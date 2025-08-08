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

@Entry
@Component
struct webFantasyFont {
  @State str: string = ""
  @State minFontSize: number = 8
  @State defaultFontSize: number = 13
  @State minLogicalFontSize: number = 8
  controller: webView.WebviewController = new webView.WebviewController();
  @State family: string = "fantasy";
  @State family2: string = "cursive";

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
          console.info("key==>" + this.str)
          switch (this.str) {
            case "emitWebFantasyFont001": {
              await Utils.sleep(1000);
              Utils.emitEvent(CopyOptions.None, 20253322)
              break;
            }

          }
        })
      }

      Web({ src: 'www.baidu.com', controller: this.controller })
        .webFantasyFont(this.family)
        .webCursiveFont(this.family2)
        .copyOptions(CopyOptions.None)

    }
  }
}
