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
import {
  WebResourceResponse,
  Entry,
  Component,
  Column,
  Row,
  Button,
  ClickEvent,
  Web
} from '@ohos.arkui.component'
import { State } from '@ohos.arkui.stateManagement';
import webView from '@ohos.web.webview';
import { BusinessError, RecordData } from '@ohos.base';
import emitter from '@ohos.events.emitter';
import Utils from '../../src/test/Util.test';
import events_emitter from '@ohos.events.emitter';
import { Callback } from '@ohos.base'
import { UIContext, Router } from '@ohos.arkui.UIContext';

@Entry
@Component
struct Index {
  controller: webView.WebviewController = new webView.WebviewController(undefined);
  controllerNull: webView.WebviewController = new webView.WebviewController(undefined);
  responseWeb: WebResourceResponse = new WebResourceResponse()
  @State str: string = ''
  @State javaScriptAccess: boolean = true;
  @State name: string = 'objName';
  @State steps: number = 1;
  @State step: number = -2;
  @State factor: number = 1;
  @State errorCode: string = '0';
  @State webResult: string = ' ';
  @State receivedFromHtml: string = 'Display received message send from HTML';
  @State ports: Array<webView.WebMessagePort> = new Array<webView.WebMessagePort>()

  aboutToAppear() {
    console.info('Entry aboutToAppear');
    let valueChangeEvent: events_emitter.InnerEvent = {
      eventId: 10,
      priority: events_emitter.EventPriority.LOW
    }
    events_emitter.on(valueChangeEvent, this.valueChangeCallBack)
    console.info('Finish aboutToAppear');
  }

  private valueChangeCallBack: Callback<events_emitter.EventData> = (eventData: events_emitter.EventData): void => {
    if (eventData != null) {
      console.info('valueChangeCallBack:' + JSON.stringify(eventData));
      const data = eventData.data as Record<string, RecordData>;
      if (data != null && data['ACTION'] != null) {
        let strValue: string = String(data['ACTION']);
        this.str = strValue;
      }
    }
  }

  build() {
    Column() {
      Row() {
        Button('WebErrorCode click').key('ErrorCodeTestSuiteButton').onClick((event: ClickEvent) => {
          console.info('key==>' + this.str)
          switch (this.str) {

            case 'emitZoomIn': {
              try {
                this.controllerNull.zoomIn();
              } catch (error) {
                error = error as BusinessError;
                Utils.emitEvent(error.code, 1012)
              }
              break;
            }

            case 'emitZoomIn2': {
              try {
                this.controller.zoomIn();
              } catch (error) {
                error = error as BusinessError;
                Utils.emitEvent(error.code, 1013)
              }
              break;
            }

            case 'emitZoomOut': {
              try {
                this.controllerNull.zoomOut();
              } catch (error) {
                error = error as BusinessError;
                Utils.emitEvent(error.code, 1028)
              }
              break;
            }

            case 'emitZoomOut2': {
              try {
                this.controller.zoomOut();
              } catch (error) {
                error = error as BusinessError;
                Utils.emitEvent(error.code, 1065)
              }
              break;
            }

            case 'emitSlideScroll': {
              try {
                this.controllerNull.slideScroll(500, 500);
              } catch (error) {
                error = error as BusinessError;
                Utils.emitEvent(error.code, 1033)
              }
              break;
            }

            case 'emitScrollBy': {
              try {
                this.controllerNull.scrollBy(50, 50);
              } catch (error) {
                error = error as BusinessError;
                Utils.emitEvent(error.code, 1034)
              }
              break;
            }

            case 'emitZoom': {
              try {
                this.controllerNull.zoom(this.factor);
              } catch (error) {
                error = error as BusinessError;
                Utils.emitEvent(error.code, 1049)
              }
              break;
            }

            case 'emitZoom2': {
              try {
                this.controller.zoom(1);
              } catch (error) {
                error = error as BusinessError;
                Utils.emitEvent(error.code, 1050)
              }
              break;
            }
            case "emitPostMessage": {
              try {
                this.controllerNull.createWebMessagePorts()[1].onMessageEvent((result: webView.WebMessage) => {
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
                this.controllerNull.postMessage('__init_port__', [this.controllerNull.createWebMessagePorts()[0]], '*');
              } catch (error) {
                error = error as BusinessError;
                Utils.emitEvent(error.code, 1022)
              }
              break;
            }

            case 'testCloseError001': {
              try {
                this.ports = this.controller.createWebMessagePorts(true);
                this.controller.postMessage('__init_port__', [this.ports[0]], '*');
                this.ports[1].close();
                this.ports[1].postMessageEvent('post message from ets to html5');
                Utils.emitEvent('no_error', 20360)
              } catch (error) {
                error = error as BusinessError;
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                Utils.emitEvent(String(error.code), 20360)
              }
              break;
            }

            case 'emitClearMatches': {
              try {
                this.controllerNull.clearMatches();
              } catch (error) {
                error = error as BusinessError;
                Utils.emitEvent(error.code, 1007)
              }
              break;
            }
            case 'emitCreateWebMessagePort': {
              try {
                this.controllerNull.createWebMessagePorts();
              } catch (error) {
                error = error as BusinessError;
                Utils.emitEvent(error.code, 1021)
              }
              break;
            }

            case 'testPrepareForPageLoadError001': {
              try {
                webView.WebviewController.prepareForPageLoad('www.example.com', true, 7);
                Utils.emitEvent(true, 50025)
              } catch (error) {
                error = error as BusinessError;
                Utils.emitEvent(error.code, 50025)
              }
              break;
            }

            case 'emitonSwitchNextPage': {
              let uiContext: UIContext = this.getUIContext();
              let router: Router = uiContext.getRouter();
              router.pushUrl({ url: 'pages/jsMessageExtErrorCode' })
              console.log('push URL success')
            }

          }
        })
      }

      Web({ src: 'resource://rawfile/index.html', controller: this.controller })
        .javaScriptAccess(this.javaScriptAccess)
        .zoomAccess(false)
        .fileAccess(true)
        .domStorageAccess(true)
        .onlineImageAccess(true)
        .key('ErrorCodeTestSuiteKey')
        .javaScriptAccess(true)
    }
  }
}
