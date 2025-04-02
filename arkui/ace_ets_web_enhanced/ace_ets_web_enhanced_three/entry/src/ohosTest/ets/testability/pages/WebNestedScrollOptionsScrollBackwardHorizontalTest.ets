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
import { Driver } from '@ohos.UiTest';
import Utils from '../../test/Utils';

@Entry
@Component
struct WebNestedScrollOptionsScrollBackwardHorizontalTest {
  controller: webView.WebviewController = new webView.WebviewController();
  scroller: Scroller = new Scroller()
  @State str: string = '';
  @State selfScrollTime: number = 0
  @State parentScrollTime: number = 0
  @State scrollForwardEnums: number = NestedScrollMode.SELF_FIRST
  @State scrollBackwardEnums: number = NestedScrollMode.SELF_FIRST
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

  build() {
    Column() {
      Button("NestedScrollOptionsScrollBackwardHorizontal click")
        .key('NestedScrollOptionsScrollBackwardHorizontalTestButton')
        .onClick(async () => {
          console.info("key==>" + this.str)
          let webRect = Utils.getComponentRect('RowSize');
          let X = Utils.getRectHorizontalCenterX(webRect)
          let Y = Utils.getRectVerticalCenterY(webRect)
          switch (this.str) {

            case "testNestedScrollOptionsScrollBackwardHorizontal001": {
              try {
                this.scrollForwardEnums = NestedScrollMode.SELF_ONLY
                this.scrollBackwardEnums = NestedScrollMode.SELF_ONLY
                this.controller.scrollTo(5000, 0)
                await Utils.sleep(2000)
                this.selfScrollTime = 0
                this.parentScrollTime = 0
                let driver = Driver.create();
                this.userAgentPC = this.controller.getUserAgent();
                if ((this.userAgentPC).includes("PC")) {
                  await driver.swipe(X - 60, Y, X + 60, Y);
                } else {
                  await driver.swipe(X - 100, Y, X + 100, Y);
                }
                await Utils.sleep(3000)
                Utils.emitEvent(this.parentScrollTime == 0 && this.selfScrollTime != 0, 9001)
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              break;
            }

            case "testNestedScrollOptionsScrollBackwardHorizontal002": {
              try {
                this.scrollForwardEnums = NestedScrollMode.SELF_ONLY
                this.scrollBackwardEnums = NestedScrollMode.SELF_FIRST
                this.controller.scrollTo(0, 0)
                this.scroller.scrollEdge(Edge.End)
                await Utils.sleep(1000)
                this.controller.scrollBy(40, 0)
                await Utils.sleep(1000)
                this.selfScrollTime = 0
                this.parentScrollTime = 0
                let driver = Driver.create();
                this.userAgentPC = this.controller.getUserAgent();
                if ((this.userAgentPC).includes("PC")) {
                  await driver.swipe(X - 60, Y, X + 60, Y);
                } else {
                  await driver.swipe(X - 100, Y, X + 100, Y);
                }
                await Utils.sleep(3000)
                Utils.emitEvent(this.parentScrollTime > this.selfScrollTime && this.selfScrollTime > 0, 9002)
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              break;
            }

            case "testNestedScrollOptionsScrollBackwardHorizontal003": {
              try {
                this.scrollForwardEnums = NestedScrollMode.SELF_ONLY
                this.scrollBackwardEnums = NestedScrollMode.PARENT_FIRST
                this.scroller.scrollEdge(Edge.Start)
                this.controller.scrollTo(5000, 0)
                await Utils.sleep(1000)
                this.selfScrollTime = 0
                this.parentScrollTime = 0
                this.scroller.scrollBy(40, 0)
                await Utils.sleep(3000)
                let driver = Driver.create();
                this.userAgentPC = this.controller.getUserAgent();
                if ((this.userAgentPC).includes("PC")) {
                  await driver.swipe(X - 60, Y, X + 60, Y);
                } else {
                  await driver.swipe(X - 100, Y, X + 100, Y);
                }
                await Utils.sleep(3000)
                Utils.emitEvent(this.parentScrollTime < this.selfScrollTime && this.parentScrollTime > 0, 9003)
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              break;
            }

            case "testNestedScrollOptionsScrollBackwardHorizontal004": {
              try {
                this.scrollForwardEnums = NestedScrollMode.SELF_ONLY
                this.scrollBackwardEnums = NestedScrollMode.PARALLEL
                this.controller.scrollTo(5000, 0)
                this.scroller.scrollEdge(Edge.End)
                await Utils.sleep(1000)
                this.selfScrollTime = 0
                this.parentScrollTime = 0
                let driver = Driver.create();
                this.userAgentPC = this.controller.getUserAgent();
                if ((this.userAgentPC).includes("PC")) {
                  await driver.swipe(X - 60, Y, X + 60, Y);
                } else {
                  await driver.swipe(X - 100, Y, X + 100, Y);
                }
                await Utils.sleep(3000)
                Utils.emitEvent(this.parentScrollTime > 0 && this.selfScrollTime > 0, 9004)
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              break;
            }

            case "testNestedScrollOptionsScrollBackwardHorizontal005": {
              try {
                this.scrollForwardEnums = NestedScrollMode.SELF_FIRST
                this.scrollBackwardEnums = NestedScrollMode.SELF_ONLY
                this.controller.scrollTo(5000, 0)
                await Utils.sleep(1000)
                await Utils.sleep(1000)
                this.selfScrollTime = 0
                this.parentScrollTime = 0
                let driver = Driver.create();
                this.userAgentPC = this.controller.getUserAgent();
                if ((this.userAgentPC).includes("PC")) {
                  await driver.swipe(X - 60, Y, X + 60, Y);
                } else {
                  await driver.swipe(X - 100, Y, X + 100, Y);
                }
                await Utils.sleep(3000)
                Utils.emitEvent(this.parentScrollTime == 0 && this.selfScrollTime != 0, 9005)
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              break;
            }

            case "testNestedScrollOptionsScrollBackwardHorizontal006": {
              try {
                this.scrollForwardEnums = NestedScrollMode.SELF_FIRST
                this.scrollBackwardEnums = NestedScrollMode.SELF_FIRST
                this.controller.scrollTo(0, 0)
                this.scroller.scrollEdge(Edge.End)
                await Utils.sleep(1000)
                this.controller.scrollBy(40, 0)
                await Utils.sleep(1000)
                this.selfScrollTime = 0
                this.parentScrollTime = 0
                let driver = Driver.create();
                this.userAgentPC = this.controller.getUserAgent();
                if ((this.userAgentPC).includes("PC")) {
                  await driver.swipe(X - 60, Y, X + 60, Y);
                } else {
                  await driver.swipe(X - 100, Y, X + 100, Y);
                }
                await Utils.sleep(3000)
                Utils.emitEvent(this.parentScrollTime > this.selfScrollTime && this.selfScrollTime > 0, 9006)
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              break;
            }

            case "testNestedScrollOptionsScrollBackwardHorizontal007": {
              try {
                this.scrollForwardEnums = NestedScrollMode.SELF_FIRST
                this.scrollBackwardEnums = NestedScrollMode.PARENT_FIRST
                this.scroller.scrollEdge(Edge.Start)
                this.controller.scrollTo(5000, 0)
                await Utils.sleep(1000)
                this.selfScrollTime = 0
                this.parentScrollTime = 0
                this.scroller.scrollBy(40, 0)
                await Utils.sleep(3000)
                let driver = Driver.create();
                this.userAgentPC = this.controller.getUserAgent();
                if ((this.userAgentPC).includes("PC")) {
                  await driver.swipe(X - 60, Y, X + 60, Y);
                } else {
                  await driver.swipe(X - 100, Y, X + 100, Y);
                }
                await Utils.sleep(3000)
                Utils.emitEvent(this.parentScrollTime < this.selfScrollTime && this.parentScrollTime > 0, 9007)
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              break;
            }

            case "testNestedScrollOptionsScrollBackwardHorizontal008": {
              try {
                this.scrollForwardEnums = NestedScrollMode.SELF_FIRST
                this.scrollBackwardEnums = NestedScrollMode.PARALLEL
                this.controller.scrollTo(5000, 0)
                this.scroller.scrollEdge(Edge.End)
                await Utils.sleep(1000)
                this.selfScrollTime = 0
                this.parentScrollTime = 0
                let driver = Driver.create();
                this.userAgentPC = this.controller.getUserAgent();
                if ((this.userAgentPC).includes("PC")) {
                  await driver.swipe(X - 60, Y, X + 60, Y);
                } else {
                  await driver.swipe(X - 100, Y, X + 100, Y);
                }
                await Utils.sleep(3000)
                Utils.emitEvent(this.parentScrollTime > 0 && this.selfScrollTime > 0, 9008)
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              break;
            }

            case "testNestedScrollOptionsScrollBackwardHorizontal009": {
              try {
                this.scrollForwardEnums = NestedScrollMode.PARENT_FIRST
                this.scrollBackwardEnums = NestedScrollMode.SELF_ONLY
                this.controller.scrollTo(5000, 0)
                await Utils.sleep(1000)
                await Utils.sleep(1000)
                this.selfScrollTime = 0
                this.parentScrollTime = 0
                let driver = Driver.create();
                this.userAgentPC = this.controller.getUserAgent();
                if ((this.userAgentPC).includes("PC")) {
                  await driver.swipe(X - 60, Y, X + 60, Y);
                } else {
                  await driver.swipe(X - 100, Y, X + 100, Y);
                }
                await Utils.sleep(3000)
                Utils.emitEvent(this.parentScrollTime == 0 && this.selfScrollTime != 0, 9009)
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              break;
            }

            case "testNestedScrollOptionsScrollBackwardHorizontal010": {
              try {
                this.scrollForwardEnums = NestedScrollMode.PARENT_FIRST
                this.scrollBackwardEnums = NestedScrollMode.SELF_FIRST
                this.controller.scrollTo(0, 0)
                this.scroller.scrollEdge(Edge.End)
                await Utils.sleep(1000)
                this.controller.scrollBy(40, 0)
                await Utils.sleep(1000)
                this.selfScrollTime = 0
                this.parentScrollTime = 0
                let driver = Driver.create();
                this.userAgentPC = this.controller.getUserAgent();
                if ((this.userAgentPC).includes("PC")) {
                  await driver.swipe(X - 60, Y, X + 60, Y);
                } else {
                  await driver.swipe(X - 100, Y, X + 100, Y);
                }
                await Utils.sleep(3000)
                Utils.emitEvent(this.parentScrollTime > this.selfScrollTime && this.selfScrollTime > 0, 9010)
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              break;
            }

            case "testNestedScrollOptionsScrollBackwardHorizontal011": {
              try {
                this.scrollForwardEnums = NestedScrollMode.PARENT_FIRST
                this.scrollBackwardEnums = NestedScrollMode.PARENT_FIRST
                this.scroller.scrollEdge(Edge.Start)
                this.controller.scrollTo(5000, 0)
                await Utils.sleep(1000)
                this.selfScrollTime = 0
                this.parentScrollTime = 0
                this.scroller.scrollBy(40, 0)
                await Utils.sleep(3000)
                let driver = Driver.create();
                this.userAgentPC = this.controller.getUserAgent();
                if ((this.userAgentPC).includes("PC")) {
                  await driver.swipe(X - 60, Y, X + 60, Y);
                } else {
                  await driver.swipe(X - 100, Y, X + 100, Y);
                }
                await Utils.sleep(3000)
                Utils.emitEvent(this.parentScrollTime < this.selfScrollTime && this.parentScrollTime > 0, 9011)
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              break;
            }

            case "testNestedScrollOptionsScrollBackwardHorizontal012": {
              try {
                this.scrollForwardEnums = NestedScrollMode.PARENT_FIRST
                this.scrollBackwardEnums = NestedScrollMode.PARALLEL
                this.controller.scrollTo(5000, 0)
                this.scroller.scrollEdge(Edge.End)
                await Utils.sleep(1000)
                this.selfScrollTime = 0
                this.parentScrollTime = 0
                let driver = Driver.create();
                this.userAgentPC = this.controller.getUserAgent();
                if ((this.userAgentPC).includes("PC")) {
                  await driver.swipe(X - 60, Y, X + 60, Y);
                } else {
                  await driver.swipe(X - 100, Y, X + 100, Y);
                }
                await Utils.sleep(3000)
                Utils.emitEvent(this.parentScrollTime > 0 && this.selfScrollTime > 0, 9012)
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              break;
            }

            case "testNestedScrollOptionsScrollBackwardHorizontal013": {
              try {
                this.scrollForwardEnums = NestedScrollMode.PARALLEL
                this.scrollBackwardEnums = NestedScrollMode.SELF_ONLY
                this.controller.scrollTo(5000, 0)
                await Utils.sleep(1000)
                await Utils.sleep(1000)
                this.selfScrollTime = 0
                this.parentScrollTime = 0
                let driver = Driver.create();
                this.userAgentPC = this.controller.getUserAgent();
                if ((this.userAgentPC).includes("PC")) {
                  await driver.swipe(X - 60, Y, X + 60, Y);
                } else {
                  await driver.swipe(X - 100, Y, X + 100, Y);
                }
                await Utils.sleep(3000)
                Utils.emitEvent(this.parentScrollTime == 0 && this.selfScrollTime != 0, 9013)
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              break;
            }

            case "testNestedScrollOptionsScrollBackwardHorizontal014": {
              try {
                this.scrollForwardEnums = NestedScrollMode.PARALLEL
                this.scrollBackwardEnums = NestedScrollMode.SELF_FIRST
                this.controller.scrollTo(0, 0)
                this.scroller.scrollEdge(Edge.End)
                await Utils.sleep(1000)
                this.controller.scrollBy(40, 0)
                await Utils.sleep(1000)
                this.selfScrollTime = 0
                this.parentScrollTime = 0
                let driver = Driver.create();
                this.userAgentPC = this.controller.getUserAgent();
                if ((this.userAgentPC).includes("PC")) {
                  await driver.swipe(X - 60, Y, X + 60, Y);
                } else {
                  await driver.swipe(X - 100, Y, X + 100, Y);
                }
                await Utils.sleep(3000)
                Utils.emitEvent(this.parentScrollTime > this.selfScrollTime && this.selfScrollTime > 0, 9014)
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              break;
            }

            case "testNestedScrollOptionsScrollBackwardHorizontal015": {
              try {
                this.scrollForwardEnums = NestedScrollMode.PARALLEL
                this.scrollBackwardEnums = NestedScrollMode.PARENT_FIRST
                this.scroller.scrollEdge(Edge.Start)
                this.controller.scrollTo(5000, 0)
                await Utils.sleep(1000)
                this.selfScrollTime = 0
                this.parentScrollTime = 0
                this.scroller.scrollBy(40, 0)
                await Utils.sleep(3000)
                let driver = Driver.create();
                this.userAgentPC = this.controller.getUserAgent();
                if ((this.userAgentPC).includes("PC")) {
                  await driver.swipe(X - 60, Y, X + 60, Y);
                } else {
                  await driver.swipe(X - 100, Y, X + 100, Y);
                }
                await Utils.sleep(3000)
                Utils.emitEvent(this.parentScrollTime < this.selfScrollTime && this.parentScrollTime > 0, 9015)
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              break;
            }

            case "testNestedScrollOptionsScrollBackwardHorizontal016": {
              try {
                this.scrollForwardEnums = NestedScrollMode.PARALLEL
                this.scrollBackwardEnums = NestedScrollMode.PARALLEL
                this.controller.scrollTo(5000, 0)
                this.scroller.scrollEdge(Edge.End)
                await Utils.sleep(1000)
                this.selfScrollTime = 0
                this.parentScrollTime = 0
                let driver = Driver.create();
                this.userAgentPC = this.controller.getUserAgent();
                if ((this.userAgentPC).includes("PC")) {
                  await driver.swipe(X - 60, Y, X + 60, Y);
                } else {
                  await driver.swipe(X - 100, Y, X + 100, Y);
                }
                await Utils.sleep(3000)
                Utils.emitEvent(this.parentScrollTime > 0 && this.selfScrollTime > 0, 9016)
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              break;
            }

          }
        })

      Scroll(this.scroller) {
        Row() {
          Column().width('20%').height('100%').backgroundColor(Color.Green)
          Web({ src: $rawfile('nestedScrollTwo.html'), controller: this.controller })
            .nestedScroll({
              scrollForward: this.scrollForwardEnums,
              scrollBackward: this.scrollBackwardEnums,
            })
            .width('90%')
            .height('100%')
            .onScroll((event) => {
              console.info("WebView onScroll x = " + event.xOffset)
              console.info("WebView onScroll y = " + event.yOffset)
              if ((event.xOffset != 0 || event.yOffset != 0) && this.selfScrollTime == 0) {
                this.selfScrollTime = Utils.getSystemTime()
              }
            })
          Column().width('20%').height('100%').backgroundColor(Color.Red)
        }
      }.onScroll((xOffset: number, yOffset: number) => {
        console.info('ParentScroll:' + xOffset + ' ' + yOffset)
        if ((xOffset != 0 || yOffset != 0) && this.parentScrollTime == 0) {
          this.parentScrollTime = Utils.getSystemTime()
        }
      })
      .scrollable(ScrollDirection.Horizontal)
      .width('100%')
      .height('100%')
    }
    .key('RowSize')
  }
}