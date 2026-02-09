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
import events_emitter from '@ohos.events.emitter';
import AbilityDelegatorRegistry from '@ohos.application.abilityDelegatorRegistry';
import { Hypium } from '@ohos/hypium';
import testsuite from '../../test/List.test';
import Utils from '../../test/Utils';
import web_webview from '@ohos.web.webview';
import { Driver } from '@kit.TestKit';

const EVENT_ID_SET_SUITE_KEY = 184701;
let driver: Driver = Driver.create();

@Entry
@Component
struct webViewScrollTo {
  controller: web_webview.WebviewController = new web_webview.WebviewController();
  @State str: string = "emitScrollToOne";
  @State res: boolean = false;
  @State xNum: number = 0;
  @State yNum: number = 0;
  @State duration: number =0;
  @State onScrollx: number = 0;
  @State onScrolly: number = 0;
  @State onScrollx1: number = 0;
  @State onScrolly1: number = 0;
  @State isReceive: number = -1;
  @State isPageEnd: number = -1;

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
      if (eventData.data?.ACTION != null) {
        this.str = eventData.data?.ACTION;
        this.isReceive = 1;
      }
    }
  }

  build() {
    Column() {
      Row() {
        Button("web click").key('webcomponentScrolTo').onClick(async () => {
          console.info("key==>" + this.str)
          switch (this.str) {
            case "emitScrollToOne": {
              this.isPageEnd = -1
              this.controller.loadUrl($rawfile('theScroll.html'));
              await Utils.waitForExist(()=>this.isPageEnd, this.str+' isPageEnd', 1, 1000);
              this.xNum = -10;
              this.yNum = -10;
              try {
                this.controller.scrollTo(this.xNum, this.yNum);
                await Utils.waitForScrollStop(()=>this.controller.getPageOffset().x, this.str+' webXOffset');
                await Utils.waitForScrollStop(()=>this.controller.getPageOffset().y, this.str+' webYOffset');
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              this.controller.runJavaScript("getScroll()", (error, result) => {
                if (error) {
                  console.info(`emitScrollToOne runJavaScript error: ` + JSON.stringify(error))
                  return;
                } else {
                  console.log("emitScrollToOne runJavaScript.result: " + result);
                }
                Utils.emitEvent(result, 184710)
                console.info("emitScrollToOne  res: " + result);
              })
              break;
            }
            case "emitScrollToTwo": {
              this.isPageEnd = -1
              this.controller.loadUrl($rawfile('theScroll.html'));
              await Utils.waitForExist(()=>this.isPageEnd, this.str+' isPageEnd', 1, 1000);
              this.xNum = -10;
              this.yNum = 3500;
              try {
                this.controller.scrollTo(this.xNum, this.yNum);
                await Utils.waitForScrollStop(()=>this.controller.getPageOffset().x, this.str+' webXOffset');
                await Utils.waitForScrollStop(()=>this.controller.getPageOffset().y, this.str+' webYOffset');
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              this.controller.runJavaScript("getScroll()", (error, result) => {
                if (error) {
                  console.info(`emitScrollToTwo runJavaScript error: ` + JSON.stringify(error))
                  return;
                } else {
                  console.log("emitScrollToTwo runJavaScript.result: " + result);
                  if (JSON.parse(result)[0] == 0 && JSON.parse(result)[1] > 200) {
                    this.res = true;
                  } else {
                    this.res = false;
                  }
                }
                Utils.emitEvent(this.res, 184720)
                console.info("emitScrollToTwo  res: " + result);
              })
              break;
            }
            case "emitScrollToThree": {
              this.isPageEnd = -1;
              this.controller.loadUrl($rawfile('theScroll.html'));
              await Utils.waitForExist(()=>this.isPageEnd, this.str+' isPageEnd', 1, 1000);
              this.xNum = -10;
              this.yNum = 200;
              try {
                this.controller.scrollTo(this.xNum, this.yNum);
                await Utils.waitForScrollStop(()=>this.controller.getPageOffset().x, this.str+' webXOffset');
                await Utils.waitForScrollStop(()=>this.controller.getPageOffset().y, this.str+' webYOffset');
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              this.controller.runJavaScript("getScroll()", (error, result) => {
                if (error) {
                  console.info(`emitScrollToThree runJavaScript error: ` + JSON.stringify(error))
                  return;
                } else {
                  console.log("emitScrollToThree runJavaScript.result: " + result);
                }
                Utils.emitEvent(result, 184730)
                console.info("emitScrollToThree  res: " + result);
              })
              break;
            }
            case "emitScrollToFour": {
              this.isPageEnd = -1;
              this.controller.loadUrl($rawfile('theScroll.html'));
              await Utils.waitForExist(()=>this.isPageEnd, this.str+' isPageEnd', 1, 1000);
              this.xNum = 200;
              this.yNum = -10;
              try {
                this.controller.scrollTo(this.xNum, this.yNum);
                await Utils.waitForScrollStop(()=>this.controller.getPageOffset().x, this.str+' webXOffset');
                await Utils.waitForScrollStop(()=>this.controller.getPageOffset().y, this.str+' webYOffset');
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              this.controller.runJavaScript("getScroll()", (error, result) => {
                if (error) {
                  console.info(`emitScrollToFour runJavaScript error: ` + JSON.stringify(error))
                  return;
                } else {
                  console.log("emitScrollToFour runJavaScript.result: " + result);
                }
                Utils.emitEvent(result, 184740)
                console.info("emitScrollToFour  res: " + result);
              })
              break;
            }
            case "emitScrollToFive": {
              this.isPageEnd = -1;
              this.controller.loadUrl($rawfile('theScroll.html'));
              await Utils.waitForExist(()=>this.isPageEnd, this.str+' isPageEnd', 1, 1000);
              this.xNum = 4000;
              this.yNum = -10;
              try {
                this.controller.scrollTo(this.xNum, this.yNum);
                await Utils.waitForScrollStop(()=>this.controller.getPageOffset().x, this.str+' webXOffset');
                await Utils.waitForScrollStop(()=>this.controller.getPageOffset().y, this.str+' webYOffset');
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              this.controller.runJavaScript("getScroll()", (error, result) => {
                if (error) {
                  console.info(`emitScrollToFive runJavaScript error: ` + JSON.stringify(error))
                  return;
                } else {
                  console.log("emitScrollToFive runJavaScript.result: " + result);
                  if (JSON.parse(result)[0] > 200 && JSON.parse(result)[1] == 0) {
                    this.res = true;
                  } else {
                    this.res = false;
                  }
                }
                Utils.emitEvent(this.res, 184750)
                console.info("emitScrollToFive  res: " + result);
              })
              break;
            }
            case "emitScrollToSix": {
              this.isPageEnd = -1;
              this.controller.loadUrl($rawfile('theScroll.html'));
              await Utils.waitForExist(()=>this.isPageEnd, this.str+' isPageEnd', 1, 1000);
              this.xNum = 200;
              this.yNum = 200;
              try {
                this.controller.scrollTo(this.xNum, this.yNum);
                await Utils.waitForScrollStop(()=>this.controller.getPageOffset().x, this.str+' webXOffset');
                await Utils.waitForScrollStop(()=>this.controller.getPageOffset().y, this.str+' webYOffset');
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              this.controller.runJavaScript("getScroll()", (error, result) => {
                if (error) {
                  console.info(`emitScrollToSix runJavaScript error: ` + JSON.stringify(error))
                  return;
                } else {
                  console.log("emitScrollToSix runJavaScript.result: " + result);
                }
                Utils.emitEvent(result, 184760)
                console.info("emitScrollToSix  res: " + result);
              })
              break;
            }
            case "emitScrollToSeven": {
              this.isPageEnd = -1;
              this.controller.loadUrl($rawfile('theScroll.html'));
              await Utils.waitForExist(()=>this.isPageEnd, this.str+' isPageEnd', 1, 1000);
              this.xNum = 4000;
              this.yNum = 3500;
              try {
                this.controller.scrollTo(this.xNum, this.yNum);
                await Utils.waitForScrollStop(()=>this.controller.getPageOffset().x, this.str+' webXOffset');
                await Utils.waitForScrollStop(()=>this.controller.getPageOffset().y, this.str+' webYOffset');
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              this.controller.runJavaScript("getScroll()", (error, result) => {
                if (error) {
                  console.info(`emitScrollToSeven runJavaScript error: ` + JSON.stringify(error))
                  return;
                } else {
                  console.log("emitScrollToSeven runJavaScript.result: " + result);
                  if (JSON.parse(result)[0] > 200 && JSON.parse(result)[1] > 200) {
                    this.res = true;
                  } else {
                    this.res = false;
                  }
                }
                Utils.emitEvent(this.res, 184770)
                console.info("emitScrollToSeven  res: " + result);
              })
              break;
            }
            case "emitScrollToEight": {
              this.isPageEnd = -1;
              this.controller.loadUrl($rawfile('theScroll.html'));
              await Utils.waitForExist(()=>this.isPageEnd, this.str+' isPageEnd', 1, 1000);
              this.xNum = -10;
              this.yNum = -10;
              this.duration = 0;
              this.onScrollx = 0;
              this.onScrolly = 0;
              try {
                this.controller.scrollTo(this.xNum, this.yNum,this.duration);
                await Utils.waitForScrollStop(()=>this.controller.getPageOffset().x, this.str+' webXOffset');
                await Utils.waitForScrollStop(()=>this.controller.getPageOffset().y, this.str+' webYOffset');
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              if (this.onScrollx == 0 && this.onScrolly == 0) {
                  Utils.emitEvent(true, 184780)
                } else {
                  Utils.emitEvent(false, 184780)
                }
              break;
            }
            case "emitScrollToNine": {
              this.isPageEnd = -1;
              this.controller.loadUrl($rawfile('theScroll.html'));
              await Utils.waitForExist(()=>this.isPageEnd, this.str+' isPageEnd', 1, 1000);
              this.xNum = -10;
              this.yNum = 200;
              this.onScrollx = 0;
              this.onScrolly = 0;
              this.duration = 500;
              try {
                this.controller.scrollTo(this.xNum, this.yNum,this.duration);
                await Utils.waitForScrollStop(()=>this.controller.getPageOffset().x, this.str+' webXOffset');
                await Utils.waitForScrollStop(()=>this.controller.getPageOffset().y, this.str+' webYOffset');
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              if (this.onScrollx == 0 && this.onScrolly == 0) {
                  Utils.emitEvent(true, 184790)
                } else {
                  Utils.emitEvent(false, 184790)
                }
              break;
            }
            case "emitScrollToTen": {
              this.isPageEnd = -1;
              this.controller.loadUrl($rawfile('theScroll.html'));
              await Utils.waitForExist(()=>this.isPageEnd, this.str+' isPageEnd', 1, 1000);
              this.xNum = 200;
              this.yNum = -10;
              this.onScrollx = 0;
              this.onScrolly = 0;
              this.duration = 500;
              try {
                this.controller.scrollTo(this.xNum, this.yNum,this.duration);
                await Utils.waitForScrollStop(()=>this.controller.getPageOffset().x, this.str+' webXOffset');
                await Utils.waitForScrollStop(()=>this.controller.getPageOffset().y, this.str+' webYOffset');
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              if (this.onScrollx == 0 && this.onScrolly == 0) {
                  Utils.emitEvent(true, 184800)
                } else {
                  Utils.emitEvent(false, 184800)
                }
              break;
            }
            case "emitScrollToEleven": {
              this.isPageEnd = -1;
              this.controller.loadUrl($rawfile('theScroll.html'));
              await Utils.waitForExist(()=>this.isPageEnd, this.str+' isPageEnd', 1, 1000);
              this.xNum = 200;
              this.yNum = 200;
              this.onScrollx = 0;
              this.onScrolly = 0;
              this.duration = 500;
              try {
                this.controller.scrollTo(this.xNum, this.yNum,this.duration);
                await Utils.waitForScrollStop(()=>this.controller.getPageOffset().x, this.str+' webXOffset');
                await Utils.waitForScrollStop(()=>this.controller.getPageOffset().y, this.str+' webYOffset');
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              if (this.onScrollx == 0 && this.onScrolly == 0) {
                  Utils.emitEvent(true, 184810)
                } else {
                  Utils.emitEvent(false, 184810)
                }
              break;
            }
          }
        })
      }

      Web({ src: $rawfile('theScroll.html'), controller: this.controller })
        .onPageEnd((event) => {
          console.log('onPageEnd url:' + event.url);
          this.isPageEnd = 1;
        })
    }
  }
}
