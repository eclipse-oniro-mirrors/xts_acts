/*
 * Copyright (c) 2025-2026 Huawei Device Co., Ltd.
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

import {
  Button,
  ClickEvent,
  Column,
  Component,
  Entry,
  Row,
  Web,
  Blank,
  OnPageBeginEvent,
  OnPageEndEvent
} from '@ohos.arkui.component';
import { State } from '@ohos.arkui.stateManagement';
import { Callback, RecordData } from '@ohos.base'
import webView from '@ohos.web.webview';
import { BusinessError, Callback } from '@ohos.base';
import events_emitter from '@ohos.events.emitter';
import Utils from '../../src/test/Utils.test';

class StringFields {
  public str: string = '';
}

@Entry
@Component
struct SetWebDebugAccess {
  stringObj: StringFields  = new StringFields ();
  controller: webView.WebviewController = new webView.WebviewController(undefined);
  @State emitKey: string = '';
  @State isReceive: number = -1;
  @State isPageEnd: number = -1;

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
        this.stringObj.str = strValue;
        console.info('this.str has been updated to: ' + this.stringObj.str);
      }
    }
  }

  build() {
    Column() {
      Row() {
        Button('SetWebDebugAccess click')
          .key('setWebDebuggingAccess')
          .onClick( (e:ClickEvent) => {
            console.info('key==>' +  this.stringObj.str)
            this.isReceive = -1
            switch (this.stringObj.str) {
              case 'emitSetWebDebugAccessEnableDebugPortAllowed': {
                try {
                  webView.WebviewController.setWebDebuggingAccess(true,8888)
                  Utils.emitEvent(true, 2025060901)
                } catch (error) {
                  error = error as BusinessError;
                  console.error(`emitSetWebDebugAccessEnableDebugPortAllowed ErrorCode: ${error.code},  `);
                  Utils.emitEvent(false, 2025060901)
                }
                break
              }
              case 'emitSetWebDebugAccessEnableDebugPortAllowedTwo': {
                try {
                  webView.WebviewController.setWebDebuggingAccess(true,99999999)
                  Utils.emitEvent(true, 2025060902)
                } catch (error) {
                  error = error as BusinessError;
                  console.error(`emitSetWebDebugAccessEnableDebugPortAllowedTwo ErrorCode: ${error.code},  `);
                  Utils.emitEvent(String(error.code), 2025060902)
                }
                break
              }
              case 'emitSetWebDebugAccessEnableDebugPortAllowedThree': {
                try {
                  webView.WebviewController.setWebDebuggingAccess(true,65535)
                  Utils.emitEvent(true, 2025060903)
                } catch (error) {
                  error = error as BusinessError;
                  console.error(`emitSetWebDebugAccessEnableDebugPortAllowedThree ErrorCode: ${error.code},  `);
                  Utils.emitEvent(false, 2025060903)
                }
                break
              }
              case 'emitSetWebDebugAccessEnableDebugPortNotAllowedOne': {
                try {
                  webView.WebviewController.setWebDebuggingAccess(true,0)
                  Utils.emitEvent(true, 2025060904)
                } catch (error) {
                  error = error as BusinessError;
                  console.error(`emitSetWebDebugAccessEnableDebugPortNotAllowedOne ErrorCode: ${error.code},  `);
                  Utils.emitEvent(String(error.code), 2025060904)
                }
                break
              }
              case 'emitSetWebDebugAccessEnableDebugPortNotAllowedTwo': {
                try {
                  webView.WebviewController.setWebDebuggingAccess(true,1024)
                  Utils.emitEvent(true, 2025060905)
                } catch (error) {
                  error = error as BusinessError;
                  console.error(`emitSetWebDebugAccessEnableDebugPortNotAllowedTwo ErrorCode: ${error.code},  `);
                  Utils.emitEvent(String(error.code), 2025060905)
                }
                break
              }
              case 'emitSetWebDebugAccessEnableDebugPortNotAllowedThree': {
                try {
                  webView.WebviewController.setWebDebuggingAccess(true,888)
                  Utils.emitEvent(true, 2025060906)
                } catch (error) {
                  error = error as BusinessError;
                  console.error(`emitSetWebDebugAccessEnableDebugPortNotAllowedThree ErrorCode: ${error.code},  `);
                  Utils.emitEvent(String(error.code), 2025060906)
                }
                break
              }
              case 'emitSetWebDebugAccessEnableDebugPortNegativeNumber': {
                try {
                  webView.WebviewController.setWebDebuggingAccess(true,-8888)
                  Utils.emitEvent(true, 2025060907)
                } catch (error) {
                  error = error as BusinessError;
                  console.error(`emitSetWebDebugAccessEnableDebugPortNegativeNumber ErrorCode: ${error.code},  `);
                  Utils.emitEvent(String(error.code), 2025060907)
                }
                break
              }
              case 'emitSetWebDebugAccessEnableDebugPortEmpty': {
                try {
                  webView.WebviewController.setWebDebuggingAccess(true)
                  Utils.emitEvent(true, 2025060908)
                } catch (error) {
                  error = error as BusinessError;
                  console.error(`emitSetWebDebugAccessEnableDebugPortEmpty ErrorCode: ${error.code},  `);
                  Utils.emitEvent(false, 2025060908)
                }
                break
              }

              case 'emitSetWebDebugAccessNotEnableDebugPortAllowed': {
                try {
                  webView.WebviewController.setWebDebuggingAccess(false,8888)
                  Utils.emitEvent(true, 2025060912)
                } catch (error) {
                  error = error as BusinessError;
                  console.error(`emitSetWebDebugAccessNotEnableDebugPortAllowed ErrorCode: ${error.code},  `);
                  Utils.emitEvent(false, 2025060912)
                }
                break
              }
              case 'emitSetWebDebugAccessNotEnableDebugPortNotAllowed': {
                try {
                  webView.WebviewController.setWebDebuggingAccess(false,1024)
                  Utils.emitEvent(true, 2025060913)
                } catch (error) {
                  error = error as BusinessError;
                  console.error(`emitSetWebDebugAccessNotEnableDebugPortNotAllowed ErrorCode: ${error.code},  `);
                  Utils.emitEvent(String(error.code), 2025060913)
                }
                break
              }
              default:
                break
            }
          })
      }
      Web({ src: 'www.example.com', controller: this.controller })
        .javaScriptAccess(true)
        .fileAccess(true)
        .domStorageAccess(true)
        .databaseAccess(true)
        .onControllerAttached(() => {
          console.log('onControllerAttached webId:' + this.controller.getWebId());
        })
        .onPageBegin((event:OnPageBeginEvent):void => {
          console.log('onPageBegin url:' + event.url);
        })
        .onPageEnd((event:OnPageEndEvent):void => {
          console.log('onPageEnd url:' + event.url);
          this.isPageEnd = 1;
        })
    }
  }
}
