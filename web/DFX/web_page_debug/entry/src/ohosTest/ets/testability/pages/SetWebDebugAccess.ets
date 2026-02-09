/*
 * Copyright (c) 2024 Huawei Device Co., Ltd.
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

import Utils from '../../test/Utils.test';
import webView from '@ohos.web.webview';
import events_emitter from '@ohos.events.emitter';
import {waitForAssert, waitForExist} from '../../test/WaitTest.test';
import business_error from '@ohos.base';
import { Driver } from '@kit.TestKit';


const EVENT_ID_SET_SUITE_KEY = 128001;
const driver = Driver.create();

@Entry
@Component
struct SetWebDebugAccess {
  controller: webView.WebviewController = new webView.WebviewController();
  @State emitKey: string = '';
  @State isReceive: number = -1;
  @State isPageEnd: number = -1;

  onPageShow() {
    let valueChangeEvent: events_emitter.InnerEvent = {
      eventId: EVENT_ID_SET_SUITE_KEY,
      priority: events_emitter.EventPriority.LOW
    }
    events_emitter.on(valueChangeEvent, this.valueChangeCallBack)
  }

  onPageHide() {
    events_emitter.off(EVENT_ID_SET_SUITE_KEY)
  }

  private valueChangeCallBack = (eventData: events_emitter.EventData) => {
    console.info('web page valueChangeCallBack');
    if (eventData != null) {
      console.info('valueChangeCallBack:' + JSON.stringify(eventData));
      if (eventData.data != null && eventData.data.ACTION != null) {
        this.emitKey = eventData.data.ACTION;
        this.isReceive = 1
      }
    }
  }

  build() {
    Column() {
      Row() {
        Button('SetWebDebugAccess click')
          .key('setWebDebuggingAccessButton')
          .onClick(async () => {
            await waitForExist(()=>this.isReceive, 'setWebDebuggingAccessIsReceive', 1, 1000)
            console.info('key==>' + this.emitKey)
            this.isReceive = -1
            switch (this.emitKey) {
              case 'emitSetWebDebugAccessEnableDebugPortAllowed': {
                try {
                  webView.WebviewController.setWebDebuggingAccess(true,8888)
                  Utils.emitEvent(true, 128010)
                } catch (error) {
                  let e: business_error.BusinessError = error as business_error.BusinessError;
                  console.error(`emitSetWebDebugAccessEnableDebugPortAllowed ErrorCode: ${e.code},  Message: ${e.message}`);
                  Utils.emitEvent(false, 128010)
                }
                break
              }
              case 'emitSetWebDebugAccessEnableDebugPortAllowedTwo': {
                try {
                  webView.WebviewController.setWebDebuggingAccess(true,99999999)
                  Utils.emitEvent(true, 128020)
                } catch (error) {
                  let e: business_error.BusinessError = error as business_error.BusinessError;
                  console.error(`emitSetWebDebugAccessEnableDebugPortAllowedTwo ErrorCode: ${e.code},  Message: ${e.message}`);
                  Utils.emitEvent(String(e.code), 128020)
                }
                break
              }
              case 'emitSetWebDebugAccessEnableDebugPortAllowedThree': {
                try {
                  webView.WebviewController.setWebDebuggingAccess(true,65535)
                  Utils.emitEvent(true, 128030)
                } catch (error) {
                  let e: business_error.BusinessError = error as business_error.BusinessError;
                  console.error(`emitSetWebDebugAccessEnableDebugPortAllowedThree ErrorCode: ${e.code},  Message: ${e.message}`);
                  Utils.emitEvent(false, 128030)
                }
                break
              }
              case 'emitSetWebDebugAccessEnableDebugPortNotAllowedOne': {
                try {
                  webView.WebviewController.setWebDebuggingAccess(true,0)
                  Utils.emitEvent(true, 128040)
                } catch (error) {
                  let e: business_error.BusinessError = error as business_error.BusinessError;
                  console.error(`emitSetWebDebugAccessEnableDebugPortNotAllowedOne ErrorCode: ${e.code},  Message: ${e.message}`);
                  Utils.emitEvent(String(e.code), 128040)
                }
                break
              }
              case 'emitSetWebDebugAccessEnableDebugPortNotAllowedTwo': {
                try {
                  webView.WebviewController.setWebDebuggingAccess(true,1024)
                  Utils.emitEvent(true, 128050)
                } catch (error) {
                  let e: business_error.BusinessError = error as business_error.BusinessError;
                  console.error(`emitSetWebDebugAccessEnableDebugPortNotAllowedTwo ErrorCode: ${e.code},  Message: ${e.message}`);
                  Utils.emitEvent(String(e.code), 128050)
                }
                break
              }
              case 'emitSetWebDebugAccessEnableDebugPortNotAllowedThree': {
                try {
                  webView.WebviewController.setWebDebuggingAccess(true,888)
                  Utils.emitEvent(true, 128060)
                } catch (error) {
                  let e: business_error.BusinessError = error as business_error.BusinessError;
                  console.error(`emitSetWebDebugAccessEnableDebugPortNotAllowedThree ErrorCode: ${e.code},  Message: ${e.message}`);
                  Utils.emitEvent(String(e.code), 128060)
                }
                break
              }
              case 'emitSetWebDebugAccessEnableDebugPortNegativeNumber': {
                try {
                  webView.WebviewController.setWebDebuggingAccess(true,-8888)
                  Utils.emitEvent(true, 12807)
                } catch (error) {
                  let e: business_error.BusinessError = error as business_error.BusinessError;
                  console.error(`emitSetWebDebugAccessEnableDebugPortNegativeNumber ErrorCode: ${e.code},  Message: ${e.message}`);
                  Utils.emitEvent(String(e.code), 128070)
                }
                break
              }
              case 'emitSetWebDebugAccessEnableDebugPortEmpty': {
                try {
                  webView.WebviewController.setWebDebuggingAccess(true,)
                  Utils.emitEvent(true, 128080)
                } catch (error) {
                  let e: business_error.BusinessError = error as business_error.BusinessError;
                  console.error(`emitSetWebDebugAccessEnableDebugPortEmpty ErrorCode: ${e.code},  Message: ${e.message}`);
                  Utils.emitEvent(false, 128080)
                }
                break
              }
              case 'emitSetWebDebugAccessEnableDebugPortNull': {
                try {
                  webView.WebviewController.setWebDebuggingAccess(true,null)
                  Utils.emitEvent(true, 128090)
                } catch (error) {
                  let e: business_error.BusinessError = error as business_error.BusinessError;
                  console.error(`emitSetWebDebugAccessEnableDebugPortNull ErrorCode: ${e.code},  Message: ${e.message}`);
                  Utils.emitEvent(false, 128090)
                }
                break
              }
              case 'emitSetWebDebugAccessEnableDebugPortUndefined': {
                try {
                  webView.WebviewController.setWebDebuggingAccess(true,undefined)
                  Utils.emitEvent(true, 128100)
                } catch (error) {
                  let e: business_error.BusinessError = error as business_error.BusinessError;
                  console.error(`emitSetWebDebugAccessEnableDebugPortUndefined ErrorCode: ${e.code},  Message: ${e.message}`);
                  Utils.emitEvent(false, 128100)
                }
                break
              }
              case 'emitSetWebDebugAccessEnableDebugPortNaN': {
                try {
                  webView.WebviewController.setWebDebuggingAccess(true,NaN)
                  Utils.emitEvent(true, 128110)
                } catch (error) {
                  let e: business_error.BusinessError = error as business_error.BusinessError;
                  console.error(`emitSetWebDebugAccessEnableDebugPortNaN ErrorCode: ${e.code},  Message: ${e.message}`);
                  Utils.emitEvent(String(e.code), 128110)
                }
                break
              }
              case 'emitSetWebDebugAccessNotEnableDebugPortAllowed': {
                try {
                  webView.WebviewController.setWebDebuggingAccess(false,8888)
                  Utils.emitEvent(true, 128120)
                } catch (error) {
                  let e: business_error.BusinessError = error as business_error.BusinessError;
                  console.error(`emitSetWebDebugAccessNotEnableDebugPortAllowed ErrorCode: ${e.code},  Message: ${e.message}`);
                  Utils.emitEvent(false, 128120)
                }
                break
              }
              case 'emitSetWebDebugAccessNotEnableDebugPortNotAllowed': {
                try {
                  webView.WebviewController.setWebDebuggingAccess(false,1024)
                  Utils.emitEvent(true, 128130)
                } catch (error) {
                  let e: business_error.BusinessError = error as business_error.BusinessError;
                  console.error(`emitSetWebDebugAccessNotEnableDebugPortNotAllowed ErrorCode: ${e.code},  Message: ${e.message}`);
                  Utils.emitEvent(String(e.code), 128130)
                }
                break
              }
              case 'emitSetWebDebugAccessErrorCode401': {
                try {
                  webView.WebviewController.setWebDebuggingAccess(null,8888)
                  Utils.emitEvent(true, 128140)
                } catch (error) {
                  let e: business_error.BusinessError = error as business_error.BusinessError;
                  console.error(`emitSetWebDebugAccessErrorCode401 ErrorCode: ${e.code},  Message: ${e.message}`);
                  Utils.emitEvent(String(e.code), 128140)
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
        .onPageBegin((event) => {
          console.log('onPageBegin url:' + event.url);
        })
        .onPageEnd((event) => {
          console.log('onPageEnd url:' + event.url);
          this.isPageEnd = 1;
        })
    }
  }
}
