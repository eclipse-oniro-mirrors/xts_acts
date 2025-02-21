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

            case "testClearHistory001": {
              try {
                this.controller.clearHistory()
                await Utils.sleep(2000);
                let accessStep = this.controller.accessStep(-1);
                Utils.emitEvent(accessStep, 37000)
              } catch (error) {
                console.error(`Errorcode: ${error.code}, Message: ${error.message}`);
              }
              break;
            }

            case "testRefresh001": {
              try {
                this.controller.refresh()
                await Utils.sleep(2000);
                let title = this.controller.getTitle()
                Utils.emitEvent(title, 37001)
              } catch (error) {
                console.error(`Errorcode: ${error.code}, Message: ${error.message}`);
              }
              break;
            }

            case "testLoadData001": {
              try {
                this.controller.loadData(
                  "<html><head><title>LoadData</title></head>" +
                  "<body bgcolor=\"white\">Source:<pre>source</pre></body></html>",
                  "text/html",
                  "UTF-8"
                );
                await Utils.sleep(3000);
                let title = this.controller.getTitle();
                Utils.emitEvent(title, 37002)
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              break;
            }

            case "testLoadUrl001": {
              try {
                this.controller.loadUrl("www.OpenHarmony.cn")
                await Utils.sleep(6000);
                let title = this.controller.getTitle();
                Utils.emitEvent(title, 37003)
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              break;
            }

            case "testLoadUrl002": {
              try {
                this.controller.loadUrl("resource://rawfile/second.html");
                await Utils.sleep(3000);
                let title = this.controller.getTitle();
                Utils.emitEvent(title, 37004)
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              break;
            }

            case "testLoadUrl003": {
              try {
                this.controller.loadUrl($rawfile('second.html'));
                await Utils.sleep(3000);
                let title = this.controller.getTitle();
                Utils.emitEvent(title, 77000)
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              break;
            }

            case "testLoadUrl004": {
              try {
                let sandboxPath = Utils.copyRawFileToSandbox('second.html')
                this.controller.loadUrl(`file://${sandboxPath}`);
                await Utils.sleep(3000);
                let title = this.controller.getTitle();
                Utils.emitEvent(title, 77002)
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              break;
            }

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

            case "testGetUserAgent001": {
              try {
                Utils.emitEvent(this.controller.getUserAgent().indexOf('OpenHarmony') >= 0, 37009)
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              break;
            }

            case "testGetWebId001": {
              try {
                let webId = this.controller.getWebId()
                Utils.emitEvent(webId > 0, 37010)
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              break;
            }

            case "testGetTitle001": {
              try {
                let getTitle = this.controller.getTitle()
                Utils.emitEvent(getTitle, 37011)
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              break;
            }

            case "testSearchAllAsync001": {
              try {
                this.numberOfMatches = 0
                this.controller.loadUrl("resource://rawfile/searchAllAsync.html");
                await Utils.sleep(2000);
                this.controller.searchAllAsync('Hello World');
                await Utils.sleep(2000);
                Utils.emitEvent(this.numberOfMatches, 37012)
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              break;
            }

            case "testSearchNext001": {
              try {
                this.numberOfMatches = 0
                this.controller.loadUrl("resource://rawfile/searchAllAsync.html");
                await Utils.sleep(2000);
                this.controller.searchAllAsync('Hello World');
                await Utils.sleep(2000);
                this.searchNext = false
                this.controller.searchNext(true)
                await Utils.sleep(2000);
                Utils.emitEvent(this.searchNext, 100080)
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              break;
            }

            case "testSearchNext002": {
              try {
                this.numberOfMatches = 0
                this.controller.loadUrl("resource://rawfile/searchAllAsync.html");
                await Utils.sleep(2000);
                this.controller.searchAllAsync('Hello World');
                await Utils.sleep(2000);
                this.searchNext = false
                this.controller.searchNext(false)
                await Utils.sleep(2000);
                Utils.emitEvent(this.searchNext, 100081)
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              break;
            }

            case "testStoreWebArchive001": {
              try {
                this.controller.loadUrl("resource://rawfile/index.html");
                await Utils.sleep(2000);
                this.controller.storeWebArchive("/data/storage/el2/base/", true, (error, filename) => {
                  if (error) {
                    console.info(`save web archive error: ` + JSON.stringify(error))
                    return;
                  }
                  if (filename != null) {
                    console.info(`save web archive success: ${filename}`)
                    Utils.emitEvent(filename, 37013)
                  }
                });
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              break;
            }

            case "testStoreWebArchive002": {
              try {
                this.controller.loadUrl("resource://rawfile/second.html");
                await Utils.sleep(2000);
                this.controller.storeWebArchive("/data/storage/el2/base/", true)
                  .then(filename => {
                    if (filename != null) {
                      console.info(`save web archive success: ${filename}`)
                      Utils.emitEvent(filename, 37014)
                    }
                  })
                  .catch((error: business_error.BusinessError) => {
                    console.log('error: ' + JSON.stringify(error));
                  })
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              break;
            }

            case "testStoreWebArchive003": {
              try {
                this.controller.loadUrl("resource://rawfile/index.html");
                await Utils.sleep(2000);
                this.controller.storeWebArchive("/data/storage/el2/base/index.html.mht", false, (error, filename) => {
                  if (error) {
                    console.info(`save web archive error: ` + JSON.stringify(error))
                    return;
                  }
                  if (filename != null) {
                    console.info(`save web archive success: ${filename}`)
                    Utils.emitEvent(filename, 37015)
                  }
                });
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              break;
            }

            case "testStoreWebArchive004": {
              try {
                this.controller.loadUrl("resource://rawfile/index.html");
                await Utils.sleep(2000);
                this.controller.storeWebArchive("/data/storage/el2/base/index.html.mht", false)
                  .then(filename => {
                    if (filename != null) {
                      console.info(`save web archive success: ${filename}`)
                      Utils.emitEvent(filename, 37016)
                    }
                  })
                  .catch((error: business_error.BusinessError) => {
                    console.log('error: ' + JSON.stringify(error));
                  })
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              break;
            }

            case "testStop001": {
              try {
                this.controller.loadUrl("http://appgallery.huawei.com/")
                this.controller.stop()
                await Utils.sleep(2000);
                let title = this.controller.getTitle()
                Utils.emitEvent(title, 37017)
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              break;
            }

            case "testGetCustomUserAgent001": {
              try {
                Utils.emitEvent(this.controller.getCustomUserAgent().indexOf('OpenHarmony') >= 0, 37018)
              } catch (error) {
                console.error(`ErrorCode: ${error.code}, Message: ${error.message}`);
              }
              break;
            }

            case "testSetCustomUserAgent001": {
              try {
                let setUA = "userAgent"
                this.controller.setCustomUserAgent(setUA)
                Utils.emitEvent(this.controller.getCustomUserAgent(), 37019);
              } catch (error) {
                console.error(`ErrorCode: ${error.code}, Message: ${error.message}`);
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
            console.info("x = " + event.xOffset)
            console.info("y = " + event.yOffset)
            this.onScrollCallBack = true
          }
        })
        .onOverScroll((event) => {
          if (event) {
            console.info("x = " + event.xOffset)
            console.info("y = " + event.yOffset)
            this.onScrollCallBack = true
          }
        })
        .onPageEnd((event) => {
          if (event) {
            this.enterPageEnd = true
          }
        })
        .onShowFileSelector((event) => {
          if (event) {
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
        .onSearchResultReceive(ret => {
          if (ret) {
            console.log("on search result receive:" + "[cur]" + ret.activeMatchOrdinal +
            "[total]" + ret.numberOfMatches + "[isDone]" + ret.isDoneCounting);
            this.numberOfMatches = ret.numberOfMatches
            this.searchNext = true
          }
        })
    }
  }
}
