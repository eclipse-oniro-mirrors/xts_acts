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

const EVENT_ID_SET_SUITE_KEY = 182301;
let driver: Driver = Driver.create();

@Entry
@Component
struct webViewScrollable {
  controller: web_webview.WebviewController = new web_webview.WebviewController();
  controller1: web_webview.WebviewController = new web_webview.WebviewController();
  @State str: string = "emitScrollableOne";
  @State res: boolean = false;
  @State xNum: number = 0;
  @State yNum: number = 0;
  @State onScrollx: number = 0;
  @State onScrolly: number = 0;
  @State scrollEnabled: boolean = true;
  @State onScrollx1: number = 0;
  @State onScrolly1: number = 0;
  @State scrollForwardEnums: number = NestedScrollMode.SELF_FIRST
  @State scrollBackwardEnums: number = NestedScrollMode.SELF_FIRST
  @State isPageEnd: number = -1;
  @State isReceive: number = -1;
  @State isPageEnd1: number = -1;

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
    Scroll(){
      Column() {
        Row() {
          Button("web click").key('webcomponentScrollable').onClick(async () => {
            console.info("key==>" + this.str)
            await Utils.waitForExist(()=>this.isReceive, this.str+' isReceive', 1, 1000);
            await Utils.waitForExist(()=>this.isPageEnd, this.str+' isPageEnd', 1, 1000);
            await Utils.waitForExist(()=>this.isPageEnd1, this.str+' isPageEnd', 1, 1000);
            switch (this.str) {
              case "emitScrollableOne": {
                this.controller.setScrollable(true);
                // await Utils.sleep(2000);
                this.isPageEnd = -1;
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
                    console.info(`emitScrollableOne runJavaScript error: ` + JSON.stringify(error))
                    return;
                  } else {
                    console.log("emitScrollableOne runJavaScript.result: " + result);
                  }
                  Utils.emitEvent(result, 182310)
                  console.info("emitScrollableOne  res: " + result);
                })
                break;
              }
              case "emitScrollableTwo": {
                this.controller.setScrollable(false);
                // await Utils.sleep(2000);
                this.isPageEnd = -1;
                this.controller.loadUrl($rawfile('theScroll.html'));
                await Utils.waitForExist(()=>this.isPageEnd, this.str+' isPageEnd', 1, 1000);
                this.xNum = -10;
                this.yNum = 3500;
                let scrollEnabled= this.controller.getScrollable();
                console.log("scrollEnabled: " + scrollEnabled);
                try {
                  this.controller.scrollTo(this.xNum, this.yNum);
                  await Utils.waitForScrollStop(()=>this.controller.getPageOffset().x, this.str+' webXOffset');
                  await Utils.waitForScrollStop(()=>this.controller.getPageOffset().y, this.str+' webYOffset');

                } catch (error) {
                  console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                }
                this.controller.runJavaScript("getScroll()", (error, result) => {
                  if (error) {
                    console.info(`emitScrollableTwo runJavaScript error: ` + JSON.stringify(error))
                    return;
                  } else {
                    console.log("emitScrollableTwo runJavaScript.result: " + result);
                    if (JSON.parse(result)[0] == 0 && JSON.parse(result)[1] > 200) {
                      this.res = true;
                    } else {
                      this.res = false;
                    }
                  }
                  Utils.emitEvent(this.res, 182320)
                  console.info("emitScrollableTwo  res: " + result);
                })
                break;
              }
              case "emitScrollableThree": {
                this.controller.setScrollable(false);
                this.isPageEnd = -1;
                this.controller.loadUrl($rawfile('theScroll.html'));
                await Utils.waitForExist(()=>this.isPageEnd, this.str+' isPageEnd', 1, 1000);
                let scrollEnabled= this.controller.getScrollable();
                console.log("scrollEnabled: " + scrollEnabled);
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
                    console.info(`emitScrollableThree runJavaScript error: ` + JSON.stringify(error))
                    return;
                  } else {
                    console.log("emitScrollableThree runJavaScript.result: " + result);
                  }
                  Utils.emitEvent(result, 182330)
                  console.info("emitScrollableThree  res: " + result);
                })
                break;
              }
              case "emitScrollableFour": {
                this.controller.setScrollable(false);
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
                    console.info(`emitScrollableFour runJavaScript error: ` + JSON.stringify(error))
                    return;
                  } else {
                    console.log("emitScrollableFour runJavaScript.result: " + result);
                  }
                  Utils.emitEvent(result, 182340)
                  console.info("emitScrollableFour  res: " + result);
                })
                break;
              }
              case "emitScrollableFive": {
                this.controller.setScrollable(false);
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
                    console.info(`emitScrollableFive runJavaScript error: ` + JSON.stringify(error))
                    return;
                  } else {
                    console.log("emitScrollableFive runJavaScript.result: " + result);
                    if (JSON.parse(result)[0] > 200 && JSON.parse(result)[1] == 0) {
                      this.res = true;
                    } else {
                      this.res = false;
                    }
                  }
                  Utils.emitEvent(this.res, 182350)
                  console.info("emitScrollableFive  res: " + result);
                })
                break;
              }
              case "emitScrollableSix": {
                this.controller.setScrollable(false);
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
                    console.info(`emitScrollableSix runJavaScript error: ` + JSON.stringify(error))
                    return;
                  } else {
                    console.log("emitScrollableSix runJavaScript.result: " + result);
                  }
                  Utils.emitEvent(result, 182360)
                  console.info("emitScrollableSix  res: " + result);
                })
                break;
              }
              case "emitScrollableSeven": {
                this.controller.setScrollable(false);
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
                    console.info(`emitScrollableSeven runJavaScript error: ` + JSON.stringify(error))
                    return;
                  } else {
                    console.log("emitScrollableSeven runJavaScript.result: " + result);
                    if (JSON.parse(result)[0] > 200 && JSON.parse(result)[1] > 200) {
                      this.res = true;
                    } else {
                      this.res = false;
                    }
                  }
                  Utils.emitEvent(this.res, 182370)
                  console.info("emitScrollableSeven  res: " + result);
                })
                break;
              }
              case "emitScrollableEight": {
                this.controller.setScrollable(false);
                this.onScrollx = 0;
                this.onScrolly = 0;
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
                if (this.onScrollx == 0 && this.onScrolly == 0) {
                  Utils.emitEvent(true, 182380)
                } else {
                  Utils.emitEvent(false, 182380)
                }
                break;
              }
              case "emitScrollableNine": {
                this.controller.setScrollable(false);
                this.onScrollx = 0;
                this.onScrolly = 0;
                this.isPageEnd = -1;
                this.controller.loadUrl($rawfile('theScroll.html'));
                await Utils.waitForExist(()=>this.isPageEnd, this.str+' isPageEnd', 1, 1000);
                try {
                  this.controller.pageUp(false);
                  await Utils.waitForScrollStop(()=>this.controller.getPageOffset().y, this.str+' webYOffset');
                } catch (error) {
                  console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                }
                if (this.onScrollx == 0 && this.onScrolly == 0) {
                  Utils.emitEvent(true, 182390)
                } else {
                  Utils.emitEvent(false, 182390)
                }
                break;
              }
              case "emitScrollableTen": {
                this.controller.setScrollable(false);
                this.onScrollx = 0;
                this.onScrolly = 0;
                this.isPageEnd = -1;
                this.controller.loadUrl($rawfile('theScroll.html'));
                await Utils.waitForExist(()=>this.isPageEnd, this.str+' isPageEnd', 1, 1000);
                try {
                  this.controller.pageDown(false);
                  await Utils.waitForScrollStop(()=>this.controller.getPageOffset().y, this.str+' webYOffset');
                } catch (error) {
                  console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                }
                if (this.onScrollx == 0 && this.onScrolly == 0) {
                  Utils.emitEvent(true, 182400)
                } else {
                  Utils.emitEvent(false, 182400)
                }
                break;
              }
              case "emitScrollableEleven": {
                this.controller.setScrollable(false);
                this.isPageEnd = -1;
                this.controller.loadUrl($rawfile('theScroll.html'));
                await Utils.waitForExist(()=>this.isPageEnd, this.str+' isPageEnd', 1, 1000);
                try {
                  let scrollEnabled= this.controller.getScrollable();
                  console.log("scrollEnabled: " + scrollEnabled);
                  Utils.emitEvent(scrollEnabled, 182410)
                } catch (error) {
                  console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                }
                break;
              }
              case "emitScrollableTwelve": {
                this.controller.setScrollable(true);
                this.isPageEnd = -1;
                this.controller.loadUrl($rawfile('theScroll.html'))
                await Utils.waitForExist(()=>this.isPageEnd, this.str+' isPageEnd', 1, 100)
                try {
                  let scrollEnabled= this.controller.getScrollable();
                  console.log("scrollEnabled: " + scrollEnabled);
                  Utils.emitEvent(scrollEnabled, 182420)
                } catch (error) {
                  console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                }
                break;
              }
              case "emitScrollableThirteen": {
                this.controller.setScrollable(true);
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
                    console.info(`emitScrollableOne runJavaScript error: ` + JSON.stringify(error))
                    return;
                  } else {
                    console.log("emitScrollableOne runJavaScript.result: " + result);
                  }
                  Utils.emitEvent(result, 182430)
                  console.info("emitScrollableOne  res: " + result);
                })
                break;
              }
              case "emitScrollableFourteen": {
                this.controller.setScrollable(false);
                this.onScrollx = 0;
                this.onScrolly = 0;
                this.isPageEnd = -1;
                this.controller.loadUrl($rawfile('theScroll.html'));
                await Utils.waitForExist(()=>this.isPageEnd, this.str+' isPageEnd', 1, )
                try {
                  this.controller.slideScroll(500, 500);
                  await Utils.waitForScrollStop(()=>this.controller.getPageOffset().x, this.str+' webXOffset');
                  await Utils.waitForScrollStop(()=>this.controller.getPageOffset().y, this.str+' webYOffset');
                } catch (error) {
                  console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                }
                if (this.onScrollx == 0 && this.onScrolly == 0) {
                  Utils.emitEvent(true, 182440)
                } else {
                  Utils.emitEvent(false, 182440)
                }
                break;
              }
              case "emitScrollableFifteen": {
                this.scrollEnabled = false
                this.controller.setScrollable(false);
                this.onScrollx = 0;
                this.onScrolly = 0;
                this.isPageEnd = -1;
                this.controller.loadUrl($rawfile('theScroll.html'));
                await Utils.waitForExist(()=>this.isPageEnd, this.str+' isPageEnd', 1, 1000);
                try {
                  this.controller.scrollBy(500, 500);
                  await Utils.waitForScrollStop(()=>this.controller.getPageOffset().x, this.str+' webXOffset');
                  await Utils.waitForScrollStop(()=>this.controller.getPageOffset().y, this.str+' webYOffset');
                } catch (error) {
                  console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                }
                if (this.onScrollx == 0 && this.onScrolly == 0) {
                  Utils.emitEvent(true, 182450)
                } else {
                  Utils.emitEvent(false, 182450)
                }
                break;
              }
              case "emitScrollableSixteen": {
                this.scrollEnabled = false
                this.controller.setScrollable(true);
                this.onScrollx = 0;
                this.onScrolly = 0;
                this.isPageEnd = -1;
                this.controller.loadUrl($rawfile('theScroll.html'));
                await Utils.waitForExist(()=>this.isPageEnd, this.str+' isPageEnd', 1, 1000);
                try {
                  this.controller.scrollBy(500, 500);
                  await Utils.waitForScrollStop(()=>this.controller.getPageOffset().x, this.str+' webXOffset');
                  await Utils.waitForScrollStop(()=>this.controller.getPageOffset().y, this.str+' webYOffset');
                } catch (error) {
                  console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                }
                if (this.onScrollx == 0 && this.onScrolly == 0) {
                  Utils.emitEvent(true, 182460)
                } else {
                  Utils.emitEvent(false, 182460)
                }
                break;
              }
              case "emitScrollableSeventeen": {
                this.controller.setScrollable(false);
                this.onScrollx = 0;
                this.onScrolly = 0;
                this.isPageEnd = -1;
                this.controller.loadUrl($rawfile('theScroll.html'));
                await Utils.waitForExist(()=>this.isPageEnd, this.str+' isPageEnd', 1, 1000);
                try {
                  this.controller.runJavaScript("tryScroll()", (error, result) => {
                  if (error) {
                    console.info(`emitScrollableSeventeen runJavaScript error: ` + JSON.stringify(error))
                    return;
                  } else {
                    console.log("emitScrollableSeventeen runJavaScript.result: " + result);
                  }
                })
                } catch (error) {
                  console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                }
                if (this.onScrollx == 0 && this.onScrolly == 0) {
                  Utils.emitEvent(true, 182470)
                } else {
                  Utils.emitEvent(false, 182470)
                }
                break;
              }
              case "emitScrollableEighteen": {
                this.controller.setScrollable(false);
                this.controller1.setScrollable(true);
                this.onScrollx = 0;
                this.onScrolly = 0;
                this.onScrollx1 = 0;
                this.onScrolly1 = 0;
                this.isPageEnd = -1;
                this.isPageEnd1 = -1;
                this.controller.loadUrl($rawfile('theScroll.html'));
                await Utils.waitForExist(()=>this.isPageEnd, this.str+' isPageEnd', 1, 1000);
                this.controller1.loadUrl($rawfile('theScroll.html'));
                await Utils.waitForExist(()=>this.isPageEnd1, this.str+' isPageEnd1', 1, 1000);
                try {
                  this.controller.scrollBy(500, 500);
                  await Utils.waitForScrollStop(()=>this.controller.getPageOffset().x, this.str+' webXOffset');
                  await Utils.waitForScrollStop(()=>this.controller.getPageOffset().y, this.str+' webYOffset');
                  this.controller1.scrollBy(500, 500);
                  await Utils.waitForScrollStop(()=>this.controller1.getPageOffset().x, this.str+' webXOffset');
                  await Utils.waitForScrollStop(()=>this.controller1.getPageOffset().y, this.str+' webYOffset');
                } catch (error) {
                  console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                }
                if (this.onScrollx == 0 && this.onScrolly == 0 && this.onScrollx1 != 0 && this.onScrolly1 != 0) {
                  Utils.emitEvent(true, 182480)
                } else {
                  Utils.emitEvent(false, 182480)
                }
                break;
              }
              case "emitScrollableNineteen": {
                this.controller.setScrollable(true);
                this.controller1.setScrollable(true);
                this.onScrollx = 0;
                this.onScrolly = 0;
                this.onScrollx1 = 0;
                this.onScrolly1 = 0;
                this.isPageEnd = -1;
                this.isPageEnd1 = -1;
                this.controller.loadUrl($rawfile('theScroll.html'));
                await Utils.waitForExist(()=>this.isPageEnd, this.str+' isPageEnd', 1, 1000);
                this.controller1.loadUrl($rawfile('theScroll.html'));
                await Utils.waitForExist(()=>this.isPageEnd1, this.str+' isPageEnd1', 1, 1000);
                try {
                  this.controller.scrollBy(500, 500);
                  await Utils.waitForScrollStop(()=>this.controller.getPageOffset().x, this.str+' webXOffset');
                  await Utils.waitForScrollStop(()=>this.controller.getPageOffset().y, this.str+' webYOffset');
                  this.controller1.scrollBy(500, 500);
                  await Utils.waitForScrollStop(()=>this.controller1.getPageOffset().x, this.str+' webXOffset');
                  await Utils.waitForScrollStop(()=>this.controller1.getPageOffset().y, this.str+' webYOffset');
                } catch (error) {
                  console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                }
                if (this.onScrollx != 0 && this.onScrolly != 0 && this.onScrollx1 != 0 && this.onScrolly1 != 0) {
                  Utils.emitEvent(true, 182490)
                } else {
                  Utils.emitEvent(false, 182490)
                }
                break;
              }
              case "emitScrollableTwenty": {
                this.onScrollx = 0;
                this.onScrolly = 0;
                this.isPageEnd = -1;
                this.controller.loadUrl($rawfile('theScroll.html'));
                await Utils.waitForExist(()=>this.isPageEnd, this.str+' isPageEnd', 1, 1000);
                try {
                  this.controller.scrollBy(500, 500);
                  await Utils.waitForScrollStop(()=>this.controller.getPageOffset().x, this.str+' webXOffset');
                  await Utils.waitForScrollStop(()=>this.controller.getPageOffset().y, this.str+' webYOffset');
                } catch (error) {
                  console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                }
                if (this.onScrollx != 0 && this.onScrolly != 0 ) {
                  Utils.emitEvent(true, 182500)
                } else {
                  Utils.emitEvent(false, 182500)
                }
                break;
              }
              case "emitScrollableTwentyOne": {
                this.controller.setScrollable(false);
                this.scrollForwardEnums = NestedScrollMode.SELF_ONLY;
                this.onScrollx = 0;
                this.onScrolly = 0;
                this.isPageEnd = -1;
                this.controller.loadUrl($rawfile('theScroll.html'));
                await Utils.waitForExist(()=>this.isPageEnd, this.str+' isPageEnd', 1, 100)
                try {
                  this.controller.scrollBy(3500, 3500);
                  await Utils.waitForScrollStop(()=>this.controller.getPageOffset().x, this.str+' webXOffset');
                  await Utils.waitForScrollStop(()=>this.controller.getPageOffset().y, this.str+' webYOffset');
                } catch (error) {
                  console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                }
                if (this.onScrollx == 0 && this.onScrolly == 0) {
                  Utils.emitEvent(true, 182510)
                } else {
                  Utils.emitEvent(false, 182510)
                }
                break;
              }
              case "emitScrollableTwentyTwo": {
                this.controller.setScrollable(false);
                this.scrollForwardEnums = NestedScrollMode.SELF_FIRST;
                this.onScrollx = 0;
                this.onScrolly = 0;
                this.isPageEnd = -1;
                this.controller.loadUrl($rawfile('theScroll.html'));
                await Utils.waitForExist(()=>this.isPageEnd, this.str+' isPageEnd', 1, 1000);
                try {
                  this.controller.scrollBy(3500, 3500);
                  await Utils.waitForScrollStop(()=>this.controller.getPageOffset().x, this.str+' webXOffset');
                  await Utils.waitForScrollStop(()=>this.controller.getPageOffset().y, this.str+' webYOffset');
                } catch (error) {
                  console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                }
                if (this.onScrollx == 0 && this.onScrolly == 0) {
                  Utils.emitEvent(true, 182520)
                } else {
                  Utils.emitEvent(false, 182520)
                }
                break;
              }
              case "emitScrollableTwentyThree": {
                this.controller.setScrollable(false);
                this.scrollForwardEnums = NestedScrollMode.PARENT_FIRST;
                this.onScrollx = 0;
                this.onScrolly = 0;
                this.isPageEnd = -1;
                this.controller.loadUrl($rawfile('theScroll.html'));
                await Utils.waitForExist(()=>this.isPageEnd, this.str+' isPageEnd', 1, 1000);
                try {
                  this.controller.scrollBy(3500, 3500);
                  await Utils.waitForScrollStop(()=>this.controller.getPageOffset().x, this.str+' webXOffset');
                  await Utils.waitForScrollStop(()=>this.controller.getPageOffset().y, this.str+' webYOffset');
                } catch (error) {
                  console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                }
                if (this.onScrollx == 0 && this.onScrolly == 0) {
                  Utils.emitEvent(true, 182530)
                } else {
                  Utils.emitEvent(false, 182530)
                }
                break;
              }
              case "emitScrollableTwentyFour": {
                this.controller.setScrollable(false);
                this.scrollForwardEnums = NestedScrollMode.PARALLEL;
                this.onScrollx = 0;
                this.onScrolly = 0;
                this.isPageEnd = -1;
                this.controller.loadUrl($rawfile('theScroll.html'));
                await Utils.waitForExist(()=>this.isPageEnd, this.str+' isPageEnd', 1, 1000);
                try {
                  this.controller.scrollBy(3500, 3500);
                  await Utils.waitForScrollStop(()=>this.controller.getPageOffset().x, this.str+' webXOffset');
                  await Utils.waitForScrollStop(()=>this.controller.getPageOffset().y, this.str+' webYOffset');
                } catch (error) {
                  console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                }
                if (this.onScrollx == 0 && this.onScrolly == 0) {
                  Utils.emitEvent(true, 182540)
                } else {
                  Utils.emitEvent(false, 182540)
                }
                break;
              }
              case "emitScrollableTwentyFive": {
                this.controller.setScrollable(false);
                this.scrollForwardEnums = NestedScrollMode.SELF_ONLY;
                this.scrollBackwardEnums = NestedScrollMode.SELF_ONLY;
                this.onScrollx = 0;
                this.onScrolly = 0;
                this.isPageEnd = -1;
                this.controller.loadUrl($rawfile('theScroll.html'));
                await Utils.waitForExist(()=>this.isPageEnd, this.str+' isPageEnd', 1, 1000);
                try {
                  this.controller.scrollBy(3500, 3500);
                  await Utils.waitForScrollStop(()=>this.controller.getPageOffset().x, this.str+' webXOffset');
                  await Utils.waitForScrollStop(()=>this.controller.getPageOffset().y, this.str+' webYOffset');
                  this.controller.scrollBy(-3500, -3500);
                  await Utils.waitForScrollStop(()=>this.controller.getPageOffset().x, this.str+' webXOffset');
                  await Utils.waitForScrollStop(()=>this.controller.getPageOffset().y, this.str+' webYOffset');
                } catch (error) {
                  console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                }
                if (this.onScrollx == 0 && this.onScrolly == 0) {
                  Utils.emitEvent(true, 182550)
                } else {
                  Utils.emitEvent(false, 182550)
                }
                break;
              }
              case "emitScrollableTwentySix": {
                this.controller.setScrollable(false);
                this.scrollBackwardEnums = NestedScrollMode.SELF_FIRST;
                this.onScrollx = 0;
                this.onScrolly = 0;
                this.isPageEnd = -1;
                this.controller.loadUrl($rawfile('theScroll.html'));
                await Utils.waitForExist(()=>this.isPageEnd, this.str+' isPageEnd', 1, 1000);
                try {
                  this.controller.scrollBy(3500, 3500);
                  await Utils.waitForScrollStop(()=>this.controller.getPageOffset().x, this.str+' webXOffset');
                  await Utils.waitForScrollStop(()=>this.controller.getPageOffset().y, this.str+' webYOffset');
                  this.controller.scrollBy(-3500, -3500);
                  await Utils.waitForScrollStop(()=>this.controller.getPageOffset().x, this.str+' webXOffset');
                  await Utils.waitForScrollStop(()=>this.controller.getPageOffset().y, this.str+' webYOffset');
                } catch (error) {
                  console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                }
                if (this.onScrollx == 0 && this.onScrolly == 0) {
                  Utils.emitEvent(true, 182560)
                } else {
                  Utils.emitEvent(false, 182560)
                }
                break;
              }
              case "emitScrollableTwentySeven": {
                this.controller.setScrollable(false);
                this.scrollBackwardEnums = NestedScrollMode.PARENT_FIRST;
                this.onScrollx = 0;
                this.onScrolly = 0;
                this.isPageEnd = -1;
                this.controller.loadUrl($rawfile('theScroll.html'));
                await Utils.waitForExist(()=>this.isPageEnd, this.str+' isPageEnd', 1, 1000);
                try {
                  this.controller.scrollBy(3500, 3500);
                  await Utils.waitForScrollStop(()=>this.controller.getPageOffset().x, this.str+' webXOffset');
                  await Utils.waitForScrollStop(()=>this.controller.getPageOffset().y, this.str+' webYOffset');
                  this.controller.scrollBy(-3500, -3500);
                  await Utils.waitForScrollStop(()=>this.controller.getPageOffset().x, this.str+' webXOffset');
                  await Utils.waitForScrollStop(()=>this.controller.getPageOffset().y, this.str+' webYOffset');
                } catch (error) {
                  console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                }
                if (this.onScrollx == 0 && this.onScrolly == 0) {
                  Utils.emitEvent(true, 182570)
                } else {
                  Utils.emitEvent(false, 182570)
                }
                break;
              }
              case "emitScrollableTwentyEight": {
                this.controller.setScrollable(false);
                this.scrollBackwardEnums = NestedScrollMode.PARALLEL;
                this.onScrollx = 0;
                this.onScrolly = 0;
                this.isPageEnd = -1;
                this.controller.loadUrl($rawfile('theScroll.html'));
                await Utils.waitForExist(()=>this.isPageEnd, this.str+' isPageEnd', 1, 1000);
                try {
                  this.controller.scrollBy(3500, 3500);
                  await Utils.waitForScrollStop(()=>this.controller.getPageOffset().x, this.str+' webXOffset');
                  await Utils.waitForScrollStop(()=>this.controller.getPageOffset().y, this.str+' webYOffset');
                  this.controller.scrollBy(-3500, -3500);
                  await Utils.waitForScrollStop(()=>this.controller.getPageOffset().x, this.str+' webXOffset');
                  await Utils.waitForScrollStop(()=>this.controller.getPageOffset().y, this.str+' webYOffset');
                } catch (error) {
                  console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                }
                if (this.onScrollx == 0 && this.onScrolly == 0) {
                  Utils.emitEvent(true, 182580)
                } else {
                  Utils.emitEvent(false, 182580)
                }
                break;
              }
              case "emitScrollableTwentyNine": {
                this.scrollEnabled = true;
                this.controller.setScrollable(true);
                this.scrollForwardEnums = NestedScrollMode.SELF_ONLY;
                this.scrollBackwardEnums = NestedScrollMode.SELF_ONLY;
                this.onScrollx = 0;
                this.onScrolly = 0;
                this.isPageEnd = -1;
                this.controller.loadUrl($rawfile('theScroll.html'));
                await Utils.waitForExist(()=>this.isPageEnd, this.str+' isPageEnd', 1, 1000);
                try {
                  this.controller.scrollBy(3500, 3500);
                  await Utils.waitForScrollStop(()=>this.controller.getPageOffset().x, this.str+' webXOffset');
                  await Utils.waitForScrollStop(()=>this.controller.getPageOffset().y, this.str+' webYOffset');
                } catch (error) {
                  console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                }
                if (this.onScrollx != 0 && this.onScrolly != 0) {
                  Utils.emitEvent(true, 182590)
                } else {
                  Utils.emitEvent(false, 182590)
                }
                break;
              }
              case "emitScrollableThirty": {
                this.isPageEnd = -1;
                this.controller.loadUrl('www.example.com')
                await Utils.waitForExist(()=>this.isPageEnd, this.str+' isPageEnd', 1, 1000);
                this.controller.setScrollable(true);
                this.scrollForwardEnums = NestedScrollMode.SELF_FIRST;
                this.onScrollx = 0;
                this.onScrolly = 0;
                this.isPageEnd = -1;
                this.controller.loadUrl($rawfile('theScroll.html'));
                await Utils.waitForExist(()=>this.isPageEnd, this.str+' isPageEnd', 1, 1000);
                try {
                  this.controller.scrollBy(3500, 3500);
                  await Utils.waitForScrollStop(()=>this.controller.getPageOffset().x, this.str+' webXOffset');
                  await Utils.waitForScrollStop(()=>this.controller.getPageOffset().y, this.str+' webYOffset');
                } catch (error) {
                  console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                }
                if (this.onScrollx != 0 && this.onScrolly != 0) {
                  Utils.emitEvent(true, 182600)
                } else {
                  Utils.emitEvent(false, 182600)
                }
                break;
              }
              case "emitScrollableThirtyOne": {
                this.isPageEnd = -1;
                this.controller.loadUrl('www.example.com')
                await Utils.waitForExist(()=>this.isPageEnd, this.str+' isPageEnd', 1, 1000);
                this.controller.setScrollable(true);
                this.scrollForwardEnums = NestedScrollMode.PARENT_FIRST;
                this.onScrollx = 0;
                this.onScrolly = 0;
                this.isPageEnd = -1;
                this.controller.loadUrl($rawfile('theScroll.html'));
                await Utils.waitForExist(()=>this.isPageEnd, this.str+' isPageEnd', 1, 1000);
                try {
                  this.controller.scrollBy(3500, 3500);
                  await Utils.waitForScrollStop(()=>this.controller.getPageOffset().x, this.str+' webXOffset');
                  await Utils.waitForScrollStop(()=>this.controller.getPageOffset().y, this.str+' webYOffset');
                } catch (error) {
                  console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                }
                if (this.onScrollx != 0 && this.onScrolly != 0) {
                  Utils.emitEvent(true, 182610)
                } else {
                  Utils.emitEvent(false, 182610)
                }
                break;
              }
              case "emitScrollableThirtyTwo": {
                this.isPageEnd = -1;
                this.controller.loadUrl('www.example.com')
                await Utils.waitForExist(()=>this.isPageEnd, this.str+' isPageEnd', 1, 1000);
                this.controller.setScrollable(true);
                this.scrollForwardEnums = NestedScrollMode.PARALLEL;
                this.onScrollx = 0;
                this.onScrolly = 0;
                this.isPageEnd = -1;
                this.controller.loadUrl($rawfile('theScroll.html'));
                await Utils.waitForExist(()=>this.isPageEnd, this.str+' isPageEnd', 1, 1000);
                try {
                  this.controller.scrollBy(3500, 3500);
                  await Utils.waitForScrollStop(()=>this.controller.getPageOffset().x, this.str+' webXOffset');
                  await Utils.waitForScrollStop(()=>this.controller.getPageOffset().y, this.str+' webYOffset');
                } catch (error) {
                  console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                }
                if (this.onScrollx != 0 && this.onScrolly != 0) {
                  Utils.emitEvent(true, 182620)
                } else {
                  Utils.emitEvent(false, 182620)
                }
                break;
              }
              case "emitScrollableThirtyThree": {
                this.isPageEnd = -1;
                this.controller.loadUrl('www.example.com')
                await Utils.waitForExist(()=>this.isPageEnd, this.str+' isPageEnd', 1, 1000);
                this.controller.setScrollable(true);
                this.scrollForwardEnums = NestedScrollMode.SELF_ONLY;
                this.scrollBackwardEnums = NestedScrollMode.SELF_ONLY;
                this.onScrollx = 0;
                this.onScrolly = 0;
                this.isPageEnd = -1;
                this.controller.loadUrl($rawfile('theScroll.html'));
                await Utils.waitForExist(()=>this.isPageEnd, this.str+' isPageEnd', 1, 1000);
                try {
                  this.controller.scrollBy(3500, 3500);
                  await Utils.waitForScrollStop(()=>this.controller.getPageOffset().x, this.str+' webXOffset');
                  await Utils.waitForScrollStop(()=>this.controller.getPageOffset().y, this.str+' webYOffset');
                  this.onScrollx = 0;
                  this.onScrolly = 0;
                  this.controller.scrollBy(-200, -200);
                  await Utils.waitForScrollStop(()=>this.controller.getPageOffset().x, this.str+' webXOffset');
                  await Utils.waitForScrollStop(()=>this.controller.getPageOffset().y, this.str+' webYOffset');
                } catch (error) {
                  console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                }
                if (this.onScrollx != 0 && this.onScrolly != 0) {
                  Utils.emitEvent(true, 182630)
                } else {
                  Utils.emitEvent(false, 182630)
                }
                break;
              }
              case "emitScrollableThirtyFour": {
                this.isPageEnd = -1;
                this.controller.loadUrl('www.example.com')
                await Utils.waitForExist(()=>this.isPageEnd, this.str+' isPageEnd', 1,)
                this.controller.setScrollable(true);
                this.scrollBackwardEnums = NestedScrollMode.SELF_FIRST;
                this.onScrollx = 0;
                this.onScrolly = 0;
                this.isPageEnd = -1;
                this.controller.loadUrl($rawfile('theScroll.html'));
                await Utils.waitForExist(()=>this.isPageEnd, this.str+' isPageEnd', 1, 1000);
                try {
                  this.controller.scrollBy(3500, 3500);
                  await Utils.waitForScrollStop(()=>this.controller.getPageOffset().x, this.str+' webXOffset');
                  await Utils.waitForScrollStop(()=>this.controller.getPageOffset().y, this.str+' webYOffset');
                  this.onScrollx = 0;
                  this.onScrolly = 0;
                  this.controller.scrollBy(-200, -200);
                  await Utils.waitForScrollStop(()=>this.controller.getPageOffset().x, this.str+' webXOffset');
                  await Utils.waitForScrollStop(()=>this.controller.getPageOffset().y, this.str+' webYOffset');
                } catch (error) {
                  console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                }
                if (this.onScrollx != 0 && this.onScrolly != 0) {
                  Utils.emitEvent(true, 182640)
                } else {
                  Utils.emitEvent(false, 182640)
                }
                break;
              }
              case "emitScrollableThirtyFive": {
                this.isPageEnd = -1;
                this.controller.loadUrl('www.example.com')
                await Utils.waitForExist(()=>this.isPageEnd, this.str+' isPageEnd', 1, 1000);
                this.controller.setScrollable(true);
                this.scrollBackwardEnums = NestedScrollMode.PARENT_FIRST;
                this.onScrollx = 0;
                this.onScrolly = 0;
                this.isPageEnd = -1;
                this.controller.loadUrl($rawfile('theScroll.html'));
                await Utils.waitForExist(()=>this.isPageEnd, this.str+' isPageEnd', 1, 1000);
                try {
                  this.controller.scrollBy(3500, 3500);
                  await Utils.waitForScrollStop(()=>this.controller.getPageOffset().x, this.str+' webXOffset');
                  await Utils.waitForScrollStop(()=>this.controller.getPageOffset().y, this.str+' webYOffset');
                  this.onScrollx = 0;
                  this.onScrolly = 0;
                  this.controller.scrollBy(-200, -200);
                  await Utils.waitForScrollStop(()=>this.controller.getPageOffset().x, this.str+' webXOffset');
                  await Utils.waitForScrollStop(()=>this.controller.getPageOffset().y, this.str+' webYOffset');
                } catch (error) {
                  console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                }
                if (this.onScrollx != 0 && this.onScrolly != 0) {
                  Utils.emitEvent(true, 182650)
                } else {
                  Utils.emitEvent(false, 182650)
                }
                break;
              }
              case "emitScrollableThirtySix": {
                this.isPageEnd = -1;
                this.controller.loadUrl('www.example.com')
                await Utils.waitForExist(()=>this.isPageEnd, this.str+' isPageEnd', 1, 1000);
                this.controller.setScrollable(true);
                this.scrollBackwardEnums = NestedScrollMode.PARALLEL;
                this.onScrollx = 0;
                this.onScrolly = 0;
                this.isPageEnd = -1;
                this.controller.loadUrl($rawfile('theScroll.html'));
                await Utils.waitForExist(()=>this.isPageEnd, this.str+' isPageEnd', 1, 1000);
                try {
                  this.controller.scrollBy(3500, 3500);
                  await Utils.waitForScrollStop(()=>this.controller.getPageOffset().x, this.str+' webXOffset');
                  await Utils.waitForScrollStop(()=>this.controller.getPageOffset().y, this.str+' webYOffset');
                  this.onScrollx = 0;
                  this.onScrolly = 0;
                  this.controller.scrollBy(-200, -200);
                  await Utils.waitForScrollStop(()=>this.controller.getPageOffset().x, this.str+' webXOffset');
                  await Utils.waitForScrollStop(()=>this.controller.getPageOffset().y, this.str+' webYOffset');
                } catch (error) {
                  console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                }
                if (this.onScrollx != 0 && this.onScrolly != 0) {
                  Utils.emitEvent(true, 182660)
                } else {
                  Utils.emitEvent(false, 182660)
                }
                break;
              }
            }
          })
        }

        Web({ src: $rawfile('theScroll.html'), controller: this.controller })
        .onScroll((event) => {
          console.info("x = " + event.xOffset)
          console.info("y = " + event.yOffset)
          this.onScrollx = event.xOffset
          this.onScrolly = event.yOffset
        })
        .nestedScroll({
          scrollForward: this.scrollForwardEnums,
          scrollBackward: this.scrollBackwardEnums,
        })
        .onPageEnd((event) => {
          console.log('onPageEnd url:' + event.url);
          this.isPageEnd = 1;
        })
        Web({ src: $rawfile('theScroll.html'), controller: this.controller1 })
        .onScroll((event) => {
          console.info("x1 = " + event.xOffset)
          console.info("y1 = " + event.yOffset)
          this.onScrollx1 = event.xOffset
          this.onScrolly1 = event.yOffset
        })
        .onPageEnd((event) => {
          console.log('onPageEnd url:' + event.url);
          this.isPageEnd1 = 1;
        })
      }
    }
    .scrollable(ScrollDirection.Vertical)
    .scrollBar(BarState.Off)
    .edgeEffect(EdgeEffect.Spring)
    .enableScrollInteraction(this.scrollEnabled)
  }
}
