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
struct webSetUserAgentClientHintsEnabled {
  controller: webView.WebviewController = new webView.WebviewController(undefined);
  @State str: string = '';
  @State isPageEnd: number = -1;
  @State isReceive: number = -1;


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
        Button('setUserAgentClientHintsEnabled click')
          .key('WebSetUserAgentClientHintsEnabledButton')
          .onClick((e:ClickEvent) => {
            console.info('key==>' + this.str);
            this.isReceive = -1;
            switch (this.str) {
              case 'emitSetUserAgentClientHintsEnabled': {
                try {
                  webView.WebviewController.setUserAgentClientHintsEnabled(true);
                  Utils.emitEvent(true, 174130);
                } catch (error) {
                  console.error(`catch ErrorCode: ${error.code},  Message: ${error.message}`);
                  Utils.emitEvent(false, 174130);
                }
                break;
              }
              case 'emitSetUserAgentClientHintsEnabledFalse': {
                try {
                  webView.WebviewController.setUserAgentClientHintsEnabled(false);
                  Utils.emitEvent(true, 174131);
                } catch (error) {
                  console.error(`catch ErrorCode: ${error.code},  Message: ${error.message}`);
                  Utils.emitEvent(false, 174131);
                }
                break;
              }
              case 'emitGetUserAgentClientHintsEnabledTrue': {
                try {
                  webView.WebviewController.setUserAgentClientHintsEnabled(true);
                  let result = webView.WebviewController.getUserAgentClientHintsEnabled();
                  Utils.emitEvent(result, 174160);
                } catch (error) {
                  console.error(`catch ErrorCode: ${error.code},  Message: ${error.message}`);
                  Utils.emitEvent(false, 174160);
                }
                break;
              }
              case 'emitGetUserAgentClientHintsEnabledFalse': {
                try {
                  webView.WebviewController.setUserAgentClientHintsEnabled(false);
                  let result = webView.WebviewController.getUserAgentClientHintsEnabled();
                  Utils.emitEvent(result, 174170);
                } catch (error) {
                  console.error(`catch ErrorCode: ${error.code},  Message: ${error.message}`);
                  Utils.emitEvent(false, 174170);
                }
                break;
              }
              case 'SwitchNextPageStatic' : {
                let uiContext: UIContext = this.getUIContext();
                let router: Router = uiContext.getRouter();
                router.pushUrl({ url: 'pages/WebSetAppCustomUserAgent' })
                console.log('push URL success')
                break;
              }
            }
          })
      }
      Web({ src: $rawfile('userAgent.html'), controller: this.controller })
        .key('setUserAgentClientHintsEnabledWComponent')
        .javaScriptAccess(true)
        .domStorageAccess(true)
        .onPageEnd(() => {
          console.info('onPageEnd is invoked');
          this.isPageEnd = 0;
        })
        .onErrorReceive((event) => {
          console.info('onErrorReceive is invoked');
        })
    }
  }
}
