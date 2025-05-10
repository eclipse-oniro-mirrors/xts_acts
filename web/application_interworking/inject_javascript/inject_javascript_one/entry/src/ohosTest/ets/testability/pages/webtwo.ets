/*
 * Copyright (c) 2021~2023 Huawei Device Co., Ltd.
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
import events_emitter from '@ohos.events.emitter';
import Utils from '../../test/Utils';
import web_webview from '@ohos.web.webview';

@Entry
@Component
struct Index {
  controller: web_webview.WebviewController = new web_webview.WebviewController();
  controllerTwo: web_webview.WebviewController = new web_webview.WebviewController();
  dialogController?: CustomDialogController;
  scheme1: web_webview.WebCustomScheme = { schemeName: "name1", isSupportCORS: true, isSupportFetch: true };
  scheme2: web_webview.WebCustomScheme = { schemeName: "name2", isSupportCORS: true, isSupportFetch: true };
  scheme3: web_webview.WebCustomScheme = { schemeName: "name3", isSupportCORS: true, isSupportFetch: true };
  responseweb: WebResourceResponse = new WebResourceResponse();
  @State str: string = "emitRegisterJavaScriptProxy";
  @State text: boolean = false;
  @State num: number = 0;
  @State mode: WebDarkMode = WebDarkMode.Off;
  @State mode1: WebDarkMode = WebDarkMode.On;
  @State mode2: WebDarkMode = WebDarkMode.Auto;
  @State enterPageEnd: boolean = false;
  @State getString: boolean = false;
  @State getNum: boolean = false;
  @State getBoo: boolean = false;
  @State getArrayBuffer: boolean = false;
  @State getArray: boolean = false;
  @State msg1: string = "";
  @State type: number = 0;
  @State enterPageEndAuto: boolean = false;
  @State enterPageEndOff: boolean = false;
  @State outputStr: string = '';
  message: web_webview.WebMessageExt = new web_webview.WebMessageExt();
  ports: web_webview.WebMessagePort[] | null = null;
  nativePort: web_webview.WebMessagePort | null = null;
  @State webMessResult: string = ""
  testObj: ESObject = {
    testOne: (data: ESObject): ESObject => {
      Utils.emitEvent(data, 13)
      return data;
    },
    toString: () => {
      console.log('Web Component toString');
    }
  };

  onPageShow() {
    let valueChangeEvent: events_emitter.InnerEvent = {
      eventId: 100,
      priority: events_emitter.EventPriority.LOW
    };
    events_emitter.on(valueChangeEvent, this.valueChangeCallBack);
  }

  private valueChangeCallBack = (eventData: ESObject) => {
    console.info("web page valueChangeCallBack");
    if (eventData != null) {
      console.info("valueChangeCallBack:" + JSON.stringify(eventData));
      if (eventData.data.ACTION != null) {
        this.str = eventData.data.ACTION;
      }
    }
  }

  build() {
    Column() {
      Row() {
        Button("web click").key('webcomponent').onClick(async () => {
          console.info("key==>" + this.str);
          switch (this.str) {
            case "emitRegisterJavaScriptProxy": {
              try {
                this.controller.registerJavaScriptProxy(this.testObj, "objName", ["testOne", "toString"]);
                setTimeout(() => {
                  this.controller.refresh();
                  setTimeout(() => {
                    this.controller.runJavaScript('htmlTest()', (error, result4) => {
                      if (error) {
                        console.info(`run JavaScript error: ` + JSON.stringify(error));
                        return;
                      }
                      if (result4) {
                        console.info('result:' + result4);
                      }
                    })
                  }, 3000)
                }, 3000)
              } catch (error) {
                console.error(`Errorcode: ${error.code}, Message: ${error.message}`);
              }
              break;
            }
            case "emitDeleteJavaScriptRegister": {
              try {
                this.controller.deleteJavaScriptRegister("objName");
                this.controller.deleteJavaScriptRegister("objName");
              } catch (error) {
                console.error(`Errorcode: ${error.code}, Message: ${error.message}`);
                Utils.emitEvent(`${error.code}`, 14);
              }
              break;
            }
            case "emitJsMessExtGetString": {
              try {
                this.getString = true;
                this.controller.loadUrl("resource://rawfile/index.html")
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              break;
            }
            case "emitJsMessExtGetNum": {
              try {
                this.getNum = true;
                this.controller.loadUrl("resource://rawfile/index.html")
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              break;
            }
            case "emitJsMessExtGetBoo": {
              try {
                this.getBoo = true;
                this.controller.loadUrl("resource://rawfile/index.html")
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              break;
            }
            case "emitJsMessExtGetArrayBuffer": {
              try {
                this.getArrayBuffer = true;
                this.controller.loadUrl("resource://rawfile/index.html")
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              break;
            }
            case "emitJsMessExtGetArray": {
              try {
                this.getArray = true;
                this.controller.loadUrl("resource://rawfile/index.html")
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              break;
            }
            case "emitWebMessExtSetString": {
              try {
                this.controller.loadUrl($rawfile('webMessageExt.html'));
                console.log("In eTS side send true start");
                if (this.nativePort) {
                  setTimeout(() => {
                    this.message.setType(1);
                    this.message.setString("helloFromEts");
                    this.nativePort!.postMessageEventExt(this.message);
                  }, 2000);
                }
                ;
                setTimeout(() => {
                  this.controller.runJavaScript("postStringToHtml()", (error, result) => {
                    console.log(`The emitWebMessExtSetString() return value is: ${result}`);
                    this.webMessResult = result;
                    Utils.emitEvent(this.webMessResult, 506);
                  });
                }, 3000);
              }
              catch (error) {
                console.log("In eTS side send message catch error:" + error.code + ", msg:" + error.message);
              }
              break;
            }
            case "emitWebMessExtGetString": {
              try {
                this.controller.loadUrl($rawfile('webMessageExt.html'));
                this.controller.runJavaScript("postStringToApp()", (error, result) => {
                  console.log(`The emitWebMessExtGetString() return value is: ${result}`);
                })
              }
              catch (error) {
                console.log("In eTS side send message catch error:" + error.code + ", msg:" + error.message);
              }
              break;
            }
            case "emitWebMessExtSetNumber": {
              try {
                this.controller.loadUrl($rawfile('webMessageExt.html'));
                console.log("In eTS side send true start");
                if (this.nativePort) {
                  setTimeout(() => {
                    this.message.setType(2);
                    this.message.setNumber(1);
                    this.nativePort!.postMessageEventExt(this.message);
                  }, 2000);
                }
                setTimeout(() => {
                  this.controller.runJavaScript("postNumberToHtml()", (error, result) => {
                    console.log(`The emitWebMessExtSetNumber() return value is: ${result}`);
                    Utils.emitEvent(result, 507);
                  });
                }, 3000);
              }
              catch (error) {
                console.log("In eTS side send message catch error:" + error.code + ", msg:" + error.message);
              }
              break;
            }
            case "emitWebMessExtGetNumber": {
              try {
                this.controller.loadUrl($rawfile('webMessageExt.html'));
                this.controller.runJavaScript("postNumberToApp()", (error, result) => {
                  console.log(`The emitWebMessExtGetNumber() return value is: ${result}`);
                })
              }
              catch (error) {
                console.log("In eTS side send message catch error:" + error.code + ", msg:" + error.message);
              }
              break;
            }
            case "emitWebMessExtSetBoolean": {
              try {
                this.controller.loadUrl($rawfile('webMessageExt.html'));
                console.log("In eTS side send true start");
                if (this.nativePort) {
                  setTimeout(() => {
                    this.message.setType(3);
                    this.message.setBoolean(true);
                    this.nativePort!.postMessageEventExt(this.message);
                  }, 2000);
                }
                setTimeout(() => {
                  this.controller.runJavaScript("postBooleanToHtml()", (error, result) => {
                    console.log(`The emitWebMessExtSetBoolean() return value is: ${result}`);
                    Utils.emitEvent(result, 509);
                  })
                }, 3000);
              }
              catch (error) {
                console.log("In eTS side send message catch error:" + error.code + ", msg:" + error.message);
              }
              break;
            }
            case "emitWebMessExtGetBoolean": {
              try {
                this.controller.loadUrl($rawfile('webMessageExt.html'));
                this.controller.runJavaScript("postBooleanToApp()", (error, result) => {
                  console.log(`The emitWebMessExtGetBoolean() return value is: ${result}`);
                })
              }
              catch (error) {
                console.log("In eTS side send message catch error:" + error.code + ", msg:" + error.message);
              }
              break;
            }
            case "emitWebMessExtSetArray": {
              try {
                this.controller.loadUrl($rawfile('webMessageExt.html'));
                console.log("In eTS side send true start");
                if (this.nativePort) {
                  setTimeout(() => {
                    const fruits: Array<string> = [];
                    fruits.push("apple");
                    this.message.setType(5);
                    this.message.setArray(fruits);
                    this.nativePort!.postMessageEventExt(this.message);
                  }, 2000)
                }
                setTimeout(() => {
                  this.controller.runJavaScript("postArrayToHtml()", (error, result) => {
                    console.log(`The emitWebMessExtSetArray() return value is: ${result}`);
                    Utils.emitEvent(result, 511)
                  })
                }, 3000)
              }
              catch (error) {
                console.log("In eTS side send message catch error:" + error.code + ", msg:" + error.message);
              }
              break;
            }
            case "emitWebMessExtGetArray": {
              try {
                this.controller.loadUrl($rawfile('webMessageExt.html'));
                this.controller.runJavaScript("postArrayToApp()", (error, result) => {
                  console.log(`The emitWebMessExtGetArray() return value is: ${result}`);
                })
              }
              catch (error) {
                console.log("In eTS side send message catch error:" + error.code + ", msg:" + error.message);
              }
              break;
            }
            case "emitWebMessExtSetArrayBuffer": {
              try {
                this.controller.loadUrl($rawfile('webMessageExt.html'));
                console.log("In eTS side send true start");
                if (this.nativePort) {
                  setTimeout(() => {
                    let buffer = new ArrayBuffer(8);
                    this.message.setType(4);
                    this.message.setArrayBuffer(buffer);
                    this.nativePort!.postMessageEventExt(this.message);
                  }, 2000)
                }
                setTimeout(() => {
                  this.controller.runJavaScript("postArrayBufferToHtml()", (error, result) => {
                    console.log(`The emitWebMessExtSetArrayBuffer() return value is: ${result}`);
                    Utils.emitEvent(result, 513);
                  })
                }, 3000)
              }
              catch (error) {
                console.log("In eTS side send message catch error:" + error.code + ", msg:" + error.message);
              }
              break;
            }
            case "emitWebMessExtGetArrayBuffer": {
              try {
                this.controller.loadUrl($rawfile('webMessageExt.html'));
                this.controller.runJavaScript("postArrayBufferToApp()", (error, result) => {
                  console.log(`The emitWebMessExtGetArrayBuffer() return value is: ${result}`);
                })
              }
              catch (error) {
                console.log("In eTS side send message catch error:" + error.code + ", msg:" + error.message);
              }
              break;
            }
            case "emitWebMessExtSetError": {
              try {
                console.log("URL Error");
                throw new URIError("URI seq")
              }
              catch (e) {
                console.log("hwd URIError:" + (e instanceof SyntaxError));
                console.log("hwd URIError:" + e.message);
                console.log("hwd URIError:" + e.name);
                if (this.nativePort) {
                  setTimeout(() => {
                    let message = new web_webview.WebMessageExt();
                    message.setType(web_webview.WebMessageType.ERROR)
                    this.message.setType(6);
                    this.message.setError(e);
                    this.nativePort!.postMessageEventExt(message);
                  }, 2000)
                }
              }
              setTimeout(() => {
                this.controller.runJavaScript("postErrorToHtml()", (error, result) => {
                  console.log(`The emitWebMessExtSetError() return value is: ${result}`);
                  Utils.emitEvent(result, 515);
                })
              }, 3000)
              break;
            }
            case "emitWebMessExtGetError": {
              try {
                this.controller.loadUrl($rawfile('webMessageExt.html'));
                this.controller.runJavaScript("postErrorToApp()", (error, result) => {
                  console.log(`The emitWebMessExtGetError() return value is: ${result}`);
                })
              }
              catch (error) {
                console.log("In eTS side send message catch error:" + error.code + ", msg:" + error.message);
              }
              break;
            }
            default:
              console.info("can not match case");
          }
        })
      }

      Web({ src: $rawfile('index.html'), controller: this.controller })
        .mediaPlayGestureAccess(true)
        .javaScriptAccess(true)
        .zoomAccess(this.text)
        .onDataResubmitted((event) => {
          console.log('onDataResubmitted');
          event.handler.resend();
        })
        .onSearchResultReceive(ret => {
          let searchResult = ret.activeMatchOrdinal.toString() +
          ret.numberOfMatches.toString();
          console.log("searchResult" + searchResult);
          setTimeout(() => {
            Utils.emitEvent(searchResult, 16);
          }, 3000)
        })
        .onContextMenuShow((event) => {
          console.info(event.param.getMediaType() + event.param.getSelectionText() + event.param.getSourceType());
          console.info(event.param.getInputFieldType().toString());
          console.info(event.param.isEditable().toString());
          console.info(event.param.getEditStateFlags().toString());
          event.result.paste();
          event.result.cut();
          return true;
        })
        .onHttpErrorReceive((event) => {
          event.response.setResponseIsReady(true);
        })
        .onPageEnd((event) => {
          if (this.enterPageEnd) {
            Utils.emitEvent(1, 446);
            this.enterPageEnd = false;
          }
          if (this.enterPageEndAuto) {
            Utils.emitEvent(this.controller.getTitle(), 518);
            this.enterPageEndAuto = false;
          }
          if (this.enterPageEndOff) {
            Utils.emitEvent(this.controller.getTitle(), 519);
            this.enterPageEndOff = false;
          }
          if (this.getString) {
            try {
              this.controller.runJavaScriptExt(
                'getStringForJs()',
                (error, result) => {
                  if (error) {
                    console.info(`run JavaScript error: ` + JSON.stringify(error))
                    return;
                  }
                  let type = result.getType();
                  if (web_webview.JsMessageType.STRING == type) {
                    this.msg1 = "result type:" + typeof (result.getString());
                    Utils.emitEvent(this.msg1, 500)
                  }
                });
              console.info('urlgetstring: ', event.url);
            } catch (error) {
              console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
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
                  let type = result.getType();
                  if (web_webview.JsMessageType.NUMBER == type) {
                    this.msg1 = "result type:" + typeof (result.getNumber());
                    Utils.emitEvent(this.msg1, 501);
                  }
                });
              console.info('urlgetstring: ', event.url);
            } catch (error) {
              console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
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
                  let type = result.getType();
                  if (web_webview.JsMessageType.BOOLEAN == type) {
                    this.msg1 = "result type:" + typeof (result.getBoolean());
                    Utils.emitEvent(this.msg1, 502)
                  }
                });
              console.info('urlgetstring: ', event.url);
            } catch (error) {
              console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
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
                  let type = result.getType();
                  if (web_webview.JsMessageType.ARRAY_BUFFER == type) {
                    this.msg1 = "result type:" + typeof (result.getArrayBuffer());
                    Utils.emitEvent(this.msg1, 503);
                  }
                });
              console.info('urlgetstring: ', event.url);
            } catch (error) {
              console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
            }
          }
          if (this.getArray) {
            try {
              this.controller.runJavaScriptExt('getArrayForJs()')
                .then((result) => {
                  let type = result.getType();
                  if (web_webview.JsMessageType.ARRAY == type) {
                    this.msg1 = "result type:" + typeof (result.getArray());
                    Utils.emitEvent(this.msg1 + web_webview.JsMessageType.NOT_SUPPORT, 504);
                  }
                })
              console.info('urlgetstring: ', event.url);
            } catch (error) {
              console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
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
          this.nativePort!.onMessageEventExt((result) => {
            console.log("In eTS side got message");
            try {
              this.type = result.getType();
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
            }
            catch (resError) {
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
        .onTouchIconUrlReceived((event) => {
          console.log('onTouchIconUrlReceived:' + JSON.stringify(event));
        })
        .pinchSmooth(true)
    }
  }
}