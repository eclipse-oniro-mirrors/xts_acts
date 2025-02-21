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
struct WebGeolocationPermissionsGetAccessibleGeolocationTest {
  controller: webView.WebviewController = new webView.WebviewController();
  nativePort: webView.WebMessagePort | null = null;
  message: webView.WebMessageExt = new webView.WebMessageExt();
  origin: string = "resource://rawfile/"
  @State str: string = ""
  @State buttonKey: string = '';
  @State stressTimes: number = 0;
  @State successTimes: number = 0;
  @State callBackId: number = 0;
  @State javaScriptAccess: boolean = true;
  @State databaseAccess: boolean = true;

  onPageShow() {
    Utils.registerEventPage((eventData: events_emitter.EventData) => {
      if (eventData.data) {
        this.str = eventData.data.CASE_NAME;
        this.callBackId = eventData.data.CALL_BACK_ID;
        this.stressTimes = eventData.data.STRESS_TIMES;
        this.buttonKey = eventData.data.BUTTON_KEY
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

              case "testGeolocationPermissionsGetAccessibleGeolocation001": {
                try {
                  webView.GeolocationPermissions.allowGeolocation(this.origin)
                  for (let i = 0; i < this.stressTimes; i++) {
                    webView.GeolocationPermissions.getAccessibleGeolocation(this.origin, (error, result) => {
                      if (error) {
                        console.log('getAccessibleGeolocation error: ' + JSON.stringify(error))
                        return;
                      }
                      if (result) {
                        console.log('getAccessibleGeolocationAsync result: ' + result);
                      }
                    });
                    Utils.stressingLog('GeolocationPermissions.allowGeolocation()', i + 1, this.stressTimes)
                  }
                  Utils.emitEvent(true, this.callBackId)
                } catch (error) {
                  console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                  Utils.emitEvent(false, this.callBackId)
                }
                break;
              }

              case "testGeolocationPermissionsGetAccessibleGeolocation002": {
                try {
                  webView.GeolocationPermissions.allowGeolocation(this.origin)
                  for (let i = 0; i < this.stressTimes; i++) {
                    webView.GeolocationPermissions.getAccessibleGeolocation(this.origin)
                      .then(result => {
                        console.log('getAccessibleGeolocationAsync result: ' + result);
                      }).catch((error: business_error.BusinessError) => {
                      console.log('getAccessibleGeolocationPromise error: ' + JSON.stringify(error));
                    });
                    Utils.stressingLog('GeolocationPermissions.allowGeolocation()', i + 1, this.stressTimes)
                  }
                  Utils.emitEvent(true, this.callBackId)
                } catch (error) {
                  console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                  Utils.emitEvent(false, this.callBackId)
                }
                break;
              }

            }
          }

          )

        Web({ src: $rawfile('index.html'), controller: this.controller })
          .javaScriptAccess(this.javaScriptAccess)
          .onPageEnd((event) => {
            if (event) {
              console.log('url:' + event.url)
            }
          })
          .databaseAccess(this.databaseAccess)
      }
      .width('100%')
    }

    .height('100%')
  }
}