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
import events_emitter from '@ohos.events.emitter';
import { Driver, ON } from '@kit.TestKit';

const EVENT_ID_SET_SUITE_KEY = 179201;
let driver: Driver = Driver.create();

@Entry
@Component
struct scrollEventComponent {
  controller: web_webview.WebviewController = new web_webview.WebviewController();
  @State xOffset: number = 0;
  @State yOffset: number = 0;
  @State str: string = "scroll01";
  @State isPageEnd: number = -1;
  @State isReceive: number = -1;
  @State flag: boolean = false;
  @State emitEventId: number = 179210;

  onPageShow() {
    let valueChangeEvent: events_emitter.InnerEvent = {
      eventId: EVENT_ID_SET_SUITE_KEY,
      priority: events_emitter.EventPriority.LOW
    }
    events_emitter.on(valueChangeEvent, this.valueChangeCallBack)
  }

  private valueChangeCallBack = (eventData: events_emitter.EventData) => {
    if (eventData != null) {
      if (eventData.data?.ACTION != null) {
        this.str = eventData.data?.ACTION;
        this.isReceive = 1;
      }
    }
  }

  onPageHide() {
    events_emitter.off(EVENT_ID_SET_SUITE_KEY)
  }

  build() {
    Column() {

      Row() {
        Button("web test").key('scrollEvent01').onClick(async () => {
          console.info("key==>" + this.str)
          await Utils.waitForExist(()=>this.isReceive, this.str+' isReceive', 1, 1000);
          await Utils.waitForExist(()=>this.isPageEnd, this.str+' isPageEnd', 1, 1000);
          switch (this.str) {
            case "scroll01": {
              this.flag = true
              await Utils.waitForReleaseDriver(this.str,driver)
              let button = await driver.findComponent(ON.id('scrollToButton'));
              await button.click();
              await Utils.waitForReleaseDriver(this.str,driver)
              await Utils.waitForScrollStop(()=>this.controller.getPageOffset().y, this.str+' webYOffset');
              Utils.emitEvent(this.xOffset,this.emitEventId);
              break;
            }

            case "scroll02": {
              this.emitEventId = 179220
              this.flag = true
              this.controller.scrollTo(0, 0, 0);
              await Utils.waitForScrollStop(()=>this.controller.getPageOffset().y, this.str+' webYOffset');
              let button = await driver.findComponent(ON.id('scrollByButton'));
              await button.click();
              await Utils.waitForReleaseDriver(this.str,driver)
              await Utils.waitForScrollStop(()=>this.controller.getPageOffset().y, this.str+' webYOffset');
              Utils.emitEvent(this.xOffset,this.emitEventId);
              break;
            }
          }
        })
      }
      Button('scrollTo')
        .onClick(() => {
          console.log('==>scrollTo');
          try {
            this.controller.scrollTo(50, 50, -500);
          } catch (error) {
            console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
          }
        }).key('scrollToButton')
      Button('scrollBy')
        .onClick(() => {
          console.log('==>scrollBy');
          try {
            this.controller.scrollBy(80, 80, 100);
          } catch (error) {
            console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
          }
        }).key('scrollByButton')
       Web({ src: $rawfile('scrollEvent.html'), controller: this.controller })
        .onScroll((event) => {
          this.xOffset = event.xOffset;
          this.yOffset = event.yOffset;
          console.info("x = " + event.xOffset);
          console.info("y = " + event.yOffset);
        })
        .onPageEnd((event) => {
          console.log('onPageEnd url:' + event.url);
          this.isPageEnd = 1;
        })

    }
  }
}




