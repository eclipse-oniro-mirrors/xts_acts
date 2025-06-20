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
import AbilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import { Hypium } from '@ohos/hypium';
import testsuite from '../../test/List.test';
import Utils from '../../test/Utils';
import web_webview from '@ohos.web.webview';
import fileio from '@ohos.fileio';
import prompt from '@system.prompt';
import cert from '@ohos.security.cert';

let loadedUrl: string;

function Uint8ArrayToString(dataArray: Uint8Array) {
  let dataString = '';
  for (let i = 0; i < dataArray.length; i++) {
    dataString += String.fromCharCode(dataArray[i]);
  }
  return dataString;
}

function ParseX509CertInfo(x509CertArray: Array<cert.X509Cert>) {
  let res: string = 'getCertificate success: len = ' + x509CertArray.length;
  for (let i = 0; i < x509CertArray.length; i++) {
    res += ', index = ' + i + ', issuer name = '
      + Uint8ArrayToString(x509CertArray[i].getIssuerName().data) + ', subject name = '
      + Uint8ArrayToString(x509CertArray[i].getSubjectName().data) + ', valid start = '
      + x509CertArray[i].getNotBeforeTime()
      + ', valid end = ' + x509CertArray[i].getNotAfterTime();
  }
  return res;
}

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
  @State str: string = "emitBackward";
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

  aboutToAppear() {
    let abilityDelegator = AbilityDelegatorRegistry.getAbilityDelegator()
    let abilityDelegatorArguments = AbilityDelegatorRegistry.getArguments()
    console.info('start run testcase!!!')
    Hypium.hypiumTest(abilityDelegator, abilityDelegatorArguments, testsuite)
    try {
      web_webview.WebviewController.customizeSchemes([this.scheme1, this.scheme2, this.scheme3]);
      web_webview.WebviewController.setWebDebuggingAccess(true);
      web_webview.once("webInited", () => {
        web_webview.WebCookieManager.setCookie("https://www.huawei.com", "a=b");
      });
    } catch (error) {
      console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
    }

  }

  build() {
    Column() {
      Row() {
        Button("web click").key('webcomponent').onClick(async () => {
          console.info("key==>" + this.str);
          switch (this.str) {
            case "emitBackward": {
              try {
                  this.controller.loadUrl($rawfile("index.html"));
                  setTimeout(() => {
                      let title = this.controller.getTitle();
                     console.info("title:"+title)
                    }, 5000)
                  await Utils.sleep(2000)
                  this.controller.loadData(
                    "<html><head><title>baidu</title></head><body bgcolor=\"white\">Source:<pre>source</pre></body></html>",
                    "text/html",
                    "UTF-8"
                  );
                  setTimeout(() => {
                    let title1 = this.controller.getTitle();
                    console.info("title1:"+title1)
                  }, 3000);
                  await Utils.sleep(2000)
                this.controller.backward();
                setTimeout(() => {
                  let title2 = this.controller.getTitle();
                  Utils.emitEvent(title2, 3);
                }, 3000);
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              break;
            }
            case "emitForward": {
              try {
                this.controller.forward();
                setTimeout(() => {
                  let title3 = this.controller.getTitle();
                  Utils.emitEvent(title3, 4);
                }, 3000);
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              break;
            }
            case "emitAccessBackward": {
              try {
                let result0 = this.controller.accessBackward();
                setTimeout(() => {
                  Utils.emitEvent(result0, 5);
                }, 3000);
              } catch (error) {
                console.error(`Errorcode: ${error.code}, Message: ${error.message}`);
              }
              break;
            }
            case "emitAccessForward": {
              try {
                let result1 = this.controller.accessForward();
                setTimeout(() => {
                  Utils.emitEvent(result1, 6);
                }, 3000);

                setTimeout(() => {
                  setTimeout(() => {
                    this.controller.loadUrl("resource://rawfile/index.html");
                  }, 3000);
                  let title = this.controller.getTitle();
                  console.log("title:"+title)
                }, 3000);

              } catch (error) {
                console.error(`Errorcode: ${error.code}, Message: ${error.message}`);
              }
              break;
            }

            case "emitAccessStep": {
              try {
                let result2 = this.controller.accessStep(-2);
                setTimeout(() => {
                  Utils.emitEvent(result2, 10);
                }, 3000);
              } catch (error) {
                console.error(`Errorcode: ${error.code}, Message: ${error.message}`);
              }
              break;
            }
            case "emitClearHistory": {
              try {
                this.controller.clearHistory();
                setTimeout(() => {
                  let result3 = this.controller.accessStep(-2);
                  setTimeout(() => {
                    Utils.emitEvent(result3, 11);
                  }, 3000);
                }, 3000);
              } catch (error) {
                console.error(`Errorcode: ${error.code}, Message: ${error.message}`);
              }
              break;
            }
            case "emitOnce": {
              try {
                let re = web_webview.WebCookieManager.getCookie("https://www.huawei.com");
                Utils.emitEvent(re, 31);
                console.log("result: " + re);
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              break;
            }
            case "emitGetItemAtIndex": {
              try {
                let res = this.controller.getBackForwardEntries();
                let item = res.getItemAtIndex(0);
                Utils.emitEvent(item.title, 32);
                console.log("result: " + item.title);
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              break;
            }

            default:
              console.info("can not match case");
          }
        })
      }

      Web({ src: "www.example.com", controller: this.controller })
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