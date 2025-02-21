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

import Utils from '../../test/Utils';
import events_emitter from '@ohos.events.emitter';

@Entry
@Component
struct WebLoadUrlTest {
  controller: WebController = new WebController()
  @State str: string = "";
  @State callBackId: number = 0;
  @State stressTimes: number = 0;
  @State buttonKey: string = '';
  @State factor: number = 1;

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
              case 'testWebLoadUrl001': {
                try {
                  for (let i = 0; i < this.stressTimes; i++) {
                    this.controller.loadUrl({ url: "index.html" })
                    Utils.stressingLog('WebController.loadUrl()', i + 1, this.stressTimes)
                  }
                  Utils.emitEvent(true, this.callBackId)
                } catch (error) {
                  console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                  Utils.emitEvent(false, this.callBackId)
                }
                break;
              }
              case 'testWebLoadUrl002': {
                try {
                  for (let i = 0; i < this.stressTimes; i++) {
                    this.controller.loadUrl({ url: "resource://rawfile/webMessageExt.html" });
                    Utils.stressingLog('WebController.loadUrl()', i + 1, this.stressTimes)
                  }
                  Utils.emitEvent(true, this.callBackId)
                } catch (error) {
                  console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                  Utils.emitEvent(false, this.callBackId)
                }
                break;
              }
              case 'testWebLoadUrl003': {
                try {
                  for (let i = 0; i < this.stressTimes; i++) {
                    this.controller.loadUrl({ url: 'https://openharmony.cn/'})
                    Utils.stressingLog('WebController.loadUrl()', i + 1, this.stressTimes)
                  }
                  Utils.emitEvent(true, this.callBackId)
                } catch (error) {
                  console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                  Utils.emitEvent(false, this.callBackId)
                }
                break;
              }
              case 'testWebLoadUrl004': {
                try {
                  let sandboxPath = Utils.copyRawFileToSandbox('second.html')
                  for (let i = 0; i < this.stressTimes; i++) {
                    this.controller.loadUrl({ url:`file://${sandboxPath}`})
                    Utils.stressingLog('WebController.loadUrl()', i + 1, this.stressTimes)
                  }
                  Utils.emitEvent(true, this.callBackId)
                } catch (error) {
                  console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                  Utils.emitEvent(false, this.callBackId)
                }
                break;
              }
              case 'testWebLoadUrl005': {
                try {
                  for (let i = 0; i < this.stressTimes; i++) {
                    this.controller.loadUrl({ url: $rawfile('index.html'),
                      headers: [{
                        headerKey: "customHeaderKey",
                        headerValue: "customHeaderValue"
                      }]
                    })
                    Utils.stressingLog('WebController.loadUrl()', i + 1, this.stressTimes)
                  }
                  Utils.emitEvent(true, this.callBackId)
                } catch (error) {
                  console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                  Utils.emitEvent(false, this.callBackId)
                }
                break;
              }
              case 'testWebLoadUrl006': {
                try {
                  for (let i = 0; i < this.stressTimes; i++) {
                    this.controller.loadUrl({ url: 'resource://rawfile/second.html',
                      headers: [{
                        headerKey: "customHeaderKey",
                        headerValue: "customHeaderValue"
                      }]
                    })
                    Utils.stressingLog('WebController.loadUrl()', i + 1, this.stressTimes)
                  }
                  Utils.emitEvent(true, this.callBackId)
                } catch (error) {
                  console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                  Utils.emitEvent(false, this.callBackId)
                }
                break;
              }
              case 'testWebLoadUrl007': {
                try {
                  for (let i = 0; i < this.stressTimes; i++) {
                    this.controller.loadUrl({ url: 'https://openharmony.cn/',
                      headers: [{
                        headerKey: "customHeaderKey",
                        headerValue: "customHeaderValue"
                      }]
                    })
                    Utils.stressingLog('WebController.loadUrl()', i + 1, this.stressTimes)
                  }
                  Utils.emitEvent(true, this.callBackId)
                } catch (error) {
                  console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                  Utils.emitEvent(false, this.callBackId)
                }
                break;
              }
              case 'testWebLoadUrl008': {
                try {
                  let sandboxPath = Utils.copyRawFileToSandbox('second.html')
                  for (let i = 0; i < this.stressTimes; i++) {
                    this.controller.loadUrl({ url: `file://${sandboxPath}`,
                      headers: [{
                        headerKey: "customHeaderKey",
                        headerValue: "customHeaderValue"
                      }]
                    })
                    Utils.stressingLog('WebController.loadUrl()', i + 1, this.stressTimes)
                  }
                  Utils.emitEvent(true, this.callBackId)
                } catch (error) {
                  console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                  Utils.emitEvent(false, this.callBackId)
                }
                break;
              }
            }
          })

        Web({ src: '', controller: this.controller })
          .javaScriptAccess(true)
          .geolocationAccess(true)
          .databaseAccess(true)
      }
      .width('100%')
    }

    .height('100%')
  }
}