/*
 * Copyright (c) 2024-2025 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import { Button, ClickEvent, Column, Component, Entry, Row, Web, WebDarkMode, $rawfile } from '@ohos.arkui.component';
import { State } from '@ohos.arkui.stateManagement';
import webView from '@ohos.web.webview';
import { BusinessError, Callback, RecordData } from '@ohos.base';
import events_emitter from '@ohos.events.emitter';
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import { Hypium } from '../../../hypium/index';
import testsuite from '../../src/test/List.test';
import Utils from '../../src/test/Util.test';
import image from '@ohos.multimedia.image';
import emitter from '@ohos.events.emitter';
import { UIContext, Router } from '@ohos.arkui.UIContext';

@Entry
@Component
struct webSetAppCustomUserAgent {
  controller: webView.WebviewController = new webView.WebviewController(undefined);
  controller2: webView.WebviewController = new webView.WebviewController(undefined);
  @State str: string = '';
  @State isJumpUserAgentTwo: number = -1;
  @State isReceive: number = -1;
  @State isPageEnd: number = -1;
  @State errorCode: number = 0;

  aboutToAppear() {
    let valueChangeEvent: events_emitter.InnerEvent = {
      eventId: 10,
      priority: events_emitter.EventPriority.LOW
    }
    events_emitter.on(valueChangeEvent, this.valueChangeCallBack)
  }

  private valueChangeCallBack: Callback<events_emitter.EventData> = (eventData: events_emitter.EventData): void => {
    if (eventData != null) {
      console.info('valueChangeCallBack:' + JSON.stringify(eventData));
      const data = eventData.data as Record<string, RecordData>;
      if (data != null && data['ACTION'] != null) {
        let strValue: string = String(data['ACTION']);
        this.str = strValue;
      }
    }
  }

  build() {
    Column() {
      Row() {
        Button('setAppCustomUserAgent click')
          .key('WebSetAppCustomUserAgentButton')
          .onClick((e:ClickEvent) => {
            console.info('key==>' + this.str);
            this.isReceive = -1;
            switch (this.str) {
              case 'emitSetAppCustomUserAgent': {
                try {
                  let userAgent = webView.WebviewController.getDefaultUserAgent();
                  console.log('userAgent===>' + userAgent);
                  let customUserAgent = userAgent + ' setAppCustomUserAgent';
                  webView.WebviewController.setAppCustomUserAgent(customUserAgent);
                  this.isPageEnd = -1;
                  this.controller.loadUrl($rawfile('userAgentTwo.html'))
                  this.controller.runJavaScript('getUserAgent()', (error, result) => {
                    if (error) {
                      console.error(`runJavaScript ErrorCode: ${error.code},  Message: ${error.message}`);
                    }
                    if (result) {
                      console.info(`runJavaScript The test() return value is: ${result}`);
                      let isGetResult = result.includes('setAppCustomUserAgent');
                      Utils.emitEvent(isGetResult, 174020)
                    }
                  })
                } catch (error) {
                  console.error(`catch ErrorCode: ${error.code},  Message: ${error.message}`);
                  if (error.code == 801) {
                    Utils.emitEvent(true, 174020)
                  }
                }
                this.isReceive = -1;
                break;
              }
              case 'emitSetAppCustomUserAgentEmpty': {
                try {
                  webView.WebviewController.setAppCustomUserAgent('');
                  Utils.emitEvent('success', 174030);
                } catch (error) {
                  console.error(`catch ErrorCode: ${error.code},  Message: ${error.message}`);
                  if (error.code == 801) {
                    Utils.emitEvent('401', 174030);
                  } else {
                    Utils.emitEvent(error.code, 174030);
                  }
                }
                this.isReceive = -1;
                break;
              }
              case "emitAvoidVisibleViewportBottomErr": {
                try {
                  this.controller2.avoidVisibleViewportBottom(111);
                } catch (error) {
                  console.error(`emitAvoidVisibleViewportBottomErr ErrorCode: ${error.code},  Message: ${error.message}`);
                  this.errorCode = error.code;
                }
                Utils.emitEvent(this.errorCode, 20250827)
                break;
              }
              case 'SwitchNextPageStatic' : {
                let uiContext: UIContext = this.getUIContext();
                let router: Router = uiContext.getRouter();
                router.pushUrl({ url: 'pages/geolocationPermissions' })
                console.log('push URL success')
                break;
              }
            }
         })
      }
      Web({ src: $rawfile('userAgent.html'), controller: this.controller })
        .key('setAppCustomUserAgentWComponent')
        .javaScriptAccess(true)
        .domStorageAccess(true)
        .onPageEnd((event) => {
          if (event) {
            this.isPageEnd = 0;
            console.log('setAppCustomUserAgent onPageEnd url:' + event.url);
           }
        })
        .width('100%')
        .height('100%')
    }
  }
}
