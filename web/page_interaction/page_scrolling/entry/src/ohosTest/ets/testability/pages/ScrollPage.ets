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
import image from '@ohos.multimedia.image';
import { Driver } from '@kit.TestKit';
import { window } from '@kit.ArkUI';

const EVENT_ID_SET_SUITE_KEY = 179301;
let driver: Driver = Driver.create();

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
  @State isPageEnd: number = -1;
  @State isReceive: number = -1;

  onPageShow() {
    let valueChangeEvent: events_emitter.InnerEvent = {
      eventId: EVENT_ID_SET_SUITE_KEY,
      priority: events_emitter.EventPriority.LOW
    }
    events_emitter.on(valueChangeEvent, this.valueChangeCallBack)
  }

  onPageHide() {
    events_emitter.off(EVENT_ID_SET_SUITE_KEY)
  }

  private valueChangeCallBack = (eventData: events_emitter.EventData) => {
    console.info("web page valueChangeCallBack");
    if (eventData != null) {
      console.info("valueChangeCallBack:" + JSON.stringify(eventData));
      if (eventData.data != null && eventData.data.ACTION != null) {
        this.str = eventData.data.ACTION;
        this.isReceive = 1;
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
          await Utils.waitForExist(()=>this.isReceive, this.str+' isReceive', 1, 1000);
          await Utils.waitForExist(()=>this.isPageEnd, this.str+' isPageEnd', 1, 1000);
          switch (this.str) {
            case "testScrollTo001": {
              try {
                this.isPageEnd = -1;
                this.controller.loadUrl("resource://rawfile/theScroll.html");
                await Utils.waitForExist(()=>this.isPageEnd, this.str+' isPageEnd', 1, 1000);
                this.controller.scrollTo(-10, -10);
                await Utils.waitForReleaseDriver(this.str,driver)
                this.controller.runJavaScript("getScroll()", (error, result) => {
                  if (error) {
                    console.info(`testScrollTo001 runJavaScript error: ` + JSON.stringify(error))
                    Utils.emitEvent(error.code, 179310)
                    return;
                  } else {
                    console.log("testScrollTo001 runJavaScript.result: " + result);
                  }
                  Utils.emitEvent(result, 179310)
                })
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                Utils.emitEvent(error.code, 179310)
              }
              break;
            }

            case "testScrollTo002": {
              try {
                this.isPageEnd = -1;
                this.controller.loadUrl("resource://rawfile/theScroll.html");
                await Utils.waitForExist(()=>this.isPageEnd, this.str+' isPageEnd', 1, 1000);
                this.controller.scrollTo(-10, 3500);
                await Utils.waitForScrollStop(()=>this.controller.getPageOffset().y, this.str+' webYOffset');
                this.controller.runJavaScript("getScroll()", (error, result) => {
                  if (error) {
                    console.info(`testScrollTo002 runJavaScript error: ` + JSON.stringify(error))
                    Utils.emitEvent(error.code, 179320)
                    return;
                  } else {
                    console.log("testScrollTo002 runJavaScript.result: " + result);
                    if (JSON.parse(result)[0] == 0 && JSON.parse(result)[1] > 100) {
                      Utils.emitEvent(true, 179320)
                    } else {
                      Utils.emitEvent(false, 179320)
                    }
                  }
                })
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                Utils.emitEvent(error.code, 179320)
              }
              break;
            }

            case "testScrollTo003": {
              try {
                this.isPageEnd = -1;
                this.controller.loadUrl("resource://rawfile/theScroll.html");
                await Utils.waitForExist(()=>this.isPageEnd, this.str+' isPageEnd', 1, 1000);
                this.controller.scrollTo(-10, 100);
                await Utils.waitForScrollStop(()=>this.controller.getPageOffset().y, this.str+' webYOffset');
                this.controller.runJavaScript("getScroll()", (error, result) => {
                  if (error) {
                    console.info(`testScrollTo003 runJavaScript error: ` + JSON.stringify(error))
                    Utils.emitEvent(error.code, 179330)
                    return;
                  } else {
                    console.log("testScrollTo003 runJavaScript.result: " + result);
                  }
                  Utils.emitEvent(result, 179330)
                })
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                Utils.emitEvent(error.code, 179330)
              }
              break;
            }

            case "testScrollTo004": {
              try {
                this.isPageEnd = -1;
                this.controller.loadUrl("resource://rawfile/theScroll.html");
                await Utils.waitForExist(()=>this.isPageEnd, this.str+' isPageEnd', 1, 1000);
                this.controller.scrollTo(100, -10);
                await Utils.waitForScrollStop(()=>this.controller.getPageOffset().x, this.str+' webYOffset');
                this.controller.runJavaScript("getScroll()", (error, result) => {
                  if (error) {
                    console.info(`testScrollTo004 runJavaScript error: ` + JSON.stringify(error))
                    Utils.emitEvent(error.code, 179340)
                    return;
                  } else {
                    console.log("testScrollTo004 runJavaScript.result: " + result);
                  }
                  Utils.emitEvent(result, 179340)
                })
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                Utils.emitEvent(error.code, 179340)
              }
              break;
            }

            case "testScrollTo005": {
              try {
                this.isPageEnd = -1;
                this.controller.loadUrl("resource://rawfile/theScroll.html");
                await Utils.waitForExist(()=>this.isPageEnd, this.str+' isPageEnd', 1, 1000);
                this.controller.scrollTo(4000, -10);
                await Utils.waitForScrollStop(()=>this.controller.getPageOffset().x, this.str+' webYOffset');
                this.controller.runJavaScript("getScroll()", (error, result) => {
                  if (error) {
                    console.info(`testScrollTo005 runJavaScript error: ` + JSON.stringify(error))
                    Utils.emitEvent(error.code, 179350)
                    return;
                  } else {
                    console.log("testScrollTo005 runJavaScript.result: " + result);
                    if (JSON.parse(result)[0] > 100 && JSON.parse(result)[1] == 0) {
                      Utils.emitEvent(true, 179350)
                    } else {
                      Utils.emitEvent(false, 179350)
                    }
                  }
                })
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                Utils.emitEvent(error.code, 179350)
              }
              break;
            }

            case "testScrollTo006": {
              try {
                this.isPageEnd = -1;
                this.controller.loadUrl("resource://rawfile/theScroll.html");
                await Utils.waitForExist(()=>this.isPageEnd, this.str+' isPageEnd', 1, 1000);
                this.controller.scrollTo(100, 100);
                await Utils.waitForScrollStop(()=>this.controller.getPageOffset().x, this.str+' webYOffset');
                await Utils.waitForScrollStop(()=>this.controller.getPageOffset().y, this.str+' webYOffset');
                this.controller.runJavaScript("getScroll()", (error, result) => {
                  if (error) {
                    console.info(`testScrollTo006 runJavaScript error: ` + JSON.stringify(error))
                    Utils.emitEvent(error.code, 179360)
                    return;
                  } else {
                    console.log("testScrollTo006 runJavaScript.result: " + result);
                  }
                  Utils.emitEvent(result, 179360)
                  console.info("testScrollTo006  res: " + result);
                })
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                Utils.emitEvent(error.code, 179360)
              }
              break;
            }

            case "testScrollTo007": {
              try {
                this.isPageEnd = -1;
                this.controller.loadUrl("resource://rawfile/theScroll.html");
                await Utils.waitForExist(()=>this.isPageEnd, this.str+' isPageEnd', 1, 1000);
                this.controller.scrollTo(4000, 3500);
                await Utils.waitForScrollStop(()=>this.controller.getPageOffset().x, this.str+' webYOffset');
                await Utils.waitForScrollStop(()=>this.controller.getPageOffset().y, this.str+' webYOffset');
                this.controller.runJavaScript("getScroll()", (error, result) => {
                  if (error) {
                    console.info(`testScrollTo007 runJavaScript error: ` + JSON.stringify(error))
                    Utils.emitEvent(error.code, 179370)
                    return;
                  } else {
                    console.log("testScrollTo007 runJavaScript.result: " + result);
                    if (JSON.parse(result)[0] > 100 && JSON.parse(result)[1] > 100) {
                      Utils.emitEvent(true, 179370)
                    } else {
                      Utils.emitEvent(false, 179370)
                    }
                  }
                })
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                Utils.emitEvent(error.code, 179370)
              }
              break;
            }

            case "testPageDown001": {
              try {
                this.userAgentPC = this.controller.getUserAgent();
                if ((this.userAgentPC).includes("Tablet")) {
                  Utils.emitEvent(true, 179380)
                  break;
                }
                this.isPageEnd = -1;
                this.controller.loadUrl($rawfile('indexCopyTwo.html'))
                await Utils.waitForExist(()=>this.isPageEnd, this.str+' isPageEnd', 1, 1000);
                this.controller.runJavaScript("checkVIsible()", (error, result) => {
                  if (error) {
                    console.error(`The checkVIsible() return value is: error`);
                    return;
                  }
                  this.checkEleResult = JSON.parse(result)
                  console.log(`The checkVIsible() return value is: ${result}`);

                })
                this.controller.pageDown(false);
                await Utils.waitForScrollStop(()=>this.controller.getPageOffset().y, this.str+' webYOffset');
                this.controller.runJavaScript("checkVIsible()", (error, result) => {
                  if (error) {
                    console.error(`The checkVIsible() return value is: error`);
                    return;
                  }
                  console.log(`The checkVIsible() again return value is: ${result}`);
                  if (this.checkEleResult[3] < JSON.parse(result)[3] && JSON.parse(result)[3] <
                    (JSON.parse(result)[1] / 2)) {
                    console.log('testPageDown001 result is :' + true);
                    Utils.emitEvent(true, 179380)
                  } else {
                    console.log('testPageDown001 result is :' + false);
                    Utils.emitEvent(false, 179380)
                  }
                })
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                Utils.emitEvent(false, 179380)
              }
              break;
            }

            case "testPageDown002": {
              try {
                this.userAgentPC = this.controller.getUserAgent();
                if ((this.userAgentPC).includes("Tablet")) {
                  this.isPageEnd = -1;
                  this.controller.loadUrl($rawfile('indexCopyTablet.html'))
                  await Utils.waitForExist(()=>this.isPageEnd, this.str+' isPageEnd', 1, 1000);
                }else{
                  this.isPageEnd = -1;
                  this.controller.loadUrl($rawfile('indexCopyTwo.html'))
                  await Utils.waitForExist(()=>this.isPageEnd, this.str+' isPageEnd', 1, 1000);
                }
                this.controller.runJavaScript("checkVIsible()", (error, result) => {
                  if (error) {
                    console.error(`The checkVIsible() return value is: error`);
                    return;
                  }
                  console.log(`The checkVIsible() return value is: ${result}`);
                })
                this.controller.pageDown(true);
                await Utils.waitForScrollStop(()=>this.controller.getPageOffset().y, this.str+' webYOffset');
                this.controller.runJavaScript("checkVIsible()", (error, result) => {
                  if (error) {
                    console.error(`The checkVIsible() return value is: error`);
                    return;
                  }
                  console.log(`The checkVIsible() again return value is: ${result}`);
                  if ((JSON.parse(result)[1] / 2) < JSON.parse(result)[3] && JSON.parse(result)[3] <
                  JSON.parse(result)[1]) {
                    console.log('testPageDown002 result is :' + true);
                    Utils.emitEvent(true, 179390)
                  } else {
                    console.log('testPageDown002 result is :' + true);
                    Utils.emitEvent(false, 179390)
                  }
                })
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                Utils.emitEvent(false, 179390)
              }
              break;
            }

            case "testPageUp001": {
              try {
                this.userAgentPC = this.controller.getUserAgent();
                if ((this.userAgentPC).includes("Tablet")) {
                  Utils.emitEvent(true, 179400)
                  break;
                }
                this.isPageEnd = -1;
                this.controller.loadUrl($rawfile('indexCopyTwo.html'))
                await Utils.waitForExist(()=>this.isPageEnd, this.str+' isPageEnd', 1, 1000);
                this.controller.pageDown(false);
                await Utils.waitForScrollStop(()=>this.controller.getPageOffset().y, this.str+' webYOffset');
                this.controller.runJavaScript("checkVIsible()", (error, result) => {
                  if (error) {
                    console.error(`The checkVIsible() return value is: error`);
                    return;
                  }
                  console.log(`The checkVIsible() return value is: ${result}`);
                  this.checkEleResult = JSON.parse(result)
                })
                this.controller.pageUp(false);
                await Utils.waitForScrollStop(()=>this.controller.getPageOffset().y, this.str+' webYOffset');
                this.controller.runJavaScript("checkVIsible()", (error, result) => {
                  if (error) {
                    console.error(`The checkVIsible() return value is: error`);
                    return;
                  }
                  console.log(`The checkVIsible() again return value is: ${result}`);
                  if (JSON.parse(result)[3] == 0) {
                    console.log('testPageUp001 result is :' + true);
                    Utils.emitEvent(true, 179400)
                  } else {
                    console.log('testPageUp001 result is :' + false);
                    Utils.emitEvent(false, 179400)
                  }
                })
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                Utils.emitEvent(false, 179400)
              }
              break;
            }

            case "testPageUp002": {
              try {
                this.userAgentPC = this.controller.getUserAgent();
                if ((this.userAgentPC).includes("Tablet")) {
                  this.isPageEnd = -1;
                  this.controller.loadUrl($rawfile('indexCopyTablet.html'))
                  await Utils.waitForExist(()=>this.isPageEnd, this.str+' isPageEnd', 1, 1000);
                }else {
                  this.isPageEnd = -1;
                  this.controller.loadUrl($rawfile('indexCopyTwo.html'))
                  await Utils.waitForExist(()=>this.isPageEnd, this.str+' isPageEnd', 1, 1000);
                }
                this.controller.pageDown(true);
                await Utils.waitForScrollStop(()=>this.controller.getPageOffset().y, this.str+' webYOffset');
                this.controller.runJavaScript("checkVIsible()", (error, result) => {
                  if (error) {
                    console.error(`The checkVIsible() return value is: error`);
                    return;
                  }
                  console.log(`The checkVIsible() return value is: ${result}`);
                  this.checkEleResult = JSON.parse(result)
                })
                this.controller.pageUp(true);
                await Utils.waitForScrollStop(()=>this.controller.getPageOffset().y);
                this.controller.runJavaScript("checkVIsible()", (error, result) => {
                  if (error) {
                    console.error(`The checkVIsible() return value is: error`);
                    return;
                  }
                  console.log(`The checkVIsible() again return value is: ${result}`);
                  console.log("==>testPageUp002 this.checkEleResult",this.checkEleResult)
                  if (JSON.parse(result)[3] == 0 && this.checkEleResult[3] > (JSON.parse(result)[1] / 2)) {
                    console.log('testPageUp002 result is :' + true);
                    Utils.emitEvent(true, 179410)
                  } else {
                    console.log('testPageUp002 result is :' + false);
                    Utils.emitEvent(false, 179410)
                  }
                })
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                Utils.emitEvent(false, 179410)
              }
              break;
            }

            case "testSlideScroll001": {
              try {
                this.isPageEnd = -1;
                this.controller.loadUrl("resource://rawfile/index.html")
                await Utils.waitForExist(()=>this.isPageEnd, this.str+' isPageEnd', 1, 1000);
                this.onScrollCallBack = false
                this.controller.slideScroll(-500, 200);
                await Utils.waitForExist(()=>this.onScrollCallBack, this.str+' onScrollCallBack', true, 1000);
                Utils.emitEvent(this.onScrollCallBack, 179420)
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
            this.isPageEnd = 1;
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
