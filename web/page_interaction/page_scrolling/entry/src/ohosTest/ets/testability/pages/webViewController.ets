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
import { Driver } from '@ohos.UiTest';

@Entry
@Component
struct webViewController {
  controller: webView.WebviewController = new webView.WebviewController();
  @State str: string = ""
  @State onScrollCallBack: boolean = false
  @State javaScriptAccess: boolean = true
  @State icon: image.PixelMap | undefined = undefined;
  @State onShowFileSelectorCallBack: boolean = false
  @State FileSelectorParamGetTitle: string = ''
  @State FileSelectorParamGetGetMode: number = 100
  @State FileSelectorParamGetGetAcceptType: Array<String> = []
  @State uri: string = "file://docs/storage/Users/currentUser/Documents/1.json";
  @State FileSelectorParamGetIsCapture: boolean = true
  @State FileSelectorResultHandleFileList: Array<String> = []
  @State enterPageEnd: boolean = false
  @State onOverScrollCallBack: boolean = false
  @State darkMode: WebDarkMode = WebDarkMode.Off
  @State forceDarkAccess: boolean = false
  @State userAgentPC:string = "";
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
    Column() {
      Row() {
        Button("WebViewController click").key('WebViewControllerButton').onClick(async () => {
          console.info("key==>" + this.str)
          let webRect = Utils.getComponentRect('RowSize');
          let X = Utils.getRectHorizontalCenterX(webRect)
          let Y = Utils.getRectVerticalCenterY(webRect)
          switch (this.str) {

            case "testOnScroll001": {
              try {
                this.controller.scrollTo(10, 10)
                await Utils.sleep(2000)
                Utils.emitEvent(this.onScrollCallBack, 31022)
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                Utils.emitEvent(error.code, 31022)
              }
              this.onScrollCallBack = false
              break;
            }

            case "testOnScroll002": {
              try {
                this.onScrollCallBack = false
                this.controller.scrollBy(100, 100)
                await Utils.sleep(2000)
                Utils.emitEvent(this.onScrollCallBack, 100068)
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                Utils.emitEvent(error.code, 100068)
              }
              this.onScrollCallBack = false
              break;
            }

            case "testOnScroll003": {
              try {
                this.controller.scrollBy(100, 100)
                await Utils.sleep(2000)
                this.onScrollCallBack = false
                this.controller.scrollBy(-50, -50)
                await Utils.sleep(2000)
                Utils.emitEvent(this.onScrollCallBack, 100069)
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                Utils.emitEvent(error.code, 100069)
              }
              this.onScrollCallBack = false
              break;
            }

            case "testOnOverScroll001": {
              try {
                this.controller.loadUrl("https://www.example.com/");
                await Utils.sleep(2000);
                this.onOverScrollCallBack = false
                let driver = Driver.create();
                await driver.swipe(X, Y - 60, X, Y + 60);
                await Utils.sleep(2000);
                Utils.emitEvent(this.onOverScrollCallBack, 31038)
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                Utils.emitEvent(error.code, 31038)
              }
              break;
            }

            case "testOnOverScroll002": {
              try {
                this.controller.loadUrl("https://www.example.com/");
                await Utils.sleep(2000);
                this.onOverScrollCallBack = false
                let driver = Driver.create();
                await driver.swipe(X, Y + 230, X, Y - 200);
                await Utils.sleep(2000);
                Utils.emitEvent(this.onOverScrollCallBack, 100034)
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                Utils.emitEvent(error.code, 100034)
              }
              break;
            }

            case "testOnOverScroll003": {
              try {
                this.controller.loadUrl("https://www.example.com/");
                await Utils.sleep(2000);
                this.onOverScrollCallBack = false
                let driver = Driver.create();
                await driver.swipe(X + 60, Y, X - 60, Y);
                await Utils.sleep(2000);
                Utils.emitEvent(this.onOverScrollCallBack, 100035)
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                Utils.emitEvent(error.code, 100035)
              }
              break;
            }

            case "testOnOverScroll004": {
              try {
                this.controller.loadUrl("https://www.example.com/");
                await Utils.sleep(2000);
                this.onOverScrollCallBack = false
                let driver = Driver.create();
                await driver.swipe(X - 60, Y, X + 60, Y);
                await Utils.sleep(2000);
                Utils.emitEvent(this.onOverScrollCallBack, 100036)
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                Utils.emitEvent(error.code, 100036)
              }
              break;
            }
          }
        })
      }

      Web({ src: $rawfile('index.html'), controller: this.controller })
        .javaScriptAccess(this.javaScriptAccess)
        .key("onShowFileSelectorKey")
        .onScroll((event) => {
          if (event) {
            console.info("onScroll x = " + event.xOffset)
            console.info("onScroll y = " + event.yOffset)
            this.onScrollCallBack = true
          }
        })
        .onOverScroll((event) => {
          if (event) {
            console.info("onOverScroll x = " + event.xOffset)
            console.info("onOverScroll y = " + event.yOffset)
            this.onOverScrollCallBack = true
          }
        })
        .onPageEnd((event) => {
          if (event) {
            this.enterPageEnd = true
          }
        })
        .onShowFileSelector((event) => {
          if (event) {
            this.onShowFileSelectorCallBack = true
            console.log('MyFileUploader onShowFileSelector invoked')
            event.result.handleFileList([this.uri]);
            console.info('getTitle:', event.fileSelector.getTitle())
            console.info('getMode:', event.fileSelector.getMode())
            console.info('getAcceptType:', event.fileSelector.getAcceptType())
            console.info('isCapture:', event.fileSelector.isCapture())
            this.FileSelectorParamGetTitle = event.fileSelector.getTitle()
            this.FileSelectorParamGetGetMode = event.fileSelector.getMode()
            this.FileSelectorParamGetGetAcceptType = event.fileSelector.getAcceptType()
            this.FileSelectorParamGetIsCapture = event.fileSelector.isCapture()
          }
          return true
        })
        .fileAccess(true)
        .darkMode(this.darkMode)
        .forceDarkAccess(this.forceDarkAccess)
    }
    .key('RowSize')
  }
}
