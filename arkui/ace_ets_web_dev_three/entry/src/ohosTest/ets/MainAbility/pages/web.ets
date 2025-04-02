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
  @State str: string = "emitLoadUrl";
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
            case "emitLoadUrl": {
              try {
                setTimeout(() => {
                  this.controller.loadUrl($rawfile("index.html"));
                  setTimeout(() => {
                    let title = this.controller.getTitle();
                    Utils.emitEvent(title, 1);
                  }, 5000)
                }, 3000)
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              break;
            }
            case "emitLoadData": {
              try {
                this.controller.loadData(
                  "<html><head><title>baidu</title></head><body bgcolor=\"white\">Source:<pre>source</pre></body></html>",
                  "text/html",
                  "UTF-8"
                );
                setTimeout(() => {
                  let title1 = this.controller.getTitle();
                  Utils.emitEvent(title1, 2);
                }, 3000);
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              break;
            }
            case "emitBackward": {
              try {
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
              } catch (error) {
                console.error(`Errorcode: ${error.code}, Message: ${error.message}`);
              }
              break;
            }
            case "emitonInactive": {
              try {
                this.controller.onInactive();
                setTimeout(() => {
                  setTimeout(() => {
                    this.controller.loadUrl("resource://rawfile/index.html");
                  }, 3000);
                  let title4 = this.controller.getTitle();
                  Utils.emitEvent(title4, 7);
                }, 3000);
              } catch (error) {
                console.error(`Errorcode: ${error.code}, Message: ${error.message}`);
              }
              break;
            }
            case "emitonActive": {
              try {
                this.controller.onInactive();
                setTimeout(() => {
                  let title5 = this.controller.getTitle();
                  Utils.emitEvent(title5, 8);
                }, 3000);
              } catch (error) {
                console.error(`Errorcode: ${error.code}, Message: ${error.message}`);
              }
              break;
            }
            case "emitRefresh": {
              try {
                this.controller.refresh();
                setTimeout(() => {
                  let title6 = this.controller.getTitle();
                  Utils.emitEvent(title6, 9);
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
            case "emitGetHitTestValue": {
              try {
                let hitValue = this.controller.getHitTestValue();
                console.log("hitType: " + hitValue.type);
                console.log("extra: " + hitValue.extra);
                Utils.emitEvent("hitValue", 12);
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              break;
            }
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
            case "emitZoom": {
              try {
                this.controller.zoom(1);
              } catch (error) {
                console.error(`Errorcode: ${error.code}, Message: ${error.message}`);
                Utils.emitEvent(`${error.code}`, 15);
              }
              break;
            }
            case "emitSearchAllAsync": {
              try {
                this.controller.loadUrl("resource://rawfile/index.html");
                setTimeout(() => {
                  this.controller.searchAllAsync("首页");
                }, 3000)
              } catch (error) {
                console.error(`Errorcode: ${error.code}, Message: ${error.message}`);
              }
              break;
            }
            case "emitClearMatches": {
              try {
                this.controllerTwo.clearMatches();
              } catch (error) {
                console.error(`Errorcode: ${error.code}, Message: ${error.message}`);
                Utils.emitEvent(`${error.code}`, 17)
              }
              break;
            }
            case "emitSearchNext": {
              try {
                this.controllerTwo.searchNext(true);
              } catch (error) {
                console.error(`Errorcode: ${error.code}, Message: ${error.message}`);
                Utils.emitEvent(`${error.code}`, 18)
              }
              break;
            }
            case "emitClearSslCache": {
              try {
                this.controllerTwo.clearSslCache();
              } catch (error) {
                console.error(`Errorcode: ${error.code}, Message: ${error.message}`);
                Utils.emitEvent(`${error.code}`, 19)
              }
              break;
            }
            case "emitClearClientAuthenticationCache": {
              try {
                this.controllerTwo.clearClientAuthenticationCache();
              } catch (error) {
                console.error(`Errorcode: ${error.code}, Message: ${error.message}`);
                Utils.emitEvent(`${error.code}`, 20);
              }
              break;
            }
            case "emitStop": {
              try {
                this.controllerTwo.stop();
              } catch (error) {
                console.error(`Errorcode: ${error.code}, Message: ${error.message}`);
                Utils.emitEvent(`${error.code}`, 21);
              }
              break;
            }
            case "emitRequestFocus": {
              try {
                this.controllerTwo.requestFocus();
              } catch (error) {
                console.error(`Errorcode: ${error.code}, Message: ${error.message}`);
                Utils.emitEvent(`${error.code}`, 22);
              }
              break;
            }
            case "emitZoomIn": {
              try {
                this.controllerTwo.zoomIn();
              } catch (error) {
                console.error(`Errorcode: ${error.code}, Message: ${error.message}`);
                Utils.emitEvent(`${error.code}`, 23);
              }
              break;
            }
            case "emitZoomOut": {
              try {
                this.controllerTwo.zoomOut();
              } catch (error) {
                console.error(`Errorcode: ${error.code}, Message: ${error.message}`);
                Utils.emitEvent(`${error.code}`, 24);
              }
              break;
            }
            case "emitGetWebId": {
              try {
                this.controllerTwo.requestFocus();
              } catch (error) {
                console.error(`Errorcode: ${error.code}, Message: ${error.message}`);
                Utils.emitEvent(`${error.code}`, 25);
              }
              break;
            }
            case "emitGetUserAgent": {
              try {
                this.controllerTwo.requestFocus();
              } catch (error) {
                console.error(`Errorcode: ${error.code}, Message: ${error.message}`);
                Utils.emitEvent(`${error.code}`, 26);
              }
              break;
            }
            case "emitGetPageHeigth": {
              try {
                this.controllerTwo.getPageHeight();
              } catch (error) {
                console.error(`Errorcode: ${error.code}, Message: ${error.message}`);
                Utils.emitEvent(`${error.code}`, 27);
              }
              break;
            }
            case "emitBackOrForward": {
              try {
                this.controllerTwo.backOrForward(-2);
              } catch (error) {
                console.error(`Errorcode: ${error.code}, Message: ${error.message}`);
                Utils.emitEvent(`${error.code}`, 28);
              }
              break;
            }
            case "emitStoreWebArchive": {
              try {
                this.controller.storeWebArchive("/data/storage/el2/base/", true, (error, filename) => {
                  if (error) {
                    console.info(`save web archive error: ` + JSON.stringify(error));
                    return;
                  }
                  if (filename != null) {
                    Utils.emitEvent(filename, 29);
                  }
                });
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              break;
            }
            case "emitGetUrl": {
              try {
                let url = this.controllerTwo.getUrl();
                console.log("url: " + url);
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                Utils.emitEvent(`${error.code}`, 30);
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
            case "emitSlideScroll": {
              try {
                this.controller.slideScroll(10, 10);
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              try {
                let state = this.controller.serializeWebState();
                let path:string = globalThis.AbilityContext.cacheDir;
                path += '/WebState';
                let fd = fileio.openSync(path, 0o2 | 0o100, 0o666);
                fileio.writeSync(fd, state.buffer);
                fileio.closeSync(fd);
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              try {
                let path:string = globalThis.AbilityContext.cacheDir;
                path += '/WebState';
                let fd = fileio.openSync(path, 0o002, 0o666);
                let stat = fileio.fstatSync(fd);
                let size = stat.size;
                let buf = new ArrayBuffer(size);
                fileio.read(fd, buf, (err, data) => {
                  if (data) {
                    this.controller.restoreWebState(new Uint8Array(data.buffer));
                  }
                  fileio.closeSync(fd);
                });
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              try {
                this.ports = this.controller.createWebMessagePorts();
                this.ports[1].onMessageEvent((msg) => {
                  if (typeof (msg) == "string") {
                    console.log("received string message from html5, string is:" + msg);
                  } else if (typeof (msg) == "object") {
                    if (msg instanceof ArrayBuffer) {
                      console.log("received arraybuffer from html5, length is:" + msg.byteLength);
                    } else {
                      console.log("not support");
                    }
                  } else {
                    console.log("not support");
                  }
                })
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              break;
            }
            case "emitContextMenuMediaType": {
              try {
                let con = ContextMenuMediaType.Image;
                Utils.emitEvent(con, 33);
                console.log("result: " + con);
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              break;
            }
            case "emitContextMenuInputFieldType": {
              try {
                Utils.emitEvent(ContextMenuInputFieldType.PlainText, 34);
                Utils.emitEvent(ContextMenuInputFieldType.Telephone, 35);
                Utils.emitEvent(ContextMenuInputFieldType.Other, 36);
                console.log("result: " + ContextMenuInputFieldType.PlainText);
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              break;
            }
            case "emitContextMenuEditStateFlags": {
              try {
                Utils.emitEvent(ContextMenuEditStateFlags.NONE, 37);
                Utils.emitEvent(ContextMenuEditStateFlags.CAN_CUT, 38);
                Utils.emitEvent(ContextMenuEditStateFlags.CAN_COPY, 39);
                Utils.emitEvent(ContextMenuEditStateFlags.CAN_PASTE, 40);
                Utils.emitEvent(ContextMenuEditStateFlags.CAN_SELECT_ALL, 41);
                console.log("result: " + ContextMenuEditStateFlags.CAN_SELECT_ALL);
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              break;
            }
            case "emitGetStoredGeolocation": {
              try {
                web_webview.GeolocationPermissions.allowGeolocation("file:///")
                web_webview.GeolocationPermissions.getStoredGeolocation((error, origins) => {
                  if (error) {
                    console.log('getStoredGeolocationAsync error: ' + JSON.stringify(error))
                    return;
                  }
                  if (origins) {
                    let origins_str: string = origins.join()
                    console.log('getStoredGeolocationAsync origins: ' + origins_str);
                    Utils.emitEvent(origins_str, 120);
                  }
                });
              } catch (error) {
                console.error(`ErrorCode: ${error.code}, Message: ${error.message}`);
              }
              break;
            }
            case "emitSetHttpDnsSuccess": {
              try {
                web_webview.WebviewController.setHttpDns(web_webview.SecureDnsMode.SECURE_ONLY, "https://httpdns-browser.platform.dbankcloud.cn/dns-query{?dns}")
                this.controller.loadUrl("https://www.example.com/");
                this.enterPageEnd = true;
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              break;
            }
            case "emitGetAccessibleGeolocation": {
              try {
                web_webview.GeolocationPermissions.allowGeolocation("file:///")
                web_webview.GeolocationPermissions.getAccessibleGeolocation("file:///", (error, result) => {
                  if (error) {
                    console.log('getAccessibleGeolocation error: ' + JSON.stringify(error))
                    return;
                  }
                  if (result) {
                    console.log('getAccessibleGeolocationAsync result: ' + result);
                    Utils.emitEvent(result, 451);
                  }
                });
              } catch (error) {
                console.error(`ErrorCode: ${error.code}, Message: ${error.message}`);
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
            case "emitGetAccessibleGeolocationPromise": {
              try {
                web_webview.GeolocationPermissions.getAccessibleGeolocation("file:///")
                  .then(result => {
                    console.log('getAccessibleGeolocationPromise result: ' + result);
                    Utils.emitEvent(result, 517);
                  }).catch((error: ESObject) => {
                  console.log('getAccessibleGeolocationPromise error: ' + JSON.stringify(error));
                });
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              break;
            }
            case "emitSetHttpDnsSuccessAuto": {
              try {
                web_webview.WebviewController.setHttpDns(web_webview.SecureDnsMode.AUTO, "https://httpdns-browser.platform.dbankcloud.cn/dns-query{?dns}");
                this.controller.loadUrl("https://www.example.com/");
                this.enterPageEndAuto = true;
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              break;
            }
            case "emitSetHttpDnsSuccessOff": {
              try {
                web_webview.WebviewController.setHttpDns(web_webview.SecureDnsMode.OFF, "https://httpdns-browser.platform.dbankcloud.cn/dns-query{?dns}");
                this.controller.loadUrl("https://www.example.com/");
                this.enterPageEndOff = true;
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              break;
            }
            case "emitGetCertificateCallback": {
              try {
                this.controller.loadUrl("https://www.example.com/");
                console.info("jinru")
                this.controller.getCertificate((error, x509CertArray) => {
                  if (error) {
                    this.outputStr = 'getCertificate failed: ' + error.code + ", errMsg: " + error.message;
                  } else {
                    this.outputStr = ParseX509CertInfo(x509CertArray);
                    console.info("hahahha" + this.outputStr.length);
                    console.info("hahahha" + this.outputStr);
                    Utils.emitEvent(this.outputStr.length, 520);
                  }
                })
              } catch (error) {
                this.outputStr = 'getCertificate failed: ' + error.code + ", errMsg: " + error.message;
              }
              break;
            }
            case "emitGetStoredGeolocationPromise": {
              try {
                web_webview.GeolocationPermissions.allowGeolocation("file:///")
                web_webview.GeolocationPermissions.getStoredGeolocation()
                  .then(origins => {
                    let origins_str: string = origins.join();
                    console.log('getStoredGeolocationPromise origins: ' + origins_str);
                    Utils.emitEvent(origins_str, 521);
                  }).catch((error: ESObject) => {
                  console.log('getStoredGeolocationPromise error: ' + JSON.stringify(error));
                });
              } catch (error) {
                console.error(`ErrorCode: ${error.code}, Message: ${error.message}`);
              }
              break;
            }

            case "emitGetCustomUserAgent": {
              try {
                let setUA = "userAgent";
                this.controller.setCustomUserAgent(setUA);
                Utils.emitEvent(this.controller.getCustomUserAgent(), 522);
              } catch (error) {
                console.error(`ErrorCode: ${error.code}, Message: ${error.message}`);
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