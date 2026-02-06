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
import AbilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import { Hypium } from '@ohos/hypium';
import testsuite from '../../test/List.test';
import {waitForAssert, waitForExist} from '../../test/WaitTest';

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
  @State isReceive: number = -1;
  @State isPageEnd: number = -1;

  onPageShow() {
    let valueChangeEvent: events_emitter.InnerEvent = {
      eventId: 170010,
      priority: events_emitter.EventPriority.LOW
    }
    events_emitter.on(valueChangeEvent, this.valueChangeCallBack)
  }

  onPageHide() {
    events_emitter.off(170010)
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

  aboutToAppear() {
    let abilityDelegator = AbilityDelegatorRegistry.getAbilityDelegator();
    let abilityDelegatorArguments = AbilityDelegatorRegistry.getArguments();
    console.info('start run testcase!!!');
    Hypium.hypiumTest(abilityDelegator, abilityDelegatorArguments, testsuite);
  }
  build() {
    Column() {
      Row() {
        Button("webMessageExt click").key('WebMessageExtButton').onClick(async () => {
          await waitForExist(()=>this.isPageEnd, 'WebMessageExtButtonIsPageEnd', 0);
          await waitForExist(()=>this.isReceive, 'WebMessageExtButtonIsReceive', 0);
          console.info("key==>" + this.str);
          this.isReceive = -1;
          switch (this.str) {
            case "testWebMessageExGetType001": {
              this.listening_port = 170020
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
              this.listening_port = 170030
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
              this.listening_port = 170040
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
              this.listening_port = 170050
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
              this.listening_port = 170060
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
              this.listening_port = 170070
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
                Utils.emitEvent(webView.WebMessageType.NOT_SUPPORT, 170080)
              } catch (error) {
                let e: business_error.BusinessError = error as business_error.BusinessError;
                console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
              }
              break;
            }

            case "testWebMessageExtWebMessageType002": {
              try {
                console.info(`webView.WebMessageType.STRING :` + webView.WebMessageType.STRING)
                Utils.emitEvent(webView.WebMessageType.STRING, 170090)
              } catch (error) {
                let e: business_error.BusinessError = error as business_error.BusinessError;
                console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
              }
              break;
            }

            case "testWebMessageExtWebMessageType003": {
              try {
                console.info(`webView.WebMessageType.NUMBER :` + webView.WebMessageType.NUMBER)
                Utils.emitEvent(webView.WebMessageType.NUMBER, 170100)
              } catch (error) {
                let e: business_error.BusinessError = error as business_error.BusinessError;
                console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
              }
              break;
            }

            case "testWebMessageExtWebMessageType004": {
              try {
                console.info(`webView.WebMessageType.BOOLEAN :` + webView.WebMessageType.BOOLEAN)
                Utils.emitEvent(webView.WebMessageType.BOOLEAN, 170110)
              } catch (error) {
                let e: business_error.BusinessError = error as business_error.BusinessError;
                console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
              }
              break;
            }

            case "testWebMessageExtWebMessageType005": {
              try {
                console.info(`webView.WebMessageType.ARRAY_BUFFER :` + webView.WebMessageType.ARRAY_BUFFER)
                Utils.emitEvent(webView.WebMessageType.ARRAY_BUFFER, 170120)
              } catch (error) {
                let e: business_error.BusinessError = error as business_error.BusinessError;
                console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
              }
              break;
            }

            case "testWebMessageExtWebMessageType006": {
              try {
                console.info(`webView.WebMessageType.ARRAY :` + webView.WebMessageType.ARRAY)
                Utils.emitEvent(webView.WebMessageType.ARRAY, 170130)
              } catch (error) {
                let e: business_error.BusinessError = error as business_error.BusinessError;
                console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
              }
              break;
            }

            case "testWebMessageExtWebMessageType007": {
              try {
                console.info(`webView.WebMessageType.ERROR :` + webView.WebMessageType.ERROR)
                Utils.emitEvent(webView.WebMessageType.ERROR, 170140)
              } catch (error) {
                let e: business_error.BusinessError = error as business_error.BusinessError;
                console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
              }
              break;
            }

            case "testWebMessageExtGetString001": {
              this.listening_port = 170150
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
              this.listening_port = 170160
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
              this.listening_port = 170170
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
              this.listening_port = 170180
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
              this.listening_port = 170190
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
              this.listening_port = 170200
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
              this.listening_port = 170210
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
                  Utils.emitEvent(result, 170220)
                })
              } catch (error) {
                console.log("In eTS side send message catch error:" + error.code + ", msg:" + error.message);
                Utils.emitEvent(error.code, 170220)
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
                  Utils.emitEvent(result, 170230)
                })
              } catch (error) {
                console.log("In eTS side send message catch error:" + error.code + ", msg:" + error.message);
                Utils.emitEvent(error.code, 170230)
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
                  Utils.emitEvent(result, 170240)
                })
              } catch (error) {
                console.log("In eTS side send message catch error:" + error.code + ", msg:" + error.message);
                Utils.emitEvent(error.code, 170240)
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
                  Utils.emitEvent(result, 170250)
                })
              } catch (error) {
                console.log("In eTS side send message catch error:" + error.code + ", msg:" + error.message);
                Utils.emitEvent(error.code, 170250)
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
                  Utils.emitEvent(result, 170260)
                })
              } catch (error) {
                console.log("In eTS side send message catch error:" + error.code + ", msg:" + error.message);
                Utils.emitEvent(error.code, 170260)
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
                  Utils.emitEvent(result, 170270)
                })
              } catch (error) {
                console.log("In eTS side send message catch error:" + error.code + ", msg:" + error.message);
                Utils.emitEvent(error.code, 170270)
              }
              break;
            }

            case "testWebMessageExtSetError001": {
              try {
                try {
                  console.log("URL Error");
                  throw new URIError("URI seq")
                } catch (e) {
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
                    Utils.emitEvent(result, 170280)
                  })
                }
              } catch (error) {
                console.log("In eTS side send message catch error:" + error.code + ", msg:" + error.message);
                Utils.emitEvent(error.code, 170280)
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
          console.log('onPageEnd url:' + event.url);
          this.isPageEnd = 0;
          if (event) {
            this.ports = this.controller.createWebMessagePorts(true);
            this.controller.postMessage("init_web_messageport", [this.ports[1]], "*");
            this.nativePort = this.ports[0];
            this.nativePort.onMessageEventExt((result) => {
              try {
                if (this.listening_flag == 0) {
                  return;
                } else if (this.listening_flag == 1) {
                  let value = result.getType()
                  console.info(`The postTypeToApp() return value is: ${value}`)
                  Utils.emitEvent(value, this.listening_port)
                } else if (this.listening_flag == 2) {
                  let value = result.getType()
                  console.info(`The postTypeToApp() return value is: ${value}`)
                  Utils.emitEvent(value, this.listening_port)
                } else if (this.listening_flag == 3) {
                  let value = result.getType()
                  console.info(`The postTypeToApp() return value is: ${value}`)
                  Utils.emitEvent(value, this.listening_port)
                } else if (this.listening_flag == 4) {
                  let value = result.getType()
                  console.info(`The postTypeToApp() return value is: ${value}`)
                  Utils.emitEvent(value, this.listening_port)
                } else if (this.listening_flag == 5) {
                  let value = result.getType()
                  console.info(`The postTypeToApp() return value is: ${value}`)
                  Utils.emitEvent(value, this.listening_port)
                } else if (this.listening_flag == 6) {
                  let value = result.getType()
                  console.info(`The postTypeToApp() return value is: ${value}`)
                  Utils.emitEvent(value, this.listening_port)
                } else if (this.listening_flag == 10) {
                  let value = result.getString()
                  console.info(`The postStringToApp() return value is: ${value}`)
                  Utils.emitEvent(value, this.listening_port)
                } else if (this.listening_flag == 11) {
                  let value = result.getNumber()
                  console.info(`The postNumberToApp() return value is: ${value}`)
                  Utils.emitEvent(value, this.listening_port)
                } else if (this.listening_flag == 12) {
                  let value = result.getBoolean()
                  console.info(`The postBooleanToApp() return value is: ${value}`)
                  Utils.emitEvent(value, this.listening_port)
                } else if (this.listening_flag == 13) {
                  let value = result.getBoolean()
                  console.info(`The postBooleanFalseToApp() return value is: ${value}`)
                  Utils.emitEvent(value, this.listening_port)
                } else if (this.listening_flag == 14) {
                  let value = 'result getArrayBuffer byteLength:' + result.getArrayBuffer().byteLength
                  console.info(`The postArrayBufferToApp() return value is: ${value}`)
                  Utils.emitEvent(value, this.listening_port)
                } else if (this.listening_flag == 15) {
                  let value = result.getArray()
                  console.info(`The postArrayToApp() return value is: ${value[0]}`)
                  Utils.emitEvent(value[0], this.listening_port)
                } else if (this.listening_flag == 16) {
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
