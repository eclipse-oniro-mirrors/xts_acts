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

  onPageShow() {
    let valueChangeEvent: events_emitter.InnerEvent = {
      eventId: 10,
      priority: events_emitter.EventPriority.LOW
    }
    events_emitter.on(valueChangeEvent, this.valueChangeCallBack)
  }

  private valueChangeCallBack = (eventData: events_emitter.EventData) => {
    console.info("web page valueChangeCallBack");
    if (eventData != null) {
      console.info("valueChangeCallBack:" + JSON.stringify(eventData));
      if (eventData.data?.ACTION != null) {
        this.str = eventData.data?.ACTION;
      }
    }
  }

  build() {
    Scroll(){
      Column() {
        Row() {
          Button("web click").key('webcomponentScrollable').onClick(async () => {
            console.info("key==>" + this.str)
            switch (this.str) {
              case "emitScrollableOne": {
                this.controller.setScrollable(true);
                await Utils.sleep(2000);
                this.controller.loadUrl($rawfile('theScroll.html'));
                this.xNum = -10;
                this.yNum = -10;
                await Utils.sleep(1000);
                try {
                  this.controller.scrollTo(this.xNum, this.yNum);
                  await Utils.sleep(1000);
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
                  Utils.emitEvent(result, 214214)
                  console.info("emitScrollableOne  res: " + result);
                })
                break;
              }
              case "emitScrollableTwo": {
                this.controller.setScrollable(false);
                await Utils.sleep(2000);
                this.controller.loadUrl($rawfile('theScroll.html'));
                this.xNum = -10;
                this.yNum = 3500;
                await Utils.sleep(1000);
                let scrollEnabled= this.controller.getScrollable();
                console.log("scrollEnabled: " + scrollEnabled);
                try {
                  this.controller.scrollTo(this.xNum, this.yNum);
                  await Utils.sleep(1000);
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
                  Utils.emitEvent(this.res, 216216)
                  console.info("emitScrollableTwo  res: " + result);
                })
                break;
              }
              case "emitScrollableThree": {
                this.controller.setScrollable(false);
                await Utils.sleep(2000);
                this.controller.loadUrl($rawfile('theScroll.html'));
                await Utils.sleep(2000);
                let scrollEnabled= this.controller.getScrollable();
                console.log("scrollEnabled: " + scrollEnabled);
                this.xNum = -10;
                this.yNum = 200;
                await Utils.sleep(1000);
                try {
                  this.controller.scrollTo(this.xNum, this.yNum);
                  await Utils.sleep(1000);
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
                  Utils.emitEvent(result, 218218)
                  console.info("emitScrollableThree  res: " + result);
                })
                break;
              }
              case "emitScrollableFour": {
                this.controller.setScrollable(false);
                await Utils.sleep(2000);
                this.controller.loadUrl($rawfile('theScroll.html'));
                await Utils.sleep(2000);
                this.xNum = 200;
                this.yNum = -10;
                await Utils.sleep(1000);
                try {
                  this.controller.scrollTo(this.xNum, this.yNum);
                  await Utils.sleep(1000)
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
                  Utils.emitEvent(result, 220220)
                  console.info("emitScrollableFour  res: " + result);
                })
                break;
              }
              case "emitScrollableFive": {
                this.controller.setScrollable(false);
                await Utils.sleep(2000);
                this.controller.loadUrl($rawfile('theScroll.html'));
                await Utils.sleep(2000);
                this.xNum = 4000;
                this.yNum = -10;
                await Utils.sleep(1000);
                try {
                  this.controller.scrollTo(this.xNum, this.yNum);
                  await Utils.sleep(1000)
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
                  Utils.emitEvent(this.res, 222222)
                  console.info("emitScrollableFive  res: " + result);
                })
                break;
              }
              case "emitScrollableSix": {
                this.controller.setScrollable(false);
                await Utils.sleep(2000);
                this.controller.loadUrl($rawfile('theScroll.html'));
                await Utils.sleep(2000);
                this.xNum = 200;
                this.yNum = 200;
                await Utils.sleep(1000);
                try {
                  this.controller.scrollTo(this.xNum, this.yNum);
                  await Utils.sleep(1000)
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
                  Utils.emitEvent(result, 224224)
                  console.info("emitScrollableSix  res: " + result);
                })
                break;
              }
              case "emitScrollableSeven": {
                this.controller.setScrollable(false);
                await Utils.sleep(2000);
                this.controller.loadUrl($rawfile('theScroll.html'));
                await Utils.sleep(2000);
                this.xNum = 4000;
                this.yNum = 3500;
                await Utils.sleep(1000);
                try {
                  this.controller.scrollTo(this.xNum, this.yNum);
                  await Utils.sleep(1000)
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
                  Utils.emitEvent(this.res, 226226)
                  console.info("emitScrollableSeven  res: " + result);
                })
                break;
              }
              case "emitScrollableEight": {
                this.controller.setScrollable(false);
                await Utils.sleep(2000);
                this.onScrollx = 0;
                this.onScrolly = 0;
                this.controller.loadUrl($rawfile('theScroll.html'));
                await Utils.sleep(2000);
                this.xNum = 4000;
                this.yNum = 3500;
                await Utils.sleep(1000);
                try {
                  this.controller.scrollBy(this.xNum, this.yNum);
                  await Utils.sleep(1000)
                } catch (error) {
                  console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                }
                if (this.onScrollx == 0 && this.onScrolly == 0) {
                  Utils.emitEvent(true, 228228)
                } else {
                  Utils.emitEvent(false, 228228)
                }
                break;
              }
              case "emitScrollableNine": {
                this.controller.setScrollable(false);
                await Utils.sleep(2000);
                this.onScrollx = 0;
                this.onScrolly = 0;
                this.controller.loadUrl($rawfile('theScroll.html'));
                await Utils.sleep(2000);
                try {
                  this.controller.pageUp(false);
                  await Utils.sleep(1000)
                } catch (error) {
                  console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                }
                if (this.onScrollx == 0 && this.onScrolly == 0) {
                  Utils.emitEvent(true, 230230)
                } else {
                  Utils.emitEvent(false, 230230)
                }
                break;
              }
              case "emitScrollableTen": {
                this.controller.setScrollable(false);
                await Utils.sleep(2000);
                this.onScrollx = 0;
                this.onScrolly = 0;
                this.controller.loadUrl($rawfile('theScroll.html'));
                await Utils.sleep(2000);
                try {
                  this.controller.pageDown(false);
                  await Utils.sleep(1000)
                } catch (error) {
                  console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                }
                if (this.onScrollx == 0 && this.onScrolly == 0) {
                  Utils.emitEvent(true, 232232)
                } else {
                  Utils.emitEvent(false, 232232)
                }
                break;
              }
              case "emitScrollableEleven": {
                this.controller.setScrollable(false);
                await Utils.sleep(2000);
                this.controller.loadUrl($rawfile('theScroll.html'));
                await Utils.sleep(2000);
                try {
                  let scrollEnabled= this.controller.getScrollable();
                  console.log("scrollEnabled: " + scrollEnabled);
                  Utils.emitEvent(scrollEnabled, 234234)
                } catch (error) {
                  console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                }
                break;
              }
              case "emitScrollableTwelve": {
                this.controller.setScrollable(true);
                await Utils.sleep(2000);
                this.controller.loadUrl($rawfile('theScroll.html'));
                await Utils.sleep(2000);
                try {
                  let scrollEnabled= this.controller.getScrollable();
                  console.log("scrollEnabled: " + scrollEnabled);
                  Utils.emitEvent(scrollEnabled, 236236)
                } catch (error) {
                  console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                }
                break;
              }
              case "emitScrollableThirteen": {
                this.controller.setScrollable(true);
                await Utils.sleep(2000);
                this.controller.loadUrl($rawfile('theScroll.html'));
                this.xNum = 200;
                this.yNum = 200;
                await Utils.sleep(1000);
                try {
                  this.controller.scrollTo(this.xNum, this.yNum);
                  await Utils.sleep(1000);
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
                  Utils.emitEvent(result, 238238)
                  console.info("emitScrollableOne  res: " + result);
                })
                break;
              }
              case "emitScrollableFourteen": {
                this.controller.setScrollable(false);
                await Utils.sleep(2000);
                this.onScrollx = 0;
                this.onScrolly = 0;
                this.controller.loadUrl($rawfile('theScroll.html'));
                await Utils.sleep(2000);
                try {
                  this.controller.slideScroll(500, 500);
                  await Utils.sleep(1000)
                } catch (error) {
                  console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                }
                if (this.onScrollx == 0 && this.onScrolly == 0) {
                  Utils.emitEvent(true, 240240)
                } else {
                  Utils.emitEvent(false, 240240)
                }
                break;
              }
              case "emitScrollableFifteen": {
                this.scrollEnabled = false
                this.controller.setScrollable(false);
                await Utils.sleep(2000);
                this.onScrollx = 0;
                this.onScrolly = 0;
                this.controller.loadUrl($rawfile('theScroll.html'));
                await Utils.sleep(2000);
                try {
                  this.controller.scrollBy(500, 500);
                  await Utils.sleep(1000)
                } catch (error) {
                  console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                }
                if (this.onScrollx == 0 && this.onScrolly == 0) {
                  Utils.emitEvent(true, 242242)
                } else {
                  Utils.emitEvent(false, 242242)
                }
                break;
              }
              case "emitScrollableSixteen": {
                this.scrollEnabled = false
                this.controller.setScrollable(true);
                await Utils.sleep(2000);
                this.onScrollx = 0;
                this.onScrolly = 0;
                this.controller.loadUrl($rawfile('theScroll.html'));
                await Utils.sleep(2000);
                try {
                  this.controller.scrollBy(500, 500);
                  await Utils.sleep(1000)
                } catch (error) {
                  console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                }
                if (this.onScrollx == 0 && this.onScrolly == 0) {
                  Utils.emitEvent(true, 244244)
                } else {
                  Utils.emitEvent(false, 244244)
                }
                break;
              }
              case "emitScrollableSeventeen": {
                this.controller.setScrollable(false);
                await Utils.sleep(2000);
                this.onScrollx = 0;
                this.onScrolly = 0;
                this.controller.loadUrl($rawfile('theScroll.html'));
                await Utils.sleep(2000);
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
                  Utils.emitEvent(true, 246246)
                } else {
                  Utils.emitEvent(false, 246246)
                }
                break;
              }
              case "emitScrollableEighteen": {
                this.controller.setScrollable(false);
                this.controller1.setScrollable(true);
                await Utils.sleep(2000);
                this.onScrollx = 0;
                this.onScrolly = 0;
                this.onScrollx1 = 0;
                this.onScrolly1 = 0;
                this.controller.loadUrl($rawfile('theScroll.html'));
                this.controller1.loadUrl($rawfile('theScroll.html'));
                await Utils.sleep(2000);
                try {
                  this.controller.scrollBy(500, 500);
                  this.controller1.scrollBy(500, 500);
                  await Utils.sleep(1000)
                } catch (error) {
                  console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                }
                if (this.onScrollx == 0 && this.onScrolly == 0 && this.onScrollx1 != 0 && this.onScrolly1 != 0) {
                  Utils.emitEvent(true, 248248)
                } else {
                  Utils.emitEvent(false, 248248)
                }
                break;
              }
              case "emitScrollableNineteen": {
                this.controller.setScrollable(true);
                this.controller1.setScrollable(true);
                await Utils.sleep(2000);
                this.onScrollx = 0;
                this.onScrolly = 0;
                this.onScrollx1 = 0;
                this.onScrolly1 = 0;
                this.controller.loadUrl($rawfile('theScroll.html'));
                this.controller1.loadUrl($rawfile('theScroll.html'));
                await Utils.sleep(2000);
                try {
                  this.controller.scrollBy(500, 500);
                  this.controller1.scrollBy(500, 500);
                  await Utils.sleep(1000)
                } catch (error) {
                  console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                }
                if (this.onScrollx != 0 && this.onScrolly != 0 && this.onScrollx1 != 0 && this.onScrolly1 != 0) {
                  Utils.emitEvent(true, 250250)
                } else {
                  Utils.emitEvent(false, 250250)
                }
                break;
              }
              case "emitScrollableTwenty": {
                this.onScrollx = 0;
                this.onScrolly = 0;
                this.controller.loadUrl($rawfile('theScroll.html'));
                await Utils.sleep(2000);
                try {
                  this.controller.scrollBy(500, 500);
                  await Utils.sleep(1000)
                } catch (error) {
                  console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                }
                if (this.onScrollx != 0 && this.onScrolly != 0 ) {
                  Utils.emitEvent(true, 252252)
                } else {
                  Utils.emitEvent(false, 252252)
                }
                break;
              }
              case "emitScrollableTwentyOne": {
                this.controller.setScrollable(false);
                this.scrollForwardEnums = NestedScrollMode.SELF_ONLY;
                await Utils.sleep(2000);
                this.onScrollx = 0;
                this.onScrolly = 0;
                this.controller.loadUrl($rawfile('theScroll.html'));
                await Utils.sleep(2000);
                try {
                  this.controller.scrollBy(3500, 3500);
                  await Utils.sleep(1000)
                } catch (error) {
                  console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                }
                if (this.onScrollx == 0 && this.onScrolly == 0) {
                  Utils.emitEvent(true, 254254)
                } else {
                  Utils.emitEvent(false, 254254)
                }
                break;
              }
              case "emitScrollableTwentyTwo": {
                this.controller.setScrollable(false);
                this.scrollForwardEnums = NestedScrollMode.SELF_FIRST;
                await Utils.sleep(2000);
                this.onScrollx = 0;
                this.onScrolly = 0;
                this.controller.loadUrl($rawfile('theScroll.html'));
                await Utils.sleep(2000);
                try {
                  this.controller.scrollBy(3500, 3500);
                  await Utils.sleep(1000)
                } catch (error) {
                  console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                }
                if (this.onScrollx == 0 && this.onScrolly == 0) {
                  Utils.emitEvent(true, 256256)
                } else {
                  Utils.emitEvent(false, 256256)
                }
                break;
              }
              case "emitScrollableTwentyThree": {
                this.controller.setScrollable(false);
                this.scrollForwardEnums = NestedScrollMode.PARENT_FIRST;
                await Utils.sleep(2000);
                this.onScrollx = 0;
                this.onScrolly = 0;
                this.controller.loadUrl($rawfile('theScroll.html'));
                await Utils.sleep(2000);
                try {
                  this.controller.scrollBy(3500, 3500);
                  await Utils.sleep(1000)
                } catch (error) {
                  console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                }
                if (this.onScrollx == 0 && this.onScrolly == 0) {
                  Utils.emitEvent(true, 258258)
                } else {
                  Utils.emitEvent(false, 258258)
                }
                break;
              }
              case "emitScrollableTwentyFour": {
                this.controller.setScrollable(false);
                this.scrollForwardEnums = NestedScrollMode.PARALLEL;
                await Utils.sleep(2000);
                this.onScrollx = 0;
                this.onScrolly = 0;
                this.controller.loadUrl($rawfile('theScroll.html'));
                await Utils.sleep(2000);
                try {
                  this.controller.scrollBy(3500, 3500);
                  await Utils.sleep(1000)
                } catch (error) {
                  console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                }
                if (this.onScrollx == 0 && this.onScrolly == 0) {
                  Utils.emitEvent(true, 260260)
                } else {
                  Utils.emitEvent(false, 260260)
                }
                break;
              }
              case "emitScrollableTwentyFive": {
                this.controller.setScrollable(false);
                this.scrollForwardEnums = NestedScrollMode.SELF_ONLY;
                this.scrollBackwardEnums = NestedScrollMode.SELF_ONLY;
                await Utils.sleep(2000);
                this.onScrollx = 0;
                this.onScrolly = 0;
                this.controller.loadUrl($rawfile('theScroll.html'));
                await Utils.sleep(2000);
                try {
                  this.controller.scrollBy(3500, 3500);
                  await Utils.sleep(1000)
                  this.controller.scrollBy(-3500, -3500);
                  await Utils.sleep(1000)
                } catch (error) {
                  console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                }
                if (this.onScrollx == 0 && this.onScrolly == 0) {
                  Utils.emitEvent(true, 262262)
                } else {
                  Utils.emitEvent(false, 262262)
                }
                break;
              }
              case "emitScrollableTwentySix": {
                this.controller.setScrollable(false);
                this.scrollBackwardEnums = NestedScrollMode.SELF_FIRST;
                await Utils.sleep(2000);
                this.onScrollx = 0;
                this.onScrolly = 0;
                this.controller.loadUrl($rawfile('theScroll.html'));
                await Utils.sleep(2000);
                try {
                  this.controller.scrollBy(3500, 3500);
                  await Utils.sleep(1000)
                  this.controller.scrollBy(-3500, -3500);
                  await Utils.sleep(1000)
                } catch (error) {
                  console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                }
                if (this.onScrollx == 0 && this.onScrolly == 0) {
                  Utils.emitEvent(true, 264264)
                } else {
                  Utils.emitEvent(false, 264264)
                }
                break;
              }
              case "emitScrollableTwentySeven": {
                this.controller.setScrollable(false);
                this.scrollBackwardEnums = NestedScrollMode.PARENT_FIRST;
                await Utils.sleep(2000);
                this.onScrollx = 0;
                this.onScrolly = 0;
                this.controller.loadUrl($rawfile('theScroll.html'));
                await Utils.sleep(2000);
                try {
                  this.controller.scrollBy(3500, 3500);
                  await Utils.sleep(1000)
                  this.controller.scrollBy(-3500, -3500);
                  await Utils.sleep(1000)
                } catch (error) {
                  console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                }
                if (this.onScrollx == 0 && this.onScrolly == 0) {
                  Utils.emitEvent(true, 266266)
                } else {
                  Utils.emitEvent(false, 266266)
                }
                break;
              }
              case "emitScrollableTwentyEight": {
                this.controller.setScrollable(false);
                this.scrollBackwardEnums = NestedScrollMode.PARALLEL;
                await Utils.sleep(2000);
                this.onScrollx = 0;
                this.onScrolly = 0;
                this.controller.loadUrl($rawfile('theScroll.html'));
                await Utils.sleep(2000);
                try {
                  this.controller.scrollBy(3500, 3500);
                  await Utils.sleep(1000)
                  this.controller.scrollBy(-3500, -3500);
                  await Utils.sleep(1000)
                } catch (error) {
                  console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                }
                if (this.onScrollx == 0 && this.onScrolly == 0) {
                  Utils.emitEvent(true, 268268)
                } else {
                  Utils.emitEvent(false, 268268)
                }
                break;
              }
              case "emitScrollableTwentyNine": {
                this.scrollEnabled = true;
                this.controller.setScrollable(true);
                this.scrollForwardEnums = NestedScrollMode.SELF_ONLY;
                this.scrollBackwardEnums = NestedScrollMode.SELF_ONLY;
                await Utils.sleep(2000);
                this.onScrollx = 0;
                this.onScrolly = 0;
                this.controller.loadUrl($rawfile('theScroll.html'));
                await Utils.sleep(2000);
                try {
                  this.controller.scrollBy(3500, 3500);
                  await Utils.sleep(1000)
                } catch (error) {
                  console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                }
                if (this.onScrollx != 0 && this.onScrolly != 0) {
                  Utils.emitEvent(true, 270270)
                } else {
                  Utils.emitEvent(false, 270270)
                }
                break;
              }
              case "emitScrollableThirty": {
                this.controller.loadUrl('www.example.com')
                this.controller.setScrollable(true);
                this.scrollForwardEnums = NestedScrollMode.SELF_FIRST;
                await Utils.sleep(2000);
                this.onScrollx = 0;
                this.onScrolly = 0;
                this.controller.loadUrl($rawfile('theScroll.html'));
                await Utils.sleep(2000);
                try {
                  this.controller.scrollBy(3500, 3500);
                  await Utils.sleep(1000)
                } catch (error) {
                  console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                }
                if (this.onScrollx != 0 && this.onScrolly != 0) {
                  Utils.emitEvent(true, 272272)
                } else {
                  Utils.emitEvent(false, 272272)
                }
                break;
              }
              case "emitScrollableThirtyOne": {
                this.controller.loadUrl('www.example.com')
                this.controller.setScrollable(true);
                this.scrollForwardEnums = NestedScrollMode.PARENT_FIRST;
                await Utils.sleep(2000);
                this.onScrollx = 0;
                this.onScrolly = 0;
                this.controller.loadUrl($rawfile('theScroll.html'));
                await Utils.sleep(2000);
                try {
                  this.controller.scrollBy(3500, 3500);
                  await Utils.sleep(1000)
                } catch (error) {
                  console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                }
                if (this.onScrollx != 0 && this.onScrolly != 0) {
                  Utils.emitEvent(true, 274274)
                } else {
                  Utils.emitEvent(false, 274274)
                }
                break;
              }
              case "emitScrollableThirtyTwo": {
                this.controller.loadUrl('www.example.com')
                this.controller.setScrollable(true);
                this.scrollForwardEnums = NestedScrollMode.PARALLEL;
                await Utils.sleep(2000);
                this.onScrollx = 0;
                this.onScrolly = 0;
                this.controller.loadUrl($rawfile('theScroll.html'));
                await Utils.sleep(2000);
                try {
                  this.controller.scrollBy(3500, 3500);
                  await Utils.sleep(1000)
                } catch (error) {
                  console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                }
                if (this.onScrollx != 0 && this.onScrolly != 0) {
                  Utils.emitEvent(true, 276276)
                } else {
                  Utils.emitEvent(false, 276276)
                }
                break;
              }
              case "emitScrollableThirtyThree": {
                this.controller.loadUrl('www.example.com')
                this.controller.setScrollable(true);
                this.scrollForwardEnums = NestedScrollMode.SELF_ONLY;
                this.scrollBackwardEnums = NestedScrollMode.SELF_ONLY;
                await Utils.sleep(2000);
                this.onScrollx = 0;
                this.onScrolly = 0;
                this.controller.loadUrl($rawfile('theScroll.html'));
                await Utils.sleep(2000);
                try {
                  this.controller.scrollBy(3500, 3500);
                  await Utils.sleep(1000)
                  this.onScrollx = 0;
                  this.onScrolly = 0;
                  this.controller.scrollBy(-200, -200);
                  await Utils.sleep(1000)
                } catch (error) {
                  console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                }
                if (this.onScrollx != 0 && this.onScrolly != 0) {
                  Utils.emitEvent(true, 278278)
                } else {
                  Utils.emitEvent(false, 278278)
                }
                break;
              }
              case "emitScrollableThirtyFour": {
                this.controller.loadUrl('www.example.com')
                this.controller.setScrollable(true);
                this.scrollBackwardEnums = NestedScrollMode.SELF_FIRST;
                await Utils.sleep(2000);
                this.onScrollx = 0;
                this.onScrolly = 0;
                this.controller.loadUrl($rawfile('theScroll.html'));
                await Utils.sleep(2000);
                try {
                  this.controller.scrollBy(3500, 3500);
                  await Utils.sleep(1000)
                  this.onScrollx = 0;
                  this.onScrolly = 0;
                  this.controller.scrollBy(-200, -200);
                  await Utils.sleep(1000)
                } catch (error) {
                  console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                }
                if (this.onScrollx != 0 && this.onScrolly != 0) {
                  Utils.emitEvent(true, 280280)
                } else {
                  Utils.emitEvent(false, 280280)
                }
                break;
              }
              case "emitScrollableThirtyFive": {
                this.controller.loadUrl('www.example.com')
                this.controller.setScrollable(true);
                this.scrollBackwardEnums = NestedScrollMode.PARENT_FIRST;
                await Utils.sleep(2000);
                this.onScrollx = 0;
                this.onScrolly = 0;
                this.controller.loadUrl($rawfile('theScroll.html'));
                await Utils.sleep(2000);
                try {
                  this.controller.scrollBy(3500, 3500);
                  await Utils.sleep(1000)
                  this.onScrollx = 0;
                  this.onScrolly = 0;
                  this.controller.scrollBy(-200, -200);
                  await Utils.sleep(1000)
                } catch (error) {
                  console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                }
                if (this.onScrollx != 0 && this.onScrolly != 0) {
                  Utils.emitEvent(true, 282282)
                } else {
                  Utils.emitEvent(false, 282282)
                }
                break;
              }
              case "emitScrollableThirtySix": {
                this.controller.loadUrl('www.example.com')
                this.controller.setScrollable(true);
                this.scrollBackwardEnums = NestedScrollMode.PARALLEL;
                await Utils.sleep(2000);
                this.onScrollx = 0;
                this.onScrolly = 0;
                this.controller.loadUrl($rawfile('theScroll.html'));
                await Utils.sleep(2000);
                try {
                  this.controller.scrollBy(3500, 3500);
                  await Utils.sleep(1000)
                  this.onScrollx = 0;
                  this.onScrolly = 0;
                  this.controller.scrollBy(-200, -200);
                  await Utils.sleep(1000)
                } catch (error) {
                  console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                }
                if (this.onScrollx != 0 && this.onScrolly != 0) {
                  Utils.emitEvent(true, 284284)
                } else {
                  Utils.emitEvent(false, 284284)
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
        Web({ src: $rawfile('theScroll.html'), controller: this.controller1 })
        .onScroll((event) => {
          console.info("x1 = " + event.xOffset)
          console.info("y1 = " + event.yOffset)
          this.onScrollx1 = event.xOffset
          this.onScrolly1 = event.yOffset
        })
      }
    }
    .scrollable(ScrollDirection.Vertical)
    .scrollBar(BarState.Off)
    .edgeEffect(EdgeEffect.Spring)
    .enableScrollInteraction(this.scrollEnabled)
  }
}
