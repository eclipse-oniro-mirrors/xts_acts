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

@Entry
@Component
struct WebMessageExtGetArrayBufferTest {
  controller: webView.WebviewController = new webView.WebviewController();
  nativePort: webView.WebMessagePort | null = null;
  message: webView.WebMessageExt = new webView.WebMessageExt();
  @State str: string = ""
  @State buttonKey: string = '';
  @State stressTimes: number = 0;
  @State successTimes: number = 0;
  @State testing: boolean = false;
  @State callBackId: number = 0;
  @State javaScriptAccess: boolean = true;
  @State databaseAccess: boolean = true;
  @State ports: webView.WebMessagePort[] = [];
  @State listening_port: number = 0
  @State listening_flag: number = 0

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

              case "testWebMessageExtGetArrayBuffer001": {
                try {
                  this.testing = true
                  this.controller.runJavaScript(
                    'postArrayBufferToApp()',
                    (error, result) => {
                      if (error) {
                        console.info(`run JavaScript error: ` + JSON.stringify(error))
                        return;
                      }
                      if (result) {
                        console.info(`The postArrayBufferToApp() return value is: ${result}`)
                      }
                    });
                } catch (error) {
                  console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                }
                break;
              }
            }
          })

        Web({ src: $rawfile('onMessageEventExt.html'), controller: this.controller })
          .javaScriptAccess(this.javaScriptAccess)
          .onPageEnd((event) => {
            if (event) {
              this.ports = this.controller.createWebMessagePorts(true);
              this.controller.postMessage("init_web_messageport", [this.ports[1]], "*");
              this.nativePort = this.ports[0];
              this.nativePort.onMessageEventExt((result) => {
                try {
                  if (this.testing) {
                    try {
                      for (let i = 0; i < this.stressTimes; i++) {
                        result.getArrayBuffer()
                        Utils.stressingLog('WebMessageExt.getArrayBuffer()', i + 1, this.stressTimes)
                      }
                      Utils.emitEvent(true, this.callBackId)
                    } catch (error) {
                      console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                      Utils.emitEvent(false, this.callBackId)
                    }
                    this.testing = false
                  }
                } catch (resError) {
                  console.log(`log error code: ${resError.code}, Message: ${resError.message}`);
                }
              });
              console.log('url:' + event.url)
            }

          })
      }
      .width('100%')
    }
    .height('100%')
  }
}