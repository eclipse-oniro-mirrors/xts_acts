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
struct WebNestedScrollOptionsScrollForwardHorizontalTest {
  controller: webView.WebviewController = new webView.WebviewController();
  scroller: Scroller = new Scroller()
  @State str: string = '';
  @State selfScrollTime: number = 0
  @State parentScrollTime: number = 0
  @State scrollForwardEnums: number = NestedScrollMode.SELF_FIRST
  @State scrollBackwardEnums: number = NestedScrollMode.SELF_FIRST

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
      Button("NestedScrollOptionsScrollForwardHorizontal click")
        .key('NestedScrollOptionsScrollForwardHorizontalTestButton')
        .onClick(async () => {
          console.info("key==>" + this.str)
          let webRect = Utils.getComponentRect('ForwardRowSize');
          let X = Utils.getRectHorizontalCenterX(webRect)
          let Y = Utils.getRectVerticalCenterY(webRect)
          switch (this.str) {

            case "testNestedScrollOptionsScrollForwardHorizontal001": {
              try {
                this.scrollForwardEnums = NestedScrollMode.SELF_ONLY
                this.scrollBackwardEnums = NestedScrollMode.SELF_ONLY
                this.scroller.scrollEdge(Edge.Start)
                this.controller.scrollTo(5000, 0)
                await Utils.sleep(2000)
                this.controller.scrollBy(-40, 0)
                await Utils.sleep(2000)
                this.selfScrollTime = 0
                this.parentScrollTime = 0
                let driver = Driver.create();
                await driver.swipe(X + 100, Y, X - 100, Y);
                await Utils.sleep(3000)
                Utils.emitEvent(this.parentScrollTime == 0 && this.selfScrollTime != 0, 5001)
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              break;
            }

            case "testNestedScrollOptionsScrollForwardHorizontal002": {
              try {
                this.scrollForwardEnums = NestedScrollMode.SELF_FIRST
                this.scrollBackwardEnums = NestedScrollMode.SELF_ONLY
                this.scroller.scrollEdge(Edge.Start)
                this.controller.scrollTo(5000, 0)
                await Utils.sleep(2000)
                this.controller.scrollBy(-40, 0)
                await Utils.sleep(2000)
                this.selfScrollTime = 0
                this.parentScrollTime = 0
                let driver = Driver.create();
                await driver.swipe(X + 100, Y, X - 100, Y);
                await Utils.sleep(3000)
                Utils.emitEvent(this.parentScrollTime > this.selfScrollTime && this.selfScrollTime > 0, 5002)
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              break;
            }

            case "testNestedScrollOptionsScrollForwardHorizontal003": {
              try {
                this.scrollForwardEnums = NestedScrollMode.PARENT_FIRST
                this.scrollBackwardEnums = NestedScrollMode.SELF_ONLY
                this.scroller.scrollEdge(Edge.End)
                this.controller.scrollTo(0, 0)
                await Utils.sleep(2000)
                this.selfScrollTime = 0
                this.parentScrollTime = 0
                this.scroller.scrollBy(-40, 0)
                await Utils.sleep(3000)
                let driver = Driver.create();
                await driver.swipe(X + 100, Y, X - 100, Y);
                await Utils.sleep(3000)
                Utils.emitEvent(this.parentScrollTime < this.selfScrollTime && this.parentScrollTime > 0, 5003)
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              break;
            }

            case "testNestedScrollOptionsScrollForwardHorizontal004": {
              try {
                this.scrollForwardEnums = NestedScrollMode.PARALLEL
                this.scrollBackwardEnums = NestedScrollMode.SELF_ONLY
                this.scroller.scrollEdge(Edge.Start)
                this.controller.scrollTo(0, 0)
                await Utils.sleep(2000)
                this.selfScrollTime = 0
                this.parentScrollTime = 0
                let driver = Driver.create();
                await driver.swipe(X + 100, Y, X - 100, Y);
                await Utils.sleep(3000)
                Utils.emitEvent(this.parentScrollTime > 0 && this.selfScrollTime > 0, 5004)
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              break;
            }

            case "testNestedScrollOptionsScrollForwardHorizontal005": {
              try {
                this.scrollForwardEnums = NestedScrollMode.SELF_ONLY
                this.scrollBackwardEnums = NestedScrollMode.SELF_FIRST
                this.scroller.scrollEdge(Edge.Start)
                this.controller.scrollTo(5000, 0)
                await Utils.sleep(2000)
                this.controller.scrollBy(-40, 0)
                await Utils.sleep(2000)
                this.selfScrollTime = 0
                this.parentScrollTime = 0
                let driver = Driver.create();
                await driver.swipe(X + 100, Y, X - 100, Y);
                await Utils.sleep(3000)
                Utils.emitEvent(this.parentScrollTime == 0 && this.selfScrollTime != 0, 5005)
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              break;
            }

            case "testNestedScrollOptionsScrollForwardHorizontal006": {
              try {
                this.scrollForwardEnums = NestedScrollMode.SELF_FIRST
                this.scrollBackwardEnums = NestedScrollMode.SELF_FIRST
                this.scroller.scrollEdge(Edge.Start)
                this.controller.scrollTo(5000, 0)
                await Utils.sleep(2000)
                this.controller.scrollBy(-40, 0)
                await Utils.sleep(2000)
                this.selfScrollTime = 0
                this.parentScrollTime = 0
                let driver = Driver.create();
                await driver.swipe(X + 100, Y, X - 100, Y);
                await Utils.sleep(3000)
                Utils.emitEvent(this.parentScrollTime > this.selfScrollTime && this.selfScrollTime > 0, 5006)
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              break;
            }

            case "testNestedScrollOptionsScrollForwardHorizontal007": {
              try {
                this.scrollForwardEnums = NestedScrollMode.PARENT_FIRST
                this.scrollBackwardEnums = NestedScrollMode.SELF_FIRST
                this.scroller.scrollEdge(Edge.End)
                this.controller.scrollTo(0, 0)
                await Utils.sleep(2000)
                this.selfScrollTime = 0
                this.parentScrollTime = 0
                this.scroller.scrollBy(-40, 0)
                await Utils.sleep(3000)
                let driver = Driver.create();
                await driver.swipe(X + 100, Y, X - 100, Y);
                await Utils.sleep(3000)
                Utils.emitEvent(this.parentScrollTime < this.selfScrollTime && this.parentScrollTime > 0, 5007)
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              break;
            }

            case "testNestedScrollOptionsScrollForwardHorizontal008": {
              try {
                this.scrollForwardEnums = NestedScrollMode.PARALLEL
                this.scrollBackwardEnums = NestedScrollMode.SELF_FIRST
                this.scroller.scrollEdge(Edge.Start)
                this.controller.scrollTo(0, 0)
                await Utils.sleep(2000)
                this.selfScrollTime = 0
                this.parentScrollTime = 0
                let driver = Driver.create();
                await driver.swipe(X + 100, Y, X - 100, Y);
                await Utils.sleep(3000)
                Utils.emitEvent(this.parentScrollTime > 0 && this.selfScrollTime > 0, 5008)
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              break;
            }

            case "testNestedScrollOptionsScrollForwardHorizontal009": {
              try {
                this.scrollForwardEnums = NestedScrollMode.SELF_ONLY
                this.scrollBackwardEnums = NestedScrollMode.PARENT_FIRST
                this.scroller.scrollEdge(Edge.Start)
                this.controller.scrollTo(5000, 0)
                await Utils.sleep(2000)
                this.controller.scrollBy(-40, 0)
                await Utils.sleep(2000)
                this.selfScrollTime = 0
                this.parentScrollTime = 0
                let driver = Driver.create();
                await driver.swipe(X + 100, Y, X - 100, Y);
                await Utils.sleep(3000)
                Utils.emitEvent(this.parentScrollTime == 0 && this.selfScrollTime != 0, 5009)
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              break;
            }

            case "testNestedScrollOptionsScrollForwardHorizontal010": {
              try {
                this.scrollForwardEnums = NestedScrollMode.SELF_FIRST
                this.scrollBackwardEnums = NestedScrollMode.PARENT_FIRST
                this.scroller.scrollEdge(Edge.Start)
                this.controller.scrollTo(5000, 0)
                await Utils.sleep(2000)
                this.controller.scrollBy(-40, 0)
                await Utils.sleep(2000)
                this.selfScrollTime = 0
                this.parentScrollTime = 0
                let driver = Driver.create();
                await driver.swipe(X + 100, Y, X - 100, Y);
                await Utils.sleep(3000)
                Utils.emitEvent(this.parentScrollTime > this.selfScrollTime && this.selfScrollTime > 0, 5010)
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              break;
            }

            case "testNestedScrollOptionsScrollForwardHorizontal011": {
              try {
                this.scrollForwardEnums = NestedScrollMode.PARENT_FIRST
                this.scrollBackwardEnums = NestedScrollMode.PARENT_FIRST
                this.scroller.scrollEdge(Edge.End)
                this.controller.scrollTo(0, 0)
                await Utils.sleep(2000)
                this.selfScrollTime = 0
                this.parentScrollTime = 0
                this.scroller.scrollBy(-40, 0)
                await Utils.sleep(3000)
                let driver = Driver.create();
                await driver.swipe(X + 100, Y, X - 100, Y);
                await Utils.sleep(3000)
                Utils.emitEvent(this.parentScrollTime < this.selfScrollTime && this.parentScrollTime > 0, 5011)
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              break;
            }

            case "testNestedScrollOptionsScrollForwardHorizontal012": {
              try {
                this.scrollForwardEnums = NestedScrollMode.PARALLEL
                this.scrollBackwardEnums = NestedScrollMode.PARENT_FIRST
                this.scroller.scrollEdge(Edge.Start)
                this.controller.scrollTo(0, 0)
                await Utils.sleep(2000)
                this.selfScrollTime = 0
                this.parentScrollTime = 0
                let driver = Driver.create();
                await driver.swipe(X + 100, Y, X - 100, Y);
                await Utils.sleep(3000)
                Utils.emitEvent(this.parentScrollTime > 0 && this.selfScrollTime > 0, 5012)
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              break;
            }


            case "testNestedScrollOptionsScrollForwardHorizontal013": {
              try {
                this.scrollForwardEnums = NestedScrollMode.SELF_ONLY
                this.scrollBackwardEnums = NestedScrollMode.PARALLEL
                this.scroller.scrollEdge(Edge.Start)
                this.controller.scrollTo(5000, 0)
                await Utils.sleep(2000)
                this.controller.scrollBy(-40, 0)
                await Utils.sleep(2000)
                this.selfScrollTime = 0
                this.parentScrollTime = 0
                let driver = Driver.create();
                await driver.swipe(X + 100, Y, X - 100, Y);
                await Utils.sleep(3000)
                Utils.emitEvent(this.parentScrollTime == 0 && this.selfScrollTime != 0, 5013)
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              break;
            }

            case "testNestedScrollOptionsScrollForwardHorizontal014": {
              try {
                this.scrollForwardEnums = NestedScrollMode.SELF_FIRST
                this.scrollBackwardEnums = NestedScrollMode.PARALLEL
                this.scroller.scrollEdge(Edge.Start)
                this.controller.scrollTo(5000, 0)
                await Utils.sleep(2000)
                this.controller.scrollBy(-40, 0)
                await Utils.sleep(2000)
                this.selfScrollTime = 0
                this.parentScrollTime = 0
                let driver = Driver.create();
                await driver.swipe(X + 100, Y, X - 100, Y);
                await Utils.sleep(3000)
                Utils.emitEvent(this.parentScrollTime > this.selfScrollTime && this.selfScrollTime > 0, 5014)
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              break;
            }

            case "testNestedScrollOptionsScrollForwardHorizontal015": {
              try {
                this.scrollForwardEnums = NestedScrollMode.PARENT_FIRST
                this.scrollBackwardEnums = NestedScrollMode.PARALLEL
                this.scroller.scrollEdge(Edge.End)
                this.controller.scrollTo(0, 0)
                await Utils.sleep(2000)
                this.selfScrollTime = 0
                this.parentScrollTime = 0
                this.scroller.scrollBy(-40, 0)
                await Utils.sleep(3000)
                let driver = Driver.create();
                await driver.swipe(X + 100, Y, X - 100, Y);
                await Utils.sleep(3000)
                Utils.emitEvent(this.parentScrollTime < this.selfScrollTime && this.parentScrollTime > 0, 5015)
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              break;
            }

            case "testNestedScrollOptionsScrollForwardHorizontal016": {
              try {
                this.scrollForwardEnums = NestedScrollMode.PARALLEL
                this.scrollBackwardEnums = NestedScrollMode.PARALLEL
                this.scroller.scrollEdge(Edge.Start)
                this.controller.scrollTo(0, 0)
                await Utils.sleep(2000)
                this.selfScrollTime = 0
                this.parentScrollTime = 0
                let driver = Driver.create();
                await driver.swipe(X + 100, Y, X - 100, Y);
                await Utils.sleep(3000)
                Utils.emitEvent(this.parentScrollTime > 0 && this.selfScrollTime > 0, 5016)
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              break;
            }


          }
        })

      Scroll(this.scroller) {
        Row() {
          Column().width('30%').height('100%').backgroundColor(Color.Green)
          Web({ src: $rawfile('nestedScroll.html'), controller: this.controller })
            .nestedScroll({
              scrollForward: this.scrollForwardEnums,
              scrollBackward: this.scrollBackwardEnums,
            })
            .width('50%')
            .height('100%')
            .onScroll((event) => {
              console.info("WebView onScroll x = " + event.xOffset)
              console.info("WebView onScroll y = " + event.yOffset)
              if ((event.xOffset != 0 || event.yOffset != 0) && this.selfScrollTime == 0) {
                this.selfScrollTime = Utils.getSystemTime()
              }
            })
          Column().width('30%').height('100%').backgroundColor(Color.Red)
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
    .key('ForwardRowSize')
  }
}