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
