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
        Button("web click").key('buttonEnumAndFontLibrary').onClick(async () => {
          console.info("key==>" + this.str)
          switch (this.str) {
            case "emitDefaultFontSize": {
              this.controller.runJavaScript("getFontSize()", async (error, result) => {
                console.log("error" + error)
                Utils.emitEvent(result, 1202)
              })
              break;
            }
            case "emitDefaultFontSizeMax": {
              this.fontSize = 75
              await Utils.sleep(2000);
              this.controller.runJavaScript("getFontSize()", async (error, result) => {
                console.log("error" + error)
                Utils.emitEvent(result, 1203)
              })
              break;
            }
            case "emitDefaultFontSizeMin": {
              this.fontSize = -5
              await Utils.sleep(2000);
              this.controller.runJavaScript("getFontSize()", async (error, result) => {
                console.log("error" + error)
                Utils.emitEvent(result, 1204)
              })
              break;
            }
            case "emitMinFontSize": {
              this.minFontSize = 18
              this.controller.loadUrl("resource://rawfile/indexFontSize.html")
              await Utils.sleep(2000);
              this.controller.runJavaScript("getPageFontSize()", (error, result) => {
                console.log("error" + error)
                let count: number = Number(result)
                if (this.minFontSize > 13 && this.minFontSize == count) {
                  Utils.emitEvent(Number(result), 1205)
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
    }
  }
}
