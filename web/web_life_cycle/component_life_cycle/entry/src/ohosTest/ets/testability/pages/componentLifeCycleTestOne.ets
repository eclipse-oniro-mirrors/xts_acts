/*
 * Copyright (c) 2024-2025 Huawei Device Co., Ltd.
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
import web_webview from '@ohos.web.webview';
import business_error, { BusinessError } from '@ohos.base';
import { waitForExist } from '../../test/WaitTest.test';

@Entry
@Component
struct httpAuthHandler {
  controller: WebController = new WebController();
  controllerone: web_webview.WebviewController = new web_webview.WebviewController();
  controllerTwo: web_webview.WebviewController = new web_webview.WebviewController();
  @State str: string = ''
  @State pageEnd: string = ''
  @State javaScriptAccess: boolean = true
  @State errorCode: string = '0';
  @State webId: number = 0
  @State errorMsg: string = 'failed';
  @State isRenderExited: number = -1;
  @State isPageEnd1: number = -1;
  @State isPageEnd2: number = -1;
  @State isReceive: number = -1;

  onPageShow() {
    let valueChangeEvent: events_emitter.InnerEvent = {
      eventId: 138100,
      priority: events_emitter.EventPriority.LOW,
    }
    events_emitter.on(valueChangeEvent, this.valueChangeCallBack)
  }

  onPageHide() {
    events_emitter.off(138100)
  }

  private valueChangeCallBack = (eventData: events_emitter.EventData) => {
    console.info('web page valueChangeCallBack');
    if (eventData != null) {
      console.info('valueChangeCallBack:' + JSON.stringify(eventData));
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
      console.info('ets toString:' + String(str));
    },
    register: (res: object) => {
      Utils.emitEvent(String(res), 86);
      return 'web222'
    },
  }

  build() {
    Column() {
      Row() {
        Button('HttpAuthHandler click').key('HttpAuthHandlerButton').onClick(async () => {
          await waitForExist(() => this.isPageEnd1, this.str, 0);
          await waitForExist(() => this.isPageEnd2, this.str, 0);
          await waitForExist(() => this.isReceive, this.str, 0);
          this.isReceive = -1;
          console.info('key==>' + this.str)
          switch (this.str) {
            case 'emitOnRenderExited': {
              this.isRenderExited = -1;
              this.controller.loadUrl({ url: 'chrome://crash/' });
              await waitForExist(() => this.isRenderExited, this.str, 0);
              break;
            }
            case 'emitonInactive': {
              try {
                this.isPageEnd1 = -1;
                this.controllerone.loadData(
                  '<html><head><title>demo</title></head><body bgcolor="white">Source:<pre>source</pre></body></html>',
                  'text/html',
                  'UTF-8',
                );
                await waitForExist(() => this.isPageEnd1, this.str, 0);

                this.controllerone.onInactive();

                this.isPageEnd1 = -1;
                this.controllerone.loadUrl('resource://rawfile/index.html');
                await waitForExist(() => this.isPageEnd1, this.str, 0);
                let title = this.controllerone.getTitle();
                Utils.emitEvent(title, 138120);
              } catch (error) {
                console.error(`Errorcode: ${error.code}, Message: ${error.message}`);
              }
              break;
            }
            case 'emitonActive': {
              try {
                this.controllerone.onActive();

                this.isPageEnd1 = -1;
                this.controllerone.loadUrl('resource://rawfile/index.html');
                await waitForExist(() => this.isPageEnd1, this.str, 0);

                let title = this.controllerone.getTitle();
                Utils.emitEvent(title, 138130);
              } catch (error) {
                console.error(`Errorcode: ${error.code}, Message: ${error.message}`);
              }
              break;
            }
            case 'emitOnActiveInitErr': {
              try {
                this.errorCode = '0';
                this.errorMsg = 'failed';
                this.controllerTwo.onActive();
              } catch (error) {
                console.error(`emitOnActiveInitErr ErrorCode: ${error.code},  Message: ${error.message}`);
                this.errorCode = error.code
                this.errorMsg = error.message
              }
              Utils.emitEvent(this.errorCode, 138140)
              break;
            }
            case 'emitOnInactiveInitErr': {
              try {
                this.errorCode = '0';
                this.errorMsg = 'failed';
                this.controllerTwo.onInactive();
              } catch (error) {
                console.error(`emitOnInactiveInitErr ErrorCode: ${error.code},  Message: ${error.message}`);
                this.errorCode = error.code
                this.errorMsg = error.message
              }
              Utils.emitEvent(this.errorCode, 138150)
              break;
            }
            case 'testOnInactive001': {
              try {
                let onInactiveCalled = false
                this.isPageEnd2 = -1;
                this.controller.loadUrl({ url: 'resource://rawfile/webPart1index.html' });
                await waitForExist(() => this.isPageEnd2, this.str, 0);
                this.controller.onInactive()
                this.controller.runJavaScript({
                  script: 'getTitle()', callback: (res) => {
                    console.info('GetTitle++++++' + res)
                    if (res == '"index"') {
                      onInactiveCalled = true
                    }
                    Utils.emitEvent(onInactiveCalled, 138160)
                  },
                })
              } catch (error) {
                let e: business_error.BusinessError = error as business_error.BusinessError;
                console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                Utils.emitEvent(e.code, 138160)
              }
              break;
            }
            case 'testOnActive001': {
              try {
                this.controller.onActive()

                this.isPageEnd2 = -1;
                this.controller.loadUrl({ url: 'resource://rawfile/webPart1index.html' });
                await waitForExist(() => this.isPageEnd2, this.str, 0);
                Utils.emitEvent(this.pageEnd, 138170)
              } catch (error) {
                let e: business_error.BusinessError = error as business_error.BusinessError;
                console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                Utils.emitEvent(e.code, 138170)
              }
              break;
            }
            case 'testOnInactive002': {
              try {
                this.controllerone.onInactive();
                this.isPageEnd1 = -1;
                this.controllerone.loadUrl('resource://rawfile/second.html');
                await waitForExist(() => this.isPageEnd1, this.str, 0);
                let title = this.controllerone.getTitle();
                Utils.emitEvent(title, 138180)
              } catch (error) {
                console.error(`Errorcode: ${error.code}, Message: ${error.message}`);
              }
              break;
            }
            case 'testOnActive002': {
              try {
                this.isPageEnd1 = -1;
                this.controllerone.loadUrl('resource://rawfile/second.html');
                await waitForExist(() => this.isPageEnd1, this.str, 0);
                this.controllerone.onActive();
                let title = this.controllerone.getTitle();
                Utils.emitEvent(title, 138190)
              } catch (error) {
                console.error(`Errorcode: ${error.code}, Message: ${error.message}`);
              }
              break;
            }
            case 'emitOnControllerAttached': {
              Utils.emitEvent(this.webId > 0, 138200)
              break;
            }
            case 'emitSetRenderProcessMode': {
              web_webview.WebviewController.setRenderProcessMode(web_webview.RenderProcessMode.MULTIPLE);
              let mode = web_webview.WebviewController.getRenderProcessMode();
              console.info('>>>>>renderProcessMode:' + mode)
              Utils.emitEvent(mode === web_webview.RenderProcessMode.MULTIPLE, 138210)
              break;
            }
            case 'emitWebViewGetAndSetRenderProcessMode01': {
              try {
                web_webview.WebviewController.setRenderProcessMode(web_webview.RenderProcessMode.SINGLE);
                let oldMode = web_webview.WebviewController.getRenderProcessMode();
                console.log('oldMode===>' + oldMode)
                if (oldMode === 0) {
                  Utils.emitEvent('success', 138220);
                } else {
                  Utils.emitEvent('fail', 138220);
                }
              } catch (error) {
                let e: business_error.BusinessError = error as business_error.BusinessError;
                console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
              }
              break;
            }
            case 'emitWebViewGetAndSetRenderProcessMode02': {
              try {
                web_webview.WebviewController.setRenderProcessMode(web_webview.RenderProcessMode.SINGLE);
                let oldMode = web_webview.WebviewController.getRenderProcessMode();
                console.log('oldMode===>' + oldMode)
                web_webview.WebviewController.setRenderProcessMode(web_webview.RenderProcessMode.MULTIPLE);
                let newMode = web_webview.WebviewController.getRenderProcessMode();
                console.log('newMode===>' + newMode)
                if (oldMode === 0 && newMode === 1) {
                  Utils.emitEvent('success', 138230);
                } else {
                  Utils.emitEvent('fail', 138230);
                }
              } catch (error) {
                let e: business_error.BusinessError = error as business_error.BusinessError;
                console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
              }
              break;
            }
            case 'emitWebViewOnRenderProcessResponding': {
              this.controllerone.runJavaScript('jumpPageCaton()', (error, result) => {
                console.error(`The jumpPageCaton() return error is: ${error}`);
                console.log(`The jumpPageCaton() return value is: ${result}`);
              })
              Utils.emitEvent(true, 138240)
              break;
            }
            case 'emitWebViewNotRespondingReason_NAVIGATION_COMMIT_TIMEOUT': {
              this.controllerone.runJavaScript('jumpPageCaton()', (error, result) => {
                console.error(`The jumpPageCaton() return error is: ${error}`);
                console.log(`The jumpPageCaton() return value is: ${result}`);
              })
              Utils.emitEvent(true, 138250)
              break;
            }
          }
        })
      }

      Web({ src: $rawfile('index.html'), controller: this.controllerone })
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
          console.log('onRenderProcessNotResponding: [jsStack]= ' + data.jsStack +
            ', [process]=' + data.pid + ', [reason]=' + data.reason);
          console.log('data.reason:' + RenderProcessNotRespondingReason.INPUT_TIMEOUT)
          console.log('data.reason:' + RenderProcessNotRespondingReason.NAVIGATION_COMMIT_TIMEOUT)
          this.controllerone.runJavaScript('stopBlockJs()', (error, result) => {
            console.error(`The stopBlockJs() return error is: ${error}`);
            console.log(`The stopBlockJs() return value is: ${result}`);
          })
          if (RenderProcessNotRespondingReason.NAVIGATION_COMMIT_TIMEOUT.toString() === '1') {
            Utils.emitEvent(true, 138250)
          }
        })
        .onRenderProcessResponding(() => {
          console.log('onRenderProcessResponding again');
          Utils.emitEvent(true, 138240)
        })
        .onPageEnd((event) => {
          console.log('web pageEnd1==>' + event.url);
          this.isPageEnd1 = 0;
        })

      Web({ src: $rawfile('index.html'), controller: this.controller })
        .javaScriptAccess(this.javaScriptAccess)
        .key('onShowFileSelectorKey')
        .javaScriptProxy({
          object: this.jsObj,
          name: 'backToEts',
          methodList: ['test', 'toString'],
          controller: this.controller,
        })
        .onRenderExited((event) => {
          this.isRenderExited = 0;
          console.info('onRenderExited==>' + event?.renderExitReason);
          Utils.emitEvent(event.renderExitReason, 138110);
        })
        .onPageEnd((event) => {
          this.pageEnd = event.url
          console.log('web pageEnd2==>' + event.url);
          this.isPageEnd2 = 0;
        })
    }
  }
}
