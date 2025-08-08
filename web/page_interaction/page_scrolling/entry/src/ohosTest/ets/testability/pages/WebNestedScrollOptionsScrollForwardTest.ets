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
struct WebNestedScrollOptionsScrollForwardTest {
  controller: webView.WebviewController = new webView.WebviewController();
  scroller: Scroller = new Scroller()
  @State str: string = '';
  @State selfScrollTime: number = 0
  @State parentScrollTime: number = 0
  @State scrollForwardEnums: number = NestedScrollMode.SELF_ONLY
  @State scrollBackwardEnums: number = NestedScrollMode.SELF_ONLY

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
        this.selfScrollTime = 0
        this.parentScrollTime = 0
      }
    }
  }

  build() {
    Column() {
      Button("NestedScrollOptionsScrollForward click")
        .key('NestedScrollOptionsScrollForwardTestButton')
        .onClick(async () => {
          console.info("key==>" + this.str)
          let webRect = Utils.getComponentRect('ForwardColumnSize');
          let X = Utils.getRectHorizontalCenterX(webRect)
          let Y = Utils.getRectVerticalCenterY(webRect)
          switch (this.str) {
            case "testNestedScrollOptionsScrollForward001": {
              try {
                this.scrollForwardEnums = NestedScrollMode.SELF_ONLY
                this.scrollBackwardEnums = NestedScrollMode.SELF_ONLY
                this.scroller.scrollEdge(Edge.Top)
                await Utils.sleep(2000)
                this.controller.pageDown(true)
                await Utils.sleep(2000)
                this.controller.scrollBy(0, -40)
                await Utils.sleep(2000)
                this.selfScrollTime = 0
                this.parentScrollTime = 0
                let driver = Driver.create();
                await driver.swipe(X, Y + 100, X, Y - 100);
                await Utils.sleep(2000)
                Utils.emitEvent(this.parentScrollTime == 0 && this.selfScrollTime != 0, 8001)
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              break;
            }

            case "testNestedScrollOptionsScrollForward002": {
              try {
                this.scrollForwardEnums = NestedScrollMode.SELF_FIRST
                this.scrollBackwardEnums = NestedScrollMode.SELF_ONLY
                this.scroller.scrollEdge(Edge.Top)
                this.controller.pageUp(true)
                await Utils.sleep(2000)
                this.controller.pageDown(true)
                await Utils.sleep(2000)
                this.controller.scrollBy(0, -40)
                await Utils.sleep(2000)
                this.selfScrollTime = 0
                this.parentScrollTime = 0
                let driver = Driver.create();
                await driver.swipe(X, Y + 100, X, Y - 100);
                await Utils.sleep(3000)
                Utils.emitEvent(this.parentScrollTime > this.selfScrollTime && this.selfScrollTime > 0, 8002)
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              break;
            }

            case "testNestedScrollOptionsScrollForward003": {
              try {
                this.scrollForwardEnums = NestedScrollMode.PARENT_FIRST
                this.scrollBackwardEnums = NestedScrollMode.SELF_ONLY
                this.scroller.scrollEdge(Edge.Bottom)
                this.controller.pageUp(true)
                await Utils.sleep(2000)
                this.selfScrollTime = 0
                this.parentScrollTime = 0
                this.scroller.scrollBy(0, -40)
                await Utils.sleep(2000)
                let driver = Driver.create();
                await driver.swipe(X, Y + 100, X, Y - 100);
                await Utils.sleep(3000)
                Utils.emitEvent(this.parentScrollTime < this.selfScrollTime && this.parentScrollTime > 0, 8003)
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              break;
            }

            case "testNestedScrollOptionsScrollForward004": {
              try {
                this.scrollForwardEnums = NestedScrollMode.PARALLEL
                this.scrollBackwardEnums = NestedScrollMode.SELF_ONLY
                this.scroller.scrollEdge(Edge.Top)
                this.controller.pageUp(true)
                await Utils.sleep(1000)
                this.selfScrollTime = 0
                this.parentScrollTime = 0
                let driver = Driver.create();
                await driver.swipe(X, Y + 50, X, Y - 50);
                await Utils.sleep(3000)
                Utils.emitEvent(this.parentScrollTime > 0 && this.selfScrollTime > 0, 8004)
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              break;
            }

            case "testNestedScrollOptionsScrollForward005": {
              try {
                this.scrollForwardEnums = NestedScrollMode.SELF_ONLY
                this.scrollBackwardEnums = NestedScrollMode.SELF_FIRST
                this.scroller.scrollEdge(Edge.Top)
                await Utils.sleep(2000)
                this.controller.pageDown(true)
                await Utils.sleep(2000)
                this.controller.scrollBy(0, -40)
                await Utils.sleep(2000)
                this.selfScrollTime = 0
                this.parentScrollTime = 0
                let driver = Driver.create();
                await driver.swipe(X, Y + 100, X, Y - 100);
                await Utils.sleep(2000)
                Utils.emitEvent(this.parentScrollTime == 0 && this.selfScrollTime != 0, 8005)
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              break;
            }

            case "testNestedScrollOptionsScrollForward006": {
              try {
                this.scrollForwardEnums = NestedScrollMode.SELF_FIRST
                this.scrollBackwardEnums = NestedScrollMode.SELF_FIRST
                this.scroller.scrollEdge(Edge.Top)
                this.controller.pageUp(true)
                await Utils.sleep(2000)
                this.controller.pageDown(true)
                await Utils.sleep(2000)
                this.controller.scrollBy(0, -40)
                await Utils.sleep(2000)
                this.selfScrollTime = 0
                this.parentScrollTime = 0
                let driver = Driver.create();
                await driver.swipe(X, Y + 100, X, Y - 100);
                await Utils.sleep(3000)
                Utils.emitEvent(this.parentScrollTime > this.selfScrollTime && this.selfScrollTime > 0, 8006)
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              break;
            }

            case "testNestedScrollOptionsScrollForward007": {
              try {
                this.scrollForwardEnums = NestedScrollMode.PARENT_FIRST
                this.scrollBackwardEnums = NestedScrollMode.SELF_FIRST
                this.scroller.scrollEdge(Edge.Bottom)
                this.controller.pageUp(true)
                await Utils.sleep(2000)
                this.selfScrollTime = 0
                this.parentScrollTime = 0
                this.scroller.scrollBy(0, -40)
                await Utils.sleep(2000)
                let driver = Driver.create();
                await driver.swipe(X, Y + 100, X, Y - 100);
                await Utils.sleep(3000)
                Utils.emitEvent(this.parentScrollTime < this.selfScrollTime && this.parentScrollTime > 0, 8007)
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              break;
            }

            case "testNestedScrollOptionsScrollForward008": {
              try {
                this.scrollForwardEnums = NestedScrollMode.PARALLEL
                this.scrollBackwardEnums = NestedScrollMode.SELF_FIRST
                this.controller.pageUp(true)
                this.scroller.scrollEdge(Edge.Top)
                await Utils.sleep(1000)
                this.selfScrollTime = 0
                this.parentScrollTime = 0
                let driver = Driver.create();
                await driver.swipe(X, Y + 50, X, Y - 50);
                await Utils.sleep(3000)
                Utils.emitEvent(this.parentScrollTime > 0 && this.selfScrollTime > 0, 8008)
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              break;
            }

            case "testNestedScrollOptionsScrollForward009": {
              try {
                this.scrollForwardEnums = NestedScrollMode.SELF_ONLY
                this.scrollBackwardEnums = NestedScrollMode.PARENT_FIRST
                this.scroller.scrollEdge(Edge.Top)
                await Utils.sleep(2000)
                this.controller.pageDown(true)
                await Utils.sleep(2000)
                this.controller.scrollBy(0, -40)
                await Utils.sleep(2000)
                this.selfScrollTime = 0
                this.parentScrollTime = 0
                let driver = Driver.create();
                await driver.swipe(X, Y + 100, X, Y - 100);
                await Utils.sleep(2000)
                Utils.emitEvent(this.parentScrollTime == 0 && this.selfScrollTime != 0, 8009)
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              break;
            }

            case "testNestedScrollOptionsScrollForward010": {
              try {
                this.scrollForwardEnums = NestedScrollMode.SELF_FIRST
                this.scrollBackwardEnums = NestedScrollMode.PARENT_FIRST
                this.scroller.scrollEdge(Edge.Top)
                this.controller.pageUp(true)
                await Utils.sleep(2000)
                this.controller.pageDown(true)
                await Utils.sleep(2000)
                this.controller.scrollBy(0, -40)
                await Utils.sleep(2000)
                this.selfScrollTime = 0
                this.parentScrollTime = 0
                let driver = Driver.create();
                await driver.swipe(X, Y + 100, X, Y - 100);
                await Utils.sleep(3000)
                Utils.emitEvent(this.parentScrollTime > this.selfScrollTime && this.selfScrollTime > 0, 8010)
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              break;
            }

            case "testNestedScrollOptionsScrollForward011": {
              try {
                this.scrollForwardEnums = NestedScrollMode.PARENT_FIRST
                this.scrollBackwardEnums = NestedScrollMode.PARENT_FIRST
                this.scroller.scrollEdge(Edge.Bottom)
                this.controller.pageUp(true)
                await Utils.sleep(2000)
                this.selfScrollTime = 0
                this.parentScrollTime = 0
                this.scroller.scrollBy(0, -40)
                await Utils.sleep(2000)
                let driver = Driver.create();
                await driver.swipe(X, Y + 100, X, Y - 100);
                await Utils.sleep(3000)
                Utils.emitEvent(this.parentScrollTime < this.selfScrollTime && this.parentScrollTime > 0, 8011)
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              break;
            }

            case "testNestedScrollOptionsScrollForward012": {
              try {
                this.scrollForwardEnums = NestedScrollMode.PARALLEL
                this.scrollBackwardEnums = NestedScrollMode.PARALLEL
                this.controller.pageUp(true)
                this.scroller.scrollEdge(Edge.Top)
                await Utils.sleep(1000)
                this.selfScrollTime = 0
                this.parentScrollTime = 0
                let driver = Driver.create();
                await driver.swipe(X, Y + 50, X, Y - 50);
                await Utils.sleep(3000)
                Utils.emitEvent(this.parentScrollTime > 0 && this.selfScrollTime > 0, 8012)
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              break;
            }

            case "testNestedScrollOptionsScrollForward013": {
              try {
                this.scrollForwardEnums = NestedScrollMode.SELF_ONLY
                this.scrollBackwardEnums = NestedScrollMode.PARALLEL
                this.scroller.scrollEdge(Edge.Top)
                await Utils.sleep(2000)
                this.controller.pageDown(true)
                await Utils.sleep(2000)
                this.controller.scrollBy(0, -40)
                await Utils.sleep(2000)
                this.selfScrollTime = 0
                this.parentScrollTime = 0
                let driver = Driver.create();
                await driver.swipe(X, Y + 100, X, Y - 100);
                await Utils.sleep(2000)
                Utils.emitEvent(this.parentScrollTime == 0 && this.selfScrollTime != 0, 8013)
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              break;
            }

            case "testNestedScrollOptionsScrollForward014": {
              try {
                this.scrollForwardEnums = NestedScrollMode.SELF_FIRST
                this.scrollBackwardEnums = NestedScrollMode.PARALLEL
                this.scroller.scrollEdge(Edge.Top)
                this.controller.pageUp(true)
                await Utils.sleep(2000)
                this.controller.pageDown(true)
                await Utils.sleep(2000)
                this.controller.scrollBy(0, -40)
                await Utils.sleep(2000)
                this.selfScrollTime = 0
                this.parentScrollTime = 0
                let driver = Driver.create();
                await driver.swipe(X, Y + 100, X, Y - 100);
                await Utils.sleep(3000)
                Utils.emitEvent(this.parentScrollTime > this.selfScrollTime && this.selfScrollTime > 0, 8014)
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              break;
            }

            case "testNestedScrollOptionsScrollForward015": {
              try {
                this.scrollForwardEnums = NestedScrollMode.PARENT_FIRST
                this.scrollBackwardEnums = NestedScrollMode.PARALLEL
                this.scroller.scrollEdge(Edge.Bottom)
                this.controller.pageUp(true)
                await Utils.sleep(2000)
                this.selfScrollTime = 0
                this.parentScrollTime = 0
                this.scroller.scrollBy(0, -40)
                await Utils.sleep(2000)
                let driver = Driver.create();
                await driver.swipe(X, Y + 100, X, Y - 100);
                await Utils.sleep(3000)
                Utils.emitEvent(this.parentScrollTime < this.selfScrollTime && this.parentScrollTime > 0, 8015)
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              break;
            }

            case "testNestedScrollOptionsScrollForward016": {
              try {
                this.scrollForwardEnums = NestedScrollMode.PARALLEL
                this.scrollBackwardEnums = NestedScrollMode.PARALLEL
                this.controller.pageUp(true)
                this.scroller.scrollEdge(Edge.Top)
                await Utils.sleep(1000)
                this.selfScrollTime = 0
                this.parentScrollTime = 0
                let driver = Driver.create();
                await driver.swipe(X, Y + 50, X, Y - 50);
                await Utils.sleep(3000)
                Utils.emitEvent(this.parentScrollTime > 0 && this.selfScrollTime > 0, 8016)
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
    .key('ForwardColumnSize')
  }
}