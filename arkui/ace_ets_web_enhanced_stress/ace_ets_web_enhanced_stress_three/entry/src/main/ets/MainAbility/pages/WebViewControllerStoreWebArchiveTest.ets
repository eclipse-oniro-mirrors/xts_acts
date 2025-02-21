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
struct WebViewControllerStoreWebArchiveTest {
  controller: webView.WebviewController = new webView.WebviewController();
  @State str: string = "";
  @State callBackId: number = 0;
  @State stressTimes: number = 0;
  @State buttonKey: string = '';

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
              case 'testWebViewControllerStoreWebArchive001': {
                try {
                  this.controller.loadUrl("resource://rawfile/index.html");
                  for (let i = 0; i < this.stressTimes; i++) {
                    this.controller.storeWebArchive("/data/storage/el2/base/", true, (error, filename) => {
                      if (error) {
                        console.info(`save web archive error: ` + JSON.stringify(error))
                        Utils.emitEvent(false, this.callBackId)
                      }
                      if (filename != null) {
                        console.info(`save web archive success: ${filename}`)
                        Utils.stressingLog('WebViewController.storeWebArchive()', i + 1, this.stressTimes)
                      }
                    });
                    await Utils.sleep(500)
                  }
                  Utils.emitEvent(true, this.callBackId)
                } catch (error) {
                  let e:business_error.BusinessError = error as business_error.BusinessError;
                  console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                  Utils.emitEvent(false, this.callBackId)
                }
                break;
              }
              case 'testWebViewControllerStoreWebArchive002': {
                try {
                  this.controller.loadUrl("resource://rawfile/second.html");
                  for (let i = 0; i < this.stressTimes; i++) {
                    this.controller.storeWebArchive("/data/storage/el2/base/", true)
                      .then(filename => {
                        if (filename != null) {
                          console.info(`save web archive success: ${filename}`)
                        }
                      })
                      .catch((error: business_error.BusinessError) => {
                        console.log('error: ' + JSON.stringify(error));
                        Utils.emitEvent(false, this.callBackId)
                      })
                    Utils.stressingLog('WebViewController.storeWebArchive()', i + 1, this.stressTimes)
                    await Utils.sleep(1000)
                  }
                  Utils.emitEvent(true, this.callBackId)
                } catch (error) {
                  let e:business_error.BusinessError = error as business_error.BusinessError;
                  console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                  Utils.emitEvent(false, this.callBackId)
                }
                break;
              }
              case 'testWebViewControllerStoreWebArchive003': {
                try {
                  this.controller.loadUrl("resource://rawfile/index.html");
                  for (let i = 0; i < this.stressTimes; i++) {
                    this.controller.storeWebArchive("/data/storage/el2/base/index.html.mht", false, (error, filename) => {
                      if (error) {
                        console.info(`save web archive error: ` + JSON.stringify(error))
                        Utils.emitEvent(false, this.callBackId)
                      }
                      if (filename != null) {
                        console.info(`save web archive success: ${filename}`)
                      }
                    });
                    Utils.stressingLog('WebViewController.storeWebArchive()', i + 1, this.stressTimes)
                    await Utils.sleep(1000)
                  }
                  Utils.emitEvent(true, this.callBackId)
                } catch (error) {
                  let e:business_error.BusinessError = error as business_error.BusinessError;
                  console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                  Utils.emitEvent(false, this.callBackId)
                }
                break;
              }
              case 'testWebViewControllerStoreWebArchive004': {
                try {
                  this.controller.loadUrl("resource://rawfile/index.html");
                  for (let i = 0; i < this.stressTimes; i++) {
                    this.controller.storeWebArchive("/data/storage/el2/base/index.html.mht", false)
                      .then(filename => {
                        if (filename != null) {
                          console.info(`save web archive success: ${filename}`)
                        }
                      })
                      .catch((error: business_error.BusinessError) => {
                        console.log('error: ' + JSON.stringify(error));
                        Utils.emitEvent(false, this.callBackId)
                      })
                    Utils.stressingLog('WebViewController.storeWebArchive()', i + 1, this.stressTimes)
                    await Utils.sleep(1000)
                  }
                  Utils.emitEvent(true, this.callBackId)
                } catch (error) {
                  let e:business_error.BusinessError = error as business_error.BusinessError;
                  console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                  Utils.emitEvent(false, this.callBackId)
                }
                break;
              }
            }
          })

        Web({ src: $rawfile('second.html'), controller: this.controller })
          .javaScriptAccess(true)
          .geolocationAccess(true)
          .databaseAccess(true)
      }
      .width('100%')
    }

    .height('100%')
  }
}