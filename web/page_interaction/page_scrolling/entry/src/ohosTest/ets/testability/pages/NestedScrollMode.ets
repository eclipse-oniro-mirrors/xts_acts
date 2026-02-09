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
import web_webview from '@ohos.web.webview';
import Utils from '../../test/Utils';
import { BusinessError } from '@ohos.base';
import CommonFunc from '../../test/Common';
import { Driver, ON, MouseButton } from '@ohos.UiTest';
import events_emitter from '@ohos.events.emitter';
import { window } from '@kit.ArkUI';

const EVENT_ID_SET_SUITE_KEY = 179001;
let driver: Driver = Driver.create();

@Entry
@Component
struct WebComponent {
  @State str: string = "NestedScrollMode01";
  private scrollerForswiper: SwiperController = new SwiperController()
  private scrollerForswiper2: SwiperController = new SwiperController()
  controller: web_webview.WebviewController = new web_webview.WebviewController();
  controller2: web_webview.WebviewController = new web_webview.WebviewController();
  // scroll横向的滚动
  @State ScrollDirection: ScrollDirection = ScrollDirection.Horizontal
  private scrollerForScroll: Scroller = new Scroller()
  private scrollerForScroll2: Scroller = new Scroller()
  @State NestedScrollModeUp: NestedScrollMode = NestedScrollMode.SELF_FIRST
  @State NestedScrollModeDown: NestedScrollMode = NestedScrollMode.SELF_FIRST
  @State NestedScrollModeRight: NestedScrollMode = NestedScrollMode.SELF_FIRST
  @State NestedScrollModeLeft: NestedScrollMode = NestedScrollMode.SELF_FIRST
  @State offsetX: number = 0
  @State offsetY: number = 0
  @State HorizontalX: number = 0;
  @State HorizontalY: number = 0;
  @State text4: number = 0
  @State text5: number = 0
  @State windowWidth: number = 0
  @State windowHeight: number = 0
  @State uintX: number = 0
  @State uintY: number = 0
  @State isPageEnd: number = -1;
  @State isReceive: number = -1;

  onPageShow() {
    let valueChangeEvent: events_emitter.InnerEvent = {
      eventId: EVENT_ID_SET_SUITE_KEY,
      priority: events_emitter.EventPriority.LOW
    }
    events_emitter.on(valueChangeEvent, this.valueChangeCallBack)
  }

  private valueChangeCallBack = (eventData: events_emitter.EventData) => {
    console.info("web page NestedScrollMode01");
    if (eventData != null) {
      console.info("NestedScrollMode01:" + JSON.stringify(eventData));
      if (eventData.data?.ACTION != null) {
        this.str = eventData.data?.ACTION;
        this.isReceive = 1;
      }
    }
  }
  onPageHide() {
    events_emitter.off(EVENT_ID_SET_SUITE_KEY)
  }

  aboutToAppear(): void {
    web_webview.WebviewController.setWebDebuggingAccess(true);
    try {
      let promise = window.getLastWindow(getContext(this));
      promise.then((windowClass) => {
        this.windowWidth = windowClass.getWindowProperties().windowRect.width
        this.windowHeight = windowClass.getWindowProperties().windowRect.height
        this.uintX = Number(Number(this.windowWidth / 20).toFixed())
        this.uintY = Number(Number(this.windowHeight / 20).toFixed())
        console.log('NestedScrollModeTest04 buttonWidth ' + this.windowWidth)

      }).catch((err: BusinessError) => {
        console.error(`Failed to obtain the top window. Cause code: ${err.code}, message: ${err.message}`);
      });
    } catch (exception) {
      console.error(`Failed to obtain the top window. Cause code: ${exception.code}, message: ${exception.message}`);
    }
  }

