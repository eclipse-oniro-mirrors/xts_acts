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
import { JsProxyObject } from '../../test/Interfaces.d';
import events_emitter from '@ohos.events.emitter';

class testObj {
  constructor() {
  }

  test(str: string): ArrayBuffer {
    let buf = new ArrayBuffer(str.length);
    let buff = new Uint8Array(buf);

    for (let i = 0; i < str.length; i++) {
      buff[i] = str.charCodeAt(i);
    }
    return buf;
  }
}

@Entry
@Component
struct WebViewControllerPostUrlTest {
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
  @State testObjTest: testObj = new testObj();
  @State pageEnd: string = "";
  @State switchCase: number = 0;

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

              case "testWebViewControllerPostUrl001": {
                try {
                  let postData = this.testObjTest.test("Name=test&Password=test");
                  for (let i = 0; i < this.stressTimes; i++) {
                    this.controller.postUrl('www.example.com', postData);
                    Utils.stressingLog('WebViewController.postUrl()', i + 1, this.stressTimes)
                  }
                  Utils.emitEvent(true, this.callBackId)
                } catch (error) {
                  console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                  Utils.emitEvent(false, this.callBackId)
                }
                break;
              }

              case "testWebViewControllerPostUrl002": {
                try {
                  let postData = this.testObjTest.test("Name=test&Password=test");
                  for (let i = 0; i < this.stressTimes; i++) {
                    this.controller.postUrl('resource://rawfile/second.html', postData);
                    Utils.stressingLog('WebViewController.postUrl()', i + 1, this.stressTimes)
                  }
                  Utils.emitEvent(true, this.callBackId)
                } catch (error) {
                  console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                  Utils.emitEvent(false, this.callBackId)
                }
                break;
              }

              case "testWebViewControllerPostUrl003": {
                try {
                  let sandboxPath = Utils.copyRawFileToSandbox('index.html')
                  let postData = this.testObjTest.test("Name=test&Password=test");
                  for (let i = 0; i < this.stressTimes; i++) {
                    this.controller.postUrl(sandboxPath, postData);
                    Utils.stressingLog('WebViewController.postUrl()', i + 1, this.stressTimes)
                  }
                  Utils.emitEvent(true, this.callBackId)
                } catch (error) {
                  console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                  Utils.emitEvent(false, this.callBackId)
                }
                break;
              }

              case "testWebViewControllerPostUrl004": {
                try {
                  let postData = this.testObjTest.test("");
                  for (let i = 0; i < this.stressTimes; i++) {
                    this.controller.postUrl('www.example.com', postData);
                    Utils.stressingLog('WebViewController.postUrl()', i + 1, this.stressTimes)
                  }
                  Utils.emitEvent(true, this.callBackId)
                } catch (error) {
                  console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                  Utils.emitEvent(false, this.callBackId)
                }
                break;
              }

              case "testWebViewControllerPostUrl005": {
                try {
                  let postData = this.testObjTest.test("");
                  for (let i = 0; i < this.stressTimes; i++) {
                    this.controller.postUrl('resource://rawfile/second.html', postData);
                    Utils.stressingLog('WebViewController.postUrl()', i + 1, this.stressTimes)
                  }
                  Utils.emitEvent(true, this.callBackId)
                } catch (error) {
                  console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                  Utils.emitEvent(false, this.callBackId)
                }
                break;
              }

              case "testWebViewControllerPostUrl006": {
                try {
                  let sandboxPath = Utils.copyRawFileToSandbox('index.html')
                  let postData = this.testObjTest.test("Name=test&Password=test");
                  for (let i = 0; i < this.stressTimes; i++) {
                    this.controller.postUrl(sandboxPath, postData);
                    Utils.stressingLog('WebViewController.postUrl()', i + 1, this.stressTimes)
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

        Web({ src: $rawfile('webStorage.html'), controller: this.controller })
          .javaScriptAccess(this.javaScriptAccess)
      }
      .width('100%')
    }
    .height('100%')
  }
}