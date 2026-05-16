/*
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

import Utils from '../../test/Utils';
import webView from '@ohos.web.webview';
import events_emitter from '@ohos.events.emitter';
import business_error, { BusinessError } from '@ohos.base';
import {waitForExist} from '../../test/WaitTest.test';

@Entry
@Component
struct webFantasyFont {
  @State str: string = ""
  @State minFontSize: number = 8
  @State defaultFontSize: number = 13
  @State minLogicalFontSize: number = 8
  controller: webView.WebviewController = new webView.WebviewController();
  @State family: string|null|undefined = "fantasy";
  @State family2: string|null|undefined = "cursive";
  @State isReceive: number = -1;
  @State isPageEnd: number = -1;
  @State selectionMenuOptions :Array<ExpandedMenuItemOptions>|undefined|null = []

  onPageShow() {
    let valueChangeEvent: events_emitter.InnerEvent = {
      eventId: 150120,
      priority: events_emitter.EventPriority.LOW
    }
    events_emitter.on(valueChangeEvent, this.valueChangeCallBack)
  }

  onPageHide() {
    events_emitter.off(150120)
  }

  private valueChangeCallBack = (eventData: events_emitter.EventData) => {
    console.info("web page valueChangeCallBack");
    if (eventData != null) {
      console.info("valueChangeCallBack:" + JSON.stringify(eventData));
      if (eventData.data != null && eventData.data.ACTION != null) {
        this.str = eventData.data.ACTION;
        this.isReceive = 0;
      }
    }
  }
  aboutToAppear(): void {
    try {
      webView.WebviewController.setWebDebuggingAccess(true);
      this.controller.prefetchPage('https://www.taobao.com');
    } catch (error) {
      console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
    }
  }

  build() {
    Column() {
      Row() {
        Button("WebViewWebFantasyFontButton").key('WebFantasyFontButton').onClick(async () => {
          await waitForExist(() => this.isPageEnd, this.str, 0);
          await waitForExist(() => this.isReceive, this.str, 0);
          this.isReceive = -1;
          console.info("key==>" + this.str)
          switch (this.str) {
            case "emitWebFantasyFont001": {
              this.isPageEnd = -1;
              this.controller.refresh();
              await waitForExist(() => this.isPageEnd, this.str, 0);
              Utils.emitEvent(CopyOptions.None, 150130)
              break;
            }
            case "emitWebFantasyFont002": {
              this.isPageEnd = -1;
              this.family=''
              this.controller.refresh();
              await waitForExist(() => this.isPageEnd, this.str, 0);
              Utils.emitEvent(CopyOptions.None, 121000)
              break;
            }
            case "emitWebFantasyFont003": {
              this.isPageEnd = -1;
              this.family=null
              this.controller.refresh();
              await waitForExist(() => this.isPageEnd, this.str, 0);
              Utils.emitEvent(true, 121010)
              break;
            }
            case "emitWebFantasyFont004": {
              this.isPageEnd = -1;
              this.family=undefined
              this.controller.refresh();
              await waitForExist(() => this.isPageEnd, this.str, 0);
              Utils.emitEvent(true, 121020)
              break;
            }
            case "emitWebCursiveFont005": {
              this.isPageEnd = -1;
              this.family2=''
              this.controller.refresh();
              await waitForExist(() => this.isPageEnd, this.str, 0);
              Utils.emitEvent(true, 121030)
              break;
            }
            case "emitWebCursiveFont006": {
              this.isPageEnd = -1;
              this.family2=null
              this.controller.refresh();
              await waitForExist(() => this.isPageEnd, this.str, 0);
              Utils.emitEvent(true, 121040)
              break;
            }
            case "emitWebCursiveFont007": {
              this.isPageEnd = -1;
              this.family2=undefined
              this.controller.refresh();
              await waitForExist(() => this.isPageEnd, this.str, 0);
              Utils.emitEvent(true, 121050)
              break;
            }

            case "emitWebCursiveFont008": {
              this.isPageEnd = -1;
              this.family  = 'fantasy'
              this.family2 = 'cursive'
              this.selectionMenuOptions = null
              this.controller.refresh();
              await waitForExist(() => this.isPageEnd, this.str, 0);
              Utils.emitEvent(true, 121060)
              break;
            }

            case "emitWebCursiveFont009": {
              this.isPageEnd = -1;
              this.selectionMenuOptions = undefined
              this.controller.refresh();
              await waitForExist(() => this.isPageEnd, this.str, 0);
              Utils.emitEvent(true, 121070)
              break;
            }
          }
        })
      }

      Web({ src: 'www.baidu.com', controller: this.controller })
        .webFantasyFont(this.family)
        .webCursiveFont(this.family2)
        .copyOptions(CopyOptions.None)
        .selectionMenuOptions(this.selectionMenuOptions)
        .onPageEnd((event) => {
          if (event) {
            this.isPageEnd = 0;
            console.log('onPageEnd url:' + event.url);
          }
        })

    }
  }
}
