/*
 * Copyright (c) 2023 Huawei Device Co., Ltd.
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

@Entry
@Component
struct WebViewStressWebViewController {
  @State str: string = ""
  @State stressTimes: number = 0;
  @State startTime: number = 0
  @State endTime: number = 0
  @State callBackId: number = 0
  @State denyState: boolean = true
  @State userAgent: string = 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/39.0.2171.71 Safari/537.36'
  handler: FullScreenExitHandler | null = null
  dialogController: CustomDialogController | null = null
  popController: webView.WebviewController | null = null;
  controller: webView.WebviewController = new webView.WebviewController();
  @State buttonKey: string = '';

  onPageShow() {
    Utils.registerEventPage((eventData: events_emitter.EventData) => {
      if (eventData.data) {
        this.str = eventData.data.CASE_NAME;
        this.callBackId = eventData.data.CALL_BACK_ID;
        this.stressTimes = eventData.data.STRESS_TIMES;
        this.buttonKey = eventData.data.BUTTON_KEY
      }
    })
  }

  onPageHide() {
    Utils.unRegisterEventPage()
  }

  build() {
    Column() {
      Row() {
        Button(this.buttonKey)
          .key(this.buttonKey)
          .onClick(async () => {
            console.info("key==>" + this.str)
            switch (this.str) {
              case "testWebViewControllerGetCustomUserAgent001": {
                try {
                  for (let i = 0; i < this.stressTimes; i++) {
                    this.controller.getCustomUserAgent()
                    Utils.stressingLog('WebViewController.getCustomUserAgent()', i + 1, this.stressTimes)
                  }
                  Utils.emitEvent(true, this.callBackId)
                } catch (error) {
                  console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                  Utils.emitEvent(false, this.callBackId)
                }
                break;
              }
              case "testWebViewControllerGetPageHeight001": {
                try {
                  for (let i = 0; i < this.stressTimes; i++) {
                    this.controller.getPageHeight()
                    Utils.stressingLog('WebViewController.getPageHeight()', i + 1, this.stressTimes)
                  }
                  Utils.emitEvent(true, this.callBackId)
                } catch (error) {
                  console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                  Utils.emitEvent(false, this.callBackId)
                }
                break;
              }
              case "testWebViewControllerGetTitle001": {
                try {
                  for (let i = 0; i < this.stressTimes; i++) {
                    this.controller.getTitle()
                    Utils.stressingLog('WebViewController.getTitle()', i + 1, this.stressTimes)
                  }
                  Utils.emitEvent(true, this.callBackId)
                } catch (error) {
                  console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                  Utils.emitEvent(false, this.callBackId)
                }
                break;
              }
              case "testWebViewControllerGetUserAgent001": {
                try {
                  for (let i = 0; i < this.stressTimes; i++) {
                    this.controller.getUserAgent()
                    Utils.stressingLog('WebViewController.getUserAgent()', i + 1, this.stressTimes)
                  }
                  Utils.emitEvent(true, this.callBackId)
                } catch (error) {
                  console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                  Utils.emitEvent(false, this.callBackId)
                }
                break;
              }
              case "testWebViewControllerGetWebId001": {
                try {
                  for (let i = 0; i < this.stressTimes; i++) {
                    this.controller.getWebId()
                    Utils.stressingLog('WebViewController.getWebId()', i + 1, this.stressTimes)
                  }
                  Utils.emitEvent(true, this.callBackId)
                } catch (error) {
                  console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                  Utils.emitEvent(false, this.callBackId)
                }
                break;
              }
              case "testWebViewControllerSearchNext001": {
                try {
                  for (let i = 0; i < this.stressTimes; i++) {
                    this.controller.searchNext(true)
                    Utils.stressingLog('WebViewController.searchNext()', i + 1, this.stressTimes)
                  }
                  Utils.emitEvent(true, this.callBackId)
                } catch (error) {
                  console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                  Utils.emitEvent(false, this.callBackId)
                }
                break;
              }
              case "testWebViewControllerSetCustomUserAgent001": {
                try {
                  for (let i = 0; i < this.stressTimes; i++) {
                    this.controller.setCustomUserAgent("userAgent")
                    Utils.stressingLog('WebViewController.setCustomUserAgent()', i + 1, this.stressTimes)
                  }
                  Utils.emitEvent(true, this.callBackId)
                } catch (error) {
                  console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                  Utils.emitEvent(false, this.callBackId)
                }
                break;
              }
              case "testWebViewControllerSearchAllAsync001": {
                try {
                  for (let i = 0; i < this.stressTimes; i++) {
                    this.controller.searchAllAsync("index")
                    Utils.stressingLog('WebViewController.searchAllAsync()', i + 1, this.stressTimes)
                  }
                  Utils.emitEvent(true, this.callBackId)
                } catch (error) {
                  console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                  Utils.emitEvent(false, this.callBackId)
                }
                break;
              }
              case "testWebViewControllerHasImage001": {
                this.controller.loadUrl($rawfile('hasImageOne.html'))
                try {
                  for (let i = 0; i < this.stressTimes; i++) {
                    this.controller.hasImage((error, data) => {
                      if (error) {
                        console.info(`hasImageCbOnline error: ` + JSON.stringify(error))
                        return;
                      }
                      console.info("hasImageCbOnline: " + data);
                    });
                    Utils.stressingLog('WebViewController.hasImage()', i + 1, this.stressTimes)
                  }
                  Utils.emitEvent(true, this.callBackId)
                } catch (error) {
                  console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                  Utils.emitEvent(false, this.callBackId)
                }
                break;
              }

              case "testWebViewControllerGetItemAtIndex001": {
                try {
                  for (let i = 0; i < this.stressTimes; i++) {
                    this.controller.getBackForwardEntries().getItemAtIndex(0)
                    Utils.stressingLog('WebViewController.getItemAtIndex()', i + 1, this.stressTimes)
                  }
                  Utils.emitEvent(true, this.callBackId)
                } catch (error) {
                  console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                  Utils.emitEvent(false, this.callBackId)
                }
                break;
              }
            }
          })
      }

      Web({ src: $rawfile("indexJru.html"), controller: this.controller })
        .javaScriptAccess(true)
        .geolocationAccess(true)
        .databaseAccess(true)
    }
  }
}
