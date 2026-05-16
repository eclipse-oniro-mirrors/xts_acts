
/**
 * Copyright (c) 2023 iSoftStone Information Technology (Group) Co.,Ltd.
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
struct webViewDefaultFontSizeWithMinLogical {
  @State str: string = ""
  controller: webView.WebviewController = new webView.WebviewController();
  @State family: string = "cursive";
  @State isReceive: number = -1;
  @State isPageEnd: number = -1;

  onPageShow() {
    let valueChangeEvent: events_emitter.InnerEvent = {
      eventId: 150204,
      priority: events_emitter.EventPriority.LOW
    }
    events_emitter.on(valueChangeEvent, this.valueChangeCallBack)
  }

  onPageHide() {
    events_emitter.off(150204)
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
    } catch (error) {
      console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
    }
  }

  build() {
    Column() {
      Row() {
        Button("WebCursiveFontButton").key('WebCursiveFontButton').onClick(async () => {
          await waitForExist(() => this.isPageEnd, this.str, 0);
          await waitForExist(() => this.isReceive, this.str, 0);
          this.isReceive = -1;
          console.info("key==>" + this.str)
          switch (this.str) {
            case "testWebCursiveFontCursive001": {
              try {
                this.family = 'cursive';
                this.isPageEnd = -1;
                this.controller.refresh();
                await waitForExist(() => this.isPageEnd, this.str, 0);
                this.isPageEnd = -1;
                this.controller.loadUrl("resource://rawfile/font.html");
                await waitForExist(() => this.isPageEnd, this.str, 0);
                this.controller.runJavaScript("getFontFamily()", (error, result) => {
                  if (error) {
                    console.info('getFontFamily() return error: ' + error)
                    Utils.emitEvent('default', 20260311)
                  }
                  if (result) {
                    console.info('getFontFamily() return result: ' + result)
                    Utils.emitEvent(result, 20260311)
                  }
                })
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                Utils.emitEvent('default', 20260311)
              }
              break;
            }

            case "testWebCursiveFontFantasy002": {
              try {
                this.family = 'fantasy';
                this.isPageEnd = -1;
                this.controller.refresh();
                await waitForExist(() => this.isPageEnd, this.str, 0);
                this.isPageEnd = -1;
                this.controller.loadUrl("resource://rawfile/font.html");
                await waitForExist(() => this.isPageEnd, this.str, 0);
                this.controller.runJavaScript("getFontFamily()", (error, result) => {
                  if (error) {
                    console.info('getFontFamily() return error: ' + error)
                    Utils.emitEvent('default', 20260312)
                  }
                  if (result) {
                    console.info('getFontFamily() return result: ' + result)
                    Utils.emitEvent(result, 20260312)
                  }
                })
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                Utils.emitEvent('default', 20260312)
              }
              break;
            }

            case "testWebCursiveFontCustom003": {
              try {
                this.family = 'Comic Sans MS';
                this.isPageEnd = -1;
                this.controller.refresh();
                await waitForExist(() => this.isPageEnd, this.str, 0);
                this.isPageEnd = -1;
                this.controller.loadUrl("resource://rawfile/font.html");
                await waitForExist(() => this.isPageEnd, this.str, 0);
                this.controller.runJavaScript("getFontFamily()", (error, result) => {
                  if (error) {
                    console.info('getFontFamily() return error: ' + error)
                    Utils.emitEvent('default', 20260313)
                  }
                  if (result) {
                    console.info('getFontFamily() return result: ' + result)
                    Utils.emitEvent(result, 20260313)
                  }
                })
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                Utils.emitEvent('default', 20260313)
              }
              break;
            }

            case "testWebCursiveFontEmpty004": {
              try {
                this.family = '';
                this.isPageEnd = -1;
                this.controller.refresh();
                await waitForExist(() => this.isPageEnd, this.str, 0);
                this.isPageEnd = -1;
                this.controller.loadUrl("resource://rawfile/font.html");
                await waitForExist(() => this.isPageEnd, this.str, 0);
                this.controller.runJavaScript("getFontFamily()", (error, result) => {
                  if (error) {
                    console.info('getFontFamily() return error: ' + error)
                    Utils.emitEvent('default', 20260314)
                  }
                  if (result) {
                    console.info('getFontFamily() return result: ' + result)
                    // Empty string should result in default font
                    Utils.emitEvent('default', 20260314)
                  }
                })
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                Utils.emitEvent('default', 20260314)
              }
              break;
            }

            case "testWebCursiveFontInvalid005": {
              try {
                this.family = 'InvalidCursiveFont123';
                this.isPageEnd = -1;
                this.controller.refresh();
                await waitForExist(() => this.isPageEnd, this.str, 0);
                this.isPageEnd = -1;
                this.controller.loadUrl("resource://rawfile/font.html");
                await waitForExist(() => this.isPageEnd, this.str, 0);
                this.controller.runJavaScript("getFontFamily()", (error, result) => {
                  if (error) {
                    console.info('getFontFamily() return error: ' + error)
                    Utils.emitEvent('default', 20260315)
                  }
                  if (result) {
                    console.info('getFontFamily() return result: ' + result)
                    // Invalid font should result in default font
                    Utils.emitEvent('default', 20260315)
                  }
                })
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                Utils.emitEvent('default', 20260315)
              }
              break;
            }

            case "testWebCursiveFontSerif006": {
              try {
                this.family = 'serif';
                this.isPageEnd = -1;
                this.controller.refresh();
                await waitForExist(() => this.isPageEnd, this.str, 0);
                this.isPageEnd = -1;
                this.controller.loadUrl("resource://rawfile/font.html");
                await waitForExist(() => this.isPageEnd, this.str, 0);
                this.controller.runJavaScript("getFontFamily()", (error, result) => {
                  if (error) {
                    console.info('getFontFamily() return error: ' + error)
                    Utils.emitEvent('default', 20260316)
                  }
                  if (result) {
                    console.info('getFontFamily() return result: ' + result)
                    Utils.emitEvent(result, 20260316)
                  }
                })
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                Utils.emitEvent('default', 20260316)
              }
              break;
            }
          }
        })
      }

      Web({ src: $rawfile('index.html'), controller: this.controller })
        .webCursiveFont(this.family)
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