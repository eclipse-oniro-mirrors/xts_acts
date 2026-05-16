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
import { ON } from '@ohos.UiTest';
import business_error, { BusinessError } from '@ohos.base';
import { waitForExist } from '../../test/WaitTest.test';
@Entry
@Component
struct WebViewEnumAndFontLibrary {
  controller: webView.WebviewController = new webView.WebviewController();
  @State str: string = ""
  @State fontSize: number = 13
  @State zoomCount: number = 100
  @State isComplete: number = -1;
  @State isReceive: number = -1;
  onPageShow() {
    let valueChangeEvent: events_emitter.InnerEvent = {
      eventId: 153230,
      priority: events_emitter.EventPriority.LOW
    }
    events_emitter.on(valueChangeEvent, this.valueChangeCallBack)
  }

  onPageHide() {
    events_emitter.off(153230)
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
        Button("web click").key('buttonEnumAndFontLibrary').onClick(async () => {
          console.info("key==>" + this.str)
          await waitForExist(() => this.isComplete, this.str, 0);
          await waitForExist(() => this.isReceive, this.str, 0);
          this.isReceive = -1;
          switch (this.str) {
            case "emitTextZoomRatio": {
              this.fontSize = 13
              this.zoomCount = 150
              this.isComplete = -1;
              this.controller.loadUrl("resource://rawfile/indexJru.html")
              await waitForExist(() => this.isComplete, this.str, 0);
              this.controller.runJavaScript("getFontSize()", async (error, result) => {
                let changeFontSize = this.fontSize * 1.5 + 'px'
                let changeResult = result.substring(1, result.length - 1)
                console.log("changeFontSize >>>", changeFontSize, "result >>>", changeResult)
                console.log("font-size :" + changeFontSize + "result :" + changeResult + error)
                if (changeResult == changeFontSize) {
                  Utils.emitEvent(true, 153240)
                }
              })
              break;
            }
          }
        })
      }

      Web({ src: $rawfile("indexJru.html"), controller: this.controller })
        .wideViewModeAccess(true)
        .overviewModeAccess(true)
        .textZoomAtio(this.zoomCount)
        .textZoomRatio(this.zoomCount)
        .defaultFontSize(this.fontSize)
        .key("webCenter")
        .onPageEnd((event) => {
          console.log('web pageEnd==>' + event.url);
          this.isComplete = 0;
        })
    }
  }
}
