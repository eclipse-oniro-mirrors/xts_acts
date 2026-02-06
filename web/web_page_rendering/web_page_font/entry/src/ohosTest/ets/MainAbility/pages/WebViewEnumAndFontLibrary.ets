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
import { Driver, ON } from '@ohos.UiTest';
import business_error, { BusinessError } from '@ohos.base';
import {waitForExist} from '../../test/WaitTest.test';


@Entry
@Component
struct WebViewEnumAndFontLibrary {
  controller: webView.WebviewController = new webView.WebviewController();
  @State str: string = ""
  @State count: string = ""
  @State javaScriptAccess: boolean = true
  @State fontSize: number = 13
  @State minFontSize: number = 1
  @State zoomCount: number = 100
  @State minLogicalFontSize: number = 13
  @State databaseAccess: boolean = true
  @State isReceive: number = -1;
  @State isPageEnd: number = -1;

  onPageShow() {
    let valueChangeEvent: events_emitter.InnerEvent = {
      eventId: 150350,
      priority: events_emitter.EventPriority.LOW
    }
    events_emitter.on(valueChangeEvent, this.valueChangeCallBack)
  }

  onPageHide() {
    events_emitter.off(150350)
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
          await waitForExist(() => this.isPageEnd, this.str, 0);
          await waitForExist(() => this.isReceive, this.str, 0);
          this.isReceive = -1;
          console.info("key==>" + this.str)
          switch (this.str) {
            case "emitDefaultFontSize": {
              this.controller.runJavaScript("getFontSize()", async (error, result) => {
                console.log("error" + error)
                Utils.emitEvent(result, 150360)
              })
              break;
            }
            case "emitDefaultFontSizeMax": {
              this.fontSize = 75
              this.isPageEnd = -1;
              this.controller.refresh();
              await waitForExist(() => this.isPageEnd, this.str, 0);
              this.controller.runJavaScript("getFontSize()", async (error, result) => {
                console.log("error" + error)
                Utils.emitEvent(result, 150370)
              })
              break;
            }
            case "emitDefaultFontSizeMin": {
              this.fontSize = -5
              this.isPageEnd = -1;
              this.controller.refresh();
              await waitForExist(() => this.isPageEnd, this.str, 0);
              this.controller.runJavaScript("getFontSize()", async (error, result) => {
                console.log("error" + error)
                Utils.emitEvent(result, 150380)
              })
              break;
            }
            case "emitMinFontSize": {
              this.minFontSize = 18
              this.isPageEnd = -1;
              this.controller.loadUrl("resource://rawfile/indexFontSize.html")
              await waitForExist(() => this.isPageEnd, this.str, 0);
              this.controller.runJavaScript("getPageFontSize()", (error, result) => {
                console.log("error" + error)
                let count: number = Number(result)
                if (this.minFontSize > 13 && this.minFontSize == count) {
                  Utils.emitEvent(Number(result), 150390)
                  this.minFontSize = 13
                }
              })
              break;
            }
          }
        })
      }

      Web({ src: $rawfile("indexJru.html"), controller: this.controller })
        .password(true)
        .tableData(true)
        .wideViewModeAccess(true)
        .overviewModeAccess(true)
        .textZoomAtio(this.zoomCount)
        .textZoomRatio(this.zoomCount)
        .defaultFontSize(this.fontSize)
        .key("webCenter")
        .minFontSize(this.minFontSize)
        .minLogicalFontSize(this.minLogicalFontSize)
        .javaScriptAccess(this.javaScriptAccess)
        .fileAccess(true)
        .imageAccess(true)
        .domStorageAccess(false)
        .onlineImageAccess(false)
        .databaseAccess(this.databaseAccess)
        .onPageEnd((event) => {
            if (event) {
              this.isPageEnd = 0;
              console.log('onPageEnd url:' + event.url);
            }
          })
    }
  }
}
