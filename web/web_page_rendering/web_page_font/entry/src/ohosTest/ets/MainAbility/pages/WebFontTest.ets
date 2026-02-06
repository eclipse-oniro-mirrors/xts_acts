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

import webView from '@ohos.web.webview';
import Utils from '../../test/Utils';
import events_emitter from '@ohos.events.emitter';
import {waitForExist} from '../../test/WaitTest.test';

@Entry
@Component
struct WebFontTest {
  controller: webView.WebviewController = new webView.WebviewController();
  @State str: string = ""
  @State font: string = 'serif'
  @State defaultFixedFontSize: number = 72
  @State isReceive: number = -1;
  @State isPageEnd: number = -1;


  onPageShow() {
    let valueChangeEvent: events_emitter.InnerEvent = {
      eventId: 150140,
      priority: events_emitter.EventPriority.LOW
    }
    events_emitter.on(valueChangeEvent, this.valueChangeCallBack)
  }

  onPageHide() {
    events_emitter.off(150140)
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
    Row() {
      Column() {
        Button("WebFontTestButton")
          .key('WebFontTestButton')
          .onClick(async () => {
          await waitForExist(() => this.isPageEnd, this.str, 0);
          await waitForExist(() => this.isReceive, this.str, 0);
          this.isReceive = -1;
            console.info("key==>" + this.str)
            switch (this.str) {
              case "testWebStandardFont001": {
                try {
                  this.font = 'serif'
                  this.isPageEnd = -1;
                  this.controller.refresh();
                  await waitForExist(() => this.isPageEnd, this.str, 0);
                  this.isPageEnd = -1;
                  this.controller.loadUrl("resource://rawfile/font.html");
                  await waitForExist(() => this.isPageEnd, this.str, 0);
                  this.controller.runJavaScript("getFontFamily()", (error, result) => {
                    if (error) {
                      console.info('getFontFamily() return error: ' + error)
                    }
                    if (result) {
                      console.info('getFontFamily() return result: ' + result)
                      Utils.emitEvent(result, 150150)
                    }
                  })
                } catch (error) {
                  console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                  Utils.emitEvent('', 150150)
                }
                break;
              }
              case "testWebStandardFont002": {
                try {
                  this.font = 'monospace'
                  this.isPageEnd = -1;
                  this.controller.refresh();
                  await waitForExist(() => this.isPageEnd, this.str, 0);
                  this.isPageEnd = -1;
                  this.controller.loadUrl("resource://rawfile/font.html");
                  await waitForExist(() => this.isPageEnd, this.str, 0);
                  this.controller.runJavaScript("getFontFamily()", (error, result) => {
                    if (error) {
                      console.info('getFontFamily() return error: ' + error)
                    }
                    if (result) {
                      console.info('getFontFamily() return result: ' + result)
                      Utils.emitEvent(result, 150160)
                    }
                  })
                } catch (error) {
                  console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                  Utils.emitEvent('', 150160)
                }
                break;
              }
              case "testWebStandardFont003": {
                try {
                  this.font = 'Helvetica'
                  this.isPageEnd = -1;
                  this.controller.refresh();
                  await waitForExist(() => this.isPageEnd, this.str, 0);
                  this.isPageEnd = -1;
                  this.controller.loadUrl("resource://rawfile/font.html");
                  await waitForExist(() => this.isPageEnd, this.str, 0);
                  this.controller.runJavaScript("getFontFamily()", (error, result) => {
                    if (error) {
                      console.info('getFontFamily() return error: ' + error)
                    }
                    if (result) {
                      console.info('getFontFamily() return result: ' + result)
                      Utils.emitEvent(result, 150170)
                    }
                  })
                } catch (error) {
                  console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                  Utils.emitEvent('', 150170)
                }
                break;
              }
              case "testWebStandardFont004": {
                try {
                  this.font = 'Arial'
                  this.isPageEnd = -1;
                  this.controller.refresh();
                  await waitForExist(() => this.isPageEnd, this.str, 0);
                  this.isPageEnd = -1;
                  this.controller.loadUrl("resource://rawfile/font.html");
                  await waitForExist(() => this.isPageEnd, this.str, 0);
                  this.controller.runJavaScript("getFontFamily()", (error, result) => {
                    if (error) {
                      console.info('getFontFamily() return error: ' + error)
                    }
                    if (result) {
                      console.info('getFontFamily() return result: ' + result)
                      Utils.emitEvent(result, 150180)
                    }
                  })
                } catch (error) {
                  console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                  Utils.emitEvent('', 150180)
                }
                break;
              }
              case "testWebStandardFont005": {
                try {
                  this.font = 'sans serif'
                  this.isPageEnd = -1;
                  this.controller.refresh();
                  await waitForExist(() => this.isPageEnd, this.str, 0);
                  this.isPageEnd = -1;
                  this.controller.loadUrl("resource://rawfile/font.html");
                  await waitForExist(() => this.isPageEnd, this.str, 0);
                  this.controller.runJavaScript("getFontFamily()", (error, result) => {
                    if (error) {
                      console.info('getFontFamily() return error: ' + error)
                    }
                    if (result) {
                      console.info('getFontFamily() return result: ' + result)
                      Utils.emitEvent(result, 150190)
                    }
                  })
                } catch (error) {
                  console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                  Utils.emitEvent('', 150190)
                }
                break;
              }
            }
          })

        Web({ src: $rawfile('index.html'), controller: this.controller })
          .height('50%')
          .width('100%')
          .webStandardFont(this.font)
          .defaultFixedFontSize(this.defaultFixedFontSize)
          .javaScriptAccess(true)
          .geolocationAccess(true)
          .databaseAccess(true)
          .onPageEnd((event) => {
            if (event) {
              this.isPageEnd = 0;
              console.log('onPageEnd url:' + event.url);
            }
          })
      }
      .width('100%')
    }

    .height('100%')
  }
}