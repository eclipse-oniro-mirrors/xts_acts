/**
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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

import { webview } from '@kit.ArkWeb';
import { componentUtils } from '@kit.ArkUI';
import { BusinessError } from '@kit.BasicServicesKit';
import events_emitter from '@ohos.events.emitter';
import Utils from '../../test/Utils';
import { Driver, ON } from '@ohos.UiTest';

@Entry
@Component
struct WebComponent {
  @State testTitle: string = 'webScroll'
  controller: webview.WebviewController = new webview.WebviewController();
  @State controllerX: number =-100;
  @State controllerY: number =-100;
  @State mode: OverScrollMode = OverScrollMode.ALWAYS;
  @State str: string = "scrollByTo01";

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
      Row() {
        Button("web test").key('scrollByToButton').onClick(async () => {
          console.info("key==>" + this.str)
          let webRect = Utils.getComponentRect('webScrollByTo');
          let X = Utils.getRectHorizontalCenterX(webRect)
          let Y = Utils.getRectVerticalCenterY(webRect)
          switch (this.str) {
            case "scrollByTo01": {
              let driver: Driver = await Driver.create()
              let button = await driver.findComponent(ON.id('setScrollableButton'));
              await button.click();
              await Utils.sleep(1000);
              await driver.swipe(X, Y, X, Y + this.controllerY);
              await Utils.sleep(2000);
              Utils.emitEvent(webview.ScrollType.EVENT , 20250322)
              await Utils.sleep(2000);
              break;
            }
          }
        })
      }

      Button('setScrollable').key('setScrollableButton')
        .onClick(() => {
          try {
            this.controller.setScrollable(true,webview.ScrollType.EVENT);
          } catch (error) {
            console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
          }
        })
      Web({ src: $rawfile("scrollByTo.html"), controller: this.controller })
        .key("webScrollByTo")
        .overScrollMode(this.mode)
        .onTouch((event) => {
          this.controllerX = this.controller.getScrollOffset().x;
          this.controllerY = this.controller.getScrollOffset().y;
          let componentInfo = componentUtils.getRectangleById("webScrollByTogit");
          let webHeight = px2vp(componentInfo.size.height);
          let pageHeight = this.controller.getPageHeight();
          if (this.controllerY < 0) {
            // case1：网页向下过滚动时，可直接使用ScrollOffset.y
            console.log(`get downwards overscroll offsetY = ${this.controllerY}`);
          } else if ((this.controllerY != 0) && (this.controllerY > (pageHeight - webHeight))) {
            // case2：网页向上过滚动时，需计算出网页下边界与Web组件下边界的偏移量
            console.log(`get upwards overscroll offsetY = ${this.controllerY - (pageHeight >= webHeight ? (pageHeight - webHeight) : 0)}`);
          } else {
            // case3：网页未发生过滚动时，可直接使用ScrollOffset.y
            console.log(`get scroll offsetY = ${this.controllerY}`);
          }
        })
        .height(600)
    }
    .width('100%')
    .height('100%')
  }
}