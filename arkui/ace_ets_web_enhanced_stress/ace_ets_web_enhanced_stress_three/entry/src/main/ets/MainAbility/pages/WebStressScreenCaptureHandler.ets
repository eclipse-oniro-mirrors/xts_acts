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
import webView from '@ohos.web.webview';
import events_emitter from '@ohos.events.emitter';

@Entry
@Component
struct Index {
  controller: webView.WebviewController = new webView.WebviewController();
  @State Permission: Boolean = false
  @State str: string = ""
  @State startTime: number = 0
  @State endTime: number = 0
  @State callBackId: number = 0
  @State onRequest: boolean = false
  @State buttonKey: string = '';
  @State text: string = ''
  @State stressTimes: number = 0;

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
    Column() {
      Row() {
        Button(this.buttonKey)
          .key(this.buttonKey)
          .onClick(async () => {
          console.info("key==>" + this.str)
          switch (this.str) {
            case "testScreenCaptureConfigDeny001": {
              this.text = 'deny'
              this.controller.loadUrl("resource://rawfile/screenCaptureTest.html");
              await Utils.sleep(2000);
              this.controller.runJavaScript('getScreenStream()')
              break;
            }
            case "testScreenCaptureConfigGetOrigin001": {
              this.text = 'getOrigin'
              this.controller.loadUrl("resource://rawfile/screenCaptureTest.html");
              await Utils.sleep(2000);
              this.controller.runJavaScript('getScreenStream()')
              break;
            }
            case "testScreenCaptureConfigGrant001": {
              this.text = 'grant'
              this.controller.loadUrl("resource://rawfile/screenCaptureTest.html");
              await Utils.sleep(2000);
              this.controller.runJavaScript('getScreenStream()')
              break;
            }
          }
        })
      }

      Web({ src: $rawfile("indexJru.html"), controller: this.controller })
        .onScreenCaptureRequest(async (event) => {
          console.log("event : >>>" + event)
          if (event) {
            switch (this.text) {
              case 'deny': {
                try {
                  for (let i = 0; i < this.stressTimes; i++) {
                    event.handler.deny()
                    Utils.stressingLog('onScreenCaptureRequest.deny()', i + 1, this.stressTimes)
                  }
                  Utils.emitEvent(true, this.callBackId)
                } catch (error) {
                  console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                  Utils.emitEvent(false, this.callBackId)
                }
                break
              }
              case 'getOrigin': {
                try {
                  for (let i = 0; i < this.stressTimes; i++) {
                    event.handler.getOrigin()
                    Utils.stressingLog('onScreenCaptureRequest.getOrigin()', i + 1, this.stressTimes)
                  }
                  Utils.emitEvent(true, this.callBackId)
                } catch (error) {
                  console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                  Utils.emitEvent(false, this.callBackId)
                }
                break
              }
              case 'grant': {
                try {
                  for (let i = 0; i < this.stressTimes; i++) {
                    event.handler.grant({ captureMode: WebCaptureMode.HOME_SCREEN })
                    Utils.stressingLog('onScreenCaptureRequest.grant()', i + 1, this.stressTimes)
                  }
                  Utils.emitEvent(true, this.callBackId)
                } catch (error) {
                  console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                  Utils.emitEvent(false, this.callBackId)
                }

                break
              }
            }
          }
        })
    }
  }
}
