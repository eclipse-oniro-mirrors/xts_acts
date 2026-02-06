/**
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
import webView from '@ohos.web.webview';
import Utils from '../../test/Utils';
import AbilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import { Hypium } from '@ohos/hypium';
import testsuite from '../../test/List.test';
import { Driver, UiWindow } from '@kit.TestKit';

const EVENT_ID_SET_SUITE_KEY = 182001;
let driver: Driver = Driver.create();

@Entry
@Component
struct WebNestedScrollOptionsTest {
  controller: webView.WebviewController = new webView.WebviewController();
  scroller: Scroller = new Scroller()
  @State str: string = '';
  @State selfScrollTime: number = 0
  @State parentScrollTime: number = 0
  @State scrollForwardEnums: number = NestedScrollMode.SELF_ONLY
  @State scrollBackwardEnums: number = NestedScrollMode.SELF_ONLY
  @State userAgentPC: string = "";
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
      }
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
      Button("WebNestedScrollOptionsScrollBackward click")
        .key('NestedScrollOptionsScrollBackwardTestButton')
        .onClick(async () => {
          console.info("key==>" + this.str)
          await Utils.waitForExist(()=>this.isReceive, this.str+' isReceive', 1, 1000);
          await Utils.waitForExist(()=>this.isPageEnd, this.str+' isPageEnd', 1, 1000);
          let webRect = Utils.getComponentRect('ColumnSize');
          let X = Utils.getRectHorizontalCenterX(webRect)
          let Y = Utils.getRectVerticalCenterY(webRect)
          switch (this.str) {

            case "testNestedScrollOptionsScrollBackward001": {
              try {
                this.userAgentPC = this.controller.getUserAgent();
                if ((this.userAgentPC).includes("PC")) {
                  let window: UiWindow = await driver.findWindow({actived: true});
                  await window.maximize()
                  // await Utils.sleep(2000)
                } 
                this.scrollForwardEnums = NestedScrollMode.SELF_ONLY
                this.scrollBackwardEnums = NestedScrollMode.SELF_ONLY
                this.scroller.scrollEdge(Edge.Bottom)
                await Utils.waitForScrollStop(()=>this.scroller.currentOffset().yOffset, this.str+' scrollYOffset')
                this.controller.scrollBy(0, 40)
                await Utils.waitForScrollStop(()=>this.controller.getPageOffset().y, this.str+' webYOffset');
                this.selfScrollTime = 0
                this.parentScrollTime = 0
                if ((this.userAgentPC).includes("PC")) {
                  await driver.swipe(X, Y - 60, X, Y + 60);
                } else {
                  await driver.swipe(X, Y - 100, X, Y + 100);
                }
                Utils.emitEvent(this.parentScrollTime == 0 && this.selfScrollTime != 0, 182010)
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              break;
            }

            case "testNestedScrollOptionsScrollBackward002": {
              try {
                this.scrollForwardEnums = NestedScrollMode.SELF_ONLY
                this.scrollBackwardEnums = NestedScrollMode.SELF_FIRST
                this.scroller.scrollEdge(Edge.Top)
                await Utils.waitForScrollStop(()=>this.scroller.currentOffset().yOffset, this.str+' scrollYOffset')
                this.controller.pageUp(true)
                await Utils.waitForScrollStop(()=>this.controller.getPageOffset().y, this.str+' webYOffset');
                await Utils.waitForScrollStop(()=>this.scroller.currentOffset().yOffset, this.str+' scrollYOffset')
                this.scroller.scrollBy(0, 40)
                await Utils.waitForScrollStop(()=>this.scroller.currentOffset().yOffset, this.str+' scrollYOffset')
                this.controller.scrollBy(0, 40)
                await Utils.waitForScrollStop(()=>this.controller.getPageOffset().y, this.str+' webYOffset');
                this.selfScrollTime = 0
                this.parentScrollTime = 0
                this.userAgentPC = this.controller.getUserAgent();
                if ((this.userAgentPC).includes("PC")) {
                  await driver.swipe(X, Y - 60, X, Y + 60);
                } else {
                  await driver.swipe(X, Y - 100, X, Y + 100);
                }
                Utils.emitEvent(this.parentScrollTime > this.selfScrollTime && this.selfScrollTime > 0, 182020)
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              break;
            }

            case "testNestedScrollOptionsScrollBackward003": {
              try {
                this.scrollForwardEnums = NestedScrollMode.SELF_ONLY
                this.scrollBackwardEnums = NestedScrollMode.PARENT_FIRST
                this.scroller.scrollEdge(Edge.Top)
                await Utils.waitForScrollStop(()=>this.scroller.currentOffset().yOffset, this.str+' scrollYOffset')
                this.controller.pageUp(true)
                await Utils.waitForScrollStop(()=>this.scroller.currentOffset().yOffset, this.str+' scrollYOffset')
                await Utils.waitForScrollStop(()=>this.controller.getPageOffset().y, this.str+' webYOffset');
                this.scroller.scrollBy(0, 40)
                await Utils.waitForScrollStop(()=>this.scroller.currentOffset().yOffset, this.str+' scrollYOffset')
                this.controller.scrollBy(0, 40)
                await Utils.waitForScrollStop(()=>this.controller.getPageOffset().y, this.str+' webYOffset');
                this.selfScrollTime = 0
                this.parentScrollTime = 0
                this.userAgentPC = this.controller.getUserAgent();
                if ((this.userAgentPC).includes("PC")) {
                  await driver.swipe(X, Y - 60, X, Y + 60);
                } else {
                  await driver.swipe(X, Y - 100, X, Y + 100);
                }
                Utils.emitEvent(this.parentScrollTime < this.selfScrollTime && this.parentScrollTime > 0, 182030)
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              break;
            }

            case "testNestedScrollOptionsScrollBackward004": {
              try {
                this.scrollForwardEnums = NestedScrollMode.SELF_ONLY
                this.scrollBackwardEnums = NestedScrollMode.PARALLEL
                this.scroller.scrollEdge(Edge.Top)
                await Utils.waitForScrollStop(()=>this.scroller.currentOffset().yOffset, this.str+' scrollYOffset')
                this.controller.pageUp(true)
                await Utils.waitForScrollStop(()=>this.controller.getPageOffset().y, this.str+' webYOffset');
                await Utils.waitForScrollStop(()=>this.scroller.currentOffset().yOffset, this.str+' scrollYOffset')
                let Y = Utils.getRectVerticalCenterY(webRect)
                this.scroller.scrollEdge(Edge.Bottom)
                await Utils.waitForScrollStop(()=>this.scroller.currentOffset().yOffset, this.str+' scrollYOffset')
                this.controller.scrollTo(0, 5000)
                await Utils.waitForScrollStop(()=>this.controller.getPageOffset().y, this.str+' webYOffset');
                this.selfScrollTime = 0
                this.parentScrollTime = 0
                this.userAgentPC = this.controller.getUserAgent();
                if ((this.userAgentPC).includes("PC")) {
                  await driver.swipe(X, Y - 60, X, Y + 60);
                } else {
                  await driver.swipe(X, Y - 100, X, Y + 100);
                }
                Utils.emitEvent(this.parentScrollTime > 0 && this.selfScrollTime > 0, 182040)
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              break;
            }

            case "testNestedScrollOptionsScrollBackward005": {
              try {
                this.scrollForwardEnums = NestedScrollMode.SELF_FIRST
                this.scrollBackwardEnums = NestedScrollMode.SELF_ONLY
                this.scroller.scrollEdge(Edge.Bottom)
                await Utils.waitForScrollStop(()=>this.scroller.currentOffset().yOffset, this.str+' scrollYOffset')
                this.controller.scrollBy(0, 40)
                await Utils.waitForScrollStop(()=>this.controller.getPageOffset().y, this.str+' webYOffset');
                await Utils.waitForScrollStop(()=>this.scroller.currentOffset().yOffset, this.str+' scrollYOffset')
                this.selfScrollTime = 0
                this.parentScrollTime = 0
                this.userAgentPC = this.controller.getUserAgent();
                if ((this.userAgentPC).includes("PC")) {
                  await driver.swipe(X, Y - 60, X, Y + 60);
                } else {
                  await driver.swipe(X, Y - 100, X, Y + 100);
                }
                Utils.emitEvent(this.parentScrollTime == 0 && this.selfScrollTime != 0, 182050)
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              break;
            }

            case "testNestedScrollOptionsScrollBackward006": {
              try {
                this.scrollForwardEnums = NestedScrollMode.SELF_FIRST
                this.scrollBackwardEnums = NestedScrollMode.SELF_FIRST
                this.scroller.scrollEdge(Edge.Top)
                await Utils.waitForScrollStop(()=>this.scroller.currentOffset().yOffset, this.str+' scrollYOffset')
                this.controller.pageUp(true)
                await Utils.waitForScrollStop(()=>this.controller.getPageOffset().y, this.str+' webYOffset');
                await Utils.waitForScrollStop(()=>this.scroller.currentOffset().yOffset, this.str+' scrollYOffset')
                this.scroller.scrollBy(0, 40)
                await Utils.waitForScrollStop(()=>this.scroller.currentOffset().yOffset, this.str+' scrollYOffset')
                this.controller.scrollBy(0, 40)
                await Utils.waitForScrollStop(()=>this.controller.getPageOffset().y, this.str+' webYOffset');
                await Utils.waitForScrollStop(()=>this.scroller.currentOffset().yOffset, this.str+' scrollYOffset')
                this.selfScrollTime = 0
                this.parentScrollTime = 0
                this.userAgentPC = this.controller.getUserAgent();
                if ((this.userAgentPC).includes("PC")) {
                  await driver.swipe(X, Y - 60, X, Y + 60);
                } else {
                  await driver.swipe(X, Y - 100, X, Y + 100);
                }
                Utils.emitEvent(this.parentScrollTime > this.selfScrollTime && this.selfScrollTime > 0, 182060)
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              break;
            }

            case "testNestedScrollOptionsScrollBackward007": {
              try {
                this.scrollForwardEnums = NestedScrollMode.SELF_FIRST
                this.scrollBackwardEnums = NestedScrollMode.PARENT_FIRST
                this.scroller.scrollEdge(Edge.Top)
                await Utils.waitForScrollStop(()=>this.scroller.currentOffset().yOffset, this.str+' scrollYOffset')
                this.controller.pageUp(true)
                await Utils.waitForScrollStop(()=>this.controller.getPageOffset().y, this.str+' webYOffset');
                await Utils.waitForScrollStop(()=>this.scroller.currentOffset().yOffset, this.str+' scrollYOffset')
                this.scroller.scrollBy(0, 40)
                await Utils.waitForScrollStop(()=>this.scroller.currentOffset().yOffset, this.str+' scrollYOffset')
                this.controller.scrollBy(0, 40)
                await Utils.waitForScrollStop(()=>this.controller.getPageOffset().y, this.str+' webYOffset');
                await Utils.waitForScrollStop(()=>this.scroller.currentOffset().yOffset, this.str+' scrollYOffset')
                this.selfScrollTime = 0
                this.parentScrollTime = 0
                this.userAgentPC = this.controller.getUserAgent();
                if ((this.userAgentPC).includes("PC")) {
                  await driver.swipe(X, Y - 60, X, Y + 60);
                } else {
                  await driver.swipe(X, Y - 100, X, Y + 100);
                }
                Utils.emitEvent(this.parentScrollTime < this.selfScrollTime && this.parentScrollTime > 0, 182070)
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              break;
            }

            case "testNestedScrollOptionsScrollBackward008": {
              try {
                this.scrollForwardEnums = NestedScrollMode.PARENT_FIRST
                this.scrollBackwardEnums = NestedScrollMode.PARALLEL
                this.scroller.scrollEdge(Edge.Top)
                await Utils.waitForScrollStop(()=>this.scroller.currentOffset().yOffset, this.str+' scrollYOffset')
                this.controller.pageUp(true)
                await Utils.waitForScrollStop(()=>this.controller.getPageOffset().y, this.str+' webYOffset');
                await Utils.waitForScrollStop(()=>this.scroller.currentOffset().yOffset, this.str+' scrollYOffset')
                this.scroller.scrollEdge(Edge.Bottom)
                await Utils.waitForScrollStop(()=>this.scroller.currentOffset().yOffset, this.str+' scrollYOffset')
                this.controller.scrollTo(0, 5000)
                await Utils.waitForScrollStop(()=>this.scroller.currentOffset().yOffset, this.str+' scrollYOffset')
                await Utils.waitForScrollStop(()=>this.controller.getPageOffset().y, this.str+' webYOffset');
                this.selfScrollTime = 0
                this.parentScrollTime = 0
                this.userAgentPC = this.controller.getUserAgent();
                if ((this.userAgentPC).includes("PC")) {
                  await driver.swipe(X, Y - 60, X, Y + 60);
                } else {
                  await driver.swipe(X, Y - 100, X, Y + 100);
                }
                Utils.emitEvent(this.parentScrollTime > 0 && this.selfScrollTime > 0, 182080)
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              break;
            }

            case "testNestedScrollOptionsScrollBackward009": {
              try {
                this.scrollForwardEnums = NestedScrollMode.PARENT_FIRST
                this.scrollBackwardEnums = NestedScrollMode.SELF_ONLY
                this.scroller.scrollEdge(Edge.Bottom)
                await Utils.waitForScrollStop(()=>this.scroller.currentOffset().yOffset, this.str+' scrollYOffset')
                this.controller.scrollBy(0, 40)
                await Utils.waitForScrollStop(()=>this.scroller.currentOffset().yOffset, this.str+' scrollYOffset')
                await Utils.waitForScrollStop(()=>this.controller.getPageOffset().y, this.str+' webYOffset');
                this.selfScrollTime = 0
                this.parentScrollTime = 0
                this.userAgentPC = this.controller.getUserAgent();
                if ((this.userAgentPC).includes("PC")) {
                  await driver.swipe(X, Y - 60, X, Y + 60);
                } else {
                  await driver.swipe(X, Y - 100, X, Y + 100);
                }
                Utils.emitEvent(this.parentScrollTime == 0 && this.selfScrollTime != 0, 182090)
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              break;
            }

            case "testNestedScrollOptionsScrollBackward010": {
              try {
                this.scrollForwardEnums = NestedScrollMode.PARENT_FIRST
                this.scrollBackwardEnums = NestedScrollMode.SELF_FIRST
                this.scroller.scrollEdge(Edge.Top)
                await Utils.waitForScrollStop(()=>this.scroller.currentOffset().yOffset, this.str+' scrollYOffset')
                this.controller.pageUp(true)
                await Utils.waitForScrollStop(()=>this.controller.getPageOffset().y, this.str+' webYOffset');
                await Utils.waitForScrollStop(()=>this.scroller.currentOffset().yOffset, this.str+' scrollYOffset')
                this.scroller.scrollBy(0, 40)
                await Utils.waitForScrollStop(()=>this.scroller.currentOffset().yOffset, this.str+' scrollYOffset')
                this.controller.scrollBy(0, 40)
                await Utils.waitForScrollStop(()=>this.scroller.currentOffset().yOffset, this.str+' scrollYOffset')
                await Utils.waitForScrollStop(()=>this.controller.getPageOffset().y, this.str+' webYOffset');
                this.selfScrollTime = 0
                this.parentScrollTime = 0
                this.userAgentPC = this.controller.getUserAgent();
                if ((this.userAgentPC).includes("PC")) {
                  await driver.swipe(X, Y - 60, X, Y + 60);
                } else {
                  await driver.swipe(X, Y - 100, X, Y + 100);
                }
                Utils.emitEvent(this.parentScrollTime > this.selfScrollTime && this.selfScrollTime > 0, 182100)
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              break;
            }

            case "testNestedScrollOptionsScrollBackward011": {
              try {
                this.scrollForwardEnums = NestedScrollMode.PARENT_FIRST
                this.scrollBackwardEnums = NestedScrollMode.PARENT_FIRST
                this.scroller.scrollEdge(Edge.Top)
                await Utils.waitForScrollStop(()=>this.scroller.currentOffset().yOffset, this.str+' scrollYOffset')
                this.controller.pageUp(true)
                await Utils.waitForScrollStop(()=>this.scroller.currentOffset().yOffset, this.str+' scrollYOffset')
                await Utils.waitForScrollStop(()=>this.controller.getPageOffset().y, this.str+' webYOffset');
                this.scroller.scrollBy(0, 40)
                await Utils.waitForScrollStop(()=>this.scroller.currentOffset().yOffset, this.str+' scrollYOffset')
                this.controller.scrollBy(0, 40)
                await Utils.waitForScrollStop(()=>this.scroller.currentOffset().yOffset, this.str+' scrollYOffset')
                await Utils.waitForScrollStop(()=>this.controller.getPageOffset().y, this.str+' webYOffset');
                this.selfScrollTime = 0
                this.parentScrollTime = 0
                this.userAgentPC = this.controller.getUserAgent();
                if ((this.userAgentPC).includes("PC")) {
                  await driver.swipe(X, Y - 60, X, Y + 60);
                } else {
                  await driver.swipe(X, Y - 100, X, Y + 100);
                }
                Utils.emitEvent(this.parentScrollTime < this.selfScrollTime && this.parentScrollTime > 0, 182110)
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              break;
            }

            case "testNestedScrollOptionsScrollBackward012": {
              try {
                this.scrollForwardEnums = NestedScrollMode.PARENT_FIRST
                this.scrollBackwardEnums = NestedScrollMode.PARALLEL
                this.scroller.scrollEdge(Edge.Top)
                await Utils.waitForScrollStop(()=>this.scroller.currentOffset().yOffset, this.str+' scrollYOffset')
                this.controller.pageUp(true)
                await Utils.waitForScrollStop(()=>this.scroller.currentOffset().yOffset, this.str+' scrollYOffset')
                await Utils.waitForScrollStop(()=>this.controller.getPageOffset().y, this.str+' webYOffset');
                this.scroller.scrollEdge(Edge.Bottom)
                await Utils.waitForScrollStop(()=>this.scroller.currentOffset().yOffset, this.str+' scrollYOffset')
                this.controller.scrollTo(0, 5000)
                await Utils.waitForScrollStop(()=>this.controller.getPageOffset().y, this.str+' webYOffset');
                await Utils.waitForScrollStop(()=>this.scroller.currentOffset().yOffset, this.str+' scrollYOffset')
                this.selfScrollTime = 0
                this.parentScrollTime = 0
                this.userAgentPC = this.controller.getUserAgent();
                if ((this.userAgentPC).includes("PC")) {
                  await driver.swipe(X, Y - 60, X, Y + 60);
                } else {
                  await driver.swipe(X, Y - 100, X, Y + 100);
                }
                Utils.emitEvent(this.parentScrollTime > 0 && this.selfScrollTime > 0, 182120)
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              break;
            }

            case "testNestedScrollOptionsScrollBackward013": {
              try {
                this.scrollForwardEnums = NestedScrollMode.PARALLEL
                this.scrollBackwardEnums = NestedScrollMode.SELF_ONLY
                this.scroller.scrollEdge(Edge.Bottom)
                await Utils.waitForScrollStop(()=>this.scroller.currentOffset().yOffset, this.str+' scrollYOffset')
                this.controller.scrollBy(0, 40)
                await Utils.waitForScrollStop(()=>this.controller.getPageOffset().y, this.str+' webYOffset');
                await Utils.waitForScrollStop(()=>this.scroller.currentOffset().yOffset, this.str+' scrollYOffset')
                this.selfScrollTime = 0
                this.parentScrollTime = 0
                this.userAgentPC = this.controller.getUserAgent();
                if ((this.userAgentPC).includes("PC")) {
                  await driver.swipe(X, Y - 60, X, Y + 60);
                } else {
                  await driver.swipe(X, Y - 100, X, Y + 100);
                }
                Utils.emitEvent(this.parentScrollTime == 0 && this.selfScrollTime != 0, 182130)
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              break;
            }

            case "testNestedScrollOptionsScrollBackward014": {
              try {
                this.scrollForwardEnums = NestedScrollMode.PARALLEL
                this.scrollBackwardEnums = NestedScrollMode.SELF_FIRST
                this.scroller.scrollEdge(Edge.Top)
                await Utils.waitForScrollStop(()=>this.scroller.currentOffset().yOffset, this.str+' scrollYOffset')
                this.controller.pageUp(true)
                await Utils.waitForScrollStop(()=>this.controller.getPageOffset().y, this.str+' webYOffset');
                await Utils.waitForScrollStop(()=>this.scroller.currentOffset().yOffset, this.str+' scrollYOffset')
                this.scroller.scrollBy(0, 40)
                await Utils.waitForScrollStop(()=>this.scroller.currentOffset().yOffset, this.str+' scrollYOffset')
                this.controller.scrollBy(0, 40)
                await Utils.waitForScrollStop(()=>this.controller.getPageOffset().y, this.str+' webYOffset');
                await Utils.waitForScrollStop(()=>this.scroller.currentOffset().yOffset, this.str+' scrollYOffset')
                this.selfScrollTime = 0
                this.parentScrollTime = 0
                this.userAgentPC = this.controller.getUserAgent();
                if ((this.userAgentPC).includes("PC")) {
                  await driver.swipe(X, Y - 60, X, Y + 60);
                } else {
                  await driver.swipe(X, Y - 100, X, Y + 100);
                }
                Utils.emitEvent(this.parentScrollTime > this.selfScrollTime && this.selfScrollTime > 0, 182140)
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              break;
            }

            case "testNestedScrollOptionsScrollBackward015": {
              try {
                this.scrollForwardEnums = NestedScrollMode.PARALLEL
                this.scrollBackwardEnums = NestedScrollMode.PARENT_FIRST
                this.scroller.scrollEdge(Edge.Top)
                await Utils.waitForScrollStop(()=>this.scroller.currentOffset().yOffset, this.str+' scrollYOffset')
                this.controller.pageUp(true)
                await Utils.waitForScrollStop(()=>this.scroller.currentOffset().yOffset, this.str+' scrollYOffset')
                await Utils.waitForScrollStop(()=>this.controller.getPageOffset().y, this.str+' webYOffset');
                this.scroller.scrollBy(0, 40)
                await Utils.waitForScrollStop(()=>this.scroller.currentOffset().yOffset, this.str+' scrollYOffset')
                this.controller.scrollBy(0, 40)
                await Utils.waitForScrollStop(()=>this.controller.getPageOffset().y, this.str+' webYOffset');
                await Utils.waitForScrollStop(()=>this.scroller.currentOffset().yOffset, this.str+' scrollYOffset')
                this.selfScrollTime = 0
                this.parentScrollTime = 0
                this.userAgentPC = this.controller.getUserAgent();
                if ((this.userAgentPC).includes("PC")) {
                  await driver.swipe(X, Y - 60, X, Y + 60);
                } else {
                  await driver.swipe(X, Y - 100, X, Y + 100);
                }
                Utils.emitEvent(this.parentScrollTime < this.selfScrollTime && this.parentScrollTime > 0, 182150)
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              break;
            }

            case "testNestedScrollOptionsScrollBackward016": {
              try {
                this.scrollForwardEnums = NestedScrollMode.PARALLEL
                this.scrollBackwardEnums = NestedScrollMode.PARALLEL
                this.scroller.scrollEdge(Edge.Top)
                await Utils.waitForScrollStop(()=>this.scroller.currentOffset().yOffset, this.str+' scrollYOffset')
                this.controller.pageUp(true)
                await Utils.waitForScrollStop(()=>this.controller.getPageOffset().y, this.str+' webYOffset');
                await Utils.waitForScrollStop(()=>this.scroller.currentOffset().yOffset, this.str+' scrollYOffset')
                this.scroller.scrollEdge(Edge.Bottom)
                await Utils.waitForScrollStop(()=>this.scroller.currentOffset().yOffset, this.str+' scrollYOffset')
                this.controller.scrollTo(0, 5000)
                await Utils.waitForScrollStop(()=>this.controller.getPageOffset().y, this.str+' webYOffset');
                await Utils.waitForScrollStop(()=>this.scroller.currentOffset().yOffset, this.str+' scrollYOffset')
                this.selfScrollTime = 0
                this.parentScrollTime = 0
                this.userAgentPC = this.controller.getUserAgent();
                if ((this.userAgentPC).includes("PC")) {
                  await driver.swipe(X, Y - 60, X, Y + 60);
                } else {
                  await driver.swipe(X, Y - 100, X, Y + 100);
                }
                Utils.emitEvent(this.parentScrollTime > 0 && this.selfScrollTime > 0, 182160)
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              break;
            }
          }
        })
      Scroll(this.scroller) {
        Column() {
          Column().width('100%').height('20%').backgroundColor(Color.Green)
          Web({ src: $rawfile('second.html'), controller: this.controller })
            .nestedScroll({
              scrollForward: this.scrollForwardEnums,
              scrollBackward: this.scrollBackwardEnums,
            })
            .height('90%')
            .onScroll((event) => {
              console.info("WebView onScroll x = " + event.xOffset)
              console.info("WebView onScroll y = " + event.yOffset)
              if ((event.xOffset != 0 || event.yOffset != 0) && this.selfScrollTime == 0) {
                this.selfScrollTime = Utils.getSystemTime()
              }
            })
            .onPageEnd((event) => {
              console.log('onPageEnd url:' + event.url);
              this.isPageEnd = 1;
            })
          Column().width('100%').height('20%').backgroundColor(Color.Red)
        }.width('100%')
      }.onScroll((xOffset: number, yOffset: number) => {
        console.info('ParentScroll:' + xOffset + ' ' + yOffset)
        if ((xOffset != 0 || yOffset != 0) && this.parentScrollTime == 0) {
          this.parentScrollTime = Utils.getSystemTime()
        }
      })
      .height('100%')
    }.width('100%')
    .key('ColumnSize')
  }
}