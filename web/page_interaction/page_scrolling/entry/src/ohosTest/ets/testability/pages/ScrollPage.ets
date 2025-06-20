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
import { BusinessError } from '@ohos.base';
import { Driver, ON, On } from '@ohos.UiTest';
import image from '@ohos.multimedia.image';

@Entry
@Component
struct setPathAllowingUniversalAccess {
  @State str: string = ""
  @State checkResult: number = 0;
  controller: webView.WebviewController = new webView.WebviewController();
  controllerTwo: webView.WebviewController = new webView.WebviewController();
  nativePort: webView.WebMessagePort | null = null;
  message: webView.WebMessageExt = new webView.WebMessageExt();
  @State pixelMap: image.PixelMap | undefined = undefined;
  @State javaScriptAccess: boolean = true
  @State fileAccess: boolean = true;
  @State domStorageAccess: boolean = true;
  @State imageAccess: boolean = true;
  @State onlineImageAccess: boolean = false;
  @State databaseAccess: boolean = true;
  @State checkEleResult: number[] = [];
  @State registerJavaScriptProxyFlag: boolean = false;
  @State console: string = ""
  @State arrTime: Array<number> = [0, 0]
  @State time: number = 0
  @State onScrollCallBack: boolean = false;
  @State onMessageEventCallBack: boolean = false
  @State ports: webView.WebMessagePort[] = [];
  @State userAgentPC:string = "";


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
        if (this.controller) {
          this.controller.loadUrl("resource://rawfile/index.html");
          this.controller.clearHistory()
        }
      }
    }
  }

  build() {
    Column() {
      Row() {
        Button("setPathAllowingUniversalAccess").key('setPathAllowingUniversalAccessButton').onClick(async () => {
          console.info("key==>" + this.str)
          switch (this.str) {
            case "testScrollTo001": {
              try {
                this.controller.loadUrl("resource://rawfile/theScroll.html");
                await Utils.sleep(2000);
                this.controller.scrollTo(-10, -10);
                await Utils.sleep(1000);
                this.controller.runJavaScript("getScroll()", (error, result) => {
                  if (error) {
                    console.info(`testScrollTo001 runJavaScript error: ` + JSON.stringify(error))
                    Utils.emitEvent(error.code, 100042)
                    return;
                  } else {
                    console.log("testScrollTo001 runJavaScript.result: " + result);
                  }
                  Utils.emitEvent(result, 100042)
                })
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                Utils.emitEvent(error.code, 100042)
              }
              break;
            }

            case "testScrollTo002": {
              try {
                this.controller.loadUrl("resource://rawfile/theScroll.html");
                await Utils.sleep(2000);
                this.controller.scrollTo(-10, 3500);
                await Utils.sleep(1000);
                this.controller.runJavaScript("getScroll()", (error, result) => {
                  if (error) {
                    console.info(`testScrollTo002 runJavaScript error: ` + JSON.stringify(error))
                    Utils.emitEvent(error.code, 100043)
                    return;
                  } else {
                    console.log("testScrollTo002 runJavaScript.result: " + result);
                    if (JSON.parse(result)[0] == 0 && JSON.parse(result)[1] > 100) {
                      Utils.emitEvent(true, 100043)
                    } else {
                      Utils.emitEvent(false, 100043)
                    }
                  }
                })
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                Utils.emitEvent(error.code, 100043)
              }
              break;
            }

            case "testScrollTo003": {
              try {
                this.controller.loadUrl("resource://rawfile/theScroll.html");
                await Utils.sleep(2000);
                this.controller.scrollTo(-10, 100);
                await Utils.sleep(1000);
                this.controller.runJavaScript("getScroll()", (error, result) => {
                  if (error) {
                    console.info(`testScrollTo003 runJavaScript error: ` + JSON.stringify(error))
                    Utils.emitEvent(error.code, 100044)
                    return;
                  } else {
                    console.log("testScrollTo003 runJavaScript.result: " + result);
                  }
                  Utils.emitEvent(result, 100044)
                })
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                Utils.emitEvent(error.code, 100044)
              }
              break;
            }

            case "testScrollTo004": {
              try {
                this.controller.loadUrl("resource://rawfile/theScroll.html");
                await Utils.sleep(2000);
                this.controller.scrollTo(100, -10);
                await Utils.sleep(1000);
                this.controller.runJavaScript("getScroll()", (error, result) => {
                  if (error) {
                    console.info(`testScrollTo004 runJavaScript error: ` + JSON.stringify(error))
                    Utils.emitEvent(error.code, 100045)
                    return;
                  } else {
                    console.log("testScrollTo004 runJavaScript.result: " + result);
                  }
                  Utils.emitEvent(result, 100045)
                })
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                Utils.emitEvent(error.code, 100045)
              }
              break;
            }

            case "testScrollTo005": {
              try {
                this.controller.loadUrl("resource://rawfile/theScroll.html");
                await Utils.sleep(2000);
                this.controller.scrollTo(4000, -10);
                await Utils.sleep(1000);
                this.controller.runJavaScript("getScroll()", (error, result) => {
                  if (error) {
                    console.info(`testScrollTo005 runJavaScript error: ` + JSON.stringify(error))
                    Utils.emitEvent(error.code, 100046)
                    return;
                  } else {
                    console.log("testScrollTo005 runJavaScript.result: " + result);
                    if (JSON.parse(result)[0] > 100 && JSON.parse(result)[1] == 0) {
                      Utils.emitEvent(true, 100046)
                    } else {
                      Utils.emitEvent(false, 100046)
                    }
                  }
                })
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                Utils.emitEvent(error.code, 100046)
              }
              break;
            }

            case "testScrollTo006": {
              try {
                this.controller.loadUrl("resource://rawfile/theScroll.html");
                await Utils.sleep(2000);
                this.controller.scrollTo(100, 100);
                await Utils.sleep(1000);
                this.controller.runJavaScript("getScroll()", (error, result) => {
                  if (error) {
                    console.info(`testScrollTo006 runJavaScript error: ` + JSON.stringify(error))
                    Utils.emitEvent(error.code, 100047)
                    return;
                  } else {
                    console.log("testScrollTo006 runJavaScript.result: " + result);
                  }
                  Utils.emitEvent(result, 100047)
                  console.info("testScrollTo006  res: " + result);
                })
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                Utils.emitEvent(error.code, 100047)
              }
              break;
            }

            case "testScrollTo007": {
              try {
                this.controller.loadUrl("resource://rawfile/theScroll.html");
                await Utils.sleep(2000);
                this.controller.scrollTo(4000, 3500);
                await Utils.sleep(1000);
                this.controller.runJavaScript("getScroll()", (error, result) => {
                  if (error) {
                    console.info(`testScrollTo007 runJavaScript error: ` + JSON.stringify(error))
                    Utils.emitEvent(error.code, 100048)
                    return;
                  } else {
                    console.log("testScrollTo007 runJavaScript.result: " + result);
                    if (JSON.parse(result)[0] > 100 && JSON.parse(result)[1] > 100) {
                      Utils.emitEvent(true, 100048)
                    } else {
                      Utils.emitEvent(false, 100048)
                    }
                  }
                })
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                Utils.emitEvent(error.code, 100048)
              }
              break;
            }

            case "testPageDown001": {
              try {
                this.userAgentPC = this.controller.getUserAgent();
                if ((this.userAgentPC).includes("tablet")) {
                  Utils.emitEvent(true, 100063)
                  break;
                }
                this.controller.loadUrl($rawfile('indexCopyTwo.html'))
                await Utils.sleep(3000)
                this.controller.runJavaScript("checkVIsible()", (error, result) => {
                  if (error) {
                    console.error(`The checkVIsible() return value is: error`);
                    return;
                  }
                  this.checkEleResult = JSON.parse(result)
                  console.log(`The checkVIsible() return value is: ${result}`);
                  
                })
                this.controller.pageDown(false);
                await Utils.sleep(3000)
                this.controller.runJavaScript("checkVIsible()", (error, result) => {
                  if (error) {
                    console.error(`The checkVIsible() return value is: error`);
                    return;
                  }
                  console.log(`The checkVIsible() again return value is: ${result}`);
                  if (this.checkEleResult[3] < JSON.parse(result)[3] && JSON.parse(result)[3] <
                    (JSON.parse(result)[1] / 2)) {
                    console.log('testPageDown001 result is :' + true);
                    Utils.emitEvent(true, 100063)
                  } else {
                    console.log('testPageDown001 result is :' + false);
                    Utils.emitEvent(false, 100063)
                  }
                })
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                Utils.emitEvent(false, 100063)
              }
              break;
            }

            case "testPageDown002": {
              try {
                this.controller.loadUrl($rawfile('indexCopyTwo.html'))
                this.userAgentPC = this.controller.getUserAgent();
                if ((this.userAgentPC).includes("Tablet")) {
                  this.controller.loadUrl($rawfile('indexCopyTablet.html'))
                }
                await Utils.sleep(3000)
                this.controller.runJavaScript("checkVIsible()", (error, result) => {
                  if (error) {
                    console.error(`The checkVIsible() return value is: error`);
                    return;
                  }
                  console.log(`The checkVIsible() return value is: ${result}`);
                })
                this.controller.pageDown(true);
                await Utils.sleep(3000)
                this.controller.runJavaScript("checkVIsible()", (error, result) => {
                  if (error) {
                    console.error(`The checkVIsible() return value is: error`);
                    return;
                  }
                  console.log(`The checkVIsible() again return value is: ${result}`);
                  if ((JSON.parse(result)[1] / 2) < JSON.parse(result)[3] && JSON.parse(result)[3] <
                  JSON.parse(result)[1]) {
                    console.log('testPageDown002 result is :' + true);
                    Utils.emitEvent(true, 100064)
                  } else {
                    console.log('testPageDown002 result is :' + true);
                    Utils.emitEvent(false, 100064)
                  }
                })
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                Utils.emitEvent(false, 100064)
              }
              break;
            }

            case "testPageUp001": {
              try {
                this.userAgentPC = this.controller.getUserAgent();
                if ((this.userAgentPC).includes("tablet")) {
                  Utils.emitEvent(true, 100065)
                  break;
                }
                this.controller.loadUrl($rawfile('indexCopyTwo.html'))
                await Utils.sleep(3000)
                this.controller.pageDown(false);
                await Utils.sleep(3000)
                this.controller.runJavaScript("checkVIsible()", (error, result) => {
                  if (error) {
                    console.error(`The checkVIsible() return value is: error`);
                    return;
                  }
                  console.log(`The checkVIsible() return value is: ${result}`);
                  this.checkEleResult = JSON.parse(result)
                })
                this.controller.pageUp(false);
                await Utils.sleep(3000)
                this.controller.runJavaScript("checkVIsible()", (error, result) => {
                  if (error) {
                    console.error(`The checkVIsible() return value is: error`);
                    return;
                  }
                  console.log(`The checkVIsible() again return value is: ${result}`);
                  if (JSON.parse(result)[3] == 0) {
                    console.log('testPageUp001 result is :' + true);
                    Utils.emitEvent(true, 100065)
                  } else {
                    console.log('testPageUp001 result is :' + false);
                    Utils.emitEvent(false, 100065)
                  }
                })
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                Utils.emitEvent(false, 100065)
              }
              break;
            }

            case "testPageUp002": {
              try {
                this.controller.loadUrl($rawfile('indexCopyTwo.html'))
                this.userAgentPC = this.controller.getUserAgent();
                if ((this.userAgentPC).includes("Tablet")) {
                  this.controller.loadUrl($rawfile('indexCopyTablet.html'))
                }
                await Utils.sleep(3000)
                this.controller.pageDown(true);
                await Utils.sleep(3000)
                this.controller.runJavaScript("checkVIsible()", (error, result) => {
                  if (error) {
                    console.error(`The checkVIsible() return value is: error`);
                    return;
                  }
                  console.log(`The checkVIsible() return value is: ${result}`);
                  this.checkEleResult = JSON.parse(result)
                })
                this.controller.pageUp(true);
                await Utils.sleep(3000)
                this.controller.runJavaScript("checkVIsible()", (error, result) => {
                  if (error) {
                    console.error(`The checkVIsible() return value is: error`);
                    return;
                  }
                  console.log(`The checkVIsible() again return value is: ${result}`);
                  if (JSON.parse(result)[3] == 0 && this.checkEleResult[3] > (JSON.parse(result)[1] / 2)) {
                    console.log('testPageUp002 result is :' + true);
                    Utils.emitEvent(true, 100066)
                  } else {
                    console.log('testPageUp002 result is :' + false);
                    Utils.emitEvent(false, 100066)
                  }
                })
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                Utils.emitEvent(false, 100066)
              }
              break;
            }

            case "testSlideScroll001": {
              try {
                this.controller.loadUrl("resource://rawfile/index.html")
                this.onScrollCallBack = false
                this.controller.slideScroll(-500, 200);
                await Utils.sleep(2000)
                Utils.emitEvent(this.onScrollCallBack, 100082)
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
        .fileAccess(this.fileAccess)
        .imageAccess(this.imageAccess)
        .domStorageAccess(this.domStorageAccess)
        .onlineImageAccess(this.onlineImageAccess)
        .databaseAccess(this.databaseAccess)
        .onConsole((event) => {
          if (event) {
            this.console = event.message.getMessage()
          }
          return false
        })
        .onFirstContentfulPaint(event => {
          if (event) {
            console.log("onFirstContentfulPaint:" + "[navigationStartTick]:" +
            event.navigationStartTick + ", [firstContentfulPaintMs]:" +
            event.firstContentfulPaintMs)
            this.time = event.firstContentfulPaintMs - event.navigationStartTick / 1000
            this.arrTime.push(this.time)
          }
        })
        .onScroll((event) => {
          if (event) {
            console.info("onScroll x = " + event.xOffset)
            console.info("onScroll y = " + event.yOffset)
            this.onScrollCallBack = true
          }
        })
        .onPageEnd((event) => {
          if (event) {
            if (this.onMessageEventCallBack) {
              this.ports = this.controller.createWebMessagePorts(true);
              this.controller.postMessage("init_web_messageport", [this.ports[1]], "*");
              this.nativePort = this.ports[0];
              this.nativePort.onMessageEvent((result) => {
                if (result) {
                  console.log(`log error result: ${result}`);
                  Utils.emitEvent(result, 100084)
                }
              });
            }
            console.log('url:' + event.url)
          }
        })
      Web({ src: $rawfile('indexTwo.html'), controller: this.controllerTwo })
        .id('2')
        .key('web2')
        .javaScriptAccess(this.javaScriptAccess)
        .fileAccess(this.fileAccess)
        .imageAccess(this.imageAccess)
        .domStorageAccess(this.domStorageAccess)
        .onlineImageAccess(this.onlineImageAccess)
        .databaseAccess(this.databaseAccess)
    }
  }
}
