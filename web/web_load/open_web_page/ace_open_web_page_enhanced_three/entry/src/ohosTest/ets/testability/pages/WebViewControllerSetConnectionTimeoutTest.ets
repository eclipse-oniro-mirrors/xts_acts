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

import Utils from '../../test/Utils';
import webView from '@ohos.web.webview';
import events_emitter from '@ohos.events.emitter';

const EVENT_ID_SET_EMIT_KEY = 201030;

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
struct WebViewControllerSetConnectionTimeoutTest {
  controller: webView.WebviewController = new webView.WebviewController();
  @State str: string = ""
  @State javaScriptAccess: boolean = true
  @State switchCase: number = 0
  @State testObjTest: testObj = new testObj();
  @State isPageEnd: number = -1;
  @State isReceive: number = -1;
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
    Column() {
      Row() {
        Button("WebViewControllerSetConnectionTimeoutTest click")
          .key('WebViewControllerSetConnectionTimeoutTestButton').onClick(async () => {
          await Utils.waitForExist(()=>this.isReceive, 'WebViewControllerSetConnectionTimeoutTestButtonIsReceive', 1, 1000);
          await Utils.waitForExist(()=>this.isPageEnd, 'WebViewControllerSetConnectionTimeoutTestButtonIsPageEnd', 1, 1000);
          console.info("key==>" + this.str);
          this.isReceive = -1;
          switch (this.str) {

            case "testWebViewControllerSetConnectionTimeout001": {
              try {
                this.switchCase = 1
                this.isPageEnd = -1;
                webView.WebviewController.setConnectionTimeout(1)
                this.controller.loadUrl('http://192.168.1.123/index.html');
                await Utils.waitForExist(()=>this.isPageEnd, 'loadUrlIsPageEnd', 1, 1000);
                webView.WebviewController.setConnectionTimeout(30);
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              break;
            }

            case "testWebViewControllerSetConnectionTimeout002": {
              try {
                this.switchCase = 2
                this.isPageEnd = -1;
                webView.WebviewController.setConnectionTimeout(1)
                let postData = this.testObjTest.test("Name=test&Password=test");
                this.controller.postUrl('http://192.168.1.123/index.html', postData);
                await Utils.waitForExist(()=>this.isPageEnd, 'postUrlIsPageEnd', 1, 1000);
                webView.WebviewController.setConnectionTimeout(30)
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              break;
            }

            case "testWebViewControllerSetConnectionTimeout003": {
              try {
                this.switchCase = 3
                this.isPageEnd = -1;
                webView.WebviewController.setConnectionTimeout(1)
                let postData = this.testObjTest.test("");
                this.controller.postUrl('http://192.168.1.123/index.html', postData);
                await Utils.waitForExist(()=>this.isPageEnd, 'postUrlIsPageEnd', 1, 1000);
                webView.WebviewController.setConnectionTimeout(30)
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              break;
            }

          }
        })
      }

      Web({ src: $rawfile('index.html'), controller: this.controller })
        .javaScriptAccess(this.javaScriptAccess)
        .key("onShowFileSelectorKey")
        .onErrorReceive((event) => {
          if (event) {
            let getErrorInfo = event.error.getErrorInfo()
            let getErrorCode = event.error.getErrorCode()
            console.log('getErrorInfo:' + getErrorInfo)
            console.log('getErrorCode:' + getErrorCode)
            if (this.switchCase == 1) {
              Utils.emitEvent(getErrorInfo, 201040);
            }
            else if (this.switchCase == 2) {
              Utils.emitEvent(getErrorInfo, 201050);
            }
            else if (this.switchCase == 3) {
              Utils.emitEvent(getErrorInfo, 201060);
            }
          }
        })
        .onPageEnd((event) => {
          console.log('onPageEnd url:' + event.url);
          this.isPageEnd = 1;
        })
    }
  }
}