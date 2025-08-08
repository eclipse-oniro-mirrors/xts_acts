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

@Entry
@Component
struct jsMessageExt {
  controller: webView.WebviewController = new webView.WebviewController();
  message: webView.WebMessageExt = new webView.WebMessageExt();
  @State str: string = ""
  @State javaScriptAccess: boolean = true;
  @State databaseAccess: boolean = true;
  @State ports: webView.WebMessagePort[] = [];

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
        Button("JsMessageExt click").key('JsMessageExtButton').onClick(async () => {
          console.info("key==>" + this.str)
          switch (this.str) {

            case "testJsMessageExtGetType001": {
              try {
                this.controller.loadUrl("resource://rawfile/getJsMessageExt.html");
                await Utils.sleep(2000);
                this.controller.runJavaScriptExt(
                  'getString()',
                  (error, result) => {
                    if (error) {
                      let e: business_error.BusinessError = error as business_error.BusinessError;
                      console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                      Utils.emitEvent(e.code, 30200)
                    }
                    if (result) {
                      try {
                        let type = result.getType();
                        console.info(`get result :` + type)
                        Utils.emitEvent(type, 30200)
                      }
                      catch (resError) {
                        let e: business_error.BusinessError = resError as business_error.BusinessError;
                        console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                        Utils.emitEvent(e.code, 30200)
                      }
                    }
                  });

              } catch (error) {
                let e: business_error.BusinessError = error as business_error.BusinessError;
                console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                Utils.emitEvent(e.code, 30200)
              }
              break;
            }

            case "testJsMessageExtGetType002": {
              try {
                this.controller.loadUrl("resource://rawfile/getJsMessageExt.html");
                await Utils.sleep(2000);
                this.controller.runJavaScriptExt(
                  'getNumber()',
                  (error, result) => {
                    if (error) {
                      let e: business_error.BusinessError = error as business_error.BusinessError;
                      console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                      Utils.emitEvent(e.code, 30201)
                    }
                    if (result) {
                      try {
                        let type = result.getType();
                        console.info(`get result :` + type)
                        Utils.emitEvent(type, 30201)
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
                Utils.emitEvent(e.code, 30201)
              }
              break;
            }

            case "testJsMessageExtGetType003": {
              try {
                this.controller.loadUrl("resource://rawfile/getJsMessageExt.html");
                await Utils.sleep(2000);
                this.controller.runJavaScriptExt(
                  'getBoolean()',
                  (error, result) => {
                    if (error) {
                      let e: business_error.BusinessError = error as business_error.BusinessError;
                      console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                      Utils.emitEvent(e.code, 30202)
                    }
                    if (result) {
                      try {
                        let type = result.getType();
                        console.info(`get result :` + type)
                        Utils.emitEvent(type, 30202)
                      }
                      catch (resError) {
                        let e: business_error.BusinessError = resError as business_error.BusinessError;
                        console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                        Utils.emitEvent(e.code, 30202)
                      }
                    }
                  });

              } catch (error) {
                let e: business_error.BusinessError = error as business_error.BusinessError;
                console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                Utils.emitEvent(e.code, 30202)
              }
              break;
            }

            case "testJsMessageExtGetType004": {
              try {
                this.controller.loadUrl("resource://rawfile/getJsMessageExt.html");
                await Utils.sleep(2000);
                this.controller.runJavaScriptExt(
                  'getArrayBuffer()',
                  (error, result) => {
                    if (result) {
                      if (error) {
                        let e: business_error.BusinessError = error as business_error.BusinessError;
                        console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                        Utils.emitEvent(e.code, 30203)
                      }
                      try {
                        let type = result.getType();
                        console.info(`get result :` + type)
                        Utils.emitEvent(type, 30203)
                      }
                      catch (resError) {
                        let e: business_error.BusinessError = resError as business_error.BusinessError;
                        console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                        Utils.emitEvent(e.code, 30203)
                      }
                    }
                  });

              } catch (error) {
                let e: business_error.BusinessError = error as business_error.BusinessError;
                console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                Utils.emitEvent(e.code, 30203)
              }
              break;
            }

            case "testJsMessageExtGetType005": {
              try {
                this.controller.loadUrl("resource://rawfile/getJsMessageExt.html");
                await Utils.sleep(2000);
                this.controller.runJavaScriptExt(
                  'getArray()',
                  (error, result) => {
                    if (error) {
                      let e: business_error.BusinessError = error as business_error.BusinessError;
                      console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                      Utils.emitEvent(e.code, 30204)
                    }
                    if (result) {
                      try {
                        let type = result.getType();
                        console.info(`get result :` + type)
                        Utils.emitEvent(type, 30204)
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
                Utils.emitEvent(e.code, 30204)
              }
              break;
            }

            case "testJsMessageExtJsMessageType001": {
              try {
                console.info(`webView.JsMessageType.NOT_SUPPORT :` + webView.JsMessageType.NOT_SUPPORT)
                Utils.emitEvent(webView.JsMessageType.NOT_SUPPORT, 30205)
              } catch (error) {
                let e: business_error.BusinessError = error as business_error.BusinessError;
                console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                Utils.emitEvent(e.code, 30205)
              }
              break;
            }

            case "testJsMessageExtJsMessageType002": {
              try {
                console.info(`webView.JsMessageType.STRING :` + webView.JsMessageType.STRING)
                Utils.emitEvent(webView.JsMessageType.STRING, 30206)
              } catch (error) {
                let e: business_error.BusinessError = error as business_error.BusinessError;
                console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                Utils.emitEvent(e.code, 30206)
              }
              break;
            }

            case "testJsMessageExtJsMessageType003": {
              try {
                console.info(`webView.JsMessageType.NUMBER :` + webView.JsMessageType.NUMBER)
                Utils.emitEvent(webView.JsMessageType.NUMBER, 30207)
              } catch (error) {
                let e: business_error.BusinessError = error as business_error.BusinessError;
                console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                Utils.emitEvent(e.code, 30207)
              }
              break;
            }

            case "testJsMessageExtJsMessageType004": {
              try {
                console.info(`webView.JsMessageType.BOOLEAN :` + webView.JsMessageType.BOOLEAN)
                Utils.emitEvent(webView.JsMessageType.BOOLEAN, 30208)
              } catch (error) {
                let e: business_error.BusinessError = error as business_error.BusinessError;
                console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                Utils.emitEvent(e.code, 30208)
              }
              break;
            }

            case "testJsMessageExtJsMessageType005": {
              try {
                console.info(`webView.JsMessageType.ARRAY_BUFFER :` + webView.JsMessageType.ARRAY_BUFFER)
                Utils.emitEvent(webView.JsMessageType.ARRAY_BUFFER, 30209)
              } catch (error) {
                let e: business_error.BusinessError = error as business_error.BusinessError;
                console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                Utils.emitEvent(e.code, 30209)
              }
              break;
            }

            case "testJsMessageExtJsMessageType006": {
              try {
                console.info(`webView.JsMessageType.ARRAY :` + webView.JsMessageType.ARRAY)
                Utils.emitEvent(webView.JsMessageType.ARRAY, 30210)
              } catch (error) {
                let e: business_error.BusinessError = error as business_error.BusinessError;
                console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                Utils.emitEvent(e.code, 30210)
              }
              break;
            }

            case "testJsMessageExtGetString001": {
              try {
                this.controller.loadUrl("resource://rawfile/getJsMessageExt.html");
                await Utils.sleep(2000);
                this.controller.runJavaScriptExt(
                  'getString()',
                  (error, result) => {
                    if (error) {
                      let e: business_error.BusinessError = error as business_error.BusinessError;
                      console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                      Utils.emitEvent(e.code, 100013)
                    }
                    if (result) {
                      try {
                        let value = result.getString();
                        console.info(`get result :` + value)
                        Utils.emitEvent(value, 100013)
                      }
                      catch (resError) {
                        let e: business_error.BusinessError = resError as business_error.BusinessError;
                        console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                        Utils.emitEvent(e.code, 100013)
                      }
                    }
                  });
              } catch (error) {
                let e: business_error.BusinessError = error as business_error.BusinessError;
                console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                Utils.emitEvent(e.code, 100013)
              }
              break;
            }

            case "testJsMessageExtGetNumber001": {
              try {
                this.controller.loadUrl("resource://rawfile/getJsMessageExt.html");
                await Utils.sleep(2000);
                this.controller.runJavaScriptExt(
                  'getNumber()',
                  (error, result) => {
                    if (error) {
                      let e: business_error.BusinessError = error as business_error.BusinessError;
                      console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                      Utils.emitEvent(e.code, 100014)
                    }
                    if (result) {
                      try {
                        let value = result.getNumber();
                        console.info(`get result :` + value)
                        Utils.emitEvent(value, 100014)
                      }
                      catch (resError) {
                        let e: business_error.BusinessError = resError as business_error.BusinessError;
                        console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                        Utils.emitEvent(e.code, 100014)
                      }
                    }
                  });

              } catch (error) {
                let e: business_error.BusinessError = error as business_error.BusinessError;
                console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                Utils.emitEvent(e.code, 100014)
              }
              break;
            }

            case "testJsMessageExtGetBoolean001": {
              try {
                this.controller.loadUrl("resource://rawfile/getJsMessageExt.html");
                await Utils.sleep(2000);
                this.controller.runJavaScriptExt(
                  'getBoolean()',
                  (error, result) => {
                    if (error) {
                      let e: business_error.BusinessError = error as business_error.BusinessError;
                      console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                      Utils.emitEvent(e.code, 100015)
                    }
                    if (result) {
                      try {
                        let value = result.getBoolean();
                        console.info(`get result :` + value)
                        Utils.emitEvent(value, 100015)
                      }
                      catch (resError) {
                        let e: business_error.BusinessError = resError as business_error.BusinessError;
                        console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                        Utils.emitEvent(e.code, 100015)
                      }
                    }
                  });

              } catch (error) {
                let e: business_error.BusinessError = error as business_error.BusinessError;
                console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                Utils.emitEvent(e.code, 100015)
              }
              break;
            }

            case "testJsMessageExtGetBoolean002": {
              try {
                this.controller.loadUrl("resource://rawfile/getJsMessageExt.html");
                await Utils.sleep(2000);
                this.controller.runJavaScriptExt(
                  'getBooleanFalse()',
                  (error, result) => {
                    if (error) {
                      let e: business_error.BusinessError = error as business_error.BusinessError;
                      console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                      Utils.emitEvent(e.code, 100016)
                    }
                    if (result) {
                      try {
                        let value = result.getBoolean();
                        console.info(`get result :` + value)
                        Utils.emitEvent(value, 100016)
                      }
                      catch (resError) {
                        let e: business_error.BusinessError = resError as business_error.BusinessError;
                        console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                        Utils.emitEvent(e.code, 100016)
                      }
                    }
                  });

              } catch (error) {
                let e: business_error.BusinessError = error as business_error.BusinessError;
                console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                Utils.emitEvent(e.code, 100016)
              }
              break;
            }

            case "testJsMessageExtGetArrayBuffer001": {
              try {
                this.controller.loadUrl("resource://rawfile/getJsMessageExt.html");
                await Utils.sleep(2000);
                this.controller.runJavaScriptExt(
                  'getArrayBuffer()',
                  (error, result) => {
                    if (error) {
                      let e: business_error.BusinessError = error as business_error.BusinessError;
                      console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                      Utils.emitEvent(e.code, 100017)
                    }
                    if (result) {
                      try {
                        let value = "result type:" + typeof (result.getArrayBuffer());
                        console.info(`get result :` + value)
                        Utils.emitEvent(value, 100017)
                      }
                      catch (resError) {
                        let e: business_error.BusinessError = resError as business_error.BusinessError;
                        console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                        Utils.emitEvent(e.code, 100017)
                      }
                    }
                  });

              } catch (error) {
                let e: business_error.BusinessError = error as business_error.BusinessError;
                console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                Utils.emitEvent(e.code, 100017)
              }
              break;
            }

            case "testJsMessageExtGetArray001": {
              try {
                this.controller.loadUrl("resource://rawfile/getJsMessageExt.html");
                await Utils.sleep(2000);
                this.controller.runJavaScriptExt(
                  'getArray()',
                  (error, result) => {
                    if (error) {
                      let e: business_error.BusinessError = error as business_error.BusinessError;
                      console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                      Utils.emitEvent(e.code, 100018)
                    }
                    if (result) {
                      try {
                        let value = result.getArray();
                        console.info(`get result :` + value)
                        if (value[0] == 'banana' && value[1] == 'apple' && value[2] == 'peach') {
                          Utils.emitEvent(true, 100018)
                        } else {
                          Utils.emitEvent(false, 100018)
                        }
                      }
                      catch (resError) {
                        let e: business_error.BusinessError = resError as business_error.BusinessError;
                        console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                        Utils.emitEvent(e.code, 100018)
                      }
                    }
                  });

              } catch (error) {
                let e: business_error.BusinessError = error as business_error.BusinessError;
                console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                Utils.emitEvent(e.code, 100018)
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
    }
  }
}
