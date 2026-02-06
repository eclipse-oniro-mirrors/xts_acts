/**
 * Copyright (c) 2023 iSoftStone Information Technology (Group) Co.,Ltd.
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

const EVENT_ID_SET_SUITE_KEY = 184501;
let driver: Driver = Driver.create();

@Entry
@Component
struct webViewScrollBy {
  controller: web_webview.WebviewController = new web_webview.WebviewController();
  @State str: string = "emitScrollByOne";
  @State res: boolean = false;
  @State xNum: number = 0;
  @State yNum: number = 0;
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
        Button("web click").key('webcomponentScrollBy').onClick(async () => {
          console.info("key==>" + this.str)
          await Utils.waitForExist(()=>this.isReceive, this.str+' isReceive', 1, 1000);
          await Utils.waitForExist(()=>this.isPageEnd, this.str+' isPageEnd', 1, 1000);
          switch (this.str) {
            case "emitScrollByOne": {
              this.isPageEnd = -1
              this.controller.loadUrl('www.example.com')
              await Utils.waitForExist(()=>this.isPageEnd, this.str+' isPageEnd', 1, 1000);
              this.isPageEnd = -1
              this.controller.loadUrl($rawfile('theScroll.html'))
              await Utils.waitForExist(()=>this.isPageEnd, this.str+' isPageEnd', 1, 1000);
              this.xNum = 0;
              this.yNum = 1717;
              try {
                this.controller.scrollBy(this.xNum, this.yNum);
                await Utils.waitForScrollStop(()=>this.controller.getPageOffset().y, this.str+' webYOffset');
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              this.controller.runJavaScript("getScroll()", (error, result) => {
                if (error) {
                  console.info(`emitScrollByOne runJavaScript error: ` + JSON.stringify(error))
                  return;
                } else {
                  console.log("emitScrollByOne runJavaScript.result: " + result);
                  if (JSON.parse(result)[0] == 0 && JSON.parse(result)[1] > 0) {
                    this.res = true;
                  } else {
                    this.res = false;
                  }
                }
                Utils.emitEvent(this.res, 184510)
                console.info("emitScrollByOne  res: " + result);
              })
              break;
            }
            case "emitScrollByTwo": {
              this.isPageEnd = -1
              this.controller.loadUrl('www.example.com')
              await Utils.waitForExist(()=>this.isPageEnd, this.str+' isPageEnd', 1, 1000);
              this.isPageEnd = -1
              this.controller.loadUrl($rawfile('theScroll.html'));
              await Utils.waitForExist(()=>this.isPageEnd, this.str+' isPageEnd', 1, 1000);
              this.xNum = 0;
              this.yNum = 3500;
              try {
                this.controller.scrollBy(this.xNum, this.yNum);
                await Utils.waitForScrollStop(()=>this.controller.getPageOffset().y, this.str+' webYOffset');
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              this.controller.runJavaScript("getScroll()", (error, result) => {
                if (error) {
                  console.info(`emitScrollByTwo runJavaScript error: ` + JSON.stringify(error))
                  return;
                } else {
                  console.log("emitScrollByTwo runJavaScript.result: " + result);
                  if (JSON.parse(result)[0] == 0 && JSON.parse(result)[1] > 200) {
                    this.res = true;
                  } else {
                    this.res = false;
                  }
                }
                Utils.emitEvent(this.res, 184520)
                console.info("emitScrollByTwo  res: " + result);
              })
              break;
            }
            case "emitScrollByThree": {
              this.isPageEnd = -1;
              this.controller.loadUrl('www.example.com')
              await Utils.waitForExist(()=>this.isPageEnd, this.str+' isPageEnd', 1, 1000);
              this.controller.loadUrl($rawfile('theScroll.html'));
              this.xNum = 0;
              this.yNum = -1717;
              try {
                this.controller.scrollBy(this.xNum, this.yNum);
                await Utils.waitForScrollStop(()=>this.controller.getPageOffset().y, this.str+' webYOffset');
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              this.controller.runJavaScript("getScroll()", (error, result) => {
                if (error) {
                  console.info(`emitScrollByThree runJavaScript error: ` + JSON.stringify(error))
                  return;
                } else {
                  console.log("emitScrollByThree runJavaScript.result: " + result);
                }
                Utils.emitEvent(result, 184530)
                console.info("emitScrollByThree  res: " + result);
              })
              break;
            }
            case "emitScrollByFour": {
              this.isPageEnd = -1;
              this.controller.loadUrl('www.example.com')
              await Utils.waitForExist(()=>this.isPageEnd, this.str+' isPageEnd', 1, 1000);
              this.isPageEnd = -1;
              this.controller.loadUrl($rawfile('theScroll.html'));
              await Utils.waitForExist(()=>this.isPageEnd, this.str+' isPageEnd', 1, 1000);
              this.xNum = 0;
              this.yNum = -3500;
              try {
                this.controller.scrollBy(this.xNum, this.yNum);
                await Utils.waitForScrollStop(()=>this.controller.getPageOffset().y, this.str+' webYOffset');
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              this.controller.runJavaScript("getScroll()", (error, result) => {
                if (error) {
                  console.info(`emitScrollByFour runJavaScript error: ` + JSON.stringify(error))
                  return;
                } else {
                  console.log("emitScrollByFour runJavaScript.result: " + result);
                }
                Utils.emitEvent(result, 184540)
                console.info("emitScrollByFour  res: " + result);
              })
              break;
            }
            case "emitScrollByFive": {
              this.isPageEnd = -1;
              this.controller.loadUrl('www.example.com')
              await Utils.waitForExist(()=>this.isPageEnd, this.str+' isPageEnd', 1, 1000);
              this.isPageEnd = -1;
              this.controller.loadUrl($rawfile('theScroll.html'));
              await Utils.waitForExist(()=>this.isPageEnd, this.str+' isPageEnd', 1, 1000);
              this.xNum = 1500;
              this.yNum = 0;
              try {
                this.controller.scrollBy(this.xNum, this.yNum);
                await Utils.waitForScrollStop(()=>this.controller.getPageOffset().x, this.str+' webXOffset');

              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              this.controller.runJavaScript("getScroll()", (error, result) => {
                if (error) {
                  console.info(`emitScrollByFive runJavaScript error: ` + JSON.stringify(error))
                  return;
                } else {
                  console.log("emitScrollByFive runJavaScript.result: " + result);
                  if (JSON.parse(result)[0] > 0 && JSON.parse(result)[1] == 0) {
                    this.res = true;
                  } else {
                    this.res = false;
                  }
                }
                Utils.emitEvent(this.res, 184550)
                console.info("emitScrollByFive  res: " + result);
              })
              break;
            }
            case "emitScrollBySix": {
              this.isPageEnd = -1;
              this.controller.loadUrl('www.example.com')
              await Utils.waitForExist(()=>this.isPageEnd, this.str+' isPageEnd', 1, 1000);
              this.isPageEnd = -1;
              this.controller.loadUrl($rawfile('theScroll.html'))
              await Utils.waitForExist(()=>this.isPageEnd, this.str+' isPageEnd', 1, 1000);
              this.xNum = 4000;
              this.yNum = 0;
              try {
                this.controller.scrollBy(this.xNum, this.yNum);
                await Utils.waitForScrollStop(()=>this.controller.getPageOffset().x, this.str+' webXOffset');
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              this.controller.runJavaScript("getScroll()", (error, result) => {
                if (error) {
                  console.info(`emitScrollBySix runJavaScript error: ` + JSON.stringify(error))
                  return;
                } else {
                  console.log("emitScrollBySix runJavaScript.result: " + result);
                  if (JSON.parse(result)[0] > 200 && JSON.parse(result)[1] == 0) {
                    this.res = true;
                  } else {
                    this.res = false;
                  }
                }
                Utils.emitEvent(this.res, 184560)
                console.info("emitScrollBySix  res: " + result);
              })
              break;
            }
            case "emitScrollBySeven": {
              this.isPageEnd = -1;
              this.controller.loadUrl('www.example.com')
              await Utils.waitForExist(()=>this.isPageEnd, this.str+' isPageEnd', 1, 1000);
              this.isPageEnd = -1;
              this.controller.loadUrl($rawfile('theScroll.html'))
              await Utils.waitForExist(()=>this.isPageEnd, this.str+' isPageEnd', 1, 1000);
              this.xNum = -4000;
              this.yNum = 0;
              try {
                this.controller.scrollBy(this.xNum, this.yNum);
                await Utils.waitForScrollStop(()=>this.controller.getPageOffset().x, this.str+' webXOffset');
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              this.controller.runJavaScript("getScroll()", (error, result) => {
                if (error) {
                  console.info(`emitScrollBySeven runJavaScript error: ` + JSON.stringify(error))
                  return;
                } else {
                  console.log("emitScrollBySeven runJavaScript.result: " + result);
                }
                Utils.emitEvent(result, 184570)
                console.info("emitScrollBySeven  res: " + result);
              })
              break;
            }
            case "emitScrollByEight": {
              this.isPageEnd = -1;
              this.controller.loadUrl('www.example.com')
              await Utils.waitForExist(()=>this.isPageEnd, this.str+' isPageEnd', 1, 1000);
              this.isPageEnd = -1;
              this.controller.loadUrl($rawfile('theScroll.html'))
              await Utils.waitForExist(()=>this.isPageEnd, this.str+' isPageEnd', 1, 1000);
              this.xNum = -1500;
              this.yNum = 0;
              try {
                this.controller.scrollBy(this.xNum, this.yNum);
                await Utils.waitForScrollStop(()=>this.controller.getPageOffset().x, this.str+' webXOffset');

              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              this.controller.runJavaScript("getScroll()", (error, result) => {
                if (error) {
                  console.info(`emitScrollByEight runJavaScript error: ` + JSON.stringify(error))
                  return;
                } else {
                  console.log("emitScrollByEight runJavaScript.result: " + result);
                }
                Utils.emitEvent(result, 184580)
                console.info("emitScrollByEight  res: " + result);
              })
              break;
            }
            case "emitScrollByNine": {
              this.isPageEnd = -1;
              this.controller.loadUrl('www.example.com')
              await Utils.waitForExist(()=>this.isPageEnd, this.str+' isPageEnd', 1, 1000);
              this.isPageEnd = -1;
              this.controller.loadUrl($rawfile('theScroll.html'))
              await Utils.waitForExist(()=>this.isPageEnd, this.str+' isPageEnd', 1, 1000);
              this.xNum = 1500;
              this.yNum = 1717;
              try {
                this.controller.scrollBy(this.xNum, this.yNum);
                await Utils.waitForScrollStop(()=>this.controller.getPageOffset().x, this.str+' webXOffset');
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              this.controller.runJavaScript("getScroll()", (error, result) => {
                if (error) {
                  console.info(`emitScrollByNine runJavaScript error: ` + JSON.stringify(error))
                  return;
                } else {
                  console.log("emitScrollByNine runJavaScript.result: " + result);
                  if (JSON.parse(result)[0] > 0 && JSON.parse(result)[1] > 0) {
                    this.res = true;
                  } else {
                    this.res = false;
                  }
                }
                Utils.emitEvent(this.res, 184590)
                console.info("emitScrollByNine  res: " + result);
              })
              break;
            }
            case "emitScrollByTen": {
              this.isPageEnd = -1;
              this.controller.loadUrl('www.example.com')
              await Utils.waitForExist(()=>this.isPageEnd, this.str+' isPageEnd', 1, 1000);
              this.isPageEnd = -1;
              this.controller.loadUrl($rawfile('theScroll.html'));
              await Utils.waitForExist(()=>this.isPageEnd, this.str+' isPageEnd', 1, 1000);
              this.xNum = 4000;
              this.yNum = 3500;
              try {
                this.controller.scrollBy(this.xNum, this.yNum);
                await Utils.waitForScrollStop(()=>this.controller.getPageOffset().x, this.str+' webXOffset');
                await Utils.waitForScrollStop(()=>this.controller.getPageOffset().y, this.str+' webYOffset');
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              this.controller.runJavaScript("getScroll()",
                (error, result) => {
                  if (error) {
                    console.info(`emitScrollByTen runJavaScript error: ` + JSON.stringify(error))
                    return;
                  } else {
                    console.log("emitScrollByTen runJavaScript.result: " + result);
                    if (JSON.parse(result)[0] > 200 && JSON.parse(result)[1] > 200) {
                      this.res = true;
                    } else {
                      this.res = false;
                    }
                  }
                  Utils.emitEvent(this.res, 184600)
                  console.info("emitScrollByTen  res: " + result);
                })
              break;
            }
            case "emitScrollByEleven": {
              this.isPageEnd = -1;
              this.controller.loadUrl('www.example.com')
              await Utils.waitForExist(()=>this.isPageEnd, this.str+' isPageEnd', 1, 1000);
              this.isPageEnd = -1;
              this.controller.loadUrl($rawfile('theScroll.html'));
              await Utils.waitForExist(()=>this.isPageEnd, this.str+' isPageEnd', 1, 1000);
              this.xNum = -1500;
              this.yNum = -1717;
              try {
                this.controller.scrollBy(this.xNum, this.yNum);
                await Utils.waitForScrollStop(()=>this.controller.getPageOffset().x, this.str+' webXOffset');
                await Utils.waitForScrollStop(()=>this.controller.getPageOffset().y, this.str+' webYOffset');
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              this.controller.runJavaScript("getScroll()",
                (error, result) => {
                  if (error) {
                    console.info(`emitScrollByEleven runJavaScript error: ` + JSON.stringify(error))
                    return;
                  } else {
                    console.log("emitScrollByEleven runJavaScript.result: " + result);
                    Utils.emitEvent(result, 184610)
                  }
                  Utils.emitEvent(result, 184610)
                  console.info("emitScrollByEleven  res: " + result);
                })
              break;
            }
            case "emitScrollByTwelve": {
              this.isPageEnd = -1;
              this.controller.loadUrl('www.example.com')
              await Utils.waitForExist(()=>this.isPageEnd, this.str+' isPageEnd', 1, 1000);
              this.isPageEnd = -1;
              this.controller.loadUrl($rawfile('theScroll.html'));
              await Utils.waitForExist(()=>this.isPageEnd, this.str+' isPageEnd', 1, 1000);
              this.xNum = -4000;
              this.yNum = -3500;
              try {
                this.controller.scrollBy(this.xNum, this.yNum);
                await Utils.waitForScrollStop(()=>this.controller.getPageOffset().x, this.str+' webXOffset');
                await Utils.waitForScrollStop(()=>this.controller.getPageOffset().y, this.str+' webYOffset');
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              this.controller.runJavaScript("getScroll()",
                (error, result) => {
                  if (error) {
                    console.info(`emitScrollByTwelve runJavaScript error: ` + JSON.stringify(error))
                    return;
                  } else {
                    console.log("emitScrollByTwelve runJavaScript.result: " + result);
                  }
                  Utils.emitEvent(result, 184620)
                  console.info("emitScrollByTwelve  res: " + result);
                })
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
