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
import { JsProxyObject } from '../../test/Interfaces';
import business_error from '@ohos.base';

class testObj {
  constructor() {
  }

  test(): string {
    return "ArkUI Web Component";
  }

  toString(): void {
    console.log('Web Component toString');
  }
}

@Entry
@Component
struct Index {
  controller: webView.WebviewController = new webView.WebviewController();
  controllerNull: webView.WebviewController = new webView.WebviewController();
  nativePort: webView.WebMessagePort | null = null;
  responseWeb: WebResourceResponse = new WebResourceResponse()
  @State str: string = ""
  @State webResult: string = ' ';
  @State javaScriptAccess: boolean = true;
  @State ports: webView.WebMessagePort[] = [];
  @State testObj: testObj = new testObj();
  @State sourceID: string = "test";
  @State message: webView.WebMessageExt = new webView.WebMessageExt();
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
        Button("JsMessageExtErrorCode click").key('JsMessageExtErrorCodeButton').onClick(async () => {
          console.info("key==>" + this.str)
          switch (this.str) {

            case "testJsMessageExtGetStringError001": {
              try {
                this.controller.runJavaScriptExt(
                  'getNumber()',
                  (error, result) => {
                    if (error) {
                      console.info(`run runJavaScriptExt error: ` + JSON.stringify(error))
                      Utils.emitEvent(String(error.code), 30400)
                      return;
                    }
                    if (result) {
                      try {
                        let type = result.getType();
                        console.info(`get result :` + type)
                        result.getString()
                        Utils.emitEvent(this.no_error, 30400)
                      }
                      catch (resError) {
                        let e: business_error.BusinessError = resError as business_error.BusinessError;
                        console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                        Utils.emitEvent(String(e.code), 30400)
                      }
                    }
                  });
              } catch (error) {
                let e: business_error.BusinessError = error as business_error.BusinessError;
                console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                Utils.emitEvent(String(e.code), 30400)
              }
              break;
            }

            case "testJsMessageExtGetStringError002": {
              try {
                this.controller.runJavaScriptExt(
                  'getBoolean()',
                  (error, result) => {
                    if (error) {
                      console.info(`run JavaScript error: ` + JSON.stringify(error))
                      Utils.emitEvent(String(error.code), 30401)
                      return;
                    }
                    if (result) {
                      try {
                        let type = result.getType();
                        console.info(`get result :` + type)
                        result.getString()
                        Utils.emitEvent(this.no_error, 30401)
                      }
                      catch (resError) {
                        let e: business_error.BusinessError = resError as business_error.BusinessError;
                        console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                        Utils.emitEvent(String(e.code), 30401)
                      }
                    }
                  });
              } catch (error) {
                let e: business_error.BusinessError = error as business_error.BusinessError;
                console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                Utils.emitEvent(String(e.code), 30401)
              }
              break;
            }

            case "testJsMessageExtGetStringError003": {
              try {
                this.controller.runJavaScriptExt(
                  'getArrayBuffer()',
                  (error, result) => {
                    if (result) {
                      if (error) {
                        console.info(`run runJavaScriptExt error: ` + JSON.stringify(error))
                        Utils.emitEvent(String(error.code), 30402)
                        return;
                      }
                      try {
                        let type = result.getType();
                        console.info(`get result :` + type)
                        result.getString()
                        Utils.emitEvent(this.no_error, 30402)
                      }
                      catch (resError) {
                        let e: business_error.BusinessError = resError as business_error.BusinessError;
                        console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                        Utils.emitEvent(String(e.code), 30402)
                      }
                    }
                  });

              } catch (error) {
                let e: business_error.BusinessError = error as business_error.BusinessError;
                console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                Utils.emitEvent(String(e.code), 30402)
              }
              break;
            }

            case "testJsMessageExtGetStringError004": {
              try {
                this.controller.runJavaScriptExt(
                  'getArray()',
                  (error, result) => {
                    if (error) {
                      console.info(`run runJavaScriptExt error: ` + JSON.stringify(error))
                      Utils.emitEvent(String(error.code), 30403)
                      return;
                    }
                    if (result) {
                      try {
                        let type = result.getType();
                        console.info(`get result :` + type)
                        result.getString()
                        Utils.emitEvent(this.no_error, 30403)
                      }
                      catch (resError) {
                        let e: business_error.BusinessError = resError as business_error.BusinessError;
                        console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                        Utils.emitEvent(String(e.code), 30403)
                      }
                    }
                  });
              } catch (error) {
                let e: business_error.BusinessError = error as business_error.BusinessError;
                console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                Utils.emitEvent(String(e.code), 30403)
              }
              break;
            }

            case "testJsMessageExtGetNumberError001": {
              try {
                this.controller.runJavaScriptExt(
                  'getString()',
                  (error, result) => {
                    if (result) {
                      if (error) {
                        console.info(`run runJavaScriptExt error: ` + JSON.stringify(error))
                        Utils.emitEvent(String(error.code), 30410)
                        return;
                      }
                      try {
                        let type = result.getType();
                        console.info(`get result :` + type)
                        result.getNumber()
                        Utils.emitEvent(this.no_error, 30410)
                      }
                      catch (resError) {
                        let e: business_error.BusinessError = resError as business_error.BusinessError;
                        console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                        Utils.emitEvent(String(e.code), 30410)
                      }
                    }
                  });
              } catch (error) {
                let e: business_error.BusinessError = error as business_error.BusinessError;
                console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                Utils.emitEvent(String(e.code), 30410)
              }
              break;
            }

            case "testJsMessageExtGetNumberError002": {
              try {
                this.controller.runJavaScriptExt(
                  'getBoolean()',
                  (error, result) => {
                    if (error) {
                      console.info(`run runJavaScriptExt error: ` + JSON.stringify(error))
                      Utils.emitEvent(String(error.code), 30411)
                      return;
                    }
                    if (result) {
                      try {
                        let type = result.getType();
                        console.info(`get result :` + type)
                        result.getNumber()
                        Utils.emitEvent(this.no_error, 30411)
                      }
                      catch (resError) {
                        let e: business_error.BusinessError = resError as business_error.BusinessError;
                        console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                        Utils.emitEvent(String(e.code), 30411)
                      }
                    }
                  });
              } catch (error) {
                let e: business_error.BusinessError = error as business_error.BusinessError;
                console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                Utils.emitEvent(String(e.code), 30411)
              }
              break;
            }

            case "testJsMessageExtGetNumberError003": {
              try {
                this.controller.runJavaScriptExt(
                  'getArrayBuffer()',
                  (error, result) => {
                    if (error) {
                      console.info(`run runJavaScriptExt error: ` + JSON.stringify(error))
                      Utils.emitEvent(String(error.code), 30412)
                      return;
                    }
                    if (result) {
                      try {
                        let type = result.getType();
                        console.info(`get result :` + type)
                        result.getNumber()
                        Utils.emitEvent(this.no_error, 30412)
                      }
                      catch (resError) {
                        let e: business_error.BusinessError = resError as business_error.BusinessError;
                        console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                        Utils.emitEvent(String(e.code), 30412)
                      }
                    }
                  });
              } catch (error) {
                let e: business_error.BusinessError = error as business_error.BusinessError;
                console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                Utils.emitEvent(String(e.code), 30412)
              }
              break;
            }

            case "testJsMessageExtGetNumberError004": {
              try {
                this.controller.runJavaScriptExt(
                  'getArray()',
                  (error, result) => {
                    if (error) {
                      console.info(`run runJavaScriptExt error: ` + JSON.stringify(error))
                      Utils.emitEvent(String(error.code), 30413)
                      return;
                    }
                    if (result) {
                      try {
                        let type = result.getType();
                        console.info(`get result :` + type)
                        result.getNumber()
                        Utils.emitEvent(this.no_error, 30413)
                      }
                      catch (resError) {
                        let e: business_error.BusinessError = resError as business_error.BusinessError;
                        console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                        Utils.emitEvent(String(e.code), 30413)
                      }
                    }
                  });

              } catch (error) {
                let e: business_error.BusinessError = error as business_error.BusinessError;
                console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                Utils.emitEvent(String(e.code), 30413)
              }
              break;
            }

            case "testJsMessageExtGetBooleanError001": {
              try {
                this.controller.runJavaScriptExt(
                  'getString()',
                  (error, result) => {
                    if (error) {
                      console.info(`run runJavaScriptExt error: ` + JSON.stringify(error))
                      Utils.emitEvent(String(error.code), 30420)
                      return;
                    }
                    if (result) {
                      try {
                        let type = result.getType();
                        console.info(`get result :` + type)
                        result.getBoolean()
                        Utils.emitEvent(this.no_error, 30420)
                      }
                      catch (resError) {
                        let e: business_error.BusinessError = resError as business_error.BusinessError;
                        console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                        Utils.emitEvent(String(e.code), 30420)
                      }
                    }
                  });
              } catch (error) {
                let e: business_error.BusinessError = error as business_error.BusinessError;
                console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                Utils.emitEvent(String(e.code), 30420)
              }
              break;
            }

            case "testJsMessageExtGetBooleanError002": {
              try {
                this.controller.runJavaScriptExt(
                  'getNumber()',
                  (error, result) => {
                    if (error) {
                      console.info(`run runJavaScriptExt error: ` + JSON.stringify(error))
                      Utils.emitEvent(String(error.code), 30421)
                      return;
                    }
                    if (result) {
                      try {
                        let type = result.getType();
                        console.info(`get result :` + type)
                        result.getBoolean()
                        Utils.emitEvent(this.no_error, 30421)
                      }
                      catch (resError) {
                        let e: business_error.BusinessError = resError as business_error.BusinessError;
                        console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                        Utils.emitEvent(String(e.code), 30421)
                      }
                    }
                  });
              } catch (error) {
                let e: business_error.BusinessError = error as business_error.BusinessError;
                console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                Utils.emitEvent(String(e.code), 30421)
              }
              break;
            }

            case "testJsMessageExtGetBooleanError003": {
              try {
                this.controller.runJavaScriptExt(
                  'getArrayBuffer()',
                  (error, result) => {
                    if (error) {
                      console.info(`run runJavaScriptExt error: ` + JSON.stringify(error))
                      Utils.emitEvent(String(error.code), 30422)
                      return;
                    }
                    if (result) {
                      try {
                        let type = result.getType();
                        console.info(`get result :` + type)
                        result.getBoolean()
                        Utils.emitEvent(this.no_error, 30422)
                      }
                      catch (resError) {
                        let e: business_error.BusinessError = resError as business_error.BusinessError;
                        console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                        Utils.emitEvent(String(e.code), 30422)
                      }
                    }
                  });
              } catch (error) {
                let e: business_error.BusinessError = error as business_error.BusinessError;
                console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                Utils.emitEvent(String(e.code), 30422)
              }
              break;
            }
            case "testJsMessageExtGetBooleanError004": {
              try {
                this.controller.runJavaScriptExt(
                  'getArray()',
                  (error, result) => {
                    if (error) {
                      console.info(`run runJavaScriptExt error: ` + JSON.stringify(error))
                      Utils.emitEvent(String(error.code), 30423)
                      return;
                    }
                    if (result) {
                      try {
                        let type = result.getType();
                        console.info(`get result :` + type)
                        result.getBoolean()
                        Utils.emitEvent(this.no_error, 30423)
                      }
                      catch (resError) {
                        let e: business_error.BusinessError = resError as business_error.BusinessError;
                        console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                        Utils.emitEvent(String(e.code), 30423)
                      }
                    }
                  });
              } catch (error) {
                let e: business_error.BusinessError = error as business_error.BusinessError;
                console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                Utils.emitEvent(String(e.code), 30423)
              }
              break;
            }
            case "testJsMessageExtGetArrayBufferError001": {
              try {
                this.controller.runJavaScriptExt(
                  'getString()',
                  (error, result) => {
                    if (error) {
                      console.info(`run runJavaScriptExt error: ` + JSON.stringify(error))
                      Utils.emitEvent(String(error.code), 30430)
                      return;
                    }
                    if (result) {
                      try {
                        let type = result.getType();
                        console.info(`get result :` + type)
                        result.getArrayBuffer()
                        Utils.emitEvent(this.no_error, 30430)
                      }
                      catch (resError) {
                        let e: business_error.BusinessError = resError as business_error.BusinessError;
                        console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                        Utils.emitEvent(String(e.code), 30430)
                      }
                    }
                  });
              } catch (error) {
                let e: business_error.BusinessError = error as business_error.BusinessError;
                console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                Utils.emitEvent(String(e.code), 30430)
              }
              break;
            }

            case "testJsMessageExtGetArrayBufferError002": {
              try {
                this.controller.runJavaScriptExt(
                  'getNumber()',
                  (error, result) => {
                    if (error) {
                      console.info(`run runJavaScriptExt error: ` + JSON.stringify(error))
                      Utils.emitEvent(String(error.code), 30431)
                      return;
                    }
                    if (result) {
                      try {
                        let type = result.getType();
                        console.info(`get result :` + type)
                        result.getArrayBuffer()
                        Utils.emitEvent(this.no_error, 30431)
                      }
                      catch (resError) {
                        let e: business_error.BusinessError = resError as business_error.BusinessError;
                        console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                        Utils.emitEvent(String(e.code), 30431)
                      }
                    }
                  });
              } catch (error) {
                let e: business_error.BusinessError = error as business_error.BusinessError;
                console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                Utils.emitEvent(String(e.code), 30431)
              }
              break;
            }

            case "testJsMessageExtGetArrayBufferError003": {
              try {
                this.controller.runJavaScriptExt(
                  'getBoolean()',
                  (error, result) => {
                    if (result) {
                      if (error) {
                        console.info(`run runJavaScriptExt error: ` + JSON.stringify(error))
                        Utils.emitEvent(String(error.code), 30432)
                        return;
                      }
                      try {
                        let type = result.getType();
                        console.info(`get result :` + type)
                        result.getArrayBuffer()
                        Utils.emitEvent(this.no_error, 30432)
                      }
                      catch (resError) {
                        let e: business_error.BusinessError = resError as business_error.BusinessError;
                        console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                        Utils.emitEvent(String(e.code), 30432)
                      }
                    }
                  });
              } catch (error) {
                let e: business_error.BusinessError = error as business_error.BusinessError;
                console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                Utils.emitEvent(String(e.code), 30432)
              }
              break;
            }

            case "testJsMessageExtGetArrayBufferError004": {
              try {
                this.controller.runJavaScriptExt(
                  'getArray()',
                  (error, result) => {
                    if (error) {
                      console.info(`run runJavaScriptExt error: ` + JSON.stringify(error))
                      Utils.emitEvent(String(error.code), 30433)
                      return;
                    }
                    if (result) {
                      try {
                        let type = result.getType();
                        console.info(`get result :` + type)
                        result.getArrayBuffer()
                        Utils.emitEvent(this.no_error, 30433)
                      }
                      catch (resError) {
                        let e: business_error.BusinessError = resError as business_error.BusinessError;
                        console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                        Utils.emitEvent(String(e.code), 30433)
                      }
                    }
                  });
              } catch (error) {
                let e: business_error.BusinessError = error as business_error.BusinessError;
                console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                Utils.emitEvent(String(e.code), 30433)
              }
              break;
            }

            case "testJsMessageExtGetArrayError001": {
              try {
                this.controller.runJavaScriptExt(
                  'getString()',
                  (error, result) => {
                    if (error) {
                      console.info(`run runJavaScriptExt error: ` + JSON.stringify(error))
                      Utils.emitEvent(String(error.code), 30440)
                      return;
                    }
                    if (result) {
                      try {
                        let type = result.getType();
                        console.info(`get result :` + type)
                        result.getArray()
                        Utils.emitEvent(this.no_error, 30440)
                      }
                      catch (resError) {
                        let e: business_error.BusinessError = resError as business_error.BusinessError;
                        console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                        Utils.emitEvent(String(e.code), 30440)
                      }
                    }
                  });
              } catch (error) {
                let e: business_error.BusinessError = error as business_error.BusinessError;
                console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                Utils.emitEvent(String(e.code), 30440)
              }
              break;
            }

            case "testJsMessageExtGetArrayError002": {
              try {
                this.controller.runJavaScriptExt(
                  'getNumber()',
                  (error, result) => {
                    if (error) {
                      console.info(`run runJavaScriptExt error: ` + JSON.stringify(error))
                      Utils.emitEvent(String(error.code), 30441)
                      return;
                    }
                    if (result) {
                      try {
                        let type = result.getType();
                        console.info(`get result :` + type)
                        result.getArray()
                        Utils.emitEvent(this.no_error, 30441)
                      }
                      catch (resError) {
                        let e: business_error.BusinessError = resError as business_error.BusinessError;
                        console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                        Utils.emitEvent(String(e.code), 30441)
                      }
                    }
                  });
              } catch (error) {
                let e: business_error.BusinessError = error as business_error.BusinessError;
                console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                Utils.emitEvent(String(e.code), 30441)
              }
              break;
            }

            case "testJsMessageExtGetArrayError003": {
              try {
                this.controller.runJavaScriptExt(
                  'getBoolean()',
                  (error, result) => {
                    if (result) {
                      if (error) {
                        console.info(`run runJavaScriptExt error: ` + JSON.stringify(error))
                        Utils.emitEvent(String(error.code), 30442)
                        return;
                      }
                      try {
                        let type = result.getType();
                        console.info(`get result :` + type)
                        result.getArray()
                        Utils.emitEvent(this.no_error, 30442)
                      }
                      catch (resError) {
                        let e: business_error.BusinessError = resError as business_error.BusinessError;
                        console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                        Utils.emitEvent(String(e.code), 30442)
                      }
                    }
                  });
              } catch (error) {
                let e: business_error.BusinessError = error as business_error.BusinessError;
                console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                Utils.emitEvent(String(e.code), 30442)
              }
              break;
            }

            case "testJsMessageExtGetArrayError004": {
              try {
                this.controller.runJavaScriptExt(
                  'getArrayBuffer()',
                  (error, result) => {
                    if (result) {
                      if (error) {
                        console.info(`run runJavaScriptExt error: ` + JSON.stringify(error))
                        Utils.emitEvent(String(error.code), 30443)
                        return;
                      }
                      try {
                        let type = result.getType();
                        console.info(`get result :` + type)
                        result.getArray()
                        Utils.emitEvent(this.no_error, 30443)
                      }
                      catch (resError) {
                        let e: business_error.BusinessError = resError as business_error.BusinessError;
                        console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                        Utils.emitEvent(String(e.code), 30443)
                      }
                    }
                  });
              } catch (error) {
                let e: business_error.BusinessError = error as business_error.BusinessError;
                console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                Utils.emitEvent(String(e.code), 30443)
              }
              break;
            }

          }
        })
      }

      Web({ src: $rawfile('getJsMessageExt.html'), controller: this.controller })
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
