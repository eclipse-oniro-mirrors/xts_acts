/*
 * Copyright (c) 2025-2026 Huawei Device Co., Ltd.
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
import { Hypium } from '../../../hypium/index';
import testsuite from '../../src/test/List.test';
import {OnPageEndEvent, Entry, Component, Column, Row, Button, ClickEvent, Web } from "@ohos.arkui.component"
import { State } from "@ohos.arkui.stateManagement" // should be insert by ui-plugins
import { BusinessError } from '@ohos.base';
import Utils from '../../src/test/Utils.test';
import emitter from '@ohos.events.emitter';
import events_emitter from '@ohos.events.emitter';
import { Callback, RecordData } from '@ohos.base'
import { UIContext, Router } from '@ohos.arkui.UIContext'
import image from '@ohos.multimedia.image';

class StringFields {
  public str: string = '';
}

class WebMessagePortImpl implements webView.WebMessagePort {
  isExtentionType?: boolean = false;


  close(): void {
  }

  postMessageEvent(message: webView.WebMessage): void {
  }


  onMessageEvent(callback: (result: webView.WebMessage) => void): void {
  }


  postMessageEventExt(message: webView.WebMessageExt): void {
  }

  onMessageEventExt(callback: (result: webView.WebMessageExt) => void): void{

  }
}

@Entry
@Component
struct webMessageExt {
  stringObj: StringFields  = new StringFields ();
  controller: webView.WebviewController = new webView.WebviewController(undefined);
  nativePort: webView.WebMessagePort =  new WebMessagePortImpl();
  message: webView.WebMessageExt = new webView.WebMessageExt();
  @State str: string = ""
  @State javaScriptAccess: boolean = true;
  @State databaseAccess: boolean = true;
  @State ports: Array<webView.WebMessagePort> = new Array<webView.WebMessagePort>()
  @State listening_port: number = 0
  @State listening_flag: number = 0

  aboutToAppear() {
    let valueChangeEvent: events_emitter.InnerEvent = {
      eventId: 10,
      priority: events_emitter.EventPriority.LOW
    }
    events_emitter.on(valueChangeEvent, this.valueChangeCallBack)
  }

  private valueChangeCallBack: Callback<events_emitter.EventData> = (eventData: events_emitter.EventData): void => {
    if (eventData != null) {
      console.info('valueChangeCallBack:' + JSON.stringify(eventData));
      const data = eventData.data as Record<string, RecordData>;
      if (data != null && data['ACTION'] != null) {
        let strValue: string = String(data['ACTION']);
        this.stringObj.str = strValue;
      }
    }
  }

  build() {
    Column() {
      Row() {
        Button("webMessageExt click").key('WebMessageExtButton').onClick( (e:ClickEvent) => {
          console.info("key==>" +  this.stringObj.str)
          switch (this.stringObj.str) {

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
                let e: BusinessError = error as BusinessError;
                console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
              }
              break;
            }

            case "testWebMessageExtWebMessageType002": {
              try {
                console.info(`webView.WebMessageType.STRING :` + webView.WebMessageType.STRING)
                Utils.emitEvent(webView.WebMessageType.STRING, 30001)
              } catch (error) {
                let e: BusinessError = error as BusinessError;
                console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
              }
              break;
            }

            case "testWebMessageExtWebMessageType003": {
              try {
                console.info(`webView.WebMessageType.NUMBER :` + webView.WebMessageType.NUMBER)
                Utils.emitEvent(webView.WebMessageType.NUMBER, 30002)
              } catch (error) {
                let e: BusinessError = error as BusinessError;
                console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
              }
              break;
            }

            case "testWebMessageExtWebMessageType004": {
              try {
                console.info(`webView.WebMessageType.BOOLEAN :` + webView.WebMessageType.BOOLEAN)
                Utils.emitEvent(webView.WebMessageType.BOOLEAN, 30003)
              } catch (error) {
                let e: BusinessError = error as BusinessError;
                console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
              }
              break;
            }

            case "testWebMessageExtWebMessageType005": {
              try {
                console.info(`webView.WebMessageType.ARRAY_BUFFER :` + webView.WebMessageType.ARRAY_BUFFER)
                Utils.emitEvent(webView.WebMessageType.ARRAY_BUFFER, 30004)
              } catch (error) {
                let e: BusinessError = error as BusinessError;
                console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
              }
              break;
            }

            case "testWebMessageExtWebMessageType006": {
              try {
                console.info(`webView.WebMessageType.ARRAY :` + webView.WebMessageType.ARRAY)
                Utils.emitEvent(webView.WebMessageType.ARRAY, 30005)
              } catch (error) {
                let e: BusinessError = error as BusinessError;
                console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
              }
              break;
            }

            case "testWebMessageExtWebMessageType007": {
              try {
                console.info(`webView.WebMessageType.ERROR :` + webView.WebMessageType.ERROR)
                Utils.emitEvent(webView.WebMessageType.ERROR, 30006)
              } catch (error) {
                let e: BusinessError = error as BusinessError;
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
                setTimeout(() => {
                this.controller.runJavaScript("postStringToHtml()", (error, result) => {
                  if (error) {
                    console.log(`The postStringToHtml() return value is: ${error}`);
                  }
                  console.log(`The postStringToHtml() return value is: ${result}`);
                  if (result) {
                    Utils.emitEvent(result, 100027)
                  }
                })
                }, 1000)
              } catch (error) {
                error = error as BusinessError;
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
                setTimeout(() => {
                this.controller.runJavaScript("postNumberToHtml()", (error, result) => {
                  if (error) {
                    console.log(`The postNumberToHtml() return value is: ${error}`);
                  }
                  console.log(`The postNumberToHtml() return value is: ${result}`);
                  if (result) {
                    Utils.emitEvent(result, 100028)
                  }
                })
              }, 1000)
              } catch (error) {
                error = error as BusinessError;
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
                setTimeout(() => {
                this.controller.runJavaScript("postBooleanToHtml()", (error, result) => {
                  if (error) {
                    console.log(`The postBooleanToHtml() return value is: ${error}`);
                  }
                  console.log(`The postBooleanToHtml() return value is: ${result}`);
                  if (result) {
                    Utils.emitEvent(result, 100029)
                  }
                })
                }, 1000)
              } catch (error) {
                error = error as BusinessError;
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
                setTimeout(() => {
                this.controller.runJavaScript("postBooleanFalseToHtml()", (error, result) => {
                  if (error) {
                    console.log(`The postBooleanFalseToHtml() return value is: ${error}`);
                  }
                  console.log(`The postBooleanFalseToHtml() return value is: ${result}`);
                  if (result) {
                    Utils.emitEvent(result, 100030)
                  }
                })
                }, 1000)
              } catch (error) {
                error = error as BusinessError;
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
                setTimeout(() => {
                this.controller.runJavaScript("postArrayBufferToHtml()", (error, result) => {
                  if (error) {
                    console.log(`The postArrayBufferToHtml() return value is: ${error}`);
                  }
                  console.log(`The postArrayBufferToHtml() return value is: ${result}`);
                  if (result) {
                    Utils.emitEvent(result, 100031)
                  }
                })
              }, 1000)
              } catch (error) {
                error = error as BusinessError;
                console.log("In eTS side send message catch error:" + error.code + ", msg:" + error.message);
                Utils.emitEvent(error.code, 100031)
              }
              break;
            }

            case "testWebMessageExtSetArray001": {
              try {
                if (this.nativePort) {
                  let fruits = ["apple"] as Array<string|Double|Long|boolean>;
                  this.message.setType(webView.WebMessageType.ARRAY);
                  this.message.setArray(fruits);
                  this.nativePort.postMessageEventExt(this.message);
                }
                setTimeout(() => {
                this.controller.runJavaScript("postArrayBufferToHtml()", (error, result) => {
                  if (error) {
                    console.log(`The postArrayBufferToHtml() return value is: ${error}`);
                  }
                  console.log(`The postArrayBufferToHtml() return value is: ${result}`);
                  if (result) {
                    Utils.emitEvent(result, 100032)
                  }
                })
                }, 1000)
              } catch (error) {
                error = error as BusinessError;
                console.log("In eTS side send message catch error:" + error.code + ", msg:" + error.message);
                Utils.emitEvent(error.code, 100032)
              }
              break;
            }

            case 'SwitchNextPageStatic' : {
              let uiContext: UIContext = this.getUIContext();
              let router: Router = uiContext.getRouter();
              router.pushUrl({ url: 'pages/webViewEnumAndFontLibrary' })
              console.log('push URL success')
            }

          }
        })
      }

      Web({ src: 'resource://rawfile/onMessageEventExt.html', controller: this.controller })
        .javaScriptAccess(this.javaScriptAccess)

        .onPageEnd((event:OnPageEndEvent):void => {
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
                  Utils.emitEvent(value, this.listening_port as Long)
                } else if (this.listening_flag == 2) {
                  let value = result.getType()
                  console.info(`The postTypeToApp() return value is: ${value}`)
                  Utils.emitEvent(value, this.listening_port as Long)
                } else if (this.listening_flag == 3) {
                  let value = result.getType()
                  console.info(`The postTypeToApp() return value is: ${value}`)
                  Utils.emitEvent(value, this.listening_port as Long)
                } else if (this.listening_flag == 4) {
                  let value = result.getType()
                  console.info(`The postTypeToApp() return value is: ${value}`)
                  Utils.emitEvent(value, this.listening_port as Long)
                } else if (this.listening_flag == 5) {
                  let value = result.getType()
                  console.info(`The postTypeToApp() return value is: ${value}`)
                  Utils.emitEvent(value, this.listening_port as Long)
                } else if (this.listening_flag == 6) {
                  let value = result.getType()
                  console.info(`The postTypeToApp() return value is: ${value}`)
                  Utils.emitEvent(value, this.listening_port as Long)
                } else if (this.listening_flag == 10) {
                  let value = result.getString()
                  console.info(`The postStringToApp() return value is: ${value}`)
                  Utils.emitEvent(value, this.listening_port as Long)
                } else if (this.listening_flag == 11) {
                  let value = result.getNumber()
                  console.info(`The postNumberToApp() return value is: ${value}`)
                  Utils.emitEvent(value, this.listening_port as Long)
                } else if (this.listening_flag == 12) {
                  let value = result.getBoolean()
                  console.info(`The postBooleanToApp() return value is: ${value}`)
                  Utils.emitEvent(value, this.listening_port as Long)
                } else if (this.listening_flag == 13) {
                  let value = result.getBoolean()
                  console.info(`The postBooleanFalseToApp() return value is: ${value}`)
                  Utils.emitEvent(value, this.listening_port as Long)
                } else if (this.listening_flag == 14) {
                  let value = 'result getArrayBuffer byteLength:' + result.getArrayBuffer().byteLength
                  console.info(`The postArrayBufferToApp() return value is: ${value}`)
                  Utils.emitEvent(value, this.listening_port as Long)
                } else if (this.listening_flag == 15) {
                  let value = result.getArray()
                  console.info(`The postArrayToApp() return value is: ${value[0]}`)
                  Utils.emitEvent(value[0], this.listening_port as Long)
                } else if (this.listening_flag == 16) {
                  let value = result.getError().message
                  console.info(`The postErrorToApp() return value is: ${value}`)
                  Utils.emitEvent(value, this.listening_port as Long)
                }
              } catch (resError) {
                console.log(`log error code: ${resError.code}, Message: ${resError.message}`);
              }
            });
            console.log('url:' + event.url)
          }
        } as Callback<OnPageEndEvent>)
    }
  }
}
