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

import AbilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import { Hypium } from '@ohos/hypium';
import testsuite from '../../test/List.test';
import Utils from '../../test/Utils';
import webView from '@ohos.web.webview';
import events_emitter from '@ohos.events.emitter';
import fs from '@ohos.file.fs';
import { JsProxyObject } from '../../test/Interfaces';
import business_error from '@ohos.base';

const EVENT_ID_SET_EMIT_KEY = 114080;

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
  responseWeb: WebResourceResponse = new WebResourceResponse()
  @State webResult: string = ' ';
  @State str: string = ""
  @State javaScriptAccess: boolean = true;
  @State searchString: string = "Hello World";
  @State searchNumber: number = 2;
  @State ports: webView.WebMessagePort[] = [];
  @State receivedFromHtml: string = 'Display received message send from HTML';
  updateContent: string = '<body><div><image src=resource://rawfile/test.png ' +
  'alt="image -- end" width="500" height="250"></image></div></body>';
  @State msg1: string = '';
  @State msg2: string = '';
  @State testObj: testObj = new testObj();
  @State name: string = 'objName';
  @State origin: string = "file:///";
  @State host: string = "www.spincast.org";
  @State realm: string = "protected example";
  @State username_password: string[] = [];
  @State steps: number = 1;
  @State step: number = -2;
  @State factor: number = 1;
  @State errorCode: string = '0';
  @State userAgent: string = 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/39.0.2171.71 Safari/537.36'
  @State isPageEnd: number = -1;
  @State isReceive: number = -1;
  scheme1: webView.WebCustomScheme = { schemeName: "name1", isSupportCORS: true, isSupportFetch: true }
  scheme2: webView.WebCustomScheme = { schemeName: "name2", isSupportCORS: true, isSupportFetch: true }
  scheme3: webView.WebCustomScheme = { schemeName: "name3", isSupportCORS: true, isSupportFetch: true }
  no_error: string = "no error happened"

  onPageShow() {
    let valueChangeEvent: events_emitter.InnerEvent = {
      eventId: EVENT_ID_SET_EMIT_KEY,
      priority: events_emitter.EventPriority.LOW
    }
    events_emitter.on(valueChangeEvent, this.valueChangeCallBack)
  }

  onPageHide() {
    events_emitter.off(EVENT_ID_SET_EMIT_KEY)
  }

  private valueChangeCallBack = (eventData: events_emitter.EventData) => {
    console.info("web page valueChangeCallBack");
    if (eventData != null) {
      console.info("valueChangeCallBack:" + JSON.stringify(eventData));
      if (eventData.data != null && eventData.data.ACTION != null) {
        this.str = eventData.data.ACTION;
        this.isReceive = 1;
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
    let abilityDelegator = AbilityDelegatorRegistry.getAbilityDelegator()
    let abilityDelegatorArguments = AbilityDelegatorRegistry.getArguments()
    console.info('start run testcase!!!')
    Hypium.hypiumTest(abilityDelegator, abilityDelegatorArguments, testsuite)
    try {
      webView.WebviewController.customizeSchemes([this.scheme1, this.scheme2, this.scheme3])
    } catch (error) {
      let e: business_error.BusinessError = error as business_error.BusinessError;
      console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
    }
  }

  build() {
    Column() {
      Row() {
        Button("WebErrorCode click").key('ErrorCodeTestSuiteButton').onClick(async () => {
          await Utils.waitForExist(()=>this.isPageEnd, 'ErrorCodeTestSuiteButtonIsPageEnd', 1, 1000);
          await Utils.waitForExist(()=>this.isReceive, 'ErrorCodeTestSuiteButtonIsReceive', 1, 1000);
          console.info("key==>" + this.str)
          this.isReceive = -1;
          switch (this.str) {

            case "emitSearchAllAsync": {
              try {
                this.controllerNull.searchAllAsync(this.searchString);
              } catch (error) {
                Utils.emitEvent(error.code, 114090)
              }
              break;
            }
            case "emitGetUserAgent": {
              try {
                let userAgent = this.controllerNull.getUserAgent();
                console.info("userAgent: " + userAgent);
              } catch (error) {
                Utils.emitEvent(error.code, 114100)
              }
              break;
            }

            case "emitClearMatches": {
              try {
                this.controllerNull.clearMatches();
              } catch (error) {
                Utils.emitEvent(error.code, 114110)
              }
              break;
            }

            case "emitSearchNext": {
              try {
                this.controllerNull.searchNext(true);
              } catch (error) {
                Utils.emitEvent(error.code, 114120)
              }
              break;
            }

            case "emitClearSslCache": {
              try {
                this.controllerNull.clearSslCache();
              } catch (error) {
                Utils.emitEvent(error.code, 114130)
              }
              break;
            }

            case "emitClearClientAuthenticationCache": {
              try {
                this.controllerNull.clearClientAuthenticationCache();
              } catch (error) {
                Utils.emitEvent(error.code, 114140)
              }
              break;
            }

            case "emitZoomIn": {
              try {
                this.controllerNull.zoomIn();
              } catch (error) {
                Utils.emitEvent(error.code, 114150)
              }
              break;
            }

            case "emitZoomIn2": {
              try {
                this.controller.zoomIn();
              } catch (error) {
                Utils.emitEvent(error.code, 114160)
              }
              break;
            }

            case "emitWebMessagePort": {
              try {
                this.ports = this.controller.createWebMessagePorts();
                this.controller.postMessage('__init_port__', [this.ports[0]], '*');
                this.ports[1].close();
                this.ports[1].postMessageEvent("post message from ets to html5");
              } catch (error) {
                Utils.emitEvent(error.code, 114170)
              }
              break;
            }

            case "emitCreateWebMessagePort": {
              try {
                this.controllerNull.createWebMessagePorts();
              } catch (error) {
                Utils.emitEvent(error.code, 114180)
              }
              break;
            }

            case "emitPostMessage": {
              try {
                this.ports = this.controllerNull.createWebMessagePorts();
                this.ports[1].onMessageEvent((result: webView.WebMessage) => {
                  let msg = 'Got msg from HTML:';
                  if (typeof (result) == "string") {
                    console.log("received string message from html5, string is:" + result);
                    msg = msg + result;
                  } else if (typeof (result) == "object") {
                    if (result instanceof ArrayBuffer) {
                      console.log("received arraybuffer from html5, length is:" + result.byteLength);
                      msg = msg + "lenght is " + result.byteLength;
                    } else {
                      console.log("not support");
                    }
                  } else {
                    console.log("not support");
                  }
                  this.receivedFromHtml = msg;
                })
                this.controllerNull.postMessage('__init_port__', [this.ports[0]], '*');
              } catch (error) {
                Utils.emitEvent(error.code, 114190)
              }
              break;
            }

            case "emitRequestFocus": {
              try {
                this.controllerNull.requestFocus();
              } catch (error) {
                Utils.emitEvent(error.code, 114200)
              }
              break;
            }

            case "emitRefresh": {
              try {
                this.controllerNull.refresh();
              } catch (error) {
                Utils.emitEvent(error.code, 114210)
              }
              break;
            }

            case "emitLoadData": {
              try {
                this.controllerNull.loadData(
                  "<html><body bgcolor=\"white\">Source:<pre>source</pre></body></html>",
                  "text/html",
                  "UTF-8"
                );
              } catch (error) {
                Utils.emitEvent(error.code, 114220)
              }
              break;
            }
            case "emitLoadUrl": {
              try {
                this.controllerNull.loadUrl('https://docs.openharmony.cn/');
              } catch (error) {
                Utils.emitEvent(error.code, 114230)
              }
              break;
            }

            case "emitZoomOut": {
              try {
                this.controllerNull.zoomOut();
              } catch (error) {
                Utils.emitEvent(error.code, 114240)
              }
              break;
            }

            case "emitSlideScroll": {
              try {
                this.controllerNull.slideScroll(500, 500);
              } catch (error) {
                Utils.emitEvent(error.code, 114250)
              }
              break;
            }
            case "emitScrollBy": {
              try {
                this.controllerNull.scrollBy(50, 50);
              } catch (error) {
                Utils.emitEvent(error.code, 114260)
              }
              break;
            }
            case "emitSerializeWebState": {
              try {
                let state = this.controllerNull.serializeWebState();
                let path: string | undefined = AppStorage.Get("cacheDir");
                if (path) {
                  path += '/WebState';
                  let file = fs.openSync(path, fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE);
                  fs.writeSync(file.fd, state.buffer);
                  fs.closeSync(file.fd);
                }
              } catch (error) {
                Utils.emitEvent(error.code, 114270)
              }
              break;
            }
            case "emitRestoreWebState": {
              try {
                this.controllerNull.restoreWebState(new Uint8Array(new ArrayBuffer(0)));
              } catch (error) {
                Utils.emitEvent(error.code, 114280)
              }
              break;
            }
            case "emitStop": {
              try {
                this.controllerNull.stop();
              } catch (error) {
                Utils.emitEvent(error.code, 114290)
              }
              break;
            }
            case "emitRegisterJavaScriptProxy": {
              try {
                this.controllerNull.registerJavaScriptProxy(this.testObj, "objName", ["test", "toString"]);
              } catch (error) {
                Utils.emitEvent(error.code, 114300)
              }
              break;
            }
            case "emitDeleteJavaScriptRegister": {
              try {
                this.controllerNull.deleteJavaScriptRegister(this.name);
              } catch (error) {
                Utils.emitEvent(error.code, 114310)
              }
              break;
            }
            case "emitDeleteJavaScriptRegister2": {
              try {
                this.controller.registerJavaScriptProxy(this.testObj, this.name, ["test", "toString"]);
                this.controller.deleteJavaScriptRegister('objName01');
              } catch (error) {
                Utils.emitEvent(error.code, 114320)
              }
              break;
            }
            case "emitGetHitTest": {
              try {
                let hitTestType = this.controllerNull.getHitTest();
                console.log("hitTestType: " + hitTestType);
              } catch (error) {
                Utils.emitEvent(error.code, 114330)
              }
              break;
            }
            case "emitGetTitle": {
              try {
                let title = this.controllerNull.getTitle();
                console.log("title: " + title);
              } catch (error) {
                Utils.emitEvent(error.code, 114340)
              }
              break;
            }
            case "emitGetPageHeight": {
              try {
                let title = this.controllerNull.getPageHeight();
                console.log("title: " + title);
              } catch (error) {
                Utils.emitEvent(error.code, 114350)
              }
              break;
            }
            case "emitGetHitTestValue": {
              try {
                this.controllerNull.getHitTestValue();
              } catch (error) {
                Utils.emitEvent(error.code, 114360)
              }
              break;
            }
            case "emitGetWebId": {
              try {
                let id = this.controllerNull.getWebId();
                console.log("id: " + id);
              } catch (error) {
                Utils.emitEvent(error.code, 114370)
              }
              break;
            }
            case "emitBackOrForward": {
              try {
                this.controllerNull.backOrForward(this.step);
              } catch (error) {
                Utils.emitEvent(error.code, 114380)
              }
              break;
            }
            case "emitZoom": {
              try {
                this.controllerNull.zoom(this.factor);
              } catch (error) {
                Utils.emitEvent(error.code, 114390)
              }
              break;
            }
            case "emitZoom2": {
              try {
                this.controller.zoom(1);
              } catch (error) {
                Utils.emitEvent(error.code, 114400)
              }
              break;
            }

            // case "emitLoadUrl2": {
            //   try {
            //     this.controller.loadUrl($rawfile(''));
            //     Utils.emitEvent(this.no_error, 114410)
            //   } catch (error) {
            //     Utils.emitEvent(error.code, 114410)
            //   }
            //   break;
            // }
            case "emitLoadUrl3": {
              try {
                this.controller.loadUrl('file://');
                Utils.emitEvent(this.no_error, 114420)
              } catch (error) {
                Utils.emitEvent(error.code, 114420)
              }
              break;
            }

            case "emitWebMessagePort2": {
              try {
                this.ports = this.controller.createWebMessagePorts();
                this.controller.postMessage('__init_port__', [this.ports[0]], '*');
                this.ports[1].close();
                this.ports[1].postMessageEvent("post message from ets to html5");
              } catch (error) {
                Utils.emitEvent(error.code, 114430)
              }
              break;
            }

            case "emitZoomOut2": {
              try {
                this.controller.zoomOut();
              } catch (error) {
                Utils.emitEvent(error.code, 114440)
              }
              break;
            }

            case "testAccessForwardError001": {
              try {
                this.controllerNull.accessForward()
              } catch (error) {
                let e: business_error.BusinessError = error as business_error.BusinessError;
                console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                Utils.emitEvent(e.code, 114450)
              }
              break;
            }

            case "testAccessBackwardError001": {
              try {
                this.controllerNull.accessBackward()
              } catch (error) {
                let e: business_error.BusinessError = error as business_error.BusinessError;
                console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                Utils.emitEvent(e.code, 114460)
              }
              break;
            }

            case "testAccessStepError001": {
              try {
                this.controllerNull.accessStep(this.steps)
              } catch (error) {
                let e: business_error.BusinessError = error as business_error.BusinessError;
                console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                Utils.emitEvent(e.code, 114470)
              }
              break;
            }

            case "testForwardError001": {
              try {
                this.controllerNull.forward()
              } catch (error) {
                let e: business_error.BusinessError = error as business_error.BusinessError;
                console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                Utils.emitEvent(e.code, 114480)
              }
              break;
            }

            case "testBackwardError001": {
              try {
                this.controllerNull.backward()
              } catch (error) {
                let e: business_error.BusinessError = error as business_error.BusinessError;
                console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                Utils.emitEvent(e.code, 114490)
              }
              break;
            }

            case "testClearHistoryError001": {
              try {
                this.controllerNull.clearHistory()
              } catch (error) {
                let e: business_error.BusinessError = error as business_error.BusinessError;
                console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                Utils.emitEvent(e.code, 114500)
              }
              break;
            }

            case "testOnActiveError001": {
              try {
                this.controllerNull.onActive()
              } catch (error) {
                let e: business_error.BusinessError = error as business_error.BusinessError;
                console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                Utils.emitEvent(e.code, 114510)
              }
              break;
            }

            case "testOnInactiveError001": {
              try {
                this.controllerNull.onInactive()
              } catch (error) {
                let e: business_error.BusinessError = error as business_error.BusinessError;
                console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                Utils.emitEvent(e.code, 114520)
              }
              break;
            }

            case "testGetCertificateError001": {
              try {
                this.controllerNull.getCertificate()
              } catch (error) {
                let e: business_error.BusinessError = error as business_error.BusinessError;
                console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                Utils.emitEvent(e.code, 114530)
              }
              break;
            }

            case "testSetAudioMutedError001": {
              try {
                this.controllerNull.setAudioMuted(true)
              } catch (error) {
                let e: business_error.BusinessError = error as business_error.BusinessError;
                console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                Utils.emitEvent(e.code, 114540)
              }
              break;
            }

            case "testPerFetchPageError001": {
              try {
                this.controllerNull.prefetchPage("123")
              } catch (error) {
                let e: business_error.BusinessError = error as business_error.BusinessError;
                console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                Utils.emitEvent(e.code, 114550)
              }
              break;
            }

            case "testPerFetchPageError002": {
              try {

                this.controller.prefetchPage('123')
              } catch (error) {
                let e: business_error.BusinessError = error as business_error.BusinessError;
                console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                Utils.emitEvent(e.code, 114560)
              }
              break;
            }

            case "testSetCustomUserAgentError001": {
              try {
                this.controllerNull.setCustomUserAgent("")
              } catch (error) {
                let e: business_error.BusinessError = error as business_error.BusinessError;
                console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                Utils.emitEvent(e.code, 114570)
              }
              break;
            }

            case "testGetCustomUserAgentError001": {
              try {

                this.controllerNull.getCustomUserAgent();
              } catch (error) {
                let e: business_error.BusinessError = error as business_error.BusinessError;
                console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                Utils.emitEvent(e.code, 114580)
              }
              break;
            }

            case "testPrepareForPageLoadError001": {
              try {
                webView.WebviewController.prepareForPageLoad("https://www.huawei.com/cn/", true, 7);
                Utils.emitEvent(this.no_error, 114590)
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                Utils.emitEvent(error.code, 114590)
              }
              break;
            }

            case "testPrepareForPageLoadError002": {
              try {
                webView.WebviewController.prepareForPageLoad("华为", true, 6);
                Utils.emitEvent(this.no_error, 114600)
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                Utils.emitEvent(error.code, 114600)
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
        .zoomAccess(false)
        .onPageEnd((event) => {
          console.log('onPageEnd url:' + event.url);
          this.isPageEnd = 1;
        })
    }
  }
}
