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
import { Driver, UiWindow } from '@ohos.UiTest';
import Utils from '../../test/Utils';
import AbilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import { Hypium } from '@ohos/hypium';
import testsuite from '../../test/List.test';

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
          let webRect = Utils.getComponentRect('ColumnSize');
          let X = Utils.getRectHorizontalCenterX(webRect)
          let Y = Utils.getRectVerticalCenterY(webRect)
          switch (this.str) {

            case "testNestedScrollOptionsScrollBackward001": {
              try {
                let driver: Driver = Driver.create();
                this.userAgentPC = this.controller.getUserAgent();
                if ((this.userAgentPC).includes("PC")) {
                  let window: UiWindow = await driver.findWindow({actived: true});
                  await window.maximize()
                  await Utils.sleep(2000)
                } 
                this.scrollForwardEnums = NestedScrollMode.SELF_ONLY
                this.scrollBackwardEnums = NestedScrollMode.SELF_ONLY
                this.scroller.scrollEdge(Edge.Bottom)
                await Utils.sleep(2000)
                this.controller.scrollBy(0, 40)
                await Utils.sleep(2000)
                this.selfScrollTime = 0
                this.parentScrollTime = 0
                if ((this.userAgentPC).includes("PC")) {
                  await driver.swipe(X, Y - 60, X, Y + 60);
                } else {
                  await driver.swipe(X, Y - 100, X, Y + 100);
                }
                await Utils.sleep(3000)
                Utils.emitEvent(this.parentScrollTime == 0 && this.selfScrollTime != 0, 7001)
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
                this.controller.pageUp(true)
                await Utils.sleep(2000)
                this.scroller.scrollBy(0, 40)
                this.controller.scrollBy(0, 40)
                await Utils.sleep(2000)
                this.selfScrollTime = 0
                this.parentScrollTime = 0
                let driver = Driver.create();
                this.userAgentPC = this.controller.getUserAgent();
                if ((this.userAgentPC).includes("PC")) {
                  await driver.swipe(X, Y - 60, X, Y + 60);
                } else {
                  await driver.swipe(X, Y - 100, X, Y + 100);
                }
                await Utils.sleep(3000)
                Utils.emitEvent(this.parentScrollTime > this.selfScrollTime && this.selfScrollTime > 0, 7002)
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
                this.controller.pageUp(true)
                await Utils.sleep(2000)
                this.scroller.scrollBy(0, 40)
                this.controller.scrollBy(0, 40)
                await Utils.sleep(2000)
                this.selfScrollTime = 0
                this.parentScrollTime = 0
                let driver = Driver.create();
                this.userAgentPC = this.controller.getUserAgent();
                if ((this.userAgentPC).includes("PC")) {
                  await driver.swipe(X, Y - 60, X, Y + 60);
                } else {
                  await driver.swipe(X, Y - 100, X, Y + 100);
                }
                await Utils.sleep(2000)
                Utils.emitEvent(this.parentScrollTime < this.selfScrollTime && this.parentScrollTime > 0, 7003)
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
                this.controller.pageUp(true)
                await Utils.sleep(2000)
                let Y = Utils.getRectVerticalCenterY(webRect)
                this.scroller.scrollEdge(Edge.Bottom)
                this.controller.scrollTo(0, 5000)
                await Utils.sleep(2000)
                this.selfScrollTime = 0
                this.parentScrollTime = 0
                let driver = Driver.create();
                this.userAgentPC = this.controller.getUserAgent();
                if ((this.userAgentPC).includes("PC")) {
                  await driver.swipe(X, Y - 60, X, Y + 60);
                } else {
                  await driver.swipe(X, Y - 100, X, Y + 100);
                }
                await Utils.sleep(3000)
                Utils.emitEvent(this.parentScrollTime > 0 && this.selfScrollTime > 0, 7004)
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
                await Utils.sleep(2000)
                this.controller.scrollBy(0, 40)
                await Utils.sleep(2000)
                this.selfScrollTime = 0
                this.parentScrollTime = 0
                let driver = Driver.create();
                this.userAgentPC = this.controller.getUserAgent();
                if ((this.userAgentPC).includes("PC")) {
                  await driver.swipe(X, Y - 60, X, Y + 60);
                } else {
                  await driver.swipe(X, Y - 100, X, Y + 100);
                }
                await Utils.sleep(3000)
                Utils.emitEvent(this.parentScrollTime == 0 && this.selfScrollTime != 0, 7005)
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
                this.controller.pageUp(true)
                await Utils.sleep(2000)
                this.scroller.scrollBy(0, 40)
                this.controller.scrollBy(0, 40)
                await Utils.sleep(2000)
                this.selfScrollTime = 0
                this.parentScrollTime = 0
                let driver = Driver.create();
                this.userAgentPC = this.controller.getUserAgent();
                if ((this.userAgentPC).includes("PC")) {
                  await driver.swipe(X, Y - 60, X, Y + 60);
                } else {
                  await driver.swipe(X, Y - 100, X, Y + 100);
                }
                await Utils.sleep(3000)
                Utils.emitEvent(this.parentScrollTime > this.selfScrollTime && this.selfScrollTime > 0, 7006)
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
                this.controller.pageUp(true)
                await Utils.sleep(2000)
                this.scroller.scrollBy(0, 40)
                this.controller.scrollBy(0, 40)
                await Utils.sleep(2000)
                this.selfScrollTime = 0
                this.parentScrollTime = 0
                let driver = Driver.create();
                this.userAgentPC = this.controller.getUserAgent();
                if ((this.userAgentPC).includes("PC")) {
                  await driver.swipe(X, Y - 60, X, Y + 60);
                } else {
                  await driver.swipe(X, Y - 100, X, Y + 100);
                }
                await Utils.sleep(2000)
                Utils.emitEvent(this.parentScrollTime < this.selfScrollTime && this.parentScrollTime > 0, 7007)
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
                this.controller.pageUp(true)
                await Utils.sleep(2000)
                this.scroller.scrollEdge(Edge.Bottom)
                this.controller.scrollTo(0, 5000)
                await Utils.sleep(2000)
                this.selfScrollTime = 0
                this.parentScrollTime = 0
                let driver = Driver.create();
                this.userAgentPC = this.controller.getUserAgent();
                if ((this.userAgentPC).includes("PC")) {
                  await driver.swipe(X, Y - 60, X, Y + 60);
                } else {
                  await driver.swipe(X, Y - 100, X, Y + 100);
                }
                await Utils.sleep(3000)
                Utils.emitEvent(this.parentScrollTime > 0 && this.selfScrollTime > 0, 7008)
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
                await Utils.sleep(2000)
                this.controller.scrollBy(0, 40)
                await Utils.sleep(2000)
                this.selfScrollTime = 0
                this.parentScrollTime = 0
                let driver = Driver.create();
                this.userAgentPC = this.controller.getUserAgent();
                if ((this.userAgentPC).includes("PC")) {
                  await driver.swipe(X, Y - 60, X, Y + 60);
                } else {
                  await driver.swipe(X, Y - 100, X, Y + 100);
                }
                await Utils.sleep(3000)
                Utils.emitEvent(this.parentScrollTime == 0 && this.selfScrollTime != 0, 7009)
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
                this.controller.pageUp(true)
                await Utils.sleep(3000)
                this.scroller.scrollBy(0, 40)
                this.controller.scrollBy(0, 40)
                await Utils.sleep(3000)
                this.selfScrollTime = 0
                this.parentScrollTime = 0
                let driver = Driver.create();
                this.userAgentPC = this.controller.getUserAgent();
                if ((this.userAgentPC).includes("PC")) {
                  await driver.swipe(X, Y - 60, X, Y + 60);
                } else {
                  await driver.swipe(X, Y - 100, X, Y + 100);
                }
                await Utils.sleep(3000)
                Utils.emitEvent(this.parentScrollTime > this.selfScrollTime && this.selfScrollTime > 0, 7010)
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
                this.controller.pageUp(true)
                await Utils.sleep(2000)
                this.scroller.scrollBy(0, 40)
                this.controller.scrollBy(0, 40)
                await Utils.sleep(2000)
                this.selfScrollTime = 0
                this.parentScrollTime = 0
                let driver = Driver.create();
                this.userAgentPC = this.controller.getUserAgent();
                if ((this.userAgentPC).includes("PC")) {
                  await driver.swipe(X, Y - 60, X, Y + 60);
                } else {
                  await driver.swipe(X, Y - 100, X, Y + 100);
                }
                await Utils.sleep(2000)
                Utils.emitEvent(this.parentScrollTime < this.selfScrollTime && this.parentScrollTime > 0, 7011)
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
                this.controller.pageUp(true)
                await Utils.sleep(2000)
                this.scroller.scrollEdge(Edge.Bottom)
                this.controller.scrollTo(0, 5000)
                await Utils.sleep(2000)
                this.selfScrollTime = 0
                this.parentScrollTime = 0
                let driver = Driver.create();
                this.userAgentPC = this.controller.getUserAgent();
                if ((this.userAgentPC).includes("PC")) {
                  await driver.swipe(X, Y - 60, X, Y + 60);
                } else {
                  await driver.swipe(X, Y - 100, X, Y + 100);
                }
                await Utils.sleep(3000)
                Utils.emitEvent(this.parentScrollTime > 0 && this.selfScrollTime > 0, 7012)
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
                await Utils.sleep(2000)
                this.controller.scrollBy(0, 40)
                await Utils.sleep(2000)
                this.selfScrollTime = 0
                this.parentScrollTime = 0
                let driver = Driver.create();
                this.userAgentPC = this.controller.getUserAgent();
                if ((this.userAgentPC).includes("PC")) {
                  await driver.swipe(X, Y - 60, X, Y + 60);
                } else {
                  await driver.swipe(X, Y - 100, X, Y + 100);
                }
                await Utils.sleep(3000)
                Utils.emitEvent(this.parentScrollTime == 0 && this.selfScrollTime != 0, 7013)
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
                this.controller.pageUp(true)
                await Utils.sleep(2000)
                this.scroller.scrollBy(0, 40)
                this.controller.scrollBy(0, 40)
                await Utils.sleep(2000)
                this.selfScrollTime = 0
                this.parentScrollTime = 0
                let driver = Driver.create();
                this.userAgentPC = this.controller.getUserAgent();
                if ((this.userAgentPC).includes("PC")) {
                  await driver.swipe(X, Y - 60, X, Y + 60);
                } else {
                  await driver.swipe(X, Y - 100, X, Y + 100);
                }
                await Utils.sleep(3000)
                Utils.emitEvent(this.parentScrollTime > this.selfScrollTime && this.selfScrollTime > 0, 7014)
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
                this.controller.pageUp(true)
                await Utils.sleep(2000)
                this.scroller.scrollBy(0, 40)
                this.controller.scrollBy(0, 40)
                await Utils.sleep(2000)
                this.selfScrollTime = 0
                this.parentScrollTime = 0
                let driver = Driver.create();
                this.userAgentPC = this.controller.getUserAgent();
                if ((this.userAgentPC).includes("PC")) {
                  await driver.swipe(X, Y - 60, X, Y + 60);
                } else {
                  await driver.swipe(X, Y - 100, X, Y + 100);
                }
                await Utils.sleep(2000)
                Utils.emitEvent(this.parentScrollTime < this.selfScrollTime && this.parentScrollTime > 0, 7015)
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
                this.controller.pageUp(true)
                await Utils.sleep(2000)
                this.scroller.scrollEdge(Edge.Bottom)
                this.controller.scrollTo(0, 5000)
                await Utils.sleep(2000)
                this.selfScrollTime = 0
                this.parentScrollTime = 0
                let driver = Driver.create();
                this.userAgentPC = this.controller.getUserAgent();
                if ((this.userAgentPC).includes("PC")) {
                  await driver.swipe(X, Y - 60, X, Y + 60);
                } else {
                  await driver.swipe(X, Y - 100, X, Y + 100);
                }
                await Utils.sleep(3000)
                Utils.emitEvent(this.parentScrollTime > 0 && this.selfScrollTime > 0, 7016)
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