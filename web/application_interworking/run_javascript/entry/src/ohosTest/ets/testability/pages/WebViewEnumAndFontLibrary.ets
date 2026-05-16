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
import { waitForExist } from '../../test/WaitTest.test';

@Entry
@Component
struct WebViewEnumAndFontLibrary {
  controller: webView.WebviewController = new webView.WebviewController();
  @State str: string = ""
  @State webResult: string = ''
  @State javaScriptAccess: boolean = true
  @State webResultText: string = ''
  @State isReceive: number = -1;
  @State isPageEnd: number = -1;


  onPageShow() {
    let valueChangeEvent: events_emitter.InnerEvent = {
      eventId: 171340,
      priority: events_emitter.EventPriority.LOW
    }
    events_emitter.on(valueChangeEvent, this.valueChangeCallBack)
  }

  onPageHide() {
    events_emitter.off(171340)
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
            case "emitRunJavaScript": {
              if (this.webResultText == '"This value is from indexJru.html"') {
                Utils.emitEvent(true, 171350)
              }
              break;
            }

            case "testRunJavaScript002": {
              try {
                let title = 'null'
                this.javaScriptAccess = false
                this.controller.runJavaScript(
                  'webTest()',
                  (error, result) => {
                    if (error) {
                      console.info(`run JavaScript error: ` + JSON.stringify(error))
                      Utils.emitEvent(error.code, 171360)
                      return;
                    }
                    if (result) {
                      this.webResult = result
                      console.info(`The test() return value is: ${this.webResult}`)
                      Utils.emitEvent(this.webResult, 171360)
                      return;
                    }
                  });
                Utils.emitEvent(title, 171360)
              } catch (error) {
                let e: business_error.BusinessError = error as business_error.BusinessError;
                console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                Utils.emitEvent(e.code, 171360)
              }
              break;
            }

            case "testRunJavaScript003": {
              try {
                this.javaScriptAccess = true
                this.isPageEnd = -1;
                this.controller.loadUrl($rawfile("indexJru.html"))
                await waitForExist(() => this.isPageEnd, this.str, 0);
                this.isPageEnd = -1;
                this.controller.refresh();
                await waitForExist(() => this.isPageEnd, this.str, 0);
                
                this.controller.runJavaScript('webTest()')
                  .then((result) => {
                    console.log('result: ' + result);
                    Utils.emitEvent(result, 171370)
                    return;
                  })
                  .catch((e: business_error.BusinessError) => {
                    console.error("error: " + e);
                    Utils.emitEvent(e.code, 171370)
                    return;
                  })
              } catch (error) {
                let e: business_error.BusinessError = error as business_error.BusinessError;
                console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                Utils.emitEvent(e.code, 171370)
              }
              break;
            }

            case "testRunJavaScript004": {
              try {
                this.javaScriptAccess = false
                this.isPageEnd = -1;
                this.controller.refresh();
                await waitForExist(() => this.isPageEnd, this.str, 0);
                this.isPageEnd = -1;
                this.controller.refresh();
                await waitForExist(() => this.isPageEnd, this.str, 0);
                this.controller.runJavaScript('webTest()')
                  .then((result) => {
                    console.log('result: ' + result);
                    Utils.emitEvent(String(result), 171380)
                    return;
                  })
                  .catch((e: business_error.BusinessError) => {
                    console.error("error: " + e);
                    Utils.emitEvent(e.code, 171380)
                    return;
                  })
              } catch (error) {
                let e: business_error.BusinessError = error as business_error.BusinessError;
                console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                Utils.emitEvent(e.code, 171380)
              }
              break;
            }

            case "testRunJavaScriptExt001": {
              try {
                this.javaScriptAccess = true
                this.isPageEnd = -1;
                this.controller.refresh();
                await waitForExist(() => this.isPageEnd, this.str, 0);
                this.isPageEnd = -1;
                this.controller.refresh();
                await waitForExist(() => this.isPageEnd, this.str, 0);
                this.controller.runJavaScriptExt(
                  'webTest()',
                  (error, result) => {
                    if (error) {
                      console.info(`run runJavaScriptExt error: ` + JSON.stringify(error))
                      return;
                    }
                    if (result) {
                      console.info(`run runJavaScriptExt : ` + result.getString())
                      Utils.emitEvent(result.getString(), 171390)
                      return;
                    }
                  });
              } catch (error) {
                let e: business_error.BusinessError = error as business_error.BusinessError;
                console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
              }
              break;
            }

            case "testRunJavaScriptExt002": {
              try {
                this.javaScriptAccess = false
                this.isPageEnd = -1;
                this.controller.refresh();
                await waitForExist(() => this.isPageEnd, this.str, 0);
                this.isPageEnd = -1;
                this.controller.refresh();
                await waitForExist(() => this.isPageEnd, this.str, 0);
                this.controller.runJavaScriptExt(
                  'webTest()',
                  (error, result) => {
                    if (error) {
                      console.info(`run runJavaScriptExt error: ` + JSON.stringify(error))
                      return;
                    }
                    Utils.emitEvent(result.getString() != "This value is from indexJru.html", 171400)
                  });
              } catch (error) {
                let e: business_error.BusinessError = error as business_error.BusinessError;
                console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
              }
              break;
            }

            case "testRunJavaScriptExt003": {
              try {
                this.javaScriptAccess = true
                this.isPageEnd = -1;
                this.controller.refresh();
                await waitForExist(() => this.isPageEnd, this.str, 0);
                this.isPageEnd = -1;
                this.controller.refresh();
                await waitForExist(() => this.isPageEnd, this.str, 0);
                this.controller.runJavaScriptExt('webTest()')
                  .then((result) => {
                    console.info(`run runJavaScriptExt : ` + result.getString())
                    Utils.emitEvent(result.getString(), 171410)
                  })
              } catch (error) {
                let e: business_error.BusinessError = error as business_error.BusinessError;
                console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
              }
              break;
            }

            case "testRunJavaScriptExt004": {
              try {
                this.javaScriptAccess = false
                this.isPageEnd = -1;
                this.controller.refresh();
                await waitForExist(() => this.isPageEnd, this.str, 0);
                this.isPageEnd = -1;
                this.controller.refresh();
                await waitForExist(() => this.isPageEnd, this.str, 0);
                this.controller.runJavaScriptExt('webTest()')
                  .then((result) => {
                    console.info(`run runJavaScriptExt : ` + result)
                    Utils.emitEvent(result.getString() != "This value is from indexJru.html", 171420)
                  })
                  .catch((e: business_error.BusinessError) => {
                    console.error("error: " + e);
                  })
              } catch (error) {
                let e: business_error.BusinessError = error as business_error.BusinessError;
                console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
              }
              break;
            }
          }
        })
      }

      Web({ src: $rawfile("indexJru.html"), controller: this.controller })
        .key("webCenter")
        .javaScriptAccess(this.javaScriptAccess)
        .onPageEnd(() => {
          this.isPageEnd = 0;
          this.controller.runJavaScript("webTest()", (error, result) => {
            console.log("error" + error)
            this.webResultText = result
          })
        })
    }
  }
}
