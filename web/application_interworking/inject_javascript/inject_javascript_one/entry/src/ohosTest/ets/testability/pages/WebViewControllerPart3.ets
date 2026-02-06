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
import {waitForAssert, waitForExist} from '../../test/WaitTest.test';

class TestObj {
  constructor() {
  }

  test(): string {
    return "ArkUI Web Component"
  }

  toString(): void {
    console.log('Web Component toString')
  }
}

@Entry
@Component
struct WebViewControllerPart3 {
  controller: webView.WebviewController = new webView.WebviewController();
  @State str: string = ""
  @State javaScriptAccess: boolean = true
  testObj: TestObj = new TestObj()
  @State registerJavaScriptProxyFlag: boolean = false;
  @State console: string = ""
  @State isReceive: number = -1;
  @State isPageEnd: number = -1;

  onPageShow() {
    let valueChangeEvent: events_emitter.InnerEvent = {
      eventId: 172310,
      priority: events_emitter.EventPriority.LOW
    }
    events_emitter.on(valueChangeEvent, this.valueChangeCallBack)
  }

  onPageHide() {
    events_emitter.off(172310)
  }

  private valueChangeCallBack = (eventData: events_emitter.EventData) => {
    console.info("web page valueChangeCallBack");
    if (eventData != null) {
      console.info("valueChangeCallBack:" + JSON.stringify(eventData));
      if (eventData.data != null && eventData.data.ACTION != null) {
        this.str = eventData.data.ACTION;
        if (this.controller) {
          this.controller.loadUrl("resource://rawfile/index.html");
          this.controller.clearHistory()
          this.isReceive = 0;
        }
      }
    }
  }
  private jsObj: JsProxyObject = {
    test: (res: object) => {
      console.info("ets toString:" + String(res));
    },
    toString: (str: string) => {
      console.info("ets toString:" + String(str));
    },
    register: (res: object) => {
      if (this.registerJavaScriptProxyFlag == true) {
        Utils.emitEvent(String(res), 172330);
      }
      return "web222"
    }
  }

  build() {
    Column() {
      Row() {
        Button("WebViewController click").key('WebViewControllerTestButton').onClick(async () => {
          await waitForExist(() => this.isPageEnd, this.str, 0);
          await waitForExist(() => this.isReceive, this.str, 0);
          this.isReceive = -1;
          console.info('key==>' + this.str)
          switch (this.str) {
            case "javaScriptProxy": {
              this.isPageEnd = -1;
              this.controller.loadUrl("resource://rawfile/proxy.html")
              await waitForExist(() => this.isPageEnd, this.str, 0);
              this.controller.runJavaScript("htmlTest()", async (error, result) => {
                console.log('error' + error)
                if (result == '"ArkUI Web Component"') {
                  Utils.emitEvent(true, 172320);
                  this.isPageEnd = -1;
                  this.controller.loadUrl("resource://rawfile/fullScreenEnter.html")
                  await waitForExist(() => this.isPageEnd, this.str, 0);
                }
              })
              break;
            }
            
            case "testRegisterJavaScriptProxy001": {
              this.registerJavaScriptProxyFlag = true
              this.isPageEnd = -1;
              this.controller.loadUrl($rawfile('index.html'))
              await waitForExist(() => this.isPageEnd, this.str, 0);
              this.controller.registerJavaScriptProxy(this.jsObj, "objName", ["test", "toString", "register"]);
              this.isPageEnd = -1;
              this.controller.refresh()
              await waitForExist(() => this.isPageEnd, this.str, 0);
              this.controller.runJavaScript("proxy()", (error) => {
                if (error) {
                  console.info('requestPosition() return error: ' + error)
                }
              })
              break;
            }

            case "testDeleteJavaScriptRegister001": {
              this.registerJavaScriptProxyFlag = false
              this.controller.registerJavaScriptProxy(this.jsObj, "objName", ["test", "toString", "register"]);
              this.isPageEnd = -1;
              this.controller.refresh()
              await waitForExist(() => this.isPageEnd, this.str, 0);
              this.controller.deleteJavaScriptRegister("objName")
              this.isPageEnd = -1;
              this.controller.refresh()
              await waitForExist(() => this.isPageEnd, this.str, 0);
              this.controller.runJavaScript("registerTest()", (error) => {
                if (error) {
                  console.info('requestPosition() return error: ' + error)
                }
              })
              if (this.console !== "web222") {
                Utils.emitEvent(true, 172340)
              }
              else {
                Utils.emitEvent(false, 172340)
              }
              break;
            }
          }
        })
      }

      Web({ src: $rawfile('index.html'), controller: this.controller })
        .javaScriptAccess(this.javaScriptAccess)
        .javaScriptProxy({
          object: this.testObj,
          name: "objName",
          methodList: ["test", "toString"],
          controller: this.controller,
        })
        .onConsole((event) => {
          if (event) {
            this.console = event.message.getMessage()
          }
          return false
        })
        .onPageEnd((event) => {
          if (event) {
            this.isPageEnd = 0;
            console.log(' WebViewController onPageEnd url:' + event.url);
          }
        })
    }
  }
}
