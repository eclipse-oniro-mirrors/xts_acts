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
struct webMessageExt {
  controller: webView.WebviewController = new webView.WebviewController();
  nativePort: webView.WebMessagePort | null = null;
  message: webView.WebMessageExt = new webView.WebMessageExt();
  @State str: string = ""
  @State javaScriptAccess: boolean = true;
  @State databaseAccess: boolean = true;
  @State ports: webView.WebMessagePort[] = [];
  @State listening_port: number = 0
  @State listening_flag: number = 0

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
        Button("webMessageExt click").key('WebMessageExtButton').onClick(async () => {
          console.info("key==>" + this.str)
          switch (this.str) {

            case "testWebMessageExGetType001": {
              this.listening_port = 20260
              this.listening_flag = 1
              this.controller.runJavaScript(
                'postStringToApp()',
                (error, result) => {
                  if (error) {
                    console.info(`run JavaScript error: ` + JSON.stringify(error))
                    return;
                  }
                  if (result) {
                    console.info(`The postStringToApp() return value is: ${result}`)
                  }
                });
              break;
            }

            case "testWebMessageExGetType002": {
              this.listening_port = 20261
              this.listening_flag = 2
              this.controller.runJavaScript(
                'postNumberToApp()',
                (error, result) => {
                  if (error) {
                    console.info(`run JavaScript error: ` + JSON.stringify(error))
                    return;
                  }
                  if (result) {
                    console.info(`The postNumberToApp() return value is: ${result}`)
                  }
                });
              break;
            }

            case "testWebMessageExGetType003": {
              this.listening_port = 20262
              this.listening_flag = 3
              this.controller.runJavaScript(
                'postBooleanToApp()',
                (error, result) => {
                  if (error) {
                    console.info(`run JavaScript error: ` + JSON.stringify(error))
                    return;
                  }
                  if (result) {
                    console.info(`The postBooleanToApp() return value is: ${result}`)
                  }
                });
              break;
            }

            case "testWebMessageExGetType004": {
              this.listening_port = 20263
              this.listening_flag = 4
              this.controller.runJavaScript(
                'postArrayBufferToApp()',
                (error, result) => {
                  if (error) {
                    console.info(`run JavaScript error: ` + JSON.stringify(error))
                    return;
                  }
                  if (result) {
                    console.info(`The postArrayBufferToApp() return value is: ${result}`)
                  }
                });
              break;
            }

            case "testWebMessageExGetType005": {
              this.listening_port = 20264
              this.listening_flag = 5
              this.controller.runJavaScript(
                'postArrayToApp()',
                (error, result) => {
                  if (error) {
                    console.info(`run JavaScript error: ` + JSON.stringify(error))
                    return;
                  }
                  if (result) {
                    console.info(`The postArrayToApp() return value is: ${result}`)
                  }
                });
              break;
            }

            case "testWebMessageExGetType006": {
              this.listening_port = 20265
              this.listening_flag = 6
              this.controller.runJavaScript(
                'postErrorToApp()',
                (error, result) => {
                  if (error) {
                    console.info(`run JavaScript error: ` + JSON.stringify(error))
                    return;
                  }
                  if (result) {
                    console.info(`The postErrorToApp() return value is: ${result}`)
                  }
                });
              break;
            }

            case "testWebMessageExtWebMessageType001": {
              try {
                console.info(`webView.WebMessageType.NOT_SUPPORT :` + webView.WebMessageType.NOT_SUPPORT)
                Utils.emitEvent(webView.WebMessageType.NOT_SUPPORT, 30000)
              } catch (error) {
                let e: business_error.BusinessError = error as business_error.BusinessError;
                console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
              }
              break;
            }

            case "testWebMessageExtWebMessageType002": {
              try {
                console.info(`webView.WebMessageType.STRING :` + webView.WebMessageType.STRING)
                Utils.emitEvent(webView.WebMessageType.STRING, 30001)
              } catch (error) {
                let e: business_error.BusinessError = error as business_error.BusinessError;
                console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
              }
              break;
            }

            case "testWebMessageExtWebMessageType003": {
              try {
                console.info(`webView.WebMessageType.NUMBER :` + webView.WebMessageType.NUMBER)
                Utils.emitEvent(webView.WebMessageType.NUMBER, 30002)
              } catch (error) {
                let e: business_error.BusinessError = error as business_error.BusinessError;
                console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
              }
              break;
            }

            case "testWebMessageExtWebMessageType004": {
              try {
                console.info(`webView.WebMessageType.BOOLEAN :` + webView.WebMessageType.BOOLEAN)
                Utils.emitEvent(webView.WebMessageType.BOOLEAN, 30003)
              } catch (error) {
                let e: business_error.BusinessError = error as business_error.BusinessError;
                console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
              }
              break;
            }

            case "testWebMessageExtWebMessageType005": {
              try {
                console.info(`webView.WebMessageType.ARRAY_BUFFER :` + webView.WebMessageType.ARRAY_BUFFER)
                Utils.emitEvent(webView.WebMessageType.ARRAY_BUFFER, 30004)
              } catch (error) {
                let e: business_error.BusinessError = error as business_error.BusinessError;
                console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
              }
              break;
            }

            case "testWebMessageExtWebMessageType006": {
              try {
                console.info(`webView.WebMessageType.ARRAY :` + webView.WebMessageType.ARRAY)
                Utils.emitEvent(webView.WebMessageType.ARRAY, 30005)
              } catch (error) {
                let e: business_error.BusinessError = error as business_error.BusinessError;
                console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
              }
              break;
            }

            case "testWebMessageExtWebMessageType007": {
              try {
                console.info(`webView.WebMessageType.ERROR :` + webView.WebMessageType.ERROR)
                Utils.emitEvent(webView.WebMessageType.ERROR, 30006)
              } catch (error) {
                let e: business_error.BusinessError = error as business_error.BusinessError;
                console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
              }
              break;
            }

            case "testWebMessageExtSetType001": {
              try {
                this.message.setType(webView.WebMessageType.NOT_SUPPORT);
              } catch (error) {
                let e: business_error.BusinessError = error as business_error.BusinessError;
                console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                Utils.emitEvent(e.code, 36000)
              }
              break;
            }

            case "testWebMessageExtSetType002": {
              try {
                this.message.setType(webView.WebMessageType.STRING);
                let type_value = this.message.getType()
                Utils.emitEvent(type_value, 36001)
              } catch (error) {
                let e: business_error.BusinessError = error as business_error.BusinessError;
                console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
              }
              break;
            }

            case "testWebMessageExtSetType003": {
              try {
                this.message.setType(webView.WebMessageType.NUMBER);
                let type_value = this.message.getType()
                Utils.emitEvent(type_value, 36002)
              } catch (error) {
                let e: business_error.BusinessError = error as business_error.BusinessError;
                console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
              }
              break;
            }

            case "testWebMessageExtSetType004": {
              try {
                this.message.setType(webView.WebMessageType.BOOLEAN);
                let type_value = this.message.getType()
                Utils.emitEvent(type_value, 36003)
              } catch (error) {
                let e: business_error.BusinessError = error as business_error.BusinessError;
                console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
              }
              break;
            }

            case "testWebMessageExtSetType005": {
              try {
                this.message.setType(webView.WebMessageType.ARRAY_BUFFER);
                let type_value = this.message.getType()
                Utils.emitEvent(type_value, 36004)
              } catch (error) {
                let e: business_error.BusinessError = error as business_error.BusinessError;
                console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
              }
              break;
            }

            case "testWebMessageExtSetType006": {
              try {
                this.message.setType(webView.WebMessageType.ARRAY);
                let type_value = this.message.getType()
                Utils.emitEvent(type_value, 36005)
              } catch (error) {
                let e: business_error.BusinessError = error as business_error.BusinessError;
                console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
              }
              break;
            }

            case "testWebMessageExtSetType007": {
              try {
                this.message.setType(webView.WebMessageType.ERROR);
                let type_value = this.message.getType()
                Utils.emitEvent(type_value, 36006)
              } catch (error) {
                let e: business_error.BusinessError = error as business_error.BusinessError;
                console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
              }
              break;
            }

            case "testWebMessageExtGetString001": {
              this.listening_port = 100020
              this.listening_flag = 10
              this.controller.runJavaScript(
                'postStringToApp()',
                (error, result) => {
                  if (error) {
                    console.info(`run JavaScript error: ` + JSON.stringify(error))
                    return;
                  }
                  if (result) {
                    console.info(`The postStringToApp() return value is: ${result}`)
                  }
                });
              break;
            }

            case "testWebMessageExtGetNumber001": {
              this.listening_port = 100021
              this.listening_flag = 11
              this.controller.runJavaScript(
                'postNumberToApp()',
                (error, result) => {
                  if (error) {
                    console.info(`run JavaScript error: ` + JSON.stringify(error))
                    return;
                  }
                  if (result) {
                    console.info(`The postNumberToApp() return value is: ${result}`)
                  }
                });

              break;
            }

            case "testWebMessageExtGetBoolean001": {
              this.listening_port = 100022
              this.listening_flag = 12
              this.controller.runJavaScript(
                'postBooleanToApp()',
                (error, result) => {
                  if (error) {
                    console.info(`run JavaScript error: ` + JSON.stringify(error))
                    return;
                  }
                  if (result) {
                    console.info(`The postBooleanToApp() return value is: ${result}`)
                  }
                });
              break;
            }

            case "testWebMessageExtGetBoolean002": {
              this.listening_port = 100023
              this.listening_flag = 13
              this.controller.runJavaScript(
                'postBooleanFalseToApp()',
                (error, result) => {
                  if (error) {
                    console.info(`run JavaScript error: ` + JSON.stringify(error))
                    return;
                  }
                  if (result) {
                    console.info(`The postBooleanFalseToApp() return value is: ${result}`)
                  }
                });
              break;
            }

            case "testWebMessageExtGetArrayBuffer001": {
              this.listening_port = 100024
              this.listening_flag = 14
              this.controller.runJavaScript(
                'postArrayBufferToApp()',
                (error, result) => {
                  if (error) {
                    console.info(`run JavaScript error: ` + JSON.stringify(error))
                    return;
                  }
                  if (result) {
                    console.info(`The postArrayBufferToApp() return value is: ${result}`)
                  }
                });
              break;
            }

            case "testWebMessageExtGetArray001": {
              this.listening_port = 100025
              this.listening_flag = 15
              this.controller.runJavaScript(
                'postArrayToApp()',
                (error, result) => {
                  if (error) {
                    console.info(`run JavaScript error: ` + JSON.stringify(error))
                    return;
                  }
                  if (result) {
                    console.info(`The postArrayToApp() return value is: ${result}`)
                  }
                });
              break;
            }

            case "testWebMessageExtGetError001": {
              this.listening_port = 100026
              this.listening_flag = 16
              this.controller.runJavaScript(
                'postErrorToApp()',
                (error, result) => {
                  if (error) {
                    console.info(`run JavaScript error: ` + JSON.stringify(error))
                    return;
                  }
                  if (result) {
                    console.info(`The postErrorToApp() return value is: ${result}`)
                  }
                });
              break;
            }

            case "testWebMessageExtSetString001": {
              try {
                if (this.nativePort) {
                  this.message.setType(webView.WebMessageType.STRING);
                  this.message.setString("helloFromEts");
                  this.nativePort.postMessageEventExt(this.message);
                }
                await Utils.sleep(3000);
                this.controller.runJavaScript("postStringToHtml()", (error, result) => {
                  if (error) {
                    console.log(`The postStringToHtml() return value is: ${error}`);
                  }
                  console.log(`The postStringToHtml() return value is: ${result}`);
                  Utils.emitEvent(result, 100027)
                })
              }
              catch (error) {
                console.log("In eTS side send message catch error:" + error.code + ", msg:" + error.message);
                Utils.emitEvent(error.code, 100027)
              }
              break;
            }

            case "testWebMessageExtSetNumber001": {
              try {
                if (this.nativePort) {
                  this.message.setType(webView.WebMessageType.NUMBER);
                  this.message.setNumber(1);
                  this.nativePort.postMessageEventExt(this.message);
                }
                await Utils.sleep(3000);
                this.controller.runJavaScript("postNumberToHtml()", (error, result) => {
                  if (error) {
                    console.log(`The postNumberToHtml() return value is: ${error}`);
                  }
                  console.log(`The postNumberToHtml() return value is: ${result}`);
                  Utils.emitEvent(result, 100028)
                })
              }
              catch (error) {
                console.log("In eTS side send message catch error:" + error.code + ", msg:" + error.message);
                Utils.emitEvent(error.code, 100028)
              }
              break;
            }

            case "testWebMessageExtSetBoolean001": {
              try {
                if (this.nativePort) {
                  this.message.setType(webView.WebMessageType.BOOLEAN);
                  this.message.setBoolean(true);
                  this.nativePort.postMessageEventExt(this.message);
                }
                await Utils.sleep(3000);
                this.controller.runJavaScript("postBooleanToHtml()", (error, result) => {
                  if (error) {
                    console.log(`The postBooleanToHtml() return value is: ${error}`);
                  }
                  console.log(`The postBooleanToHtml() return value is: ${result}`);
                  Utils.emitEvent(result, 100029)
                })
              }
              catch (error) {
                console.log("In eTS side send message catch error:" + error.code + ", msg:" + error.message);
                Utils.emitEvent(error.code, 100029)
              }
              break;
            }

            case "testWebMessageExtSetBoolean002": {
              try {
                if (this.nativePort) {
                  this.message.setType(webView.WebMessageType.BOOLEAN);
                  this.message.setBoolean(false);
                  this.nativePort.postMessageEventExt(this.message);
                }
                await Utils.sleep(3000);
                this.controller.runJavaScript("postBooleanFalseToHtml()", (error, result) => {
                  if (error) {
                    console.log(`The postBooleanFalseToHtml() return value is: ${error}`);
                  }
                  console.log(`The postBooleanFalseToHtml() return value is: ${result}`);
                  Utils.emitEvent(result, 100030)
                })
              }
              catch (error) {
                console.log("In eTS side send message catch error:" + error.code + ", msg:" + error.message);
                Utils.emitEvent(error.code, 100030)
              }
              break;
            }

            case "testWebMessageExtSetArrayBuffer001": {
              try {
                if (this.nativePort) {
                  let buffer = new ArrayBuffer(8);
                  this.message.setType(webView.WebMessageType.ARRAY_BUFFER);
                  this.message.setArrayBuffer(buffer);
                  this.nativePort.postMessageEventExt(this.message);
                }
                await Utils.sleep(3000);
                this.controller.runJavaScript("postArrayBufferToHtml()", (error, result) => {
                  if (error) {
                    console.log(`The postArrayBufferToHtml() return value is: ${error}`);
                  }
                  console.log(`The postArrayBufferToHtml() return value is: ${result}`);
                  Utils.emitEvent(result, 100031)
                })
              }
              catch (error) {
                console.log("In eTS side send message catch error:" + error.code + ", msg:" + error.message);
                Utils.emitEvent(error.code, 100031)
              }
              break;
            }

            case "testWebMessageExtSetArray001": {
              try {
                if (this.nativePort) {
                  let fruits = ["apple"];
                  this.message.setType(webView.WebMessageType.ARRAY);
                  this.message.setArray(fruits);
                  this.nativePort.postMessageEventExt(this.message);
                }
                await Utils.sleep(3000);
                this.controller.runJavaScript("postArrayBufferToHtml()", (error, result) => {
                  if (error) {
                    console.log(`The postArrayBufferToHtml() return value is: ${error}`);
                  }
                  console.log(`The postArrayBufferToHtml() return value is: ${result}`);
                  Utils.emitEvent(result, 100032)
                })
              }
              catch (error) {
                console.log("In eTS side send message catch error:" + error.code + ", msg:" + error.message);
                Utils.emitEvent(error.code, 100032)
              }
              break;
            }

            case "testWebMessageExtSetError001": {
              try {
                try {
                  console.log("URL Error");
                  throw new URIError("URI seq")
                }
                catch (e) {
                  console.log("hwd URIError:" + (e instanceof SyntaxError));
                  console.log("hwd URIError:" + e.message);
                  console.log("hwd URIError:" + e.name);
                  if (this.nativePort) {
                    this.message.setType(webView.WebMessageType.ERROR);
                    this.message.setError(e);
                    this.nativePort.postMessageEventExt(this.message);
                  }
                  await Utils.sleep(3000);
                  this.controller.runJavaScript("postErrorToHtml()", (error, result) => {
                    if (error) {
                      console.log(`The postErrorToHtml() return value is: ${error}`);
                    }
                    console.log(`The postErrorToHtml() return value is: ${result}`);
                    Utils.emitEvent(result, 100033)
                  })
                }
              }
              catch (error) {
                console.log("In eTS side send message catch error:" + error.code + ", msg:" + error.message);
                Utils.emitEvent(error.code, 100033)
              }
              break;
            }

          }
        })
      }

      Web({ src: $rawfile('onMessageEventExt.html'), controller: this.controller })
        .javaScriptAccess(this.javaScriptAccess)
        .javaScriptProxy({
          object: this.jsObj,
          name: "backToEts",
          methodList: ["test", "toString"],
          controller: this.controller
        })
        .onPageEnd((event) => {
          if (event) {
            this.ports = this.controller.createWebMessagePorts(true);
            this.controller.postMessage("init_web_messageport", [this.ports[1]], "*");
            this.nativePort = this.ports[0];
            this.nativePort.onMessageEventExt((result) => {
              try {
                if (this.listening_flag == 0) {
                  return;
                }
                else if (this.listening_flag == 1) {
                  let value = result.getType()
                  console.info(`The postTypeToApp() return value is: ${value}`)
                  Utils.emitEvent(value, this.listening_port)
                }
                else if (this.listening_flag == 2) {
                  let value = result.getType()
                  console.info(`The postTypeToApp() return value is: ${value}`)
                  Utils.emitEvent(value, this.listening_port)
                }
                else if (this.listening_flag == 3) {
                  let value = result.getType()
                  console.info(`The postTypeToApp() return value is: ${value}`)
                  Utils.emitEvent(value, this.listening_port)
                }
                else if (this.listening_flag == 4) {
                  let value = result.getType()
                  console.info(`The postTypeToApp() return value is: ${value}`)
                  Utils.emitEvent(value, this.listening_port)
                }
                else if (this.listening_flag == 5) {
                  let value = result.getType()
                  console.info(`The postTypeToApp() return value is: ${value}`)
                  Utils.emitEvent(value, this.listening_port)
                }
                else if (this.listening_flag == 6) {
                  let value = result.getType()
                  console.info(`The postTypeToApp() return value is: ${value}`)
                  Utils.emitEvent(value, this.listening_port)
                }
                else if (this.listening_flag == 10) {
                  let value = result.getString()
                  console.info(`The postStringToApp() return value is: ${value}`)
                  Utils.emitEvent(value, this.listening_port)
                }
                else if (this.listening_flag == 11) {
                  let value = result.getNumber()
                  console.info(`The postNumberToApp() return value is: ${value}`)
                  Utils.emitEvent(value, this.listening_port)
                }
                else if (this.listening_flag == 12) {
                  let value = result.getBoolean()
                  console.info(`The postBooleanToApp() return value is: ${value}`)
                  Utils.emitEvent(value, this.listening_port)
                }
                else if (this.listening_flag == 13) {
                  let value = result.getBoolean()
                  console.info(`The postBooleanFalseToApp() return value is: ${value}`)
                  Utils.emitEvent(value, this.listening_port)
                }
                else if (this.listening_flag == 14) {
                  let value = 'result getArrayBuffer byteLength:' + result.getArrayBuffer().byteLength
                  console.info(`The postArrayBufferToApp() return value is: ${value}`)
                  Utils.emitEvent(value, this.listening_port)
                }
                else if (this.listening_flag == 15) {
                  let value = result.getArray()
                  console.info(`The postArrayToApp() return value is: ${value[0]}`)
                  Utils.emitEvent(value[0], this.listening_port)
                }
                else if (this.listening_flag == 16) {
                  let value = result.getError().message
                  console.info(`The postErrorToApp() return value is: ${value}`)
                  Utils.emitEvent(value, this.listening_port)
                }
              } catch (resError) {
                console.log(`log error code: ${resError.code}, Message: ${resError.message}`);
              }
            });
            console.log('url:' + event.url)
          }

        })

    }
  }
}
