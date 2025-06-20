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
import image from '@ohos.multimedia.image';
import business_error from '@ohos.base'

@Entry
@Component
struct webViewControllerPart2 {
  controller: webView.WebviewController = new webView.WebviewController();
  controllerone: webView.WebviewController = new webView.WebviewController();
  @State str: string = ""
  @State onScrollCallBack: boolean = false
  @State javaScriptAccess: boolean = true
  @State icon: image.PixelMap | undefined = undefined;
  @State onShowFileSelectorCallBack: boolean = false
  @State FileSelectorParamGetTitle: string = ''
  @State FileSelectorParamGetGetMode: number = 100
  @State FileSelectorParamGetGetAcceptType: Array<String> = []
  @State userAgent: string = "Mozilla/5.0 (X11; Linux aarch64) AppleWebKit/537.36 " +
    "(KHTML, like Gecko) Chrome/99.0.4844.88 Mobile Safari/537.36";
  @State uri: string = "file://docs/storage/Users/currentUser/Documents/1.json";
  @State FileSelectorParamGetIsCapture: boolean = true
  @State FileSelectorResultHandleFileList: Array<String> = []
  @State enterPageEnd: boolean = false
  @State numberOfMatches: number = 0
  @State searchNext: boolean = false
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
        Button("WebViewControllerPart2 click").key('WebViewControllerPart2Button').onClick(async () => {
          console.info("key==>" + this.str)
          switch (this.str) {

            case "testBackOrForward001": {
              try {
                this.controller.clearHistory()
                await Utils.sleep(1000);
                this.controller.loadUrl("resource://rawfile/index.html");
                await Utils.sleep(2000);
                this.controller.loadUrl("resource://rawfile/second.html");
                await Utils.sleep(2000);
                this.controller.backward()
                await Utils.sleep(2000);
                this.controller.backOrForward(1)
                await Utils.sleep(2000);
                let title = this.controller.getTitle();
                Utils.emitEvent(title, 37005)
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              break;
            }

            case "testBackOrForward002": {
              try {
                this.controller.clearHistory()
                await Utils.sleep(1000);
                this.controller.loadUrl("resource://rawfile/index.html");
                await Utils.sleep(2000);
                this.controller.loadUrl("resource://rawfile/second.html");
                await Utils.sleep(2000);
                this.controller.backOrForward(-1)
                await Utils.sleep(2000);
                let title = this.controller.getTitle();
                Utils.emitEvent(title, 37006)
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              break;
            }

            case "testBackOrForward003": {
              try {
                this.controller.clearHistory()
                await Utils.sleep(1000);
                this.controller.loadUrl("resource://rawfile/index.html");
                await Utils.sleep(3000);
                this.controller.backOrForward(-3)
                await Utils.sleep(3000);
                let title = this.controller.getTitle();
                Utils.emitEvent(title, 37007)
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              break;
            }

            case "testBackOrForward004": {
              try {
                this.controller.clearHistory()
                await Utils.sleep(1000);
                this.controller.loadUrl("resource://rawfile/index.html");
                await Utils.sleep(3000);
                this.controller.backOrForward(3)
                await Utils.sleep(3000);
                let title = this.controller.getTitle();
                Utils.emitEvent(title, 37008)
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
        .fileAccess(true)
        .key("onShowFileSelectorKey")
        .javaScriptProxy({
          object: this.jsObj,
          name: "backToEts",
          methodList: ["test", "toString"],
          controller: this.controller
        })
    }
  }
}
