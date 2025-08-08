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

@Entry
@Component
struct SetWebDebugAccess {
  controller: webView.WebviewController = new webView.WebviewController();
  @State emitKey: string = '';
  @State isReceive: number = -1;
  @State isPageEnd: number = -1;

  onPageShow() {
    let valueChangeEvent: events_emitter.InnerEvent = {
      eventId: 609,
      priority: events_emitter.EventPriority.LOW
    }
    events_emitter.on(valueChangeEvent, this.valueChangeCallBack)
  }

  onPageHide() {
    events_emitter.off(609)
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
          .key('setWebDebuggingAccess')
          .onClick(async () => {
            await waitForExist(()=>this.isReceive, 'setWebDebuggingAccessIsReceive', 1, 1000)
            await waitForExist(()=>this.isPageEnd, 'setWebDebuggingAccessIsPageEnd', 1, 1000)
            console.info('key==>' + this.emitKey)
            this.isReceive = -1
            switch (this.emitKey) {
              case 'emitSetWebDebugAccessEnableDebugPortAllowed': {
                try {
                  webView.WebviewController.setWebDebuggingAccess(true,8888)
                  Utils.emitEvent(true, 2025060901)
                } catch (error) {
                  let e: business_error.BusinessError = error as business_error.BusinessError;
                  console.error(`emitSetWebDebugAccessEnableDebugPortAllowed ErrorCode: ${e.code},  Message: ${e.message}`);
                  Utils.emitEvent(false, 2025060901)
                }
                break
              }
              case 'emitSetWebDebugAccessEnableDebugPortAllowedTwo': {
                try {
                  webView.WebviewController.setWebDebuggingAccess(true,99999999)
                  Utils.emitEvent(true, 2025060902)
                } catch (error) {
                  let e: business_error.BusinessError = error as business_error.BusinessError;
                  console.error(`emitSetWebDebugAccessEnableDebugPortAllowedTwo ErrorCode: ${e.code},  Message: ${e.message}`);
                  Utils.emitEvent(String(e.code), 2025060902)
                }
                break
              }
              case 'emitSetWebDebugAccessEnableDebugPortAllowedThree': {
                try {
                  webView.WebviewController.setWebDebuggingAccess(true,65535)
                  Utils.emitEvent(true, 2025060903)
                } catch (error) {
                  let e: business_error.BusinessError = error as business_error.BusinessError;
                  console.error(`emitSetWebDebugAccessEnableDebugPortAllowedThree ErrorCode: ${e.code},  Message: ${e.message}`);
                  Utils.emitEvent(false, 2025060903)
                }
                break
              }
              case 'emitSetWebDebugAccessEnableDebugPortNotAllowedOne': {
                try {
                  webView.WebviewController.setWebDebuggingAccess(true,0)
                  Utils.emitEvent(true, 2025060904)
                } catch (error) {
                  let e: business_error.BusinessError = error as business_error.BusinessError;
                  console.error(`emitSetWebDebugAccessEnableDebugPortNotAllowedOne ErrorCode: ${e.code},  Message: ${e.message}`);
                  Utils.emitEvent(String(e.code), 2025060904)
                }
                break
              }
              case 'emitSetWebDebugAccessEnableDebugPortNotAllowedTwo': {
                try {
                  webView.WebviewController.setWebDebuggingAccess(true,1024)
                  Utils.emitEvent(true, 2025060905)
                } catch (error) {
                  let e: business_error.BusinessError = error as business_error.BusinessError;
                  console.error(`emitSetWebDebugAccessEnableDebugPortNotAllowedTwo ErrorCode: ${e.code},  Message: ${e.message}`);
                  Utils.emitEvent(String(e.code), 2025060905)
                }
                break
              }
              case 'emitSetWebDebugAccessEnableDebugPortNotAllowedThree': {
                try {
                  webView.WebviewController.setWebDebuggingAccess(true,888)
                  Utils.emitEvent(true, 2025060906)
                } catch (error) {
                  let e: business_error.BusinessError = error as business_error.BusinessError;
                  console.error(`emitSetWebDebugAccessEnableDebugPortNotAllowedThree ErrorCode: ${e.code},  Message: ${e.message}`);
                  Utils.emitEvent(String(e.code), 2025060906)
                }
                break
              }
              case 'emitSetWebDebugAccessEnableDebugPortNegativeNumber': {
                try {
                  webView.WebviewController.setWebDebuggingAccess(true,-8888)
                  Utils.emitEvent(true, 2025060907)
                } catch (error) {
                  let e: business_error.BusinessError = error as business_error.BusinessError;
                  console.error(`emitSetWebDebugAccessEnableDebugPortNegativeNumber ErrorCode: ${e.code},  Message: ${e.message}`);
                  Utils.emitEvent(String(e.code), 2025060907)
                }
                break
              }
              case 'emitSetWebDebugAccessEnableDebugPortEmpty': {
                try {
                  webView.WebviewController.setWebDebuggingAccess(true,)
                  Utils.emitEvent(true, 2025060908)
                } catch (error) {
                  let e: business_error.BusinessError = error as business_error.BusinessError;
                  console.error(`emitSetWebDebugAccessEnableDebugPortEmpty ErrorCode: ${e.code},  Message: ${e.message}`);
                  Utils.emitEvent(false, 2025060908)
                }
                break
              }
              case 'emitSetWebDebugAccessEnableDebugPortNull': {
                try {
                  webView.WebviewController.setWebDebuggingAccess(true,null)
                  Utils.emitEvent(true, 2025060909)
                } catch (error) {
                  let e: business_error.BusinessError = error as business_error.BusinessError;
                  console.error(`emitSetWebDebugAccessEnableDebugPortNull ErrorCode: ${e.code},  Message: ${e.message}`);
                  Utils.emitEvent(false, 2025060909)
                }
                break
              }
              case 'emitSetWebDebugAccessEnableDebugPortUndefined': {
                try {
                  webView.WebviewController.setWebDebuggingAccess(true,undefined)
                  Utils.emitEvent(true, 2025060910)
                } catch (error) {
                  let e: business_error.BusinessError = error as business_error.BusinessError;
                  console.error(`emitSetWebDebugAccessEnableDebugPortUndefined ErrorCode: ${e.code},  Message: ${e.message}`);
                  Utils.emitEvent(false, 2025060910)
                }
                break
              }
              case 'emitSetWebDebugAccessEnableDebugPortNaN': {
                try {
                  webView.WebviewController.setWebDebuggingAccess(true,NaN)
                  Utils.emitEvent(true, 2025060911)
                } catch (error) {
                  let e: business_error.BusinessError = error as business_error.BusinessError;
                  console.error(`emitSetWebDebugAccessEnableDebugPortNaN ErrorCode: ${e.code},  Message: ${e.message}`);
                  Utils.emitEvent(String(e.code), 2025060911)
                }
                break
              }
              case 'emitSetWebDebugAccessNotEnableDebugPortAllowed': {
                try {
                  webView.WebviewController.setWebDebuggingAccess(false,8888)
                  Utils.emitEvent(true, 2025060912)
                } catch (error) {
                  let e: business_error.BusinessError = error as business_error.BusinessError;
                  console.error(`emitSetWebDebugAccessNotEnableDebugPortAllowed ErrorCode: ${e.code},  Message: ${e.message}`);
                  Utils.emitEvent(false, 2025060912)
                }
                break
              }
              case 'emitSetWebDebugAccessNotEnableDebugPortNotAllowed': {
                try {
                  webView.WebviewController.setWebDebuggingAccess(false,1024)
                  Utils.emitEvent(true, 2025060913)
                } catch (error) {
                  let e: business_error.BusinessError = error as business_error.BusinessError;
                  console.error(`emitSetWebDebugAccessNotEnableDebugPortNotAllowed ErrorCode: ${e.code},  Message: ${e.message}`);
                  Utils.emitEvent(String(e.code), 2025060913)
                }
                break
              }
              case 'emitSetWebDebugAccessErrorCode401': {
                try {
                  webView.WebviewController.setWebDebuggingAccess(null,8888)
                  Utils.emitEvent(true, 2025060914)
                } catch (error) {
                  let e: business_error.BusinessError = error as business_error.BusinessError;
                  console.error(`emitSetWebDebugAccessErrorCode401 ErrorCode: ${e.code},  Message: ${e.message}`);
                  Utils.emitEvent(String(e.code), 2025060914)
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
