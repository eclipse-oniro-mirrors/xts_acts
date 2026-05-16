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
import business_error from '@ohos.base';
import image from "@ohos.multimedia.image";

const EVENT_ID_SET_EMIT_KEY = 115280;

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
  @State isPageEnd: number = -1;
  @State isReceive: number = -1;
  scheme1: webView.WebCustomScheme = { schemeName: "name1", isSupportCORS: true, isSupportFetch: true }
  scheme2: webView.WebCustomScheme = { schemeName: "name2", isSupportCORS: true, isSupportFetch: true }
  scheme3: webView.WebCustomScheme = { schemeName: "name3", isSupportCORS: true, isSupportFetch: true }
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
        Button("WebViewControllerErrorCode click").key('WebViewControllerErrorCodeButton').onClick(async () => {
          await Utils.waitForExist(()=>this.isPageEnd, 'WebViewControllerErrorCodeButtonIsPageEnd', 1, 1000);
          await Utils.waitForExist(()=>this.isReceive, 'WebViewControllerErrorCodeButtonIsReceive', 1, 1000);
          console.info("key==>" + this.str);
          this.isReceive = -1;
          switch (this.str) {
            case "testGetUrlError001": {
              try {
                let url = this.controllerNull.getUrl();
                console.log("url: " + url);
                Utils.emitEvent(this.no_error, 115290)
              } catch (error) {
                let e: business_error.BusinessError = error as business_error.BusinessError;
                console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                Utils.emitEvent(String(e.code), 115290)
              }
              break;
            }

            case "testPageUpError001": {
              try {
                this.controllerNull.pageUp(true);
                Utils.emitEvent(this.no_error, 115300)
              } catch (error) {
                let e: business_error.BusinessError = error as business_error.BusinessError;
                console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                Utils.emitEvent(String(e.code), 115300)
              }
              break;
            }

            case "testPageUpError002": {
              try {
                this.controllerNull.pageUp(false);
                Utils.emitEvent(this.no_error, 115310)
              } catch (error) {
                let e: business_error.BusinessError = error as business_error.BusinessError;
                console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                Utils.emitEvent(String(e.code), 115310)
              }
              break;
            }

            case "testPageDownError001": {
              try {
                this.controllerNull.pageDown(true);
                Utils.emitEvent(this.no_error, 115320)
              } catch (error) {
                let e: business_error.BusinessError = error as business_error.BusinessError;
                console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                Utils.emitEvent(String(e.code), 115320)
              }
              break;
            }

            case "testPageDownError002": {
              try {
                this.controllerNull.pageDown(false);
                Utils.emitEvent(this.no_error, 115330)
              } catch (error) {
                let e: business_error.BusinessError = error as business_error.BusinessError;
                console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                Utils.emitEvent(String(e.code), 115330)
              }
              break;
            }

            case "testGetOriginalUrlError001": {
              try {
                let url = this.controllerNull.getOriginalUrl();
                console.log("url: " + url);
                Utils.emitEvent(this.no_error, 115340)
              } catch (error) {
                let e: business_error.BusinessError = error as business_error.BusinessError;
                console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                Utils.emitEvent(String(e.code), 115340)
              }
              break;
            }

            case "testGetFaviconError001": {
              try {
                this.pixelMap = this.controllerNull.getFavicon();
                Utils.emitEvent(this.no_error, 115350)
              } catch (error) {
                let e: business_error.BusinessError = error as business_error.BusinessError;
                console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                Utils.emitEvent(String(e.code), 115350)
              }
              break;
            }

            case "testSetNetworkAvailableError001": {
              try {
                this.controllerNull.setNetworkAvailable(true);
                Utils.emitEvent(this.no_error, 115360)
              } catch (error) {
                let e: business_error.BusinessError = error as business_error.BusinessError;
                console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                Utils.emitEvent(String(e.code), 115360)
              }
              break;
            }

            case "testSetNetworkAvailableError002": {
              try {
                this.controllerNull.setNetworkAvailable(false);
                Utils.emitEvent(this.no_error, 115370)
              } catch (error) {
                let e: business_error.BusinessError = error as business_error.BusinessError;
                console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                Utils.emitEvent(String(e.code), 115370)
              }
              break;
            }

            case "testHasImageError001": {
              try {
                this.controllerNull.hasImage((error, data) => {
                  if (error) {
                    console.info(`hasImage error: ` + JSON.stringify(error))
                    Utils.emitEvent(String(error.code), 115380)
                    return;
                  }
                  console.info("hasImage: " + data);
                  Utils.emitEvent(this.no_error, 115380)
                });
              } catch (error) {
                let e: business_error.BusinessError = error as business_error.BusinessError;
                console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                Utils.emitEvent(String(e.code), 115380)
              }
              break;
            }

            case "testHasImageError002": {
              try {
                this.controllerNull.hasImage().then((data) => {
                  console.info('hasImage: ' + data);
                  Utils.emitEvent(this.no_error, 115390)
                })
                  .catch((error: business_error.BusinessError) => {
                    console.error("error: " + error);
                    Utils.emitEvent(String(error.code), 115390)
                  })
              } catch (error) {
                let e: business_error.BusinessError = error as business_error.BusinessError;
                console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                Utils.emitEvent(String(e.code), 115390)
              }
              break;
            }

            case "testGetBackForwardEntriesError001": {
              try {
                let list = this.controllerNull.getBackForwardEntries()
                console.info('getBackForwardEntries: ' + list);
                Utils.emitEvent(this.no_error, 115400)
              } catch (error) {
                let e: business_error.BusinessError = error as business_error.BusinessError;
                console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                Utils.emitEvent(String(e.code), 115400)
              }
              break;
            }

            case "testScrollToError001": {
              try {
                this.controllerNull.scrollTo(50, 50);
                Utils.emitEvent(this.no_error, 115410)
              } catch (error) {
                let e: business_error.BusinessError = error as business_error.BusinessError;
                console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                Utils.emitEvent(String(e.code), 115410)
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
                      Utils.emitEvent(String(error.code), 115420)
                      return;
                    }
                    if (result) {
                      this.webResult = result
                      console.info(`The test() return value is: ${result}`)
                      Utils.emitEvent(this.no_error, 115420)
                    }
                  });
              } catch (error) {
                let e: business_error.BusinessError = error as business_error.BusinessError;
                console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                Utils.emitEvent(String(e.code), 115420)
              }
              break;
            }

            case "testRunJavaScriptError002": {
              try {
                this.controllerNull.runJavaScript('test()')
                  .then((result) => {
                    console.log('result: ' + result);
                    Utils.emitEvent(this.no_error, 115430)
                  })
                  .catch((error: business_error.BusinessError) => {
                    console.error("error: " + error);
                    Utils.emitEvent(String(error.code), 115430)
                  })
              } catch (error) {
                let e: business_error.BusinessError = error as business_error.BusinessError;
                console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                Utils.emitEvent(String(e.code), 115430)
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
                      Utils.emitEvent(String(error.code), 115440)
                      return;
                    }
                    if (result) {
                      console.info(`The test() return value is: ${result}`)
                      Utils.emitEvent(this.no_error, 115440)
                    }
                  });
              } catch (error) {
                let e: business_error.BusinessError = error as business_error.BusinessError;
                console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                Utils.emitEvent(String(e.code), 115440)
              }
              break;
            }

            case "testRunJavaScriptExtError002": {
              try {
                this.controllerNull.runJavaScriptExt('test()')
                  .then((result) => {
                    console.log('result: ' + result);
                    Utils.emitEvent(this.no_error, 115450)
                  })
                  .catch((error: business_error.BusinessError) => {
                    console.error("error: " + error);
                    Utils.emitEvent(String(error.code), 115450)
                  })
              } catch (error) {
                let e: business_error.BusinessError = error as business_error.BusinessError;
                console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                Utils.emitEvent(String(e.code), 115450)
              }
              break;
            }

            case "testStoreWebArchiveError001": {
              try {
                this.controllerNull.storeWebArchive("/data/storage/el2/base/", false, (error, filename) => {
                  if (error) {
                    console.info(`save web archive error: ` + JSON.stringify(error))
                    Utils.emitEvent(String(error.code), 115460)
                    return;
                  }
                  if (filename != null) {
                    console.info(`save web archive success: ${filename}`)
                  }
                  Utils.emitEvent(this.no_error, 115460)
                });
              } catch (error) {
                let e: business_error.BusinessError = error as business_error.BusinessError;
                console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                Utils.emitEvent(String(e.code), 115460)
              }
              break;
            }

            case "testStoreWebArchiveError002": {
              try {
                this.controllerNull.storeWebArchive("/data/storage/el2/base/", true, (error, filename) => {
                  if (error) {
                    console.info(`save web archive error: ` + JSON.stringify(error))
                    Utils.emitEvent(String(error.code), 115470)
                    return;
                  }
                  if (filename != null) {
                    console.info(`save web archive success: ${filename}`)
                  }
                  Utils.emitEvent(this.no_error, 115470)
                });
              } catch (error) {
                let e: business_error.BusinessError = error as business_error.BusinessError;
                console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                Utils.emitEvent(String(e.code), 115470)
              }
              break;
            }

            case "testStoreWebArchiveError003": {
              try {
                this.controller.storeWebArchive("/data/storage/el2/,/base/", false, (error, filename) => {
                  if (error) {
                    console.info(`save web archive error: ` + JSON.stringify(error))
                    Utils.emitEvent(String(error.code), 115480)
                    return;
                  }
                  if (filename != null) {
                    console.info(`save web archive success: ${filename}`)
                  }
                  Utils.emitEvent(this.no_error, 115480)
                });
              } catch (error) {
                let e: business_error.BusinessError = error as business_error.BusinessError;
                console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                Utils.emitEvent(String(e.code), 115480)
              }
              break;
            }

            case "testStoreWebArchiveError004": {
              try {
                this.controller.storeWebArchive("/data/storage/el2/,/base/", true, (error, filename) => {
                  if (error) {
                    console.info(`save web archive error: ` + JSON.stringify(error))
                    Utils.emitEvent(String(error.code), 115490)
                    return;
                  }
                  if (filename != null) {
                    console.info(`save web archive success: ${filename}`)
                  }
                  Utils.emitEvent(this.no_error, 115490)
                });
              } catch (error) {
                let e: business_error.BusinessError = error as business_error.BusinessError;
                console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                Utils.emitEvent(String(e.code), 115490)
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
                    Utils.emitEvent(this.no_error, 115500)
                  })
                  .catch((error: business_error.BusinessError) => {
                    console.log('error: ' + JSON.stringify(error));
                    Utils.emitEvent(String(error.code), 115500)
                  })
              } catch (error) {
                let e: business_error.BusinessError = error as business_error.BusinessError;
                console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                Utils.emitEvent(String(e.code), 115500)
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
                    Utils.emitEvent(this.no_error, 115510)
                  })
                  .catch((error: business_error.BusinessError) => {
                    console.log('error: ' + JSON.stringify(error));
                    Utils.emitEvent(String(error.code), 115510)
                  })
              } catch (error) {
                let e: business_error.BusinessError = error as business_error.BusinessError;
                console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                Utils.emitEvent(String(e.code), 115510)
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
                    Utils.emitEvent(this.no_error, 115520)
                  })
                  .catch((error: business_error.BusinessError) => {
                    console.log('error: ' + JSON.stringify(error));
                    Utils.emitEvent(String(error.code), 115520)
                  })
              } catch (error) {
                let e: business_error.BusinessError = error as business_error.BusinessError;
                console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                Utils.emitEvent(String(e.code), 115520)
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
                    Utils.emitEvent(this.no_error, 115530)
                  })
                  .catch((error: business_error.BusinessError) => {
                    console.log('error: ' + JSON.stringify(error));
                    Utils.emitEvent(String(error.code), 115530)
                  })
              } catch (error) {
                let e: business_error.BusinessError = error as business_error.BusinessError;
                console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                Utils.emitEvent(String(e.code), 115530)
              }
              break;
            }

            case "testRemoveCacheError001": {
              try {
                this.controllerNull.removeCache(false);
                Utils.emitEvent(this.no_error, 115540)
              } catch (error) {
                let e: business_error.BusinessError = error as business_error.BusinessError;
                console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                Utils.emitEvent(String(e.code), 115540)
              }
              break;
            }
          }
        })
      }

      Web({ src: $rawfile('index.html'), controller: this.controller })
        .javaScriptAccess(this.javaScriptAccess)
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
        .zoomAccess(false)
        .databaseAccess(this.databaseAccess)
        .onPageEnd((event) => {
          console.log('onPageEnd url:' + event.url);
          this.isPageEnd = 1;
        })
    }
  }
}