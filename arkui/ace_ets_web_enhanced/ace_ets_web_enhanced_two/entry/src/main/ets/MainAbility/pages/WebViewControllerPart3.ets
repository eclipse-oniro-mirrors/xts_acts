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
import image from '@ohos.multimedia.image';
import { JsProxyObject } from '../../test/Interfaces';
import AbilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import { Hypium } from '@ohos/hypium';
import testsuite from '../../test/List.test';

@Entry
@Component
struct WebViewControllerPart3 {
  controller: webView.WebviewController = new webView.WebviewController();
  controllerTwo: webView.WebviewController = new webView.WebviewController();
  nativePort: webView.WebMessagePort | null = null;
  message: webView.WebMessageExt = new webView.WebMessageExt();
  @State str: string = ""
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
  private jsObj: JsProxyObject = {
    test: (res: object) => {
      console.info("ets toString:" + String(res));
    },
    toString: (str: string) => {
      console.info("ets toString:" + String(str));
    },
    register: (res: object) => {
      if (this.registerJavaScriptProxyFlag == true) {
        Utils.emitEvent(String(res), 100075);
      }
      return "web222"
    }
  }

  aboutToAppear() {
    let abilityDelegator = AbilityDelegatorRegistry.getAbilityDelegator()
    let abilityDelegatorArguments = AbilityDelegatorRegistry.getArguments()
    console.info('start run testcase!!!')
    Hypium.hypiumTest(abilityDelegator, abilityDelegatorArguments, testsuite)
  }

