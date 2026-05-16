/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the 'License');
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an 'AS IS' BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
import { Color,NativeEmbedDataInfo,  Entry, Component, Column, Row, Button, ClickEvent,Web } from '@ohos.arkui.component'
import web_webview from '@ohos.web.webview';
import webView from '@ohos.web.webview';
import events_emitter from '@ohos.events.emitter';
import emitter from '@ohos.events.emitter';
import { Callback } from '@ohos.base'
import { State} from '@ohos.arkui.stateManagement'
import Utils from '../../src/test/Util.test';
import { BusinessError, RecordData } from '@ohos.base'
import {NativeEmbedDataInfo,Position ,NativeEmbedTouchInfo} from '@ohos.arkui.component'
import { Driver, ON } from '@ohos.UiTest';
import hilog from '@ohos.hilog';
import {NativeEmbedVisibilityInfo,NativeEmbedStatus} from '@ohos.arkui.component';
import { Hypium } from '../../../hypium';
import testsuite from '../../src/test/List.test';
import { UIContext, Router } from '@ohos.arkui.UIContext'

@Entry
@Component
struct WebDefaultTextEncodingFormat  {
  @State str: string = ''
  @State encoding: string | undefined= ""
  controller: webView.WebviewController = new webView.WebviewController(undefined);

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
        console.info('this.str has been updated to: ' + this.str);
      }
    }
  }

  build() {
    Column() {
      Row() {
        Button('WebDefaultTextEncodingFormat')
          .key('WebDefaultTextEncodingFormatButton')
          .onClick((e: ClickEvent) => {
            console.info('key==>' + this.str)
            switch (this.str) {
              case 'defaultTextEncodingFormat0100': {
                let value: string;
                try {
                  this.encoding = "UTF-8";
                  this.controller.refresh();
                  setTimeout(() => {
                    this.controller.runJavaScript("getEncoding()", (err, res) => {
                      console.info("key==>getEncoding res:" + res)
                      Utils.emitEvent(res ?? '', 20260319)
                    })
                  }, 2000)
                } catch (error) {
                  console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
                  Utils.emitEvent(error as BusinessError, 20260319)
                }
                break;
              }
              case 'defaultTextEncodingFormat0200': {
                let value: string;
                try {
                  this.encoding = "";
                  this.controller.refresh();
                  setTimeout(() => {
                    this.controller.runJavaScript("getEncoding()", (err, res) => {
                      console.info("key==>getEncoding res:" + res)
                      Utils.emitEvent(res ?? '', 20260320)
                    })
                  }, 2000)
                } catch (error) {
                  console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
                  Utils.emitEvent(error as BusinessError, 20260320)
                }
                break;
              }
              case 'defaultTextEncodingFormat0300': {
                let value: string;
                try {
                  this.encoding = undefined;
                  this.controller.refresh();
                  setTimeout(() => {
                    this.controller.runJavaScript("getEncoding()", (err, res) => {
                      console.info("key==>getEncoding res:" + res)
                      Utils.emitEvent(res ?? '', 20260321)
                    })
                  }, 2000)
                } catch (error) {
                  console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
                  Utils.emitEvent(error as BusinessError, 20260321)
                }
                break;
              }

              case 'emitSwitchNextPage6': {
                let uiContext: UIContext = this.getUIContext();
                let router: Router = uiContext.getRouter();
                router.pushUrl({ url: 'pages/NativeEmbedParamStatusUpdate' })
                break;
              }
            }
          })
      }

      Web({ src: 'resource://rawfile/index_defaultTextEncodingFormat.html', controller: this.controller })
        .defaultTextEncodingFormat(this.encoding)
    }
  }
}
