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

const EVENT_ID_SET_SUITE_KEY = 184301;
let driver: Driver = Driver.create();


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
      if (eventData.data != null && eventData.data.ACTION != null) {
        this.str = eventData.data.ACTION;
        this.isReceive = 1;
      }
    }
  }

  build() {
    Column() {
      Button("NestedScrollOptionsScrollForwardHorizontal click")
        .key('NestedScrollOptionsScrollForwardHorizontalTestButton')
        .onClick(async () => {
          console.info("key==>" + this.str)
          await Utils.waitForExist(()=>this.isReceive, this.str+' isReceive', 1, 1000);
          await Utils.waitForExist(()=>this.isPageEnd, this.str+' isPageEnd', 1, 1000);
          let webRect = Utils.getComponentRect('ForwardRowSize');
          let X = Utils.getRectHorizontalCenterX(webRect)
          let Y = Utils.getRectVerticalCenterY(webRect)
          switch (this.str) {
            case "testNestedScrollOptionsScrollForwardHorizontal001": {
              try {
                this.scrollForwardEnums = NestedScrollMode.SELF_ONLY
                this.scrollBackwardEnums = NestedScrollMode.SELF_ONLY
                this.scroller.scrollEdge(Edge.Start)
                await Utils.waitForScrollStop(()=>this.scroller.currentOffset().xOffset, this.str+' scrollXOffset')
                this.controller.scrollTo(5000, 0)
                await Utils.waitForScrollStop(()=>this.controller.getPageOffset().x, this.str+' webXOffset');
                this.controller.scrollBy(-40, 0)
                await Utils.waitForScrollStop(()=>this.controller.getPageOffset().x, this.str+' webXOffset');
                this.selfScrollTime = 0
                this.parentScrollTime = 0
                await driver.swipe(X + 100, Y, X - 100, Y);
                Utils.emitEvent(this.parentScrollTime == 0 && this.selfScrollTime != 0, 184310)
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
                await Utils.waitForScrollStop(()=>this.scroller.currentOffset().xOffset, this.str+' scrollXOffset')
                this.controller.scrollTo(5000, 0)
                await Utils.waitForScrollStop(()=>this.controller.getPageOffset().x, this.str+' webXOffset');
                await Utils.waitForScrollStop(()=>this.scroller.currentOffset().xOffset, this.str+' scrollXOffset')
                this.controller.scrollBy(-40, 0)
                await Utils.waitForScrollStop(()=>this.controller.getPageOffset().x, this.str+' webXOffset');
                this.selfScrollTime = 0
                this.parentScrollTime = 0
                await driver.swipe(X + 100, Y, X - 100, Y);
                Utils.emitEvent(this.parentScrollTime > this.selfScrollTime && this.selfScrollTime > 0, 184320)
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
                await Utils.waitForScrollStop(()=>this.scroller.currentOffset().xOffset, this.str+' scrollXOffset')
                this.controller.scrollTo(0, 0)
                await Utils.waitForScrollStop(()=>this.controller.getPageOffset().x, this.str+' webXOffset');
                this.selfScrollTime = 0
                this.parentScrollTime = 0
                this.scroller.scrollBy(-40, 0)
                await Utils.waitForScrollStop(()=>this.controller.getPageOffset().x, this.str+' webXOffset');
                await driver.swipe(X + 100, Y, X - 100, Y);
                Utils.emitEvent(this.parentScrollTime < this.selfScrollTime && this.parentScrollTime > 0, 184330)
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
                await Utils.waitForScrollStop(()=>this.scroller.currentOffset().xOffset, this.str+' scrollXOffset')
                this.controller.scrollTo(0, 0)
                await Utils.waitForScrollStop(()=>this.controller.getPageOffset().x, this.str+' webXOffset');
                this.selfScrollTime = 0
                this.parentScrollTime = 0
                await driver.swipe(X + 100, Y, X - 100, Y);
                Utils.emitEvent(this.parentScrollTime > 0 && this.selfScrollTime > 0, 184340)
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
                await Utils.waitForScrollStop(()=>this.scroller.currentOffset().xOffset, this.str+' scrollXOffset')
                this.controller.scrollTo(5000, 0)
                await Utils.waitForScrollStop(()=>this.controller.getPageOffset().x, this.str+' webXOffset');
                this.controller.scrollBy(-40, 0)
                await Utils.waitForScrollStop(()=>this.controller.getPageOffset().x, this.str+' webXOffset');
                await Utils.waitForScrollStop(()=>this.scroller.currentOffset().xOffset, this.str+' scrollXOffset')
                this.selfScrollTime = 0
                this.parentScrollTime = 0
                await driver.swipe(X + 100, Y, X - 100, Y);
                Utils.emitEvent(this.parentScrollTime == 0 && this.selfScrollTime != 0, 184350)
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
                await Utils.waitForScrollStop(()=>this.scroller.currentOffset().xOffset, this.str+' scrollXOffset')
                this.controller.scrollTo(5000, 0)
                await Utils.waitForScrollStop(()=>this.controller.getPageOffset().x, this.str+' webXOffset');
                await Utils.waitForScrollStop(()=>this.scroller.currentOffset().xOffset, this.str+' scrollXOffset')
                this.controller.scrollBy(-40, 0)
                await Utils.waitForScrollStop(()=>this.controller.getPageOffset().x, this.str+' webXOffset');
                await Utils.waitForScrollStop(()=>this.scroller.currentOffset().xOffset, this.str+' scrollXOffset')
                this.selfScrollTime = 0
                this.parentScrollTime = 0
                await driver.swipe(X + 100, Y, X - 100, Y);
                Utils.emitEvent(this.parentScrollTime > this.selfScrollTime && this.selfScrollTime > 0, 184360)
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
                await Utils.waitForScrollStop(()=>this.scroller.currentOffset().xOffset, this.str+' scrollXOffset')
                this.controller.scrollTo(0, 0)
                await Utils.waitForScrollStop(()=>this.controller.getPageOffset().x, this.str+' webXOffset');
                await Utils.waitForScrollStop(()=>this.scroller.currentOffset().xOffset, this.str+' scrollXOffset')
                this.selfScrollTime = 0
                this.parentScrollTime = 0
                this.scroller.scrollBy(-40, 0)
                await Utils.waitForScrollStop(()=>this.controller.getPageOffset().x, this.str+' webXOffset');
                await Utils.waitForScrollStop(()=>this.scroller.currentOffset().xOffset, this.str+' scrollXOffset')
                await driver.swipe(X + 100, Y, X - 100, Y);
                Utils.emitEvent(this.parentScrollTime < this.selfScrollTime && this.parentScrollTime > 0, 184370)
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
                await Utils.waitForScrollStop(()=>this.scroller.currentOffset().xOffset, this.str+' scrollXOffset')
                this.controller.scrollTo(0, 0)
                await Utils.waitForScrollStop(()=>this.controller.getPageOffset().x, this.str+' webXOffset');
                await Utils.waitForScrollStop(()=>this.scroller.currentOffset().xOffset, this.str+' scrollXOffset')
                this.selfScrollTime = 0
                this.parentScrollTime = 0
                await driver.swipe(X + 100, Y, X - 100, Y);
                await Utils.waitForScrollStop(()=>this.controller.getPageOffset().x, this.str+' webXOffset');
                await Utils.waitForScrollStop(()=>this.scroller.currentOffset().xOffset, this.str+' scrollXOffset')
                Utils.emitEvent(this.parentScrollTime > 0 && this.selfScrollTime > 0, 184380)
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
                await Utils.waitForScrollStop(()=>this.scroller.currentOffset().xOffset, this.str+' scrollXOffset')
                this.controller.scrollTo(5000, 0)
                await Utils.waitForScrollStop(()=>this.controller.getPageOffset().x, this.str+' webXOffset');
                this.controller.scrollBy(-40, 0)
                await Utils.waitForScrollStop(()=>this.scroller.currentOffset().xOffset, this.str+' scrollXOffset')
                await Utils.waitForScrollStop(()=>this.controller.getPageOffset().x, this.str+' webXOffset');
                this.selfScrollTime = 0
                this.parentScrollTime = 0
                await driver.swipe(X + 100, Y, X - 100, Y);
                Utils.emitEvent(this.parentScrollTime == 0 && this.selfScrollTime != 0, 184390)
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
                await Utils.waitForScrollStop(()=>this.scroller.currentOffset().xOffset, this.str+' scrollXOffset')
                this.controller.scrollTo(5000, 0)
                await Utils.waitForScrollStop(()=>this.controller.getPageOffset().x, this.str+' webXOffset');
                await Utils.waitForScrollStop(()=>this.scroller.currentOffset().xOffset, this.str+' scrollXOffset')
                this.controller.scrollBy(-40, 0)
                await Utils.waitForScrollStop(()=>this.scroller.currentOffset().xOffset, this.str+' scrollXOffset')
                await Utils.waitForScrollStop(()=>this.controller.getPageOffset().x, this.str+' webXOffset');
                this.selfScrollTime = 0
                this.parentScrollTime = 0
                await driver.swipe(X + 100, Y, X - 100, Y);
                Utils.emitEvent(this.parentScrollTime > this.selfScrollTime && this.selfScrollTime > 0, 184400)
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
                await Utils.waitForScrollStop(()=>this.scroller.currentOffset().xOffset, this.str+' scrollXOffset')
                this.controller.scrollTo(0, 0)
                await Utils.waitForScrollStop(()=>this.scroller.currentOffset().xOffset, this.str+' scrollXOffset')
                await Utils.waitForScrollStop(()=>this.controller.getPageOffset().x, this.str+' webXOffset');
                this.selfScrollTime = 0
                this.parentScrollTime = 0
                this.scroller.scrollBy(-40, 0)
                await Utils.waitForScrollStop(()=>this.scroller.currentOffset().xOffset, this.str+' scrollXOffset')
                await Utils.waitForScrollStop(()=>this.controller.getPageOffset().x, this.str+' webXOffset');
                await driver.swipe(X + 100, Y, X - 100, Y);
                Utils.emitEvent(this.parentScrollTime < this.selfScrollTime && this.parentScrollTime > 0, 184410)
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
                await Utils.waitForScrollStop(()=>this.scroller.currentOffset().xOffset, this.str+' scrollXOffset')
                this.controller.scrollTo(0, 0)
                await Utils.waitForScrollStop(()=>this.scroller.currentOffset().xOffset, this.str+' scrollXOffset')
                await Utils.waitForScrollStop(()=>this.controller.getPageOffset().x, this.str+' webXOffset');
                this.selfScrollTime = 0
                this.parentScrollTime = 0
                await driver.swipe(X + 100, Y, X - 100, Y);
                Utils.emitEvent(this.parentScrollTime > 0 && this.selfScrollTime > 0, 184420)
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
                await Utils.waitForScrollStop(()=>this.scroller.currentOffset().xOffset, this.str+' scrollXOffset')
                this.controller.scrollTo(5000, 0)
                await Utils.waitForScrollStop(()=>this.controller.getPageOffset().x, this.str+' webXOffset');
                this.controller.scrollBy(-40, 0)
                await Utils.waitForScrollStop(()=>this.controller.getPageOffset().x, this.str+' webXOffset');
                await Utils.waitForScrollStop(()=>this.scroller.currentOffset().xOffset, this.str+' scrollXOffset')
                this.selfScrollTime = 0
                this.parentScrollTime = 0
                await driver.swipe(X + 100, Y, X - 100, Y);
                Utils.emitEvent(this.parentScrollTime == 0 && this.selfScrollTime != 0, 184430)
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
                await Utils.waitForScrollStop(()=>this.scroller.currentOffset().xOffset, this.str+' scrollXOffset')
                this.controller.scrollTo(5000, 0)
                await Utils.waitForScrollStop(()=>this.controller.getPageOffset().x, this.str+' webXOffset');
                await Utils.waitForScrollStop(()=>this.scroller.currentOffset().xOffset, this.str+' scrollXOffset')
                this.controller.scrollBy(-40, 0)
                await Utils.waitForScrollStop(()=>this.controller.getPageOffset().x, this.str+' webXOffset');
                await Utils.waitForScrollStop(()=>this.scroller.currentOffset().xOffset, this.str+' scrollXOffset')
                this.selfScrollTime = 0
                this.parentScrollTime = 0
                await driver.swipe(X + 100, Y, X - 100, Y);
                Utils.emitEvent(this.parentScrollTime > this.selfScrollTime && this.selfScrollTime > 0, 184440)
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
                await Utils.waitForScrollStop(()=>this.scroller.currentOffset().xOffset, this.str+' scrollXOffset')
                this.controller.scrollTo(0, 0)
                await Utils.waitForScrollStop(()=>this.controller.getPageOffset().x, this.str+' webXOffset');
                await Utils.waitForScrollStop(()=>this.scroller.currentOffset().xOffset, this.str+' scrollXOffset')
                this.selfScrollTime = 0
                this.parentScrollTime = 0
                this.scroller.scrollBy(-40, 0)
                await Utils.waitForScrollStop(()=>this.controller.getPageOffset().x, this.str+' webXOffset');
                await Utils.waitForScrollStop(()=>this.scroller.currentOffset().xOffset, this.str+' scrollXOffset')
                await driver.swipe(X + 100, Y, X - 100, Y);
                Utils.emitEvent(this.parentScrollTime < this.selfScrollTime && this.parentScrollTime > 0, 184450)
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
                await Utils.waitForScrollStop(()=>this.scroller.currentOffset().xOffset, this.str+' scrollXOffset')
                this.controller.scrollTo(0, 0)
                await Utils.waitForScrollStop(()=>this.controller.getPageOffset().x, this.str+' webXOffset');
                await Utils.waitForScrollStop(()=>this.scroller.currentOffset().xOffset, this.str+' scrollXOffset')
                this.selfScrollTime = 0
                this.parentScrollTime = 0
                await driver.swipe(X + 100, Y, X - 100, Y);
                Utils.emitEvent(this.parentScrollTime > 0 && this.selfScrollTime > 0, 184460)
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
            .onPageEnd((event) => {
              console.log('onPageEnd url:' + event.url);
              this.isPageEnd = 1;
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