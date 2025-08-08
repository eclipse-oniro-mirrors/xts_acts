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
  @State webResult: string = ''
  @State javaScriptAccess: boolean = true
  @State webResultText: string = ''


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
            case "emitRunJavaScript": {
              if (this.webResultText == '"This value is from indexJru.html"') {
                Utils.emitEvent(true, 1241)
              }
              break;
            }

            case "testRunJavaScript002": {
              try {
                let title = 'null'
                this.javaScriptAccess = false
                await Utils.sleep(2000);
                this.controller.runJavaScript(
                  'webTest()',
                  (error, result) => {
                    if (error) {
                      console.info(`run JavaScript error: ` + JSON.stringify(error))
                      Utils.emitEvent(error.code, 10001)
                      return;
                    }
                    if (result) {
                      this.webResult = result
                      console.info(`The test() return value is: ${this.webResult}`)
                      Utils.emitEvent(this.webResult, 10001)
                      return;
                    }
                  });
                Utils.emitEvent(title, 10001)
              } catch (error) {
                let e: business_error.BusinessError = error as business_error.BusinessError;
                console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                Utils.emitEvent(e.code, 10001)
              }
              break;
            }

            case "testRunJavaScript003": {
              try {
                this.javaScriptAccess = true
                await Utils.sleep(2000);
                this.controller.loadUrl($rawfile("indexJru.html"))
                await Utils.sleep(2000);
                this.controller.runJavaScript('webTest()')
                  .then((result) => {
                    console.log('result: ' + result);
                    Utils.emitEvent(result, 10002)
                    return;
                  })
                  .catch((e: business_error.BusinessError) => {
                    console.error("error: " + e);
                    Utils.emitEvent(e.code, 10002)
                    return;
                  })
              } catch (error) {
                let e: business_error.BusinessError = error as business_error.BusinessError;
                console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                Utils.emitEvent(e.code, 10002)
              }
              break;
            }

            case "testRunJavaScript004": {
              try {
                this.javaScriptAccess = false
                await Utils.sleep(2000);
                this.controller.runJavaScript('webTest()')
                  .then((result) => {
                    console.log('result: ' + result);
                    Utils.emitEvent(String(result), 10003)
                    return;
                  })
                  .catch((e: business_error.BusinessError) => {
                    console.error("error: " + e);
                    Utils.emitEvent(e.code, 10003)
                    return;
                  })
              } catch (error) {
                let e: business_error.BusinessError = error as business_error.BusinessError;
                console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                Utils.emitEvent(e.code, 10003)
              }
              break;
            }

            case "testRunJavaScriptExt001": {
              try {
                this.javaScriptAccess = true
                await Utils.sleep(4000);
                this.controller.runJavaScriptExt(
                  'webTest()',
                  (error, result) => {
                    if (error) {
                      console.info(`run runJavaScriptExt error: ` + JSON.stringify(error))
                      return;
                    }
                    if (result) {
                      console.info(`run runJavaScriptExt : ` + result.getString())
                      Utils.emitEvent(result.getString(), 10004)
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
                await Utils.sleep(4000);
                this.controller.runJavaScriptExt(
                  'webTest()',
                  (error, result) => {
                    if (error) {
                      console.info(`run runJavaScriptExt error: ` + JSON.stringify(error))
                      return;
                    }
                    Utils.emitEvent(result.getString() != "This value is from indexJru.html", 10005)
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
                await Utils.sleep(4000);
                this.controller.runJavaScriptExt('webTest()')
                  .then((result) => {
                    console.info(`run runJavaScriptExt : ` + result.getString())
                    Utils.emitEvent(result.getString(), 10006)
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
                await Utils.sleep(4000);
                this.controller.runJavaScriptExt('webTest()')
                  .then((result) => {
                    console.info(`run runJavaScriptExt : ` + result)
                    Utils.emitEvent(result.getString() != "This value is from indexJru.html", 10007)
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
          this.controller.runJavaScript("webTest()", (error, result) => {
            console.log("error" + error)
            this.webResultText = result
          })
        })
    }
  }
}
