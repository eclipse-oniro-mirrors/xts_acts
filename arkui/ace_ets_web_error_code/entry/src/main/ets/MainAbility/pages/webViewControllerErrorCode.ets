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

import Utils from '../../test/Utils';
import webView from '@ohos.web.webview';
import events_emitter from '@ohos.events.emitter';
import { JsProxyObject } from '../../test/Interfaces';
import business_error from '@ohos.base';
import image from "@ohos.multimedia.image";

class testObj {
  constructor() {
  }

  test(): string {
    return "ArkUI Web Component";
  }

  toString(): void {
    console.log('Web Component toString');
  }
}

@Entry
@Component
struct Index {
  controller: webView.WebviewController = new webView.WebviewController();
  controllerNull: webView.WebviewController = new webView.WebviewController();
  nativePort: webView.WebMessagePort | null = null;
  responseWeb: WebResourceResponse = new WebResourceResponse()
  @State webResult: string = ' ';
  @State str: string = ""
  @State javaScriptAccess: boolean = true;
  @State databaseAccess: boolean = true
  @State searchString: string = "Hello World";
  @State searchNumber: number = 2;
  @State ports: webView.WebMessagePort[] = [];
  @State receivedFromHtml: string = 'Display received message send from HTML';
  updateContent: string = '<body><div><image src=resource://rawfile/test.png ' +
  'alt="image -- end" width="500" height="250"></image></div></body>';
  @State msg1: string = '';
  @State msg2: string = '';
  @State testObj: testObj = new testObj();
  @State name: string = 'objName';
  @State origin: string = "file:///";
  @State host: string = "www.spincast.org";
  @State realm: string = "protected example";
  @State username_password: string[] = [];
  @State steps: number = 1;
  @State step: number = -2;
  @State factor: number = 1;
  @State level: number = 100;
  @State lineNumber: number = 100;
  @State sourceID: string = "test";
  @State message: string = "123";
  @State pixelMap: image.PixelMap | undefined = undefined;
  @State errorCode: string = '0';
  scheme1: webView.WebCustomScheme = { schemeName: "name1", isSupportCORS: true, isSupportFetch: true }
  scheme2: webView.WebCustomScheme = { schemeName: "name2", isSupportCORS: true, isSupportFetch: true }
  scheme3: webView.WebCustomScheme = { schemeName: "name3", isSupportCORS: true, isSupportFetch: true }
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
        Button("WebViewControllerErrorCode click").key('WebViewControllerErrorCodeButton').onClick(async () => {
          console.info("key==>" + this.str)
          switch (this.str) {

            case "testGetUrlError001": {
              try {
                let url = this.controllerNull.getUrl();
                console.log("url: " + url);
                Utils.emitEvent(this.no_error, 20260)
              } catch (error) {
                let e: business_error.BusinessError = error as business_error.BusinessError;
                console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                Utils.emitEvent(String(e.code), 20260)
              }
              break;
            }

            case "testPageUpError001": {
              try {
                this.controllerNull.pageUp(true);
                Utils.emitEvent(this.no_error, 20265)
              } catch (error) {
                let e: business_error.BusinessError = error as business_error.BusinessError;
                console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                Utils.emitEvent(String(e.code), 20265)
              }
              break;
            }

            case "testPageUpError002": {
              try {
                this.controllerNull.pageUp(false);
                Utils.emitEvent(this.no_error, 20266)
              } catch (error) {
                let e: business_error.BusinessError = error as business_error.BusinessError;
                console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                Utils.emitEvent(String(e.code), 20266)
              }
              break;
            }

            case "testPageDownError001": {
              try {
                this.controllerNull.pageDown(true);
                Utils.emitEvent(this.no_error, 20270)
              } catch (error) {
                let e: business_error.BusinessError = error as business_error.BusinessError;
                console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                Utils.emitEvent(String(e.code), 20270)
              }
              break;
            }

            case "testPageDownError002": {
              try {
                this.controllerNull.pageDown(false);
                Utils.emitEvent(this.no_error, 20271)
              } catch (error) {
                let e: business_error.BusinessError = error as business_error.BusinessError;
                console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                Utils.emitEvent(String(e.code), 20271)
              }
              break;
            }

            case "testGetOriginalUrlError001": {
              try {
                let url = this.controllerNull.getOriginalUrl();
                console.log("url: " + url);
                Utils.emitEvent(this.no_error, 20275)
              } catch (error) {
                let e: business_error.BusinessError = error as business_error.BusinessError;
                console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                Utils.emitEvent(String(e.code), 20275)
              }
              break;
            }

            case "testGetFaviconError001": {
              try {
                this.pixelMap = this.controllerNull.getFavicon();
                Utils.emitEvent(this.no_error, 20280)
              } catch (error) {
                let e: business_error.BusinessError = error as business_error.BusinessError;
                console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                Utils.emitEvent(String(e.code), 20280)
              }
              break;
            }

            case "testSetNetworkAvailableError001": {
              try {
                this.controllerNull.setNetworkAvailable(true);
                Utils.emitEvent(this.no_error, 20285)
              } catch (error) {
                let e: business_error.BusinessError = error as business_error.BusinessError;
                console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                Utils.emitEvent(String(e.code), 20285)
              }
              break;
            }

            case "testSetNetworkAvailableError002": {
              try {
                this.controllerNull.setNetworkAvailable(false);
                Utils.emitEvent(this.no_error, 20286)
              } catch (error) {
                let e: business_error.BusinessError = error as business_error.BusinessError;
                console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                Utils.emitEvent(String(e.code), 20286)
              }
              break;
            }

            case "testHasImageError001": {
              try {
                this.controllerNull.hasImage((error, data) => {
                  if (error) {
                    console.info(`hasImage error: ` + JSON.stringify(error))
                    Utils.emitEvent(String(error.code), 20290)
                    return;
                  }
                  console.info("hasImage: " + data);
                  Utils.emitEvent(this.no_error, 20290)
                });
              } catch (error) {
                let e: business_error.BusinessError = error as business_error.BusinessError;
                console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                Utils.emitEvent(String(e.code), 20290)
              }
              break;
            }

            case "testHasImageError002": {
              try {
                this.controllerNull.hasImage().then((data) => {
                  console.info('hasImage: ' + data);
                  Utils.emitEvent(this.no_error, 20291)
                })
                  .catch((error: business_error.BusinessError) => {
                    console.error("error: " + error);
                    Utils.emitEvent(String(error.code), 20291)
                  })
              } catch (error) {
                let e: business_error.BusinessError = error as business_error.BusinessError;
                console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                Utils.emitEvent(String(e.code), 20291)
              }
              break;
            }

            case "testGetBackForwardEntriesError001": {
              try {
                let list = this.controllerNull.getBackForwardEntries()
                console.info('getBackForwardEntries: ' + list);
                Utils.emitEvent(this.no_error, 20295)
              } catch (error) {
                let e: business_error.BusinessError = error as business_error.BusinessError;
                console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                Utils.emitEvent(String(e.code), 20295)
              }
              break;
            }

            case "testScrollToError001": {
              try {
                this.controllerNull.scrollTo(50, 50);
                Utils.emitEvent(this.no_error, 20300)
              } catch (error) {
                let e: business_error.BusinessError = error as business_error.BusinessError;
                console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                Utils.emitEvent(String(e.code), 20300)
              }
              break;
            }

            case "testRunJavaScriptError001": {
              try {
                this.controllerNull.runJavaScript(
                  'test()',
                  (error, result) => {
                    if (error) {
                      console.info(`run JavaScript error: ` + JSON.stringify(error))
                      Utils.emitEvent(String(error.code), 20305)
                      return;
                    }
                    if (result) {
                      this.webResult = result
                      console.info(`The test() return value is: ${result}`)
                      Utils.emitEvent(this.no_error, 20305)
                    }
                  });
              } catch (error) {
                let e: business_error.BusinessError = error as business_error.BusinessError;
                console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                Utils.emitEvent(String(e.code), 20305)
              }
              break;
            }

            case "testRunJavaScriptError002": {
              try {
                this.controllerNull.runJavaScript('test()')
                  .then((result) => {
                    console.log('result: ' + result);
                    Utils.emitEvent(this.no_error, 20306)
                  })
                  .catch((error: business_error.BusinessError) => {
                    console.error("error: " + error);
                    Utils.emitEvent(String(error.code), 20306)
                  })
              } catch (error) {
                let e: business_error.BusinessError = error as business_error.BusinessError;
                console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                Utils.emitEvent(String(e.code), 20306)
              }
              break;
            }

            case "testRunJavaScriptExtError001": {
              try {
                this.controllerNull.runJavaScriptExt(
                  'test()',
                  (error, result) => {
                    if (error) {
                      console.info(`run JavaScript error: ` + JSON.stringify(error))
                      Utils.emitEvent(String(error.code), 20310)
                      return;
                    }
                    if (result) {
                      console.info(`The test() return value is: ${result}`)
                      Utils.emitEvent(this.no_error, 20310)
                    }
                  });
              } catch (error) {
                let e: business_error.BusinessError = error as business_error.BusinessError;
                console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                Utils.emitEvent(String(e.code), 20310)
              }
              break;
            }

            case "testRunJavaScriptExtError002": {
              try {
                this.controllerNull.runJavaScriptExt('test()')
                  .then((result) => {
                    console.log('result: ' + result);
                    Utils.emitEvent(this.no_error, 20311)
                  })
                  .catch((error: business_error.BusinessError) => {
                    console.error("error: " + error);
                    Utils.emitEvent(String(error.code), 20311)
                  })
              } catch (error) {
                let e: business_error.BusinessError = error as business_error.BusinessError;
                console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                Utils.emitEvent(String(e.code), 20311)
              }
              break;
            }

            case "testStoreWebArchiveError001": {
              try {
                this.controllerNull.storeWebArchive("/data/storage/el2/base/", false, (error, filename) => {
                  if (error) {
                    console.info(`save web archive error: ` + JSON.stringify(error))
                    Utils.emitEvent(String(error.code), 20350)
                    return;
                  }
                  if (filename != null) {
                    console.info(`save web archive success: ${filename}`)
                  }
                  Utils.emitEvent(this.no_error, 20350)
                });
              } catch (error) {
                let e: business_error.BusinessError = error as business_error.BusinessError;
                console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                Utils.emitEvent(String(e.code), 20350)
              }
              break;
            }

            case "testStoreWebArchiveError002": {
              try {
                this.controllerNull.storeWebArchive("/data/storage/el2/base/", true, (error, filename) => {
                  if (error) {
                    console.info(`save web archive error: ` + JSON.stringify(error))
                    Utils.emitEvent(String(error.code), 20351)
                    return;
                  }
                  if (filename != null) {
                    console.info(`save web archive success: ${filename}`)
                  }
                  Utils.emitEvent(this.no_error, 20351)
                });
              } catch (error) {
                let e: business_error.BusinessError = error as business_error.BusinessError;
                console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                Utils.emitEvent(String(e.code), 20351)
              }
              break;
            }

            case "testStoreWebArchiveError003": {
              try {
                this.controller.storeWebArchive("/data/storage/el2/,/base/", false, (error, filename) => {
                  if (error) {
                    console.info(`save web archive error: ` + JSON.stringify(error))
                    Utils.emitEvent(String(error.code), 20352)
                    return;
                  }
                  if (filename != null) {
                    console.info(`save web archive success: ${filename}`)
                  }
                  Utils.emitEvent(this.no_error, 20352)
                });
              } catch (error) {
                let e: business_error.BusinessError = error as business_error.BusinessError;
                console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                Utils.emitEvent(String(e.code), 20352)
              }
              break;
            }

            case "testStoreWebArchiveError004": {
              try {
                this.controller.storeWebArchive("/data/storage/el2/,/base/", true, (error, filename) => {
                  if (error) {
                    console.info(`save web archive error: ` + JSON.stringify(error))
                    Utils.emitEvent(String(error.code), 20353)
                    return;
                  }
                  if (filename != null) {
                    console.info(`save web archive success: ${filename}`)
                  }
                  Utils.emitEvent(this.no_error, 20353)
                });
              } catch (error) {
                let e: business_error.BusinessError = error as business_error.BusinessError;
                console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                Utils.emitEvent(String(e.code), 20353)
              }
              break;
            }

            case "testStoreWebArchiveError005": {
              try {
                this.controllerNull.storeWebArchive("/data/storage/el2/base/", false)
                  .then(filename => {
                    if (filename != null) {
                      console.info(`save web archive success: ${filename}`)
                    }
                    Utils.emitEvent(this.no_error, 20354)
                  })
                  .catch((error: business_error.BusinessError) => {
                    console.log('error: ' + JSON.stringify(error));
                    Utils.emitEvent(String(error.code), 20354)
                  })
              } catch (error) {
                let e: business_error.BusinessError = error as business_error.BusinessError;
                console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                Utils.emitEvent(String(e.code), 20354)
              }
              break;
            }

            case "testStoreWebArchiveError006": {
              try {
                this.controllerNull.storeWebArchive("/data/storage/el2/base/", true)
                  .then(filename => {
                    if (filename != null) {
                      console.info(`save web archive success: ${filename}`)
                    }
                    Utils.emitEvent(this.no_error, 20355)
                  })
                  .catch((error: business_error.BusinessError) => {
                    console.log('error: ' + JSON.stringify(error));
                    Utils.emitEvent(String(error.code), 20355)
                  })
              } catch (error) {
                let e: business_error.BusinessError = error as business_error.BusinessError;
                console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                Utils.emitEvent(String(e.code), 20355)
              }
              break;
            }

            case "testStoreWebArchiveError007": {
              try {
                this.controller.storeWebArchive("/data/storage/el2/,/base/", false)
                  .then(filename => {
                    if (filename != null) {
                      console.info(`save web archive success: ${filename}`)
                    }
                    Utils.emitEvent(this.no_error, 20356)
                  })
                  .catch((error: business_error.BusinessError) => {
                    console.log('error: ' + JSON.stringify(error));
                    Utils.emitEvent(String(error.code), 20356)
                  })
              } catch (error) {
                let e: business_error.BusinessError = error as business_error.BusinessError;
                console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                Utils.emitEvent(String(e.code), 20356)
              }
              break;
            }

            case "testStoreWebArchiveError008": {
              try {
                this.controller.storeWebArchive("/data/storage/el2/,/base/", true)
                  .then(filename => {
                    if (filename != null) {
                      console.info(`save web archive success: ${filename}`)
                    }
                    Utils.emitEvent(this.no_error, 20357)
                  })
                  .catch((error: business_error.BusinessError) => {
                    console.log('error: ' + JSON.stringify(error));
                    Utils.emitEvent(String(error.code), 20357)
                  })
              } catch (error) {
                let e: business_error.BusinessError = error as business_error.BusinessError;
                console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                Utils.emitEvent(String(e.code), 20357)
              }
              break;
            }

            case "testRemoveCacheError001": {
              try {
                this.controllerNull.removeCache(false);
                Utils.emitEvent(this.no_error, 20358)
              } catch (error) {
                let e: business_error.BusinessError = error as business_error.BusinessError;
                console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                Utils.emitEvent(String(e.code), 20358)
              }
              break;
            }

          }
        })
      }

      Web({ src: $rawfile('index.html'), controller: this.controller })
        .javaScriptAccess(this.javaScriptAccess)
        .javaScriptProxy({
          object: this.jsObj,
          name: "backToEts",
          methodList: ["test", "toString"],
          controller: this.controller
        })
        .onErrorReceive((event) => {
          if (event) {
            console.log('getErrorInfo:' + event.error.getErrorInfo())
            console.log('getErrorCode:' + event.error.getErrorCode())
            console.log('url:' + event.request.getRequestUrl())
            console.log('isMainFrame:' + event.request.isMainFrame())
            console.log('isRedirect:' + event.request.isRedirect())
            console.log('isRequestGesture:' + event.request.isRequestGesture())
            console.log('getRequestHeader_headerKey:' + event.request.getRequestHeader().toString())
            let result = event.request.getRequestHeader()
            console.log('The request header result size is ' + result.length)
            for (let i of result) {
              console.log('The request header key is : ' + i.headerKey + ', value is : ' + i.headerValue)
            }
          }
        })
        .onConsole((event) => {
          if (event) {
            this.level = event.message.getMessageLevel()
            this.message = event.message.getMessage()
            this.lineNumber = event.message.getLineNumber()
            this.sourceID = event.message.getSourceId()
          }
          return false
        })
        .zoomAccess(false)
        .databaseAccess(this.databaseAccess)
    }
  }
}
