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
  @State str: string = ""
  @State javaScriptAccess: boolean = true;
  @State testObjTest: testObj = new testObj();
  @State pageEnd: string = "";
  @State switchCase: number = 0;

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
    Column() {
      Row() {
        Button("WebViewControllerPostUrlTest click").key('WebViewControllerPostUrlTestButton').onClick(async () => {
          console.info("key==>" + this.str)
          switch (this.str) {

            case "testWebViewControllerPostUrl001": {
              try {
                this.pageEnd = 'not page end'
                this.switchCase = 1
                let postData = this.testObjTest.test("Name=test&Password=test");
                this.controller.postUrl('www.example.com', postData);
                await Utils.sleep(6000)
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              break;
            }

            case "testWebViewControllerPostUrl002": {
              try {
                this.pageEnd = 'not page end'
                this.switchCase = 2
                let postData = this.testObjTest.test("Name=test&Password=test");
                this.controller.postUrl('resource://rawfile/second.html', postData);
                await Utils.sleep(6000)
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              break;
            }

            case "testWebViewControllerPostUrl003": {
              try {
                this.pageEnd = 'not page end'
                this.switchCase = 3
                let sandboxPath = Utils.copyRawFileToSandbox('index.html')
                let postData = this.testObjTest.test("Name=test&Password=test");
                this.controller.postUrl(sandboxPath, postData);
                await Utils.sleep(6000)
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              break;
            }

            case "testWebViewControllerPostUrl004": {
              try {
                this.pageEnd = 'not page end'
                this.switchCase = 4
                let postData = this.testObjTest.test("");
                this.controller.postUrl('www.example.com', postData);
                await Utils.sleep(6000)
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              break;
            }

            case "testWebViewControllerPostUrl005": {
              try {
                this.pageEnd = 'not page end'
                this.switchCase = 5
                let postData = this.testObjTest.test("");
                this.controller.postUrl('resource://rawfile/second.html', postData);
                await Utils.sleep(6000)
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              break;
            }

            case "testWebViewControllerPostUrl006": {
              try {
                this.pageEnd = 'not page end'
                this.switchCase = 6
                let sandboxPath = Utils.copyRawFileToSandbox('index.html')
                let postData = this.testObjTest.test("Name=test&Password=test");
                this.controller.postUrl(sandboxPath, postData);
                await Utils.sleep(6000)
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
        .onPageEnd((event) => {
          if (event) {
            this.pageEnd = event.url
            if (this.switchCase == 1) {
              Utils.emitEvent(this.pageEnd, 4001);
            }
            else if (this.switchCase == 2) {
              Utils.emitEvent(this.pageEnd, 4002);
            }
            else if (this.switchCase == 3) {
              Utils.emitEvent(this.pageEnd, 4003);
            }
            else if (this.switchCase == 4) {
              Utils.emitEvent(this.pageEnd, 4004);
            }
            else if (this.switchCase == 5) {
              Utils.emitEvent(this.pageEnd, 4005);
            }
            else if (this.switchCase == 6) {
              Utils.emitEvent(this.pageEnd, 4006);
            }
            console.log("onPageEnd==> event.url:" + event.url)
            console.log("onPageEnd==> this.pageEnd:" + this.pageEnd)
          }
        })
    }
  }
}
