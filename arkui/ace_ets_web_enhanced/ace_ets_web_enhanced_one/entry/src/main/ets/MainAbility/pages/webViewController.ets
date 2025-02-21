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

            case "testHistoryItemIcon001": {
              try {
                this.controller.loadUrl("resource://rawfile/HistoryItem.html");
                await Utils.sleep(2000);
                let list = this.controller.getBackForwardEntries();
                let historyItem = list.getItemAtIndex(list.currentIndex);
                console.log("HistoryItem: " + JSON.stringify(historyItem));
                this.icon = historyItem.icon;
                if (this.icon != null) {
                  Utils.emitEvent(true, 31023)
                }
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                Utils.emitEvent(error.code, 31023)
              }
              break;
            }


            case "testHistoryItemHistoryUrl001": {
              try {
                let historyItemString: string = ' '
                this.controller.loadUrl("resource://rawfile/HistoryItem.html");
                await Utils.sleep(2000);
                let list = this.controller.getBackForwardEntries();
                let historyItem = list.getItemAtIndex(list.currentIndex);
                console.log("HistoryItem: " + JSON.stringify(historyItem));
                historyItemString = historyItem.historyUrl;
                Utils.emitEvent(historyItemString, 31024)
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                Utils.emitEvent(error.code, 31024)
              }
              break;
            }

            case "testHistoryRawUrl001": {
              try {
                let historyItemRawUrl: string = ' '
                this.controller.loadUrl("resource://rawfile/HistoryItem.html");
                await Utils.sleep(2000);
                let list = this.controller.getBackForwardEntries();
                let historyItem = list.getItemAtIndex(list.currentIndex);
                console.log("HistoryItem: " + JSON.stringify(historyItem));
                historyItemRawUrl = historyItem.historyRawUrl;
                Utils.emitEvent(historyItemRawUrl, 31025)
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                Utils.emitEvent(error.code, 31025)
              }
              break;
            }

            case "testHistoryItemTitle001": {
              try {
                let historyItemTitle: string = ' '
                this.controller.loadUrl("resource://rawfile/HistoryItem.html");
                await Utils.sleep(2000);
                let list = this.controller.getBackForwardEntries();
                let historyItem = list.getItemAtIndex(list.currentIndex);
                console.log("HistoryItem: " + JSON.stringify(historyItem));
                historyItemTitle = historyItem.title;
                Utils.emitEvent(historyItemTitle, 31026)
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                Utils.emitEvent(error.code, 31026)
              }
              break;
            }

            case "testBackForwardListCurrentIndex001": {
              try {
                this.controller.clearHistory()
                await Utils.sleep(2000);
                this.controller.loadUrl("resource://rawfile/HistoryItem.html");
                await Utils.sleep(2000);
                let list = this.controller.getBackForwardEntries();
                Utils.emitEvent(list.currentIndex, 31027)
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                Utils.emitEvent(error.code, 31027)
              }
              break;
            }

            case "testBackForwardListCurrentSize001": {
              try {
                this.controller.clearHistory()
                await Utils.sleep(2000);
                this.controller.loadUrl("resource://rawfile/HistoryItem.html");
                await Utils.sleep(2000);
                let list = this.controller.getBackForwardEntries();
                Utils.emitEvent(list.size, 31028)
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                Utils.emitEvent(error.code, 31028)
              }
              break;
            }

            case "testOnShowFileSelector001": {
              try {
                this.onShowFileSelectorCallBack = false
                this.controller.loadUrl("resource://rawfile/showFileSelector.html");
                await Utils.sleep(2000);
                await Utils.clickComponent('onShowFileSelectorKey')
                await Utils.sleep(2000);
                Utils.emitEvent(this.onShowFileSelectorCallBack, 31029)
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                Utils.emitEvent(error.code, 31029)
              }
              break;
            }


            case "testFileSelectorParamGetTitle001": {
              try {
                this.onShowFileSelectorCallBack = false
                this.FileSelectorParamGetTitle = ''
                this.controller.loadUrl("resource://rawfile/showFileSelector.html");
                await Utils.sleep(2000);
                await Utils.clickComponent('onShowFileSelectorKey')
                await Utils.sleep(2000);
                Utils.emitEvent(this.FileSelectorParamGetTitle, 31030)
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                Utils.emitEvent(error.code, 31030)
              }
              break;
            }

            case "testFileSelectorParamGetMode001": {
              try {
                this.onShowFileSelectorCallBack = false
                this.FileSelectorParamGetGetMode = 100
                this.controller.loadUrl("resource://rawfile/showFileSelector.html");
                await Utils.sleep(2000);
                await Utils.clickComponent('onShowFileSelectorKey')
                await Utils.sleep(2000);
                Utils.emitEvent(this.FileSelectorParamGetGetMode, 31031)
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                Utils.emitEvent(error.code, 31031)
              }
              break;
            }

            case "testFileSelectorParamGetAcceptType001": {
              try {
                this.onShowFileSelectorCallBack = false
                this.FileSelectorParamGetGetAcceptType = []
                this.controller.loadUrl("resource://rawfile/showFileSelector.html");
                await Utils.sleep(2000);
                await Utils.clickComponent('onShowFileSelectorKey')
                await Utils.sleep(2000);
                Utils.emitEvent(this.FileSelectorParamGetGetAcceptType[0], 31032)
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                Utils.emitEvent(error.code, 31032)
              }
              break;
            }

            case "testFileSelectorParamIsCapture001": {
              try {
                this.onShowFileSelectorCallBack = false
                this.FileSelectorParamGetIsCapture = true
                this.controller.loadUrl("resource://rawfile/showFileSelector.html");
                await Utils.sleep(2000);
                await Utils.clickComponent('onShowFileSelectorKey')
                await Utils.sleep(10000);
                Utils.emitEvent(this.FileSelectorParamGetIsCapture, 31033)
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                Utils.emitEvent(error.code, 31033)
              }
              break;
            }

            case "testFileSelectorResultHandleFileList001": {
              try {
                this.onShowFileSelectorCallBack = false
                this.FileSelectorParamGetTitle = ''
                this.controller.loadUrl("resource://rawfile/showFileSelector.html");
                await Utils.sleep(2000);
                await Utils.clickComponent('onShowFileSelectorKey')
                await Utils.sleep(2000);
                this.controller.runJavaScript(
                  'getFilePath()',
                  (error, result) => {
                    if (error) {
                      console.info(`run runJavaScriptExt error: ` + JSON.stringify(error))
                      Utils.emitEvent(String(error.code), 31034)
                      return;
                    }
                    if (result) {
                      Utils.emitEvent(result, 31034)
                    }
                  });
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                Utils.emitEvent(error.code, 31034)
              }
              break;
            }

            case "testSecureDnsModeOFF001": {
              try {
                webView.WebviewController.setHttpDns(webView.SecureDnsMode.OFF,
                  "https://httpdns-browser.platform.dbankcloud.cn/dns-query{?dns}")
                this.controller.loadUrl("https://www.example.com/");
                await Utils.sleep(4000);
                Utils.emitEvent(this.controller.getTitle(), 31035)
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                Utils.emitEvent(error.code, 31034)
              }
              break;
            }

            case "testSecureDnsModeAUTO001": {
              try {
                webView.WebviewController.setHttpDns(webView.SecureDnsMode.AUTO,
                  "https://httpdns-browser.platform.dbankcloud.cn/dns-query{?dns}")
                this.controller.loadUrl("https://www.example.com/");
                await Utils.sleep(2000);
                Utils.emitEvent(this.controller.getTitle(), 31036)
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                Utils.emitEvent(error.code, 31036)
              }
              break;
            }

            case "testSecureDnsModeSECURE_ONLY001": {
              try {
                this.enterPageEnd = false
                webView.WebviewController.setHttpDns(webView.SecureDnsMode.AUTO,
                  "https://httpdns-browser.platform.dbankcloud.cn/dns-query{?dns}")
                this.controller.loadUrl("https://www.example.com/");
                await Utils.sleep(2000);
                Utils.emitEvent(this.enterPageEnd, 31037)
                this.enterPageEnd = true
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                Utils.emitEvent(error.code, 31037)
              }
              break;
            }

            case "testOnOverScroll001": {
              try {
                this.controller.loadUrl("https://www.example.com/");
                await Utils.sleep(2000);
                this.onOverScrollCallBack = false
                let driver = Driver.create();
                this.userAgentPC = this.controller.getUserAgent();
                if ((this.userAgentPC).includes("PC")) {
                  await driver.swipe(X, Y - 60, X, Y + 60);
                }else{
                  await driver.swipe(100, 300, 100, 500, 600);
                }
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
                this.userAgentPC = this.controller.getUserAgent();
                if ((this.userAgentPC).includes("PC")) {
                  await driver.swipe(X, Y + 60, X, Y - 60);
                }else{
                  await driver.swipe(100, 900, 100, 200, 600);
                }
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
                this.userAgentPC = this.controller.getUserAgent();
                if ((this.userAgentPC).includes("PC")) {
                  await driver.swipe(X + 60, Y, X - 60, Y);
                }else{
                  await driver.swipe(400, 300, 100, 300, 600);
                }
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
                this.userAgentPC = this.controller.getUserAgent();
                if ((this.userAgentPC).includes("PC")) {
                  await driver.swipe(X - 60, Y, X + 60, Y);
                }else{
                  await driver.swipe(100, 300, 400, 300, 600);
                }
                await Utils.sleep(2000);
                Utils.emitEvent(this.onOverScrollCallBack, 100036)
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                Utils.emitEvent(error.code, 100036)
              }
              break;
            }

            case "testDarkMode001": {
              try {
                this.darkMode = WebDarkMode.On
                this.forceDarkAccess = true
                this.controller.loadUrl("resource://rawfile/darkModle.html");
                await Utils.sleep(2000);
                this.controller.runJavaScript(
                  'isDarkModel()',
                  (error, result) => {
                    if (error) {
                      console.info(`run runJavaScriptExt error: ` + JSON.stringify(error))
                      Utils.emitEvent(error.code, 31039)
                      return;
                    }
                    if (result) {
                      Utils.emitEvent(result, 31039)
                    }
                  });
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                Utils.emitEvent(error.code, 31039)
              }
              break;
            }

            case "testDarkMode002": {
              try {
                this.darkMode = WebDarkMode.Auto
                this.forceDarkAccess = true
                this.controller.loadUrl("resource://rawfile/darkModle.html");
                await Utils.sleep(2000);
                this.controller.runJavaScript(
                  'isDarkModel()',
                  (error, result) => {
                    if (error) {
                      console.info(`run runJavaScriptExt error: ` + JSON.stringify(error))
                      Utils.emitEvent(error.code, 31040)
                      return;
                    }
                    if (result) {
                      Utils.emitEvent(result, 31040)
                    }
                  });
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                Utils.emitEvent(error.code, 31040)
              }
              break;
            }

            case "testForceDarkAccess001": {
              try {
                this.darkMode = WebDarkMode.Off
                this.forceDarkAccess = true
                this.controller.loadUrl("resource://rawfile/darkModle.html");
                await Utils.sleep(2000);
                this.controller.runJavaScript(
                  'isDarkModel()',
                  (error, result) => {
                    if (error) {
                      console.info(`run runJavaScriptExt error: ` + JSON.stringify(error))
                      Utils.emitEvent(error.code, 31041)
                      return;
                    }
                    if (result) {
                      Utils.emitEvent(result, 31041)
                    }
                  });
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                Utils.emitEvent(error.code, 31041)
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
