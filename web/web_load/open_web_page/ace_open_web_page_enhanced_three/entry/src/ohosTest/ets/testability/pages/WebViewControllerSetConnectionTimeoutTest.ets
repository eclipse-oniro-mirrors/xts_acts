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
import { JsProxyObject } from '../../test/Interfaces';

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
  private jsObj: JsProxyObject = {
    test: (res: object) => {
      Utils.emitEvent(String(res), 102);
    },
    toString: (str: string) => {
      console.info("ets toString:" + String(str));
    },
    register: (res: object) => {
      Utils.emitEvent(String(res), 86);
      return "web222"
    }
  }

  build() {
    Column() {
      Row() {
        Button("WebViewControllerSetConnectionTimeoutTest click")
          .key('WebViewControllerSetConnectionTimeoutTestButton').onClick(async () => {
          console.info("key==>" + this.str)
          switch (this.str) {

            case "testWebViewControllerSetConnectionTimeout001": {
              try {
                this.switchCase = 1
                webView.WebviewController.setConnectionTimeout(1)
                await Utils.sleep(2000)
                this.controller.loadUrl('http://192.168.1.123/index.html');
                await Utils.sleep(2000)
                webView.WebviewController.setConnectionTimeout(30)
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              break;
            }

            case "testWebViewControllerSetConnectionTimeout002": {
              try {
                this.switchCase = 2
                webView.WebviewController.setConnectionTimeout(1)
                await Utils.sleep(2000)
                let postData = this.testObjTest.test("Name=test&Password=test");
                this.controller.postUrl('http://192.168.1.123/index.html', postData);
                await Utils.sleep(2000)
                webView.WebviewController.setConnectionTimeout(30)
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              break;
            }

            case "testWebViewControllerSetConnectionTimeout003": {
              try {
                this.switchCase = 3
                webView.WebviewController.setConnectionTimeout(1)
                await Utils.sleep(2000)
                let postData = this.testObjTest.test("");
                this.controller.postUrl('http://192.168.1.123/index.html', postData);
                await Utils.sleep(2000)
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
        .javaScriptProxy({
          object: this.jsObj,
          name: "backToEts",
          methodList: ["test", "toString"],
          controller: this.controller
        })
        .onErrorReceive((event) => {
          if (event) {
            let getErrorInfo = event.error.getErrorInfo()
            let getErrorCode = event.error.getErrorCode()
            console.log('getErrorInfo:' + getErrorInfo)
            console.log('getErrorCode:' + getErrorCode)
            if (this.switchCase == 1) {
              Utils.emitEvent(getErrorInfo, 4007);
            }
            else if (this.switchCase == 2) {
              Utils.emitEvent(getErrorInfo, 4008);
            }
            else if (this.switchCase == 3) {
              Utils.emitEvent(getErrorInfo, 4009);
            }
          }
        })
    }
  }
}
