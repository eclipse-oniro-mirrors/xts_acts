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
import { JsProxyObject } from '../../test/Interfaces.d';
import business_error from '@ohos.base';
import {waitForAssert, waitForExist} from '../../test/WaitTest.test';

@Entry
@Component
struct jsMessageExt {
  controller: webView.WebviewController = new webView.WebviewController();
  message: webView.WebMessageExt = new webView.WebMessageExt();
  @State str: string = ""
  @State javaScriptAccess: boolean = true;
  @State databaseAccess: boolean = true;
  @State ports: webView.WebMessagePort[] = [];
  @State isReceive: number = -1;
  @State isPageEnd: number = -1;

  onPageShow() {
    let valueChangeEvent: events_emitter.InnerEvent = {
      eventId: 171010,
      priority: events_emitter.EventPriority.LOW
    }
    events_emitter.on(valueChangeEvent, this.valueChangeCallBack)
  }

  onPageHide() {
    events_emitter.off(171010)
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
        Button("JsMessageExt click").key('JsMessageExtButton').onClick(async () => {
          await waitForExist(() => this.isPageEnd, this.str, 0);
          await waitForExist(() => this.isReceive, this.str, 0);
          this.isReceive = -1;
          console.info("key==>" + this.str)
          switch (this.str) {

            case "testJsMessageExtGetType001": {
              try {
                this.isPageEnd = -1;
                this.controller.loadUrl("resource://rawfile/getJsMessageExt.html");
                await waitForExist(() => this.isPageEnd, this.str, 0);
                this.controller.runJavaScriptExt(
                  'getString()',
                  (error, result) => {
                    if (error) {
                      let e: business_error.BusinessError = error as business_error.BusinessError;
                      console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                      Utils.emitEvent(e.code, 171020)
                    }
                    if (result) {
                      try {
                        let type = result.getType();
                        console.info(`get result :` + type)
                        Utils.emitEvent(type, 171020)
                      }
                      catch (resError) {
                        let e: business_error.BusinessError = resError as business_error.BusinessError;
                        console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                        Utils.emitEvent(e.code, 171020)
                      }
                    }
                  });

              } catch (error) {
                let e: business_error.BusinessError = error as business_error.BusinessError;
                console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                Utils.emitEvent(e.code, 171020)
              }
              break;
            }

            case "testJsMessageExtGetType002": {
              try {
                this.isPageEnd = -1;
                this.controller.loadUrl("resource://rawfile/getJsMessageExt.html");
                await waitForExist(() => this.isPageEnd, this.str, 0);
                this.controller.runJavaScriptExt(
                  'getNumber()',
                  (error, result) => {
                    if (error) {
                      let e: business_error.BusinessError = error as business_error.BusinessError;
                      console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                      Utils.emitEvent(e.code, 171030)
                    }
                    if (result) {
                      try {
                        let type = result.getType();
                        console.info(`get result :` + type)
                        Utils.emitEvent(type, 171030)
                      }
                      catch (resError) {
                        let e: business_error.BusinessError = resError as business_error.BusinessError;
                        console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                      }
                    }
                  });

              } catch (error) {
                let e: business_error.BusinessError = error as business_error.BusinessError;
                console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                Utils.emitEvent(e.code, 171030)
              }
              break;
            }

            case "testJsMessageExtGetType003": {
              try {
                this.isPageEnd = -1;
                this.controller.loadUrl("resource://rawfile/getJsMessageExt.html");
                await waitForExist(() => this.isPageEnd, this.str, 0);
                this.controller.runJavaScriptExt(
                  'getBoolean()',
                  (error, result) => {
                    if (error) {
                      let e: business_error.BusinessError = error as business_error.BusinessError;
                      console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                      Utils.emitEvent(e.code, 171040)
                    }
                    if (result) {
                      try {
                        let type = result.getType();
                        console.info(`get result :` + type)
                        Utils.emitEvent(type, 171040)
                      }
                      catch (resError) {
                        let e: business_error.BusinessError = resError as business_error.BusinessError;
                        console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                        Utils.emitEvent(e.code, 171040)
                      }
                    }
                  });

              } catch (error) {
                let e: business_error.BusinessError = error as business_error.BusinessError;
                console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                Utils.emitEvent(e.code, 171040)
              }
              break;
            }

            case "testJsMessageExtGetType004": {
              try {
                this.isPageEnd = -1;
                this.controller.loadUrl("resource://rawfile/getJsMessageExt.html");
                await waitForExist(() => this.isPageEnd, this.str, 0);
                this.controller.runJavaScriptExt(
                  'getArrayBuffer()',
                  (error, result) => {
                    if (result) {
                      if (error) {
                        let e: business_error.BusinessError = error as business_error.BusinessError;
                        console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                        Utils.emitEvent(e.code, 171050)
                      }
                      try {
                        let type = result.getType();
                        console.info(`get result :` + type)
                        Utils.emitEvent(type, 171050)
                      }
                      catch (resError) {
                        let e: business_error.BusinessError = resError as business_error.BusinessError;
                        console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                        Utils.emitEvent(e.code, 171050)
                      }
                    }
                  });

              } catch (error) {
                let e: business_error.BusinessError = error as business_error.BusinessError;
                console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                Utils.emitEvent(e.code, 171050)
              }
              break;
            }

            case "testJsMessageExtGetType005": {
              try {
                this.isPageEnd = -1;
                this.controller.loadUrl("resource://rawfile/getJsMessageExt.html");
                await waitForExist(() => this.isPageEnd, this.str, 0);
                this.controller.runJavaScriptExt(
                  'getArray()',
                  (error, result) => {
                    if (error) {
                      let e: business_error.BusinessError = error as business_error.BusinessError;
                      console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                      Utils.emitEvent(e.code, 171060)
                    }
                    if (result) {
                      try {
                        let type = result.getType();
                        console.info(`get result :` + type)
                        Utils.emitEvent(type, 171060)
                      }
                      catch (resError) {
                        let e: business_error.BusinessError = resError as business_error.BusinessError;
                        console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                      }
                    }
                  });

              } catch (error) {
                let e: business_error.BusinessError = error as business_error.BusinessError;
                console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                Utils.emitEvent(e.code, 171060)
              }
              break;
            }

            case "testJsMessageExtJsMessageType001": {
              try {
                console.info(`webView.JsMessageType.NOT_SUPPORT :` + webView.JsMessageType.NOT_SUPPORT)
                Utils.emitEvent(webView.JsMessageType.NOT_SUPPORT, 171070)
              } catch (error) {
                let e: business_error.BusinessError = error as business_error.BusinessError;
                console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                Utils.emitEvent(e.code, 171070)
              }
              break;
            }

            case "testJsMessageExtJsMessageType002": {
              try {
                console.info(`webView.JsMessageType.STRING :` + webView.JsMessageType.STRING)
                Utils.emitEvent(webView.JsMessageType.STRING, 171080)
              } catch (error) {
                let e: business_error.BusinessError = error as business_error.BusinessError;
                console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                Utils.emitEvent(e.code, 171080)
              }
              break;
            }

            case "testJsMessageExtJsMessageType003": {
              try {
                console.info(`webView.JsMessageType.NUMBER :` + webView.JsMessageType.NUMBER)
                Utils.emitEvent(webView.JsMessageType.NUMBER, 171090)
              } catch (error) {
                let e: business_error.BusinessError = error as business_error.BusinessError;
                console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                Utils.emitEvent(e.code, 171090)
              }
              break;
            }

            case "testJsMessageExtJsMessageType004": {
              try {
                console.info(`webView.JsMessageType.BOOLEAN :` + webView.JsMessageType.BOOLEAN)
                Utils.emitEvent(webView.JsMessageType.BOOLEAN, 171100)
              } catch (error) {
                let e: business_error.BusinessError = error as business_error.BusinessError;
                console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                Utils.emitEvent(e.code, 171100)
              }
              break;
            }

            case "testJsMessageExtJsMessageType005": {
              try {
                console.info(`webView.JsMessageType.ARRAY_BUFFER :` + webView.JsMessageType.ARRAY_BUFFER)
                Utils.emitEvent(webView.JsMessageType.ARRAY_BUFFER, 171110)
              } catch (error) {
                let e: business_error.BusinessError = error as business_error.BusinessError;
                console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                Utils.emitEvent(e.code, 171110)
              }
              break;
            }

            case "testJsMessageExtJsMessageType006": {
              try {
                console.info(`webView.JsMessageType.ARRAY :` + webView.JsMessageType.ARRAY)
                Utils.emitEvent(webView.JsMessageType.ARRAY, 171120)
              } catch (error) {
                let e: business_error.BusinessError = error as business_error.BusinessError;
                console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                Utils.emitEvent(e.code, 171120)
              }
              break;
            }

            case "testJsMessageExtGetString001": {
              try {
                this.isPageEnd = -1;
                this.controller.loadUrl("resource://rawfile/getJsMessageExt.html");
                await waitForExist(() => this.isPageEnd, this.str, 0);
                this.controller.runJavaScriptExt(
                  'getString()',
                  (error, result) => {
                    if (error) {
                      let e: business_error.BusinessError = error as business_error.BusinessError;
                      console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                      Utils.emitEvent(e.code, 171130)
                    }
                    if (result) {
                      try {
                        let value = result.getString();
                        console.info(`get result :` + value)
                        Utils.emitEvent(value, 171130)
                      }
                      catch (resError) {
                        let e: business_error.BusinessError = resError as business_error.BusinessError;
                        console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                        Utils.emitEvent(e.code, 171130)
                      }
                    }
                  });
              } catch (error) {
                let e: business_error.BusinessError = error as business_error.BusinessError;
                console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                Utils.emitEvent(e.code, 171130)
              }
              break;
            }

            case "testJsMessageExtGetNumber001": {
              try {
                this.isPageEnd = -1;
                this.controller.loadUrl("resource://rawfile/getJsMessageExt.html");
                await waitForExist(() => this.isPageEnd, this.str, 0);
                this.controller.runJavaScriptExt(
                  'getNumber()',
                  (error, result) => {
                    if (error) {
                      let e: business_error.BusinessError = error as business_error.BusinessError;
                      console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                      Utils.emitEvent(e.code, 171140)
                    }
                    if (result) {
                      try {
                        let value = result.getNumber();
                        console.info(`get result :` + value)
                        Utils.emitEvent(value, 171140)
                      }
                      catch (resError) {
                        let e: business_error.BusinessError = resError as business_error.BusinessError;
                        console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                        Utils.emitEvent(e.code, 171140)
                      }
                    }
                  });

              } catch (error) {
                let e: business_error.BusinessError = error as business_error.BusinessError;
                console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                Utils.emitEvent(e.code, 171140)
              }
              break;
            }

            case "testJsMessageExtGetBoolean001": {
              try {
                this.isPageEnd = -1;
                this.controller.loadUrl("resource://rawfile/getJsMessageExt.html");
                await waitForExist(() => this.isPageEnd, this.str, 0);
                this.controller.runJavaScriptExt(
                  'getBoolean()',
                  (error, result) => {
                    if (error) {
                      let e: business_error.BusinessError = error as business_error.BusinessError;
                      console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                      Utils.emitEvent(e.code, 171150)
                    }
                    if (result) {
                      try {
                        let value = result.getBoolean();
                        console.info(`get result :` + value)
                        Utils.emitEvent(value, 171150)
                      }
                      catch (resError) {
                        let e: business_error.BusinessError = resError as business_error.BusinessError;
                        console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                        Utils.emitEvent(e.code, 171150)
                      }
                    }
                  });

              } catch (error) {
                let e: business_error.BusinessError = error as business_error.BusinessError;
                console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                Utils.emitEvent(e.code, 171150)
              }
              break;
            }

            case "testJsMessageExtGetBoolean002": {
              try {
                this.isPageEnd = -1;
                this.controller.loadUrl("resource://rawfile/getJsMessageExt.html");
                await waitForExist(() => this.isPageEnd, this.str, 0);
                this.controller.runJavaScriptExt(
                  'getBooleanFalse()',
                  (error, result) => {
                    if (error) {
                      let e: business_error.BusinessError = error as business_error.BusinessError;
                      console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                      Utils.emitEvent(e.code, 171160)
                    }
                    if (result) {
                      try {
                        let value = result.getBoolean();
                        console.info(`get result :` + value)
                        Utils.emitEvent(value, 171160)
                      }
                      catch (resError) {
                        let e: business_error.BusinessError = resError as business_error.BusinessError;
                        console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                        Utils.emitEvent(e.code, 171160)
                      }
                    }
                  });

              } catch (error) {
                let e: business_error.BusinessError = error as business_error.BusinessError;
                console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                Utils.emitEvent(e.code, 171160)
              }
              break;
            }

            case "testJsMessageExtGetArrayBuffer001": {
              try {
                this.isPageEnd = -1;
                this.controller.loadUrl("resource://rawfile/getJsMessageExt.html");
                await waitForExist(() => this.isPageEnd, this.str, 0);
                this.controller.runJavaScriptExt(
                  'getArrayBuffer()',
                  (error, result) => {
                    if (error) {
                      let e: business_error.BusinessError = error as business_error.BusinessError;
                      console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                      Utils.emitEvent(e.code, 171170)
                    }
                    if (result) {
                      try {
                        let value = "result type:" + typeof (result.getArrayBuffer());
                        console.info(`get result :` + value)
                        Utils.emitEvent(value, 171170)
                      }
                      catch (resError) {
                        let e: business_error.BusinessError = resError as business_error.BusinessError;
                        console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                        Utils.emitEvent(e.code, 171170)
                      }
                    }
                  });

              } catch (error) {
                let e: business_error.BusinessError = error as business_error.BusinessError;
                console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                Utils.emitEvent(e.code, 171170)
              }
              break;
            }

            case "testJsMessageExtGetArray001": {
              try {
                this.isPageEnd = -1;
                this.controller.loadUrl("resource://rawfile/getJsMessageExt.html");
                await waitForExist(() => this.isPageEnd, this.str, 0);
                this.controller.runJavaScriptExt(
                  'getArray()',
                  (error, result) => {
                    if (error) {
                      let e: business_error.BusinessError = error as business_error.BusinessError;
                      console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                      Utils.emitEvent(e.code, 171180)
                    }
                    if (result) {
                      try {
                        let value = result.getArray();
                        console.info(`get result :` + value)
                        if (value[0] == 'banana' && value[1] == 'apple' && value[2] == 'peach') {
                          Utils.emitEvent(true, 171180)
                        } else {
                          Utils.emitEvent(false, 171180)
                        }
                      }
                      catch (resError) {
                        let e: business_error.BusinessError = resError as business_error.BusinessError;
                        console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                        Utils.emitEvent(e.code, 171180)
                      }
                    }
                  });

              } catch (error) {
                let e: business_error.BusinessError = error as business_error.BusinessError;
                console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                Utils.emitEvent(e.code, 171180)
              }
              break;
            }
            case 'testJsMessageExtGetArrayReturnArrayLengthLarger0': {
              try {
                this.isPageEnd = -1;
                this.controller.loadUrl('resource://rawfile/getJsMessageExt.html');
                await waitForExist(() => this.isPageEnd, 'testJsMessageExtGetArrayReturnArrayLengthLarger0_isPageEnd', 0);
                this.controller.runJavaScriptExt(
                  'getArray()',
                  (error, result) => {
                    if (error) {
                      let e: business_error.BusinessError = error as business_error.BusinessError;
                      console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                      Utils.emitEvent(e.code, 25102211)
                    }
                    if (result) {
                      try {
                        let getArray = result.getArray();
                        console.info(`[testJsMessageExtGetArrayReturnArrayLengthLarger0] get result length :` + getArray.length)
                        Utils.emitEvent(getArray.length, 25102211)
                      }
                      catch (resError) {
                        let e: business_error.BusinessError = resError as business_error.BusinessError;
                        console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                        Utils.emitEvent(e.code, 25102211)
                      }
                    }
                  });

              } catch (error) {
                let e: business_error.BusinessError = error as business_error.BusinessError;
                console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                Utils.emitEvent(e.code, 25102211)
              }
              break;
            }
          }
        })
      }

      Web({ src: $rawfile('index.html'), controller: this.controller })
        .javaScriptAccess(this.javaScriptAccess)
        .javaScriptProxy({
          object: this.jsObj,
          name: "backToEts",
          methodList: ["test", "toString"],
          controller: this.controller
        })
        .onPageEnd((event) => {
          if (event) {
            this.isPageEnd = 0;
            console.log(' onPageEnd url:' + event.url);
           }
        })
    }
  }
}
