/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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
import {
  OnTouchIconUrlReceivedEvent,
  OnPageEndEvent,
  OnHttpErrorReceiveEvent,
  OnSearchResultReceiveEvent,
  WebDarkMode,
  Entry,
  Component,
  Column,
  Row,
  Button,
  ClickEvent,
  Web,
  Text
} from "@ohos.arkui.component"
import { State } from "@ohos.arkui.stateManagement" // should be insert by ui-plugins
import web_webview from '@ohos.web.webview'
import { BusinessError, RecordData } from '@ohos.base';
import Utils from '../../src/test/Util.test';
import emitter from '@ohos.events.emitter';
import events_emitter from '@ohos.events.emitter';
import { UIContext, Router } from '@ohos.arkui.UIContext'
import { Callback,RecordData } from '@ohos.base'

class StringFields {
  public str: string = '';
}

@Entry
@Component
struct Index {
  stringObj: StringFields  = new StringFields ();
  controller: web_webview.WebviewController = new web_webview.WebviewController(undefined);
  @State text: boolean = false;
  @State num: number = 0;
  @State mode: WebDarkMode = WebDarkMode.OFF;
  @State getString: boolean = false;
  @State getNum: boolean = false;
  @State getBoo: boolean = false;
  @State getArrayBuffer: boolean = false;
  @State getArray: boolean = false;
  @State msg1: string = "";
  @State type: number = 0;
  ports: Array<web_webview.WebMessagePort> = new Array<web_webview.WebMessagePort>();
  message: web_webview.WebMessageExt = new web_webview.WebMessageExt();
  nativePort: web_webview.WebMessagePort | null = null;
  @State webMessResult: string|undefined = ""

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
        Text(this.msg1).fontSize(16)
        Button("WebDownloadErrorCodeButton").key('webcomponent').onClick((e: ClickEvent) => {
          console.info("key==>" +  this.stringObj.str)
          switch (this.stringObj.str) {

            case "emitDeleteJavaScriptRegister": {
              try {
                this.controller.deleteJavaScriptRegister("objName");
                this.controller.deleteJavaScriptRegister("objName");
              } catch (error) {
                error = error as BusinessError;
                console.error(`Errorcode: ${error.code}, `);
                Utils.emitEvent(`${error.code}`, 14);
              }
              break;
            }

            case "emitJsMessExtGetString": {
              try {
                this.getString = true;
                this.controller.loadUrl("resource://rawfile/index.html")
              } catch (error) {
                error = error as BusinessError;
                console.error(`ErrorCode: ${error.code},    `);
              }
              break;
            }

            case "emitJsMessExtGetNum": {
              try {
                this.getNum = true;
                this.controller.loadUrl("resource://rawfile/index.html")
              } catch (error) {
                error = error as BusinessError;
                console.error(`ErrorCode: ${error.code}, `);
              }
              break;
            }

            case "emitJsMessExtGetBoo": {
              try {
                this.getBoo = true;
                this.controller.loadUrl("resource://rawfile/index.html")
              } catch (error) {
                error = error as BusinessError;
                console.error(`ErrorCode: ${error.code}, `);
              }
              break;
            }

            case "emitJsMessExtGetArrayBuffer": {
              try {
                this.getArrayBuffer = true;
                this.controller.loadUrl("resource://rawfile/index.html")
              } catch (error) {
                error = error as BusinessError;
                console.error(`ErrorCode: ${error.code},    `);
              }
              break;
            }

            case "emitJsMessExtGetArray": {
              try {
                this.getArray = true;
                this.controller.loadUrl("resource://rawfile/index.html")
              } catch (error) {
                error = error as BusinessError;
                console.error(`ErrorCode: ${error.code},    `);
              }
              break;
            }

            case "emitWebMessExtSetString": {
              try {
                this.controller.loadUrl("resource://rawfile/webMessageExt.html");
                console.log("In eTS side send true start");
                setTimeout(() => {
                if (this.nativePort) {
                    this.message.setType(web_webview.WebMessageType.STRING);
                    this.message.setString("helloFromEts");
                    this.nativePort?.postMessageEventExt(this.message);
                };
                }, 4000);
                setTimeout(() => {
                  this.controller.runJavaScript("postStringToHtml()", (error, result) => {
                    console.log(`The emitWebMessExtSetString() return value is: ${result}`);
                    setTimeout(() => {
                   this.webMessResult = result;
                   if (this.webMessResult) {
                     Utils.emitEvent(this.webMessResult as String, 506);
                   }
                    }, 2000);
                  });
                }, 7000);

              } catch (error) {
                error = error as BusinessError;
                console.log("In eTS side send message catch error:" + error.code + ", msg:" + error.message);
              }
              break;
            }

            case "emitWebMessExtGetString": {
              try {
                this.controller.loadUrl("resource://rawfile/webMessageExt.html");
                this.controller.runJavaScript("postStringToApp()", (error, result) => {
                  console.log(`The emitWebMessExtGetString() return value is: ${result}`);
                })
              } catch (error) {
                error = error as BusinessError;
                console.log("In eTS side send message catch error:" + error.code + ", msg:" + error.message);
              }
              break;
            }

            case "emitWebMessExtSetNumber": {
              try {
                this.controller.loadUrl("resource://rawfile/webMessageExt.html");
                console.log("In eTS side send true start");
                if (this.nativePort) {
                  setTimeout(() => {
                    this.message.setType(web_webview.WebMessageType.NUMBER);
                    this.message.setNumber(1);
                    this.nativePort!.postMessageEventExt(this.message);
                  }, 2000);
                }
                setTimeout(() => {
                  this.controller.runJavaScript("postNumberToHtml()", (error, result) => {
                    console.log(`The emitWebMessExtSetNumber() return value is: ${result}`);
                    if (result) {
                      Utils.emitEvent(result, 507);
                    }
                  });
                }, 3000);
              } catch (error) {
                error = error as BusinessError;
                console.log("In eTS side send message catch error:" + error.code + ", msg:" + error.message);
              }
              break;
            }

            case "emitWebMessExtGetNumber": {
              try {
                this.controller.loadUrl("resource://rawfile/webMessageExt.html");
                setTimeout(() => {
                this.controller.runJavaScript("postNumberToApp()", (error, result) => {
                  console.log(`The emitWebMessExtGetNumber() return value is: ${result}`);
                })
                }, 2000);
              } catch (error) {
                error = error as BusinessError;
                console.log("In eTS side send message catch error:" + error.code + ", msg:" + error.message);
              }
              break;
            }

            case "emitWebMessExtSetBoolean": {
              try {
                this.controller.loadUrl("resource://rawfile/webMessageExt.html");
                console.log("In eTS side send true start");
                if (this.nativePort) {
                  setTimeout(() => {
                    this.message.setType(web_webview.WebMessageType.BOOLEAN);
                    this.message.setBoolean(true);
                    this.nativePort!.postMessageEventExt(this.message);
                  }, 2000);
                }
                setTimeout(() => {
                  this.controller.runJavaScript("postBooleanToHtml()", (error, result) => {
                    console.log(`The emitWebMessExtSetBoolean() return value is: ${result}`);
                    if (result) {
                      Utils.emitEvent(result, 509);
                    }
                  })
                }, 3000);
              } catch (error) {
                error = error as BusinessError;
                console.log("In eTS side send message catch error:" + error.code + ", msg:" + error.message);
              }
              break;
            }

            case "emitWebMessExtGetBoolean": {
              try {
                this.controller.loadUrl("resource://rawfile/webMessageExt.html");
                this.controller.runJavaScript("postBooleanToApp()", (error, result) => {
                  console.log(`The emitWebMessExtGetBoolean() return value is: ${result}`);
                })
              } catch (error) {
                error = error as BusinessError;
                console.log("In eTS side send message catch error:" + error.code + ", msg:" + error.message);
              }
              break;
            }
            case "emitWebMessExtSetArray": {
              try {
                this.controller.loadUrl("resource://rawfile/webMessageExt.html");
                console.log("In eTS side send true start");
                if (this.nativePort) {
                  setTimeout(() => {
                    this.message.setType(web_webview.WebMessageType.ARRAY);
                    this.message.setArray(["apple", "banana"]);
                    this.nativePort!.postMessageEventExt(this.message);
                  }, 2000)
                }
                setTimeout(() => {
                  this.controller.runJavaScript("postArrayToHtml()", (error, result) => {
                    console.log(`The emitWebMessExtSetArray() return value is: ${result}`);
                    if (result) {
                      Utils.emitEvent(result, 511)
                    }
                  })
                }, 3000)
              } catch (error) {
                error = error as BusinessError;
                console.log("In eTS side send message catch error:" + error.code + ", msg:" + error.message);
              }
              break;
            }
//
            case "emitWebMessExtSetArrayBuffer": {
              try {
                this.controller.loadUrl("resource://rawfile/webMessageExt.html");
                console.log("In eTS side send true start");
                if (this.nativePort) {
                  setTimeout(() => {
                    let buffer = new ArrayBuffer(8);
                    this.message.setType(web_webview.WebMessageType.ARRAY_BUFFER);
                    this.message.setArrayBuffer(buffer);
                    this.nativePort!.postMessageEventExt(this.message);
                  }, 2000)
                }
                setTimeout(() => {
                  this.controller.runJavaScript("postArrayBufferToHtml()", (error, result) => {
                    console.log(`The emitWebMessExtSetArrayBuffer() return value is: ${result}`);
                    if (result) {
                      Utils.emitEvent(result, 513);
                    }
                  })
                }, 3000)
              } catch (error) {
                error = error as BusinessError;
                console.log("In eTS side send message catch error:" + error.code + ", msg:" + error.message);
              }
              break;
            }
            case "emitWebMessExtGetArrayBuffer": {
              try {
                this.controller.loadUrl("resource://rawfile/webMessageExt.html");
                this.controller.runJavaScript("postArrayBufferToApp()", (error, result) => {
                  console.log(`The emitWebMessExtGetArrayBuffer() return value is: ${result}`);
                })
              } catch (error) {
                error = error as BusinessError;
                console.log("In eTS side send message catch error:" + error.code + ", msg:" + error.message);
              }
              break;
            }
            case "emitWebMessExtSetError": {
              try {
                console.log("emitWebMessExtSetError Error0");
                throw new ReferenceError("Error");
                console.log("emitWebMessExtSetError Error1");
              } catch (error) {
                console.log("URIError:" + error) ;

                if (this.nativePort) {
                  setTimeout(() => {
                    this.message.setType(web_webview.WebMessageType.ERROR);
                    this.message.setError(error);
                    this.nativePort!.postMessageEventExt(this.message);
                  }, 2000)
                }
              }
              setTimeout(() => {
                this.controller.runJavaScript("postErrorToHtml()", (error, result) => {
                  console.log(`The emitWebMessExtSetError() return value is: ${result}`);
                  if (result) {
                    Utils.emitEvent(result, 515);
                  }
                })
              }, 3000)
              break;
            }
            case "emitWebMessExtGetError": {
              try {
                this.controller.loadUrl("resource://rawfile/webMessageExt.html");
                this.controller.runJavaScript("postErrorToApp()", (error, result) => {
                  console.log(`The emitWebMessExtGetError() return value is: ${result}`);
                })
              } catch (error) {
                error = error as BusinessError;
                console.log("In eTS side send message catch error:" + error.code + ", msg:" + error.message);
              }
              break;
            }

            case 'SwitchNextPageStatic' : {
              let uiContext: UIContext = this.getUIContext();
              let router: Router = uiContext.getRouter();
              router.pushUrl({ url: 'pages/webViewMetaViewportFalse' })
              console.log('push URL success')
            }

          }
        })
      }

      Web({ src: "resource://rawfile/index.html", controller: this.controller })
        .mediaPlayGestureAccess(true)
        .javaScriptAccess(true)
        .zoomAccess(this.text)
        .onSearchResultReceive(ret => {
          let searchResult = ret.activeMatchOrdinal.toString() +
          ret.numberOfMatches.toString();
          console.log("searchResult" + searchResult);
        })
        .onHttpErrorReceive((event: OnHttpErrorReceiveEvent): void => {
          event.response.setResponseIsReady(true);
        })
        .onPageEnd((event: OnPageEndEvent): void => {
          if (this.getString) {
            try {
              this.controller.runJavaScriptExt(
                'getStringForJs()',
                (error, result) => {
                  if (error) {
                    console.info(`run JavaScript error: ` + JSON.stringify(error))
                    return;
                  }
                  let type = result?.getType();
                  if (web_webview.JsMessageType.STRING == type) {
                    this.msg1 = "result type:" + typeof (result?.getString());
                    Utils.emitEvent(this.msg1, 500)
                  }
                });
              console.info('urlgetstring: ', event.url);
            } catch (error) {
              error = error as BusinessError;
              console.error(`ErrorCode: ${error.code}, `);
            }
          }

          if (this.getNum) {
            try {
              this.controller.runJavaScriptExt(
                'getNumForJs()',
                (error, result) => {
                  if (error) {
                    console.info(`run JavaScript error: ` + JSON.stringify(error));
                    return;
                  }
                  let type = result?.getType();
                  if (web_webview.JsMessageType.NUMBER == type) {
                    this.msg1 = "result type:" + typeof (result?.getNumber());
                    Utils.emitEvent(this.msg1, 501);
                  }
                });
              console.info('urlgetstring: ', event.url);
            } catch (error) {
              error = error as BusinessError;
              console.error(`ErrorCode: ${error.code},    `);
            }
          }

          if (this.getBoo) {
            try {
              this.controller.runJavaScriptExt(
                'getBooForJs()',
                (error, result) => {
                  if (error) {
                    console.info(`run JavaScript error: ` + JSON.stringify(error));
                    return;
                  }
                  let type = result?.getType();
                  if (web_webview.JsMessageType.BOOLEAN == type) {
                    this.msg1 = "result type:" + typeof (result?.getBoolean());
                    Utils.emitEvent(this.msg1, 502)
                  }
                });
              console.info('urlgetstring: ', event.url);
            } catch (error) {
              error = error as BusinessError;
              console.error(`ErrorCode: ${error.code},    `);
            }
          }

          if (this.getArrayBuffer) {
            try {
              this.controller.runJavaScriptExt(
                'getArrayBufferForJs()',
                (error, result) => {
                  if (error) {
                    console.info(`run JavaScript error: ` + JSON.stringify(error))
                    return;
                  }
                  let type = result?.getType();
                  if (web_webview.JsMessageType.ARRAY_BUFFER == type) {
                    this.msg1 = "result type:" + typeof (result?.getArrayBuffer());
                    Utils.emitEvent(this.msg1, 503);
                  }
                });
              console.info('urlgetstring: ', event.url);
            } catch (error) {
              error = error as BusinessError;
              console.error(`ErrorCode: ${error.code},    `);
            }
          }

          if (this.getArray) {
            try {
              this.controller.runJavaScriptExt('getArrayForJs()')
                .then((result: web_webview.JsMessageExt): void => {
                  let type = result.getType();
                  if (web_webview.JsMessageType.ARRAY == type) {
                    this.msg1 = "result type:" + typeof (result.getArray());
                    Utils.emitEvent(this.msg1 + web_webview.JsMessageType.NOT_SUPPORT, 504);
                  }
                })
              console.info('urlgetstring: ', event.url);
            } catch (error) {
              error = error as BusinessError;
              console.error(`ErrorCode: ${error.code},    `);
            }
          }

          this.getString = false;
          this.getNum = false;
          this.getBoo = false;
          this.getArrayBuffer = false;
          this.getArray = false;
          this.ports = this.controller.createWebMessagePorts(true);
          this.controller.postMessage("init_web_messageport", [this.ports[1]], "*");
          this.nativePort = this.ports[0];
          this.nativePort?.onMessageEventExt((result: web_webview.WebMessageExt): void => {
            console.log("In eTS side got message");
            try {
              this.type = result.getType();
              console.log("getType: "  + this.type + " result: " + this.msg1);
              if (this.type == web_webview.WebMessageType.STRING) {
                this.msg1 = "result type:" + typeof (result.getString());
                Utils.emitEvent(this.msg1, 505);
              }
              if (this.type == web_webview.WebMessageType.NUMBER) {
                this.msg1 = "result type:" + typeof (result.getNumber());
                Utils.emitEvent(this.msg1 + web_webview.WebMessageType.NOT_SUPPORT, 508);
              }
              if (this.type == web_webview.WebMessageType.BOOLEAN) {
                this.msg1 = "result type:" + typeof (result.getBoolean());
                Utils.emitEvent(this.msg1, 510);
              }
              if (this.type == web_webview.WebMessageType.ARRAY) {
                this.msg1 = "result type:" + typeof (result.getArray());
                Utils.emitEvent(this.msg1, 512);
              }
              if (this.type == web_webview.WebMessageType.ARRAY_BUFFER) {
                this.msg1 = "result getArrayBuffer byteLength:" + ((result.getArrayBuffer().byteLength));
                Utils.emitEvent(this.msg1, 514);
              }
              if (this.type == web_webview.WebMessageType.ERROR) {
                this.msg1 = "result type:" + typeof (result.getError());
                Utils.emitEvent(this.msg1, 516);
              }
            } catch (resError) {
              resError = resError as BusinessError;
              console.log(`log error code: ${resError.code}, Message: ${resError.message}`);
            }
          })

          console.log('url:' + event.url);
        })
        .darkMode(this.mode)
        .forceDarkAccess(false)
        .webSerifFont('serif')
        .webFixedFont('fixed')
        .webSansSerifFont('serif')
        .minLogicalFontSize(1)
        .horizontalScrollBarAccess(true)
        .verticalScrollBarAccess(true)
        .onTouchIconUrlReceived((event: OnTouchIconUrlReceivedEvent): void => {
          console.log('onTouchIconUrlReceived:' + JSON.stringify(event));
        })
        .pinchSmooth(true)

    }
  }
}