  build() {
    Flex() {
      Scroll(this.scrollerForScroll2) {
        Column({ space: 5 }) {

          Row() {


          }.height('40%')

          Scroll(this.scrollerForScroll) {
            Column() {
              Row() {
                Button('innerWidth')
                  .onClick(async () => {
                    try {
                      this.controller2.runJavaScript('javascript:window.innerWidth').then((result) => {
                        this.text4 = Number(result)
                        console.log('NestedScrollModeTest04  text4: ' + this.text4)
                      })
                    } catch (e) {
                      console.log(e)
                    }
                  }).key('innerWidth1').width(Number(this.windowWidth / 6).toFixed() + 'px')
                Button("web test").key('NestedScrollModeTest').onClick(async () => {
                  console.info("key==>" + this.str)
                  await Utils.waitForExist(()=>this.isReceive, this.str+' isReceive', 1, 1000);
                  await Utils.waitForExist(()=>this.isPageEnd, this.str+' isPageEnd', 1, 1000);
                  let pointer = CommonFunc.getComponentRect('NestedScrollModeWeb')
                  console.log('NestedScrollModeTest04 pointer' + JSON.stringify(pointer))
                  let X = pointer.left + this.uintX * 5
                  let Y = pointer.top + this.uintY * 5
                  console.log('NestedScrollModeTest04 X' + X)
                  console.log('NestedScrollModeTest04 Y' + Y)
                  let button1 = await driver.findComponent(ON.id('innerWidth1'));
                  await button1.click()

                  let button2 = await driver.findComponent(ON.id('innerHeight1'));
                  await button2.click()
                  await Utils.waitForReleaseDriver(this.str,driver)
                  switch (this.str) {

                    case "NestedScrollMode01": {
                      console.log('swipe01' + this.offsetX)
                      this.controller2.scrollBy(this.text4, 0, 1)
                      await Utils.waitForScrollStop(()=>this.controller2.getPageOffset().x, this.str+' webYOffset');
                      await driver.mouseClick({ x: X, y: Y }, MouseButton.MOUSE_BUTTON_LEFT, 2072);
                      await driver.swipe(X, Y, X - this.uintX*3, Y);
                      await Utils.waitForReleaseDriver(this.str,driver)
                      if (this.offsetX == 0 && this.HorizontalX > 10) {
                        Utils.emitEvent(true, 179010)
                      }
                      console.log('NestedScrollMode01' + this.offsetX)
                      console.log('NestedScrollMode0101' + this.HorizontalX)

                      break;
                    }
                    case "NestedScrollMode02": {
                      console.log('swipe03' + this.offsetX)

                      //web向右滚到头了,this.offsetX 等于0
                      this.controller2.scrollBy(-this.text4, 0, 1)
                      await Utils.waitForScrollStop(()=>this.controller2.getPageOffset().x, this.str+' webYOffset');
                      await driver.mouseClick({ x: X, y: Y }, MouseButton.MOUSE_BUTTON_LEFT, 2072);
                      await driver.swipe(X, Y, X + this.uintX * 5, Y);
                      if (this.offsetX == 0 && this.HorizontalX < 10) {
                        Utils.emitEvent(true, 179020)
                      }
                      console.log('swipe04' + this.offsetX)
                      console.log('X2' + X);
                      console.log('Y2' + Y);
                      console.log('NestedScrollMode02' + this.offsetX)
                      console.log('NestedScrollMode0202' + this.HorizontalX)

                      break;
                    }

                    case "NestedScrollMode03": {
                      this.controller2.scrollBy(0, this.text5, 1);
                      await Utils.waitForScrollStop(()=>this.controller2.getPageOffset().y, this.str+' webYOffset');
                      await driver.mouseClick({ x: X, y: Y }, MouseButton.MOUSE_BUTTON_LEFT, 2072);
                      await Utils.waitForReleaseDriver(this.str,driver)
                      await driver.swipe(X, Y, X, Y - this.uintY);
                      //子组件向上滚到头了
                      if (this.offsetY == 0 && this.HorizontalY > 10) {
                        Utils.emitEvent(true, 179030)
                      }

                      console.log('swipe06' + this.offsetY)
                      console.log('X3' + X);
                      console.log('Y3' + Y);
                      console.log('NestedScrollMode03' + this.offsetY)
                      console.log('NestedScrollMode0303' + this.HorizontalY)
                      break;
                    }

                    case "NestedScrollMode04": {
                      console.log('NestedScrollModeTest04 swipe07' + this.offsetY)
                      this.controller2.scrollBy(0, -this.text5, 1);
                      await Utils.waitForScrollStop(()=>this.controller2.getPageOffset().y, this.str+' webYOffset');
                      await driver.mouseClick({ x: X, y: Y }, MouseButton.MOUSE_BUTTON_LEFT, 2072);
                      await driver.swipe(X, Y, X, Y + this.uintY * 3);
                      //子组件滚到头为0
                      if (this.offsetY == 0 && this.HorizontalY < 10) {
                        Utils.emitEvent(true, 179040)
                      }
                      console.log('NestedScrollModeTest04 swipe08' + this.offsetY)
                      console.log('NestedScrollModeTest04 X4' + X);
                      console.log('NestedScrollModeTest04 Y4' + Y);
                      console.log('NestedScrollModeTest04 NestedScrollMode04' + this.offsetY)
                      console.log('NestedScrollModeTest04 NestedScrollMode04' + this.HorizontalY)
                      break;
                    }
                  }
                }).width(Number(this.windowWidth / 6).toFixed() + 'px')
                Button('innerHeight')
                  .onClick(async () => {
                    try {
                      this.controller2.runJavaScript('javascript:window.innerHeight').then((result) => {
                        this.text5 = Number(result);
                        console.log('NestedScrollModeTest04  text5: ' + this.text5)
                      })
                    } catch (e) {
                      console.log(e)
                    }
                  }).key('innerHeight1')
                  .width(Number(this.windowWidth / 6).toFixed() + 'px')

              }


              Row() {
                // 第一行按钮
                Text("Scroll Area")
                  .width(this.uintX * 2 + "px")
                  .height("20%")
                  .backgroundColor(0X330000FF)
                  .fontSize(16)
                  .textAlign(TextAlign.Center)

                Web({ src: $rawfile('nestedScroll1.html'), controller: this.controller2 })
                  .cacheMode(CacheMode.Online)
                  .onlineImageAccess(true)
                  .domStorageAccess(true)
                  .imageAccess(true)
                  .overviewModeAccess(true)
                  .zoomAccess(true)
                  .geolocationAccess(true)
                  .javaScriptAccess(true)
                  .databaseAccess(true)
                  .mixedMode(MixedMode.All)
                  .nestedScroll({
                    scrollUp: this.NestedScrollModeUp,
                    scrollDown: this.NestedScrollModeDown,
                    scrollRight: this.NestedScrollModeRight,
                    scrollLeft: this.NestedScrollModeLeft,
                  })
                  .onScroll((event) => {
                    console.info("xOffset = " + event.xOffset);
                    console.info("yOffset = " + event.yOffset);
                    this.offsetX = event.xOffset;
                    this.offsetY = event.yOffset;
                  })

                  .border({ width: 5, color: '#ef3e53' })
                  .onScroll((event) => {
                    console.info("xOffset = " + event.xOffset);
                    console.info("yOffset = " + event.yOffset);
                  })
                  .onPageEnd((event) => {
                    console.log('onPageEnd url:' + event.url);
                    this.isPageEnd = 1;
                  })
                Text("Scroll Area")
                  .width("20%")
                  .height("20%")
                  .backgroundColor(0X330000FF)
                  .fontSize(16)
                  .textAlign(TextAlign.Center)

              }.height("90%").border({ width: 5 })
            }

            // .alignItems(HorizontalAlign.Start)
          }
          .width("100%")
          .key('NestedScrollModeWeb')
          .height(1000)
          .border({ width: 5 })
          .scrollable(this.ScrollDirection)
          .onDidScroll((xOffset: number, yOffset: number) => {
            console.log("HorizontalX:" + this.scrollerForScroll.currentOffset().xOffset)
            this.HorizontalX = this.scrollerForScroll.currentOffset().xOffset
          })

        }
      }
      .width("100%")

      .height("100%")
      .border({ width: 5 })
      .scrollable(ScrollDirection.Vertical)
      .onDidScroll((xOffset: number, yOffset: number) => {
        console.log("HorizontalY:" + this.scrollerForScroll2.currentOffset().yOffset)
        this.HorizontalY = this.scrollerForScroll2.currentOffset().yOffset;
      })
    }.width('100%').height('100%').backgroundColor(0xDCDCDC).padding(20)

  }
}