  build() {
    Column() {
      Row() {
        Button("WebViewController click").key('WebViewControllerTestButton').onClick(async () => {
          console.info("key==>" + this.str)
          switch (this.str) {
            case "testAccessForward001": {
              try {
                Utils.emitEvent(this.controller.accessForward(), 50520)
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              break;
            }
            case "testAccessForward002": {
              try {
                this.controller.loadUrl("resource://rawfile/second.html");
                await Utils.sleep(2000)
                this.controller.backward()
                await Utils.sleep(2000)
                Utils.emitEvent(this.controller.accessForward(), 50522)
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              break;
            }
            case "testAccessForward003": {
              try {
                this.controller.loadUrl("resource://rawfile/second.html");
                await Utils.sleep(2000)
                this.controller.backward()
                await Utils.sleep(2000)
                this.controller.clearHistory()
                await Utils.sleep(2000)
                Utils.emitEvent(this.controller.accessForward(), 200000)
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              break;
            }
            case "testAccessForward004": {
              try {
                this.controller.loadData(
                  "<html><head><title>LoadData</title></head>" +
                    "<body bgcolor=\"white\">Source:<pre>source</pre></body></html>",
                  "text/html",
                  "UTF-8"
                );
                await Utils.sleep(2000)
                this.controller.backward()
                await Utils.sleep(2000)
                Utils.emitEvent(this.controller.accessForward(), 200002)
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              break;
            }
            case "testAccessBackward001": {
              try {
                Utils.emitEvent(this.controller.accessBackward(), 50526)
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              break;
            }
            case "testAccessBackward002": {
              try {
                this.controller.loadUrl("resource://rawfile/second.html");
                await Utils.sleep(2000)
                Utils.emitEvent(this.controller.accessBackward(), 50528)
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              break;
            }
            case "testAccessBackward003": {
              try {
                this.controller.loadUrl("resource://rawfile/second.html");
                await Utils.sleep(2000)
                this.controller.clearHistory()
                await Utils.sleep(2000)
                Utils.emitEvent(this.controller.accessBackward(), 200001)
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              break;
            }
            case "testAccessBackward004": {
              try {
                this.controller.loadData(
                  "<html><head><title>LoadData</title></head>" +
                    "<body bgcolor=\"white\">Source:<pre>source</pre></body></html>",
                  "text/html",
                  "UTF-8"
                );
                await Utils.sleep(2000)
                Utils.emitEvent(this.controller.accessBackward(), 200003)
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              break;
            }
            case "testAccessStep001": {
              try {
                Utils.emitEvent(this.controller.accessStep(1), 50530)
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              break;
            }
            case "testAccessStep002": {
              try {
                this.controller.loadUrl("resource://rawfile/second.html");
                await Utils.sleep(2000)
                this.controller.backward()
                await Utils.sleep(2000)
                Utils.emitEvent(this.controller.accessStep(1), 50532)
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              break;
            }
            case "testAccessStep003": {
              try {
                Utils.emitEvent(this.controller.accessStep(-1), 50534)
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              break;
            }
            case "testAccessStep004": {
              try {
                this.controller.loadUrl("resource://rawfile/second.html");
                await Utils.sleep(2000)
                Utils.emitEvent(this.controller.accessStep(-1), 50536)
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              break;
            }

            case "testAccessStep005": {
              try {
                this.controller.loadData(
                  "<html><head><title>LoadData</title></head>" +
                    "<body bgcolor=\"white\">Source:<pre>source</pre></body></html>",
                  "text/html",
                  "UTF-8"
                );
                await Utils.sleep(2000)
                Utils.emitEvent(this.controller.accessStep(1), 100096)
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              break;
            }
            case "testAccessStep006": {
              try {
                this.controller.loadData(
                  "<html><head><title>LoadData</title></head>" +
                    "<body bgcolor=\"white\">Source:<pre>source</pre></body></html>",
                  "text/html",
                  "UTF-8"
                );
                await Utils.sleep(2000)
                this.controller.backward()
                await Utils.sleep(2000)
                Utils.emitEvent(this.controller.accessStep(1), 100097)
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              break;
            }
            case "testAccessStep007": {
              try {
                this.controller.loadData(
                  "<html><head><title>LoadData</title></head>" +
                    "<body bgcolor=\"white\">Source:<pre>source</pre></body></html>",
                  "text/html",
                  "UTF-8"
                );
                await Utils.sleep(2000)
                this.controller.clearHistory()
                await Utils.sleep(2000)
                Utils.emitEvent(this.controller.accessStep(-1), 100098)
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              break;
            }
            case "testAccessStep008": {
              try {
                this.controller.loadData(
                  "<html><head><title>LoadData</title></head>" +
                    "<body bgcolor=\"white\">Source:<pre>source</pre></body></html>",
                  "text/html",
                  "UTF-8"
                );
                await Utils.sleep(2000)
                Utils.emitEvent(this.controller.accessStep(-1), 100099)
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              break;
            }

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

            case "testHasImage001": {
              try {
                this.controller.loadUrl("resource://rawfile/hasImageOne.html");
                await Utils.sleep(2000);
                this.controller.hasImage().then((data) => {
                  console.info('HasImagePm: ' + data);
                  Utils.emitEvent(data, 100049);
                })
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                Utils.emitEvent(error.code, 100049)
              }
              break;
            }
            case "testHasImage002": {
              this.controller.loadUrl($rawfile('hasImageTwo.html'))
              await Utils.sleep(2000)
              try {
                this.controller.hasImage().then((data) => {
                  console.info('HasImagePmSvg: ' + data);
                  Utils.emitEvent(data, 100050);
                })
              } catch (error) {
                console.error(`Errorcode: ${error.code}, Message: ${error.message}`);
              }
              break;
            }

            case "testHasImage003": {
              try {
                this.controller.loadUrl($rawfile('onlineImageAccess.html'))
                await Utils.sleep(6000)
                this.controller.hasImage().then((data) => {
                  console.info('HasImagePmOnline: ' + data);
                  Utils.emitEvent(data, 100051);
                })
              } catch (error) {
                console.error(`Errorcode: ${error.code}, Message: ${error.message}`);
              }
              break;
            }

            case "testHasImage004": {
              try {
                this.controller.loadUrl($rawfile('hasImageOne.html'))
                await Utils.sleep(6000)
                this.controller.hasImage((error, data) => {
                  if (error) {
                    console.info(`hasImageCb error: ` + JSON.stringify(error))
                    return
                  }
                  console.info("hasImageCb: " + data);
                  Utils.emitEvent(data, 100052);
                });
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              break;
            }

            case "testHasImage005": {
              this.controller.loadUrl($rawfile('hasImageTwo.html'))
              await Utils.sleep(2000)
              try {
                this.controller.hasImage((error, data) => {
                  if (error) {
                    console.info(`hasImageCbSvg error: ` + JSON.stringify(error))
                    return;
                  }
                  console.info("hasImageCbSvg: " + data);
                  Utils.emitEvent(data, 100053);
                });
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              break;
            }

            case "testHasImage006": {
              this.controller.loadUrl($rawfile('onlineImageAccess.html'))
              await Utils.sleep(2000)
              try {
                this.controller.hasImage((error, data) => {
                  if (error) {
                    console.info(`hasImageCbOnline error: ` + JSON.stringify(error))
                    return;
                  }
                  console.info("hasImageCbOnline: " + data);
                  Utils.emitEvent(data, 100054);
                });
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              break;
            }

            case "testSetNetworkAvailable001": {
              try {
                this.controller.loadUrl($rawfile('indexCopy.html'))
                this.controller.setNetworkAvailable(false);
                await Utils.sleep(3000)
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              this.controller.runJavaScript("getNavigatorOnLine()", (error, result) => {
                if (error) {
                  console.info(`run JavaScript error: ` + JSON.stringify(error))
                  return;
                }
                if (result) {
                  console.log("result:" + result + JSON.stringify(result))
                  console.log("the status of navigator.onLine: " + result);
                  Utils.emitEvent(result, 100055)
                }
              })
              break;
            }

            case "testSetNetworkAvailable002": {
              try {
                this.controller.loadUrl($rawfile('indexCopy.html'))
                this.controller.setNetworkAvailable(true);
                await Utils.sleep(3000)
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              this.controller.runJavaScript("getNavigatorOnLine()", (error, result) => {
                if (error) {
                  console.info(`run JavaScript error: ` + JSON.stringify(error))
                  return;
                }
                if (result) {
                  console.log("result:" + result + JSON.stringify(result))
                  console.log("the status of navigator.onLine: " + result);
                  Utils.emitEvent(result, 100056)
                }
              })
              break;
            }

            case "testGetFavicon001": {
              try {
                this.controller.loadUrl($rawfile('indexCopy.html'))
                await Utils.sleep(3000)
                this.pixelMap = this.controller.getFavicon();
                this.pixelMap.getImageInfo().then(imageInfo => {
                  if (imageInfo == undefined) {
                    console.error("Failed to obtain the image pixel map information.");
                  }
                  let resut = imageInfo.size.height + '_' + imageInfo.size.width
                  console.log("the result of pixelMap: " + JSON.stringify(imageInfo));
                  Utils.emitEvent(resut, 100057)
                })
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                Utils.emitEvent(false, 100057)
              }
              break;
            }

            case "testGetFavicon002": {
              try {
                this.controller.loadUrl($rawfile('secondCopy.html'))
                await Utils.sleep(3000)
                this.pixelMap = this.controller.getFavicon();
                this.pixelMap.getImageInfo().then(imageInfo => {
                  if (imageInfo == undefined) {
                    console.error("Failed to obtain the image pixel map information.");
                  }
                  let result = imageInfo.size.height + '_' + imageInfo.size.width
                  console.log("the result of pixelMap: " + JSON.stringify(imageInfo));
                  Utils.emitEvent(result, 100058)
                })
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                Utils.emitEvent(error.code, 100058)
              }
              break;
            }

            case "testGetOriginalUrl001": {
              try {
                this.controller.loadUrl($rawfile('secondCopy.html'))
                await Utils.sleep(6000)
                let indexUrl = this.controller.getOriginalUrl();
                console.log("original url: " + indexUrl);
                Utils.emitEvent(indexUrl, 100059)
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                Utils.emitEvent(error.code, 100059)
              }
              break;
            }

            case "testGetOriginalUrl002": {
              try {
                this.controller.loadUrl($rawfile('secondCopy.html'))
                this.controllerTwo.loadUrl($rawfile('secondCopy.html'))
                await Utils.sleep(6000)
                let indexUrl = this.controller.getOriginalUrl();
                let indexUrlTwo = this.controllerTwo.getOriginalUrl();
                console.log("original url: " + indexUrl);
                if (indexUrl + indexUrlTwo == 'resource://rawfile/secondCopy.htmlresource://rawfile/secondCopy.html') {
                  Utils.emitEvent(true, 100060)
                }
                else {
                  Utils.emitEvent(false, 100060)
                }
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                Utils.emitEvent(error.code, 100059)
              }
              break;
            }

            case "testGetUrl001": {
              try {
                this.controller.loadUrl($rawfile('secondCopy.html'))
                await Utils.sleep(3000)
                let Url = this.controller.getUrl();
                console.log("original url: " + Url);
                Utils.emitEvent(Url, 100061)
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                Utils.emitEvent(error.code, 100061)
              }
              break;
            }

            case "testGetUrl002": {
              try {
                this.controller.loadUrl('https://www.example.com/')
                await Utils.sleep(3000)
                let Url = this.controller.getUrl();
                console.log("original url: " + Url);
                Utils.emitEvent(Url, 100062)
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                Utils.emitEvent(error.code, 100062)
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

            case "testBackward001": {
              try {
                this.controller.loadUrl($rawfile('second.html'))
                await Utils.sleep(3000)
                this.controller.backward();
                await Utils.sleep(1000)
                let title = this.controller.getTitle();
                Utils.emitEvent(title, 100071)
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              break;
            }
            case "testBackward002": {
              try {
                this.controller.loadUrl($rawfile("index.html"));
                await Utils.sleep(2000)
                this.controller.loadData(
                  "<html><head><title>LoadData</title></head>" +
                    "<body bgcolor=\"white\">Source:<pre>source</pre></body></html>",
                  "text/html",
                  "UTF-8"
                );
                await Utils.sleep(2000)
                this.controller.backward()
                await Utils.sleep(2000)
                Utils.emitEvent(this.controller.getTitle(), 200004)
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              break;
            }
            case "testBackward003": {
              try {
                this.controller.loadUrl($rawfile("second.html"));
                await Utils.sleep(2000)
                this.controller.clearHistory()
                await Utils.sleep(2000)
                this.controller.backward()
                await Utils.sleep(2000)
                Utils.emitEvent(this.controller.getTitle(), 200005)
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              break;
            }
            case "testForward001": {
              try {
                this.controller.loadUrl($rawfile('second.html'))
                await Utils.sleep(3000)
                this.controller.backward();
                await Utils.sleep(2000)
                this.controller.forward();
                await Utils.sleep(2000)
                let title = this.controller.getTitle();
                Utils.emitEvent(title, 100072)
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              break;
            }
            case "testForward002": {
              try {
                this.controller.loadData(
                  "<html><head><title>LoadData</title></head>" +
                    "<body bgcolor=\"white\">Source:<pre>source</pre></body></html>",
                  "text/html",
                  "UTF-8"
                );
                await Utils.sleep(2000)
                this.controller.backward();
                await Utils.sleep(2000)
                this.controller.forward();
                await Utils.sleep(2000)
                let title = this.controller.getTitle();
                Utils.emitEvent(title, 100085)
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              break;
            }
            case "testForward003": {
              try {
                this.controller.loadUrl($rawfile("second.html"));
                await Utils.sleep(2000)
                this.controller.backward();
                await Utils.sleep(2000)
                this.controller.clearHistory()
                await Utils.sleep(2000)
                this.controller.forward();
                await Utils.sleep(2000)
                let title = this.controller.getTitle();
                Utils.emitEvent(title, 100086)
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              break;
            }
            case "testGetPageHeight001": {
              try {
                let height = -1
                height = this.controller.getPageHeight()
                if (height > 0) {
                  Utils.emitEvent(true, 100074)
                } else {
                  Utils.emitEvent(false, 100074)
                }
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              break;
            }

            case "testRegisterJavaScriptProxy001": {
              this.registerJavaScriptProxyFlag = true
              this.controller.loadUrl($rawfile('index.html'))
              await Utils.sleep(3000)
              this.controller.registerJavaScriptProxy(this.jsObj, "objName", ["test", "toString", "register"]);
              this.controller.refresh()
              await Utils.sleep(3000)
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
              this.controller.refresh()
              await Utils.sleep(3000)
              this.controller.deleteJavaScriptRegister("objName")
              this.controller.refresh()
              await Utils.sleep(3000)
              this.controller.runJavaScript("registerTest()", (error) => {
                if (error) {
                  console.info('requestPosition() return error: ' + error)
                }
              })
              await Utils.sleep(3000)
              if (this.console !== "web222") {
                Utils.emitEvent(true, 100076)
              }
              else {
                Utils.emitEvent(false, 100076)
              }
              break;
            }

            case "testOnInactive001": {
              try {
                this.controller.onInactive();
                await Utils.sleep(3000)
                this.controller.loadUrl("resource://rawfile/second.html")
                await Utils.sleep(3000)
                let title = this.controller.getTitle();
                Utils.emitEvent(title, 100077)
              } catch (error) {
                console.error(`Errorcode: ${error.code}, Message: ${error.message}`);
              }
              break;
            }

            case "testOnActive001": {
              try {
                this.controller.loadUrl("resource://rawfile/second.html")
                await Utils.sleep(3000)
                this.controller.onActive();
                await Utils.sleep(3000)
                let title = this.controller.getTitle();
                Utils.emitEvent(title, 100078)
              } catch (error) {
                console.error(`Errorcode: ${error.code}, Message: ${error.message}`);
              }
              break;
            }

            case "testPrefetchPage001": {
              try {
                this.arrTime = []
                this.controller.removeCache(true)
                this.controller.loadUrl('https://www.huawei.com')
                await Utils.sleep(3000)
                this.controller.removeCache(true);
                await Utils.sleep(3000)
                this.controller.prefetchPage('https://www.huawei.com');
                await Utils.sleep(3000)
                this.controller.loadUrl('https://www.huawei.com')
                await Utils.sleep(3000)
                if (this.arrTime[1] - this.arrTime[0] < 0) {
                  Utils.emitEvent(true, 100079)
                } else {
                  Utils.emitEvent(false, 100079)
                }
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
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

            case "testRestoreWebState001": {
              try {
                this.controller.clearHistory()
                await Utils.sleep(2000)
                this.controller.loadUrl("resource://rawfile/index.html")
                await Utils.sleep(2000)
                let state = this.controller.serializeWebState()
                await Utils.sleep(2000)
                this.controller.clearHistory()
                await Utils.sleep(2000)
                this.controller.restoreWebState(state)
                let list = this.controller.getBackForwardEntries();
                let historyItem = list.getItemAtIndex(list.currentIndex);
                console.log('testRestoreWebState001 result is :' + historyItem['title']);
                Utils.emitEvent(historyItem['title'], 100083)
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              break;
            }

            case "testOnMessageEvent001": {
              try {
                this.onMessageEventCallBack = true
                this.controller.loadUrl("resource://rawfile/onMessageEventExt.html")
                await Utils.sleep(2000)
                this.controller.runJavaScript(
                  'postNumberToApp()',
                  (error, result) => {
                    if (error) {
                      console.info(`run JavaScript error: ` + JSON.stringify(error))
                      return;
                    }
                    if (result) {
                      console.info(`The postErrorToApp() return value is: ${result}`)
                    }
                  });
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
