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
// Index.ets
import { router } from '@kit.ArkUI'
import { BusinessError } from '@kit.BasicServicesKit'
import webView from '@ohos.web.webview';
import Window from '@ohos.window';
import common from '@ohos.app.ability.common';
import Utils from '../../test/Utils.test';
import { waitForExist} from '../../test/WaitTest.test';
import events_emitter from '@ohos.events.emitter';
import { Driver, ON,  Component } from '@ohos.UiTest';


@Entry
struct WebOnFirstContentfulPaint1 {
  webController: webView.WebviewController = new webView.WebviewController();
  @State message: string = 'Hello World'
  scroller: Scroller = new Scroller();
  @State changeColor: Color = Color.Red;
  @State isReceive: number = -1;
  @State str:string = ''

  onPageShow() {
    let valueChangeEvent: events_emitter.InnerEvent = {
      eventId: 10,
      priority: events_emitter.EventPriority.LOW
    }
    events_emitter.on(valueChangeEvent, this.valueChangeCallBack)
  }

  private valueChangeCallBack = (eventData: events_emitter.EventData) => {
    if (eventData != null) {
      console.info('valueChangeCallBack:' + JSON.stringify(eventData));
      if (eventData.data != null && eventData.data.ACTION != null) {
        this.str = eventData.data.ACTION;
        this.isReceive = 0;
      }
    }
  }

  build() {
    Scroll(this.scroller) {
      Column() {

        Button("web click")
          .key("WebEnableDataDetectorButton")
          .onClick(async () => {
            console.info("key==>" + this.str)
            await waitForExist(()=>this.isReceive, this.str, 0);
            switch (this.str) {
              case "emitWebEnableDataDetector": {
                try {
                  if(!canIUse('SystemCapability.UIDesign.HDSPattern.Standard')) {
                    Utils.emitEvent(true, 20250607)
                  } else {
                    let driver: Driver = Driver.create();
                    let buttonOne = await driver.findComponent(ON.text('customer.support@example.com'));
                    if (buttonOne) {
                      Utils.emitEvent(true, 20250607)
                    } else {
                      Utils.emitEvent(false, 20250607)
                    }
                  }
                } catch (error) {
                  console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                }
                break;
              }

            }
          })


        Web({ src: $rawfile("index.html"), controller: this.webController })
          .enableDataDetector(true)
          .dataDetectorConfig({
            types: [0, 1, 2, 3, 4],
            color: this.changeColor,
            decoration: {
              type: TextDecorationType.LineThrough,
              color: Color.Green,
              style: TextDecorationStyle.WAVY
            }
          })
          .offset({x: 0, y: 0})
      }
      .width('100%')
    }
    .backgroundColor(0xDCDCDC)
    .scrollable(ScrollDirection.Vertical) // 滚动方向为垂直方向
    .scrollBar(BarState.On) // 滚动条常驻显示
    .scrollBarColor(Color.Gray) // 滚动条颜色
    .scrollBarWidth(10) // 滚动条宽度
    .edgeEffect(EdgeEffect.Spring) // 滚动到边沿后回弹
  }
}
