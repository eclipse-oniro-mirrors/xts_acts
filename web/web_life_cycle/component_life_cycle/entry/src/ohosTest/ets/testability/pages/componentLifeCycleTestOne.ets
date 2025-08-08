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
import events_emitter from '@ohos.events.emitter';
import { JsProxyObject } from '../../test/Interfaces';
import image from '@ohos.multimedia.image';
import web_webview from '@ohos.web.webview';
import business_error, { BusinessError } from '@ohos.base';

@Entry
@Component
struct httpAuthHandler {
  controller: WebController = new WebController();
  controllerone: web_webview.WebviewController = new web_webview.WebviewController();
  controllerTwo: web_webview.WebviewController = new web_webview.WebviewController();
  @State str: string = ""
  @State onScrollCallBack: boolean = false
  @State pageBegin: string = ""
  @State javaScriptAccess: boolean = true
  @State icon: image.PixelMap | undefined = undefined;
  @State onShowFileSelectorCallBack: boolean = false
  @State HttpAuthHandlerCallBack: string = ''
  @State HttpAuthHandlerConfirmCallBack: boolean = false
  @State HttpAuthHandlerCancelCallBack: boolean = false
  @State HttpAuthHandlerIsHttpAuthInfoSavedCallBack: boolean = false
  @State Http_Error_Code: number = 0
  @State errorCode: string = '0';
  @State webId: number = 0
  @State errorMsg: string = 'failed';
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
        Button("HttpAuthHandler click").key('HttpAuthHandlerButton').onClick(async () => {
          console.info("key==>" + this.str)
          switch (this.str) {

            case "emitOnRenderExited": {
              this.controller.loadUrl({ url: "chrome://crash/" });
              await Utils.sleep(3000)
              break;
            }
            case "emitonInactive": {
              try {
                this.controllerone.loadData(
                  "<html><head><title>baidu</title></head><body bgcolor=\"white\">Source:<pre>source</pre></body></html>",
                  "text/html",
                  "UTF-8"
                );
                await Utils.sleep(1000)
                this.controllerone.onInactive();
                setTimeout(() => {
                  setTimeout(() => {
                    this.controllerone.loadUrl("resource://rawfile/index.html");
                  }, 3000);
                  let title4 = this.controllerone.getTitle();
                  Utils.emitEvent(title4, 7);
                }, 3000);
              } catch (error) {
                console.error(`Errorcode: ${error.code}, Message: ${error.message}`);
              }
              break;
            }
            case "emitonActive": {
              try {
                this.controllerone.onInactive();
                setTimeout(() => {
                  let title5 = this.controllerone.getTitle();
                  Utils.emitEvent(title5, 8);
                }, 3000);
              } catch (error) {
                console.error(`Errorcode: ${error.code}, Message: ${error.message}`);
              }
              break;
            }
            case "emitOnActiveInitErr": {
              try {
                this.errorCode = '0';
                this.errorMsg = 'failed';
                this.controllerTwo.onActive();
              } catch (error) {
                console.error(`emitOnActiveInitErr ErrorCode: ${error.code},  Message: ${error.message}`);
                this.errorCode = error.code
                this.errorMsg = error.message
              }
              Utils.emitEvent(this.errorCode, 638)
              Utils.emitEvent(this.errorMsg, 639)
              break;
            }
            case "emitOnInactiveInitErr": {
              try {
                this.errorCode = '0';
                this.errorMsg = 'failed';
                this.controllerTwo.onInactive();
              } catch (error) {
                console.error(`emitOnInactiveInitErr ErrorCode: ${error.code},  Message: ${error.message}`);
                this.errorCode = error.code
                this.errorMsg = error.message
              }
              Utils.emitEvent(this.errorCode, 640)
              Utils.emitEvent(this.errorMsg, 641)
              break;
            }
            case "testOnInactive001": {
              try {
                let onInactiveCalled = false
                this.controller.loadUrl({ url: "resource://rawfile/webPart1index.html" });
                this.controller.onInactive()
                await Utils.sleep(2000);
                this.controller.runJavaScript({ script: "getTitle()", callback: (res) => {
                  console.info("GetTitle++++++" + res)
                  if (res == "\"index\"") {
                    onInactiveCalled = true
                  }
                  Utils.emitEvent(onInactiveCalled, 31000)
                } })
              }
              catch (error) {
                let e: business_error.BusinessError = error as business_error.BusinessError;
                console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                Utils.emitEvent(e.code, 31000)
              }
              break;
            }

            case "testOnActive001": {
              try {
                this.controller.onActive()
                this.controller.loadUrl({ url: "resource://rawfile/webPart1index.html" });
                setTimeout(() => {
                  let onActiveCalled = this.pageBegin
                  Utils.emitEvent(onActiveCalled, 31001)
                }, 5000)
              }
              catch (error) {
                let e: business_error.BusinessError = error as business_error.BusinessError;
                console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                Utils.emitEvent(e.code, 31001)
              }
              break;
            }

            case "testOnInactive002": {
              try {
                this.controllerone.onInactive();
                await Utils.sleep(3000)
                this.controllerone.loadUrl("resource://rawfile/second.html")
                await Utils.sleep(3000)
                let title = this.controllerone.getTitle();
                Utils.emitEvent(title, 100077)
              } catch (error) {
                console.error(`Errorcode: ${error.code}, Message: ${error.message}`);
              }
              break;
            }

            case "testOnActive002": {
              try {
                this.controllerone.loadUrl("resource://rawfile/second.html")
                await Utils.sleep(3000)
                this.controllerone.onActive();
                await Utils.sleep(3000)
                let title = this.controllerone.getTitle();
                Utils.emitEvent(title, 100078)
              } catch (error) {
                console.error(`Errorcode: ${error.code}, Message: ${error.message}`);
              }
              break;
            }

            case "emitOnControllerAttached": {
              Utils.emitEvent(this.webId > 0, 1221)
              break;
            }

            case "emitSetRenderProcessMode": {
              this.controllerone.loadUrl("resource://rawfile/metaViewport.html")
              await Utils.sleep(3000)
              web_webview.WebviewController.setRenderProcessMode(web_webview.RenderProcessMode.MULTIPLE);
              Utils.sleep(1000);
              let mode = web_webview.WebviewController.getRenderProcessMode();
              console.info('>>>>>renderProcessMode:' + mode)
              Utils.emitEvent(mode === web_webview.RenderProcessMode.MULTIPLE, 10005)
              Utils.emitEvent(true, 10005)
              break;
            }

            case 'emitWebViewGetAndSetRenderProcessMode01': {
              try {
                web_webview.WebviewController.setRenderProcessMode(web_webview.RenderProcessMode.SINGLE);
                this.controllerone.refresh();
                await Utils.sleep(2000);
                let oldMode = web_webview.WebviewController.getRenderProcessMode();
                console.log('oldMode===>'+oldMode)
                if (oldMode === 0) {
                  Utils.emitEvent('success', 8006);
                } else {
                  Utils.emitEvent('fail', 8006);
                }
              } catch (error) {
                let e:business_error.BusinessError = error as business_error.BusinessError;
                console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
              }
              break;
            }
            case 'emitWebViewGetAndSetRenderProcessMode02': {
              try {
                web_webview.WebviewController.setRenderProcessMode(web_webview.RenderProcessMode.SINGLE);
                this.controllerone.refresh();
                await Utils.sleep(2000);
                let oldMode = web_webview.WebviewController.getRenderProcessMode();
                console.log('oldMode===>'+oldMode)
                web_webview.WebviewController.setRenderProcessMode(web_webview.RenderProcessMode.MULTIPLE);
                await Utils.sleep(2000);
                let newMode = web_webview.WebviewController.getRenderProcessMode();
                console.log('newMode===>'+newMode)
                if (oldMode===0&&newMode === 1) {
                  Utils.emitEvent('success', 8007);
                } else {
                  Utils.emitEvent('fail', 8007);
                }
              } catch (error) {
                let e:business_error.BusinessError = error as business_error.BusinessError;
                console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
              }
              break;
            }

            case "emitWebViewOnRenderProcessResponding": {
              this.controllerone.refresh()
              this.controllerone.loadUrl($rawfile('common_index.html'))
              await Utils.sleep(1000)
              this.controllerone.runJavaScript("jumpPageCaton()", (error, result) => {
                console.error(`The jumpPageCaton() return error is: ${error}`);
                console.log(`The jumpPageCaton() return value is: ${result}`);
              })
              await Utils.sleep(15000)
              Utils.emitEvent(true,1336)
              break;
            }

            case "emitWebViewNotRespondingReason_NAVIGATION_COMMIT_TIMEOUT": {
              this.controllerone.refresh()
              this.controllerone.loadUrl($rawfile('common_index.html'))
              await Utils.sleep(1000)
              this.controllerone.runJavaScript("jumpPageCaton()", (error, result) => {
                console.error(`The jumpPageCaton() return error is: ${error}`);
                console.log(`The jumpPageCaton() return value is: ${result}`);
              })
              await Utils.sleep(15000)
              Utils.emitEvent(true,1338)
              break;
            }

          }
        })
      }
      Web({ src: "www.example.com", controller: this.controllerone })
        .mediaPlayGestureAccess(true)
        .javaScriptAccess(true)
        .forceDarkAccess(false)
        .webSerifFont('serif')
        .webFixedFont('fixed')
        .webSansSerifFont('serif')
        .minLogicalFontSize(1)
        .horizontalScrollBarAccess(true)
        .verticalScrollBarAccess(true)
        .pinchSmooth(true)
        .onControllerAttached(() => {
          try {
            let id = this.controllerone.getWebId();
            this.webId = id
          } catch (error) {
            let code = (error as BusinessError).code;
            let message = (error as BusinessError).message;
            console.error(`ErrorCode: ${code},  Message: ${message}`);
          }
        })
        .onRenderProcessNotResponding(async (data) => {
          console.log("onRenderProcessNotResponding: [jsStack]= " + data.jsStack +
          ", [process]=" + data.pid + ", [reason]=" + data.reason);
          console.log('data.reason:' + RenderProcessNotRespondingReason.INPUT_TIMEOUT)
          console.log('data.reason:' + RenderProcessNotRespondingReason.NAVIGATION_COMMIT_TIMEOUT)
          await Utils.sleep(1000)
          this.controllerone.runJavaScript("stopBlockJs()", (error, result) => {
            console.error(`The stopBlockJs() return error is: ${error}`);
            console.log(`The stopBlockJs() return value is: ${result}`);
          })
          if(RenderProcessNotRespondingReason.NAVIGATION_COMMIT_TIMEOUT.toString() === '1'){
            Utils.emitEvent(true,1338)
          }
        })
        .onRenderProcessResponding(() => {
          console.log("onRenderProcessResponding again");
          Utils.emitEvent(true,1336)
        })
      Web({ src: $rawfile('index.html'), controller: this.controller })
        .javaScriptAccess(this.javaScriptAccess)
        .key("onShowFileSelectorKey")
        .onPageBegin((event) => {
          if (event) {
            this.pageBegin = event.url
          }
        })
        .javaScriptProxy({
          object: this.jsObj,
          name: "backToEts",
          methodList: ["test", "toString"],
          controller: this.controller
        })
        .onRenderExited((event) => {
          console.info("onRenderExited==>" + event?.renderExitReason);
          Utils.emitEvent(event.renderExitReason, 106);
        })
    }
  }
}
