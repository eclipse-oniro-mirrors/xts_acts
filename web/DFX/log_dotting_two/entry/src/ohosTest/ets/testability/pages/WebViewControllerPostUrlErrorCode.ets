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

const EVENT_ID_SET_EMIT_KEY = 115670;

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
  @State isPageEnd: number = -1;
  @State isReceive: number = -1;
  @State testObjTest: testObj = new testObj();
  no_error: string = "no error happened"

  onPageShow() {
    let valueChangeEvent: events_emitter.InnerEvent = {
      eventId: EVENT_ID_SET_EMIT_KEY,
      priority: events_emitter.EventPriority.LOW
    }
    events_emitter.on(valueChangeEvent, this.valueChangeCallBack)
  }

  onPageHide() {
    events_emitter.off(EVENT_ID_SET_EMIT_KEY)
  }

  private valueChangeCallBack = (eventData: events_emitter.EventData) => {
    console.info("web page valueChangeCallBack");
    if (eventData != null) {
      console.info("valueChangeCallBack:" + JSON.stringify(eventData));
      if (eventData.data != null && eventData.data.ACTION != null) {
        this.str = eventData.data.ACTION;
        this.isReceive = 1;
      }
    }
  }

  build() {
    Row() {
      Column() {
        Button('PostUrlErrorCodeButton click')
          .key('PostUrlErrorCodeButton')
          .onClick(async () => {
            await Utils.waitForExist(()=>this.isPageEnd, 'PostUrlErrorCodeButtonIsPageEnd', 1, 1000);
            await Utils.waitForExist(()=>this.isReceive, 'PostUrlErrorCodeButtonIsReceive', 1, 1000);
            console.info("key==>" + this.str)
            switch (this.str) {

              case "testWebViewControllerPostUrl001": {
                try {
                  let postData = this.testObjTest.test("Name=test&Password=test");
                  this.controllerNull.postUrl('www.example.com', postData);
                  Utils.emitEvent(this.no_error, 115680)
                } catch (error) {
                  console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                  Utils.emitEvent(String(error.code), 115680)
                }
                break;
              }

              case "testWebViewControllerPostUrl002": {
                try {
                  let postData = this.testObjTest.test("Name=test&Password=test");
                  this.controller.postUrl('', postData);
                  Utils.emitEvent(this.no_error, 115690)
                } catch (error) {
                  console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                  Utils.emitEvent(String(error.code), 115690)
                }
                break;
              }
            }
          })

        Web({ src: $rawfile('index.html'), controller: this.controller })
          .javaScriptAccess(this.javaScriptAccess)
          .onPageEnd((event) => {
            console.log('onPageEnd url:' + event.url);
            this.isPageEnd = 1;
          })
      }
      .width('100%')
    }
    .height('100%')
  }
}