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
import { Driver, ON, UiDirection, BY, UiDriver } from '@ohos.UiTest';
import events_emitter from '@ohos.events.emitter';

@Entry
@Component
struct scrollEventComponent {
  controller: web_webview.WebviewController = new web_webview.WebviewController();
  @State xOffset: number = 0;
  @State yOffset: number = 0;
  @State str: string = "scroll01";
  onPageShow() {
    let valueChangeEvent: events_emitter.InnerEvent = {
      eventId: 10,
      priority: events_emitter.EventPriority.LOW
    }
    events_emitter.on(valueChangeEvent, this.valueChangeCallBack)
  }

  private valueChangeCallBack = (eventData: events_emitter.EventData) => {
    if (eventData != null) {
      if (eventData.data?.ACTION != null) {
        this.str = eventData.data?.ACTION;
      }
    }
  }
  build() {
    Column() {

      Row() {
        Button("web test").key('scrollEvent01').onClick(async () => {
          console.info("key==>" + this.str)
          switch (this.str) {
            case "scroll01": {
              let driver: Driver = await Driver.create()
              let button = await driver.findComponent(ON.id('scrollToButton'));
              await button.click();
              await Utils.sleep(1000);
              Utils.emitEvent(this.xOffset,20241225);
              await Utils.sleep(1000);
              this.controller.scrollTo(0, 0, 0);
              break;
            }

            case "scroll02": {
              let driver: Driver = await Driver.create()
              let button = await driver.findComponent(ON.id('scrollByButton'));
              await button.click();
              await Utils.sleep(1000);
              Utils.emitEvent(this.xOffset,20241226);
              await Utils.sleep(1000);
              break;
            }
          }
        })
      }
      Button('scrollTo')
        .onClick(() => {
          try {
            this.controller.scrollTo(50, 50, -500);
          } catch (error) {
            console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
          }
        }).key('scrollToButton')
      Button('scrollBy')
        .onClick(() => {
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

    }
  }
}
