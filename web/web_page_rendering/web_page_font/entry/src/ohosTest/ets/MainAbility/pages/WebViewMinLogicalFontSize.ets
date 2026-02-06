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
import {waitForExist} from '../../test/WaitTest.test';

@Entry
@Component
struct WebViewMinLogicalFontSize {
  @State str: string = ""
  @State minFontSize: number = 8
  @State defaultFontSize: number = 13
  @State minLogicalFontSize: number = 8
  controller: webView.WebviewController = new webView.WebviewController();
  @State isReceive: number = -1;
  @State isPageEnd: number = -1;

  onPageShow() {
    let valueChangeEvent: events_emitter.InnerEvent = {
      eventId: 150420,
      priority: events_emitter.EventPriority.LOW
    }
    events_emitter.on(valueChangeEvent, this.valueChangeCallBack)
  }

  onPageHide() {
    events_emitter.off(150420)
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

  build() {
    Column() {
      Row() {
        Button("WebViewMinLogicalFontSizeTestButton").key('WebViewMinLogicalFontSizeTestButton').onClick(async () => {
          await waitForExist(() => this.isPageEnd, this.str, 0);
          await waitForExist(() => this.isReceive, this.str, 0);
          this.isReceive = -1;
          console.info("key==>" + this.str)
          switch (this.str) {
            case "emitMinLogicalFontSize": {
              this.minLogicalFontSize = 5
              this.minFontSize = 4
              this.defaultFontSize = 3
              this.isPageEnd = -1;
              this.controller.refresh();
              await waitForExist(() => this.isPageEnd, this.str, 0);
              this.controller.runJavaScript('getFontSize()', (error, result) => {
                console.log(' return data => ', result, error)
                if (result == '"5px"') {
                  Utils.emitEvent(true, 150430)
                }
              })
              break;
            }

            case "emitMinLogicalFontSizeMin": {
              this.minLogicalFontSize = 0.5
              this.minFontSize = 0.4
              this.defaultFontSize = 0.3
              this.isPageEnd = -1;
              this.controller.refresh();
              await waitForExist(() => this.isPageEnd, this.str, 0);
              this.controller.runJavaScript('getFontSize()', (error, result) => {
                console.log(' return data => ', result, error)
                if (result == '"1px"') {
                  Utils.emitEvent(true, 150440)
                }
              })
              break;
            }
            case "emitMinLogicalFontSizeMax": {
              this.minLogicalFontSize = 75
              this.minFontSize = 74
              this.defaultFontSize = 73
              this.isPageEnd = -1;
              this.controller.refresh();
              await waitForExist(() => this.isPageEnd, this.str, 0);
              this.controller.runJavaScript('getFontSize()', (error, result) => {
                console.log(' return data => ', result, error)
                if (result == '"72px"') {
                  Utils.emitEvent(true, 150450)
                }
              })
              break;
            }
          }
        })
      }


      Web({ src: $rawfile("indexJru.html"), controller: this.controller })
        .minLogicalFontSize(this.minLogicalFontSize)
        .defaultFontSize(this.defaultFontSize)
        .minFontSize(this.minFontSize)
        .javaScriptAccess(true)
        .onPageEnd((event) => {
            if (event) {
              this.isPageEnd = 0;
              console.log('onPageEnd url:' + event.url);
            }
          })

    }
  }
}
