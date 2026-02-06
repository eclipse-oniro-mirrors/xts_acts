/*
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
import { picker } from '@kit.CoreFileKit';
import Utils from '../../test/Utils.test';
import webView from '@ohos.web.webview';
import events_emitter from '@ohos.events.emitter';
import image from '@ohos.multimedia.image';
import { Hypium } from '@ohos/hypium';
import { waitForExist} from '../../test/WaitTest.test';
import { AbilityConstant, Configuration, ConfigurationConstant, UIAbility, Want } from '@kit.AbilityKit';
import { webview } from '@kit.ArkWeb';
import { pasteboard } from '@kit.BasicServicesKit';
import { Driver, MouseButton, UiWindow, ON, On } from '@kit.TestKit';
const EVENT_ID_SET_SUITE_KEY = 183128;
let driver = Driver.create();

@Entry
@Component
struct webViewController {
  controller: webview.WebviewController = new webview.WebviewController();
  @State str: string = ""
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
      Row() {
        Button("WebViewController click").key('WebViewOnTextSelectionChangeButton').onClick(async () => {
          console.info("key==>" + this.str)
          await Utils.waitForExist(()=>this.isReceive, this.str+' isReceive', 1, 1000);
          await Utils.waitForExist(()=>this.isPageEnd, this.str+' isPageEnd', 1, 1000);
          switch (this.str) {
            case "emitOnTextSelectionChange01": {
                this.isPageEnd = -1
                this.controller.loadUrl("https://www-file.huawei.com/minisite/media/annual_report/annual_report_2022_cn.pdf")
                await Utils.waitForExist(()=>this.isPageEnd, this.str+' isPageEnd', 1, 1000);
                Utils.emitEvent("onTextSelectionChange", 202601211);
                break;
            }

            case "emitOnTextSelectionChange02": {
              this.isPageEnd = -1
              this.controller.loadUrl("https://www-file.huawei.com/minisite/media/annual_report/annual_report_2022_cn.pdf")
              await Utils.waitForExist(()=>this.isPageEnd, this.str+' isPageEnd', 1, 1000);
              Utils.emitEvent("selectionText", 202601212);
              break;
            }

          }
        })
      }

      Web({ src: 'https://www-file.huawei.com/minisite/media/annual_report/annual_report_2022_cn.pdf', controller: this.controller })
        .width('100%')
        .height('50%%')
        .onTextSelectionChange((selectionText: string) => {
          console.log(`Selected text: "${selectionText}"`);
        })
        .onPageEnd((event) => {
          console.log('onPageEnd')
          this.isPageEnd = 1
        })


    }
    .key('RowSize')

  }
}

