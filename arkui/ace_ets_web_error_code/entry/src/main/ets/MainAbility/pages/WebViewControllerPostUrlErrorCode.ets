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
struct WebViewControllerPostUrlErrorCode {
  controller: webView.WebviewController = new webView.WebviewController();
  controllerNull: webView.WebviewController = new webView.WebviewController();
  nativePort: webView.WebMessagePort | null = null;
  message: webView.WebMessageExt = new webView.WebMessageExt();
  @State str: string = ""
  @State callBackId: number = 0;
  @State javaScriptAccess: boolean = true;
  @State testObjTest: testObj = new testObj();
  no_error: string = "no error happened"

  onPageShow() {
    let valueChangeEvent: events_emitter.InnerEvent = {
      eventId: 10,
      priority: events_emitter.EventPriority.LOW
    }
    events_emitter.on(valueChangeEvent, this.valueChangeCallBack)
  }

  onPageHide() {
    events_emitter.off(10)
  }

  private valueChangeCallBack = (eventData: events_emitter.EventData) => {
    console.info("web page valueChangeCallBack");
    if (eventData != null) {
      console.info("valueChangeCallBack:" + JSON.stringify(eventData));
      if (eventData.data != null && eventData.data.ACTION != null) {
        this.str = eventData.data.ACTION;
      }
    }
  }

  build() {
    Row() {
      Column() {
        Button('PostUrlErrorCodeButton click')
          .key('PostUrlErrorCodeButton')
          .onClick(async () => {
            console.info("key==>" + this.str)
            switch (this.str) {

              case "testWebViewControllerPostUrl001": {
                try {
                  let postData = this.testObjTest.test("Name=test&Password=test");
                  this.controllerNull.postUrl('www.example.com', postData);
                  Utils.emitEvent(this.no_error, 30001)
                } catch (error) {
                  console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                  Utils.emitEvent(String(error.code), 30001)
                }
                break;
              }

              case "testWebViewControllerPostUrl002": {
                try {
                  let postData = this.testObjTest.test("Name=test&Password=test");
                  this.controller.postUrl('', postData);
                  Utils.emitEvent(this.no_error, 30002)
                } catch (error) {
                  console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                  Utils.emitEvent(String(error.code), 30002)
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