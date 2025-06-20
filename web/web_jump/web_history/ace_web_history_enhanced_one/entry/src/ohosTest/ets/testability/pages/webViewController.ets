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
import { JsProxyObject } from '../../test/Interfaces';
import image from '@ohos.multimedia.image';
import { Driver } from '@ohos.UiTest';

@Entry
@Component
struct webViewController {
  controller: webView.WebviewController = new webView.WebviewController();
  @State str: string = ""
  @State onScrollCallBack: boolean = false
  @State javaScriptAccess: boolean = true
  @State icon: image.PixelMap | undefined = undefined;
  @State onShowFileSelectorCallBack: boolean = false
  @State FileSelectorParamGetTitle: string = ''
  @State FileSelectorParamGetGetMode: number = 100
  @State FileSelectorParamGetGetAcceptType: Array<String> = []
  @State uri: string = "file://docs/storage/Users/currentUser/Documents/1.json";
  @State FileSelectorParamGetIsCapture: boolean = true
  @State FileSelectorResultHandleFileList: Array<String> = []
  @State enterPageEnd: boolean = false
  @State onOverScrollCallBack: boolean = false
  @State darkMode: WebDarkMode = WebDarkMode.Off
  @State forceDarkAccess: boolean = false
  @State userAgentPC:string = "";
  no_error: string = "no error happened"

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
  private jsObj: JsProxyObject = {
    test: (res: object) => {
      Utils.emitEvent(String(res), 102);
    },
    toString: (str: string) => {
      console.info("ets toString:" + String(str));
    },
    register: (res: object) => {
      Utils.emitEvent(String(res), 86);
      return "web222"
    }
  }

  build() {
    Column() {
      Row() {
        Button("WebViewController click").key('WebViewControllerButton').onClick(async () => {
          console.info("key==>" + this.str)
          let webRect = Utils.getComponentRect('RowSize');
          let X = Utils.getRectHorizontalCenterX(webRect)
          let Y = Utils.getRectVerticalCenterY(webRect)
          switch (this.str) {

            case "testHistoryItemIcon001": {
              try {
                this.controller.loadUrl("resource://rawfile/HistoryItem.html");
                await Utils.sleep(2000);
                let list = this.controller.getBackForwardEntries();
                let historyItem = list.getItemAtIndex(list.currentIndex);
                console.log("HistoryItem: " + JSON.stringify(historyItem));
                this.icon = historyItem.icon;
                if (this.icon != null) {
                  Utils.emitEvent(true, 31023)
                }
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                Utils.emitEvent(error.code, 31023)
              }
              break;
            }


            case "testHistoryItemHistoryUrl001": {
              try {
                let historyItemString: string = ' '
                this.controller.loadUrl("resource://rawfile/HistoryItem.html");
                await Utils.sleep(2000);
                let list = this.controller.getBackForwardEntries();
                let historyItem = list.getItemAtIndex(list.currentIndex);
                console.log("HistoryItem: " + JSON.stringify(historyItem));
                historyItemString = historyItem.historyUrl;
                Utils.emitEvent(historyItemString, 31024)
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                Utils.emitEvent(error.code, 31024)
              }
              break;
            }

            case "testHistoryRawUrl001": {
              try {
                let historyItemRawUrl: string = ' '
                this.controller.loadUrl("resource://rawfile/HistoryItem.html");
                await Utils.sleep(2000);
                let list = this.controller.getBackForwardEntries();
                let historyItem = list.getItemAtIndex(list.currentIndex);
                console.log("HistoryItem: " + JSON.stringify(historyItem));
                historyItemRawUrl = historyItem.historyRawUrl;
                Utils.emitEvent(historyItemRawUrl, 31025)
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                Utils.emitEvent(error.code, 31025)
              }
              break;
            }

            case "testHistoryItemTitle001": {
              try {
                let historyItemTitle: string = ' '
                this.controller.loadUrl("resource://rawfile/HistoryItem.html");
                await Utils.sleep(2000);
                let list = this.controller.getBackForwardEntries();
                let historyItem = list.getItemAtIndex(list.currentIndex);
                console.log("HistoryItem: " + JSON.stringify(historyItem));
                historyItemTitle = historyItem.title;
                Utils.emitEvent(historyItemTitle, 31026)
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                Utils.emitEvent(error.code, 31026)
              }
              break;
            }

            case "testBackForwardListCurrentIndex001": {
              try {
                this.controller.clearHistory()
                await Utils.sleep(2000);
                this.controller.loadUrl("resource://rawfile/HistoryItem.html");
                await Utils.sleep(2000);
                let list = this.controller.getBackForwardEntries();
                Utils.emitEvent(list.currentIndex, 31027)
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                Utils.emitEvent(error.code, 31027)
              }
              break;
            }

            case "testBackForwardListCurrentSize001": {
              try {
                this.controller.clearHistory()
                await Utils.sleep(2000);
                this.controller.loadUrl("resource://rawfile/HistoryItem.html");
                await Utils.sleep(2000);
                let list = this.controller.getBackForwardEntries();
                Utils.emitEvent(list.size, 31028)
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                Utils.emitEvent(error.code, 31028)
              }
              break;
            }

          }
        })
      }

      Web({ src: $rawfile('index.html'), controller: this.controller })
        .javaScriptAccess(this.javaScriptAccess)
        .key("onShowFileSelectorKey")
        .javaScriptProxy({
          object: this.jsObj,
          name: "backToEts",
          methodList: ["test", "toString"],
          controller: this.controller
        })
        .fileAccess(true)
        .darkMode(this.darkMode)
        .forceDarkAccess(this.forceDarkAccess)
    }
    .key('RowSize')
  }
}
