/*
 * Copyright (c) 2023 Huawei Device Co., Ltd.
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

import webView from '@ohos.web.webview';
import Utils from '../../test/Utils';
import events_emitter from '@ohos.events.emitter';
import business_error from '@ohos.base';

@Entry
@Component
struct WebJsGeolocationInvokeTest {
  controller: webView.WebviewController = new webView.WebviewController();
  @State str: string = "";
  @State callBackId: number = 0;
  @State stressTimes: number = 0;
  @State buttonKey: string = '';
  @State invokeType: number = 1

  onPageShow() {
    Utils.registerEventPage((eventData: events_emitter.EventData) => {
      if (eventData.data) {
        this.str = eventData.data.CASE_NAME;
        this.callBackId = eventData.data.CALL_BACK_ID;
        this.stressTimes = eventData.data.STRESS_TIMES;
        this.buttonKey = eventData.data.BUTTON_KEY
      }
      try {
        webView.GeolocationPermissions.deleteAllGeolocation();
      } catch (error) {
        let e: business_error.BusinessError = error as business_error.BusinessError;
        console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
      }
    })
  }

  onPageHide() {
    Utils.unRegisterEventPage()
  }

  build() {
    Row() {
      Column() {
        Button(this.buttonKey)
          .key(this.buttonKey)
          .onClick(async () => {
            console.info("key==>" + this.str)
            switch (this.str) {
              case 'testWebJsGeolocationInvoke001': {
                try {
                  this.invokeType = 1
                  this.controller.runJavaScript("requestPosition()")
                } catch (error) {
                  console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                  Utils.emitEvent(false, this.callBackId)
                }
                break;
              }
              case 'testWebJsGeolocationInvoke002': {
                try {
                  this.invokeType = 2
                  this.controller.runJavaScript("requestPosition()")
                } catch (error) {
                  console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                  Utils.emitEvent(false, this.callBackId)
                }
                break;
              }
              case 'testWebJsGeolocationInvoke003': {
                try {
                  this.invokeType = 3
                  this.controller.runJavaScript("requestPosition()")
                } catch (error) {
                  console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                  Utils.emitEvent(false, this.callBackId)
                }
                break;
              }
              case 'testWebJsGeolocationInvoke004': {
                try {
                  this.invokeType = 4
                  this.controller.runJavaScript("requestPosition()")
                } catch (error) {
                  console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                  Utils.emitEvent(false, this.callBackId)
                }
                break;
              }
            }
          })

        Web({ src: $rawfile('geo2.html'), controller: this.controller })
          .javaScriptAccess(true)
          .geolocationAccess(true)
          .databaseAccess(true)
          .onGeolocationShow((event) => {
            if (event) {
              try {
                for (let i = 0; i < this.stressTimes; i++) {
                  if (this.invokeType == 1) {
                    event.geolocation.invoke(event.origin, true, true)
                  } else if (this.invokeType == 2) {
                    event.geolocation.invoke(event.origin, true, false)
                  } else if (this.invokeType == 3) {
                    event.geolocation.invoke(event.origin, false, true)
                  } else {
                    event.geolocation.invoke(event.origin, false, false)
                  }
                  Utils.stressingLog('JsGeolocation.invoke()', i + 1, this.stressTimes)
                }
                Utils.emitEvent(true, this.callBackId)
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                Utils.emitEvent(false, this.callBackId)
              }
            }
          })
      }
      .width('100%')
    }

    .height('100%')
  }
}