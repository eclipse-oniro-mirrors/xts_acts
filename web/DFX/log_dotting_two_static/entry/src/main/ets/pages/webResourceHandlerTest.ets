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
import {LoadCommittedDetails, Entry, Component, Column, Row, Button, ClickEvent, Web } from '@ohos.arkui.component'
import { State } from '@ohos.arkui.stateManagement' // should be insert by ui-plugins
import webview from '@ohos.web.webview'
import { BusinessError } from '@ohos.base';
import Utils from '../../src/test/Util.test';
import events_emitter from '@ohos.events.emitter';
import emitter from '@ohos.events.emitter';
import { Callback, RecordData } from '@ohos.base'
import { WebNetErrorList } from '@ohos.web.netErrorList';
import { UIContext, Router } from '@ohos.arkui.UIContext';
import  buffer  from '@ohos.buffer'

class StringFields {
  public str: string = '';
}

export enum ThreatType {
  UNKNOWN = -1,
  THREAT_ILLEGAL = 0,
  THREAT_FRAUD = 1,
  THREAT_RISK = 2,
  THREAT_WARNING = 3,
}

export enum WebNavigationType {
  MAIN_FRAME_NEW_ENTRY = 0,
  MAIN_FRAME_EXISTING_ENTRY = 1,
  NAVIGATION_TYPE_NEW_SUBFRAME = 2,
  NAVIGATION_TYPE_AUTO_SUBFRAME = 3,
}

@Entry
@Component
struct webResourceHandlerTest {
  stringObj: StringFields  = new StringFields ();
  controller: webview.WebviewController = new webview.WebviewController(undefined);
  schemeHandler: webview.WebSchemeHandler = new webview.WebSchemeHandler()
  httpBodyStream: webview.WebHttpBodyStream|null = null
  @State emitKey: string = '';
  @State javaScriptAccess: boolean = true;
  @State fileAccess: boolean = true;
  @State domStorageAccess: boolean = true;
  @State imageAccess: boolean = true;
  @State onlineImageAccess: boolean = true;
  @State databaseAccess: boolean = true;
  htmlData: string = '<html><body bgcolor=\"white\">Source:<pre>source</pre></body></html>';

  @State testDidReceiveResponse: Int= -1;
  @State testDidReceiveResponseBody: Int= -1;
  @State testDidFinish: Int= -1;
  @State testDidFail: Int= -1;
  @State webNavigationType: Int = 0;

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
        Button('web click').key('webView').onClick( (e:ClickEvent) => {
          console.info('key==>' +  this.stringObj.str)
          switch (this.stringObj.str) {

            case 'testWebNavigationType001': {
              try {
                this.controller.loadUrl('resource:r//rawfile/index.html');
                let check = (v1: boolean, v2: boolean): boolean => {
                  return v1 === v2 ? true: false;
                }
                if(this.webNavigationType = 1 ) {
                  Utils.emitEvent(true, 202503212)
                }
              } catch (error) {
                error = error as BusinessError;
                console.error(`testWebNavigationType001 ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              break;
            }

            case 'testWebNavigationType002': {
              try {
                this.controller.loadUrl('www.example.com');
                this.controller.backward();
                let check = (v1: boolean, v2: boolean): boolean => {
                  return v1 === v2 ? true: false;
                }
                if(this.webNavigationType = 2 ) {
                  Utils.emitEvent(true, 202503213)
                }
              } catch (error) {
                error = error as BusinessError;
                console.error(`testWebNavigationType002 ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              break;
            }

            case 'testWebNavigationType003': {
              try {
                this.controller.loadUrl('resource://rawfile/iframe1.html');
                let check = (v1: boolean, v2: boolean): boolean => {
                  return v1 === v2 ? true: false;
                }
                if(this.webNavigationType = 3 ) {
                  Utils.emitEvent(true, 202503214)
                }
              } catch (error) {
                error = error as BusinessError;
                console.error(`testWebNavigationType003 ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              break;
            }

          }
        })
      }

      Web({ src: 'www.example.com', controller: this.controller })
        .javaScriptAccess(this.javaScriptAccess)
        .fileAccess(this.fileAccess)
        .imageAccess(this.imageAccess)
        .domStorageAccess(this.domStorageAccess)
        .onlineImageAccess(this.onlineImageAccess)
        .databaseAccess(this.databaseAccess)
       .onNavigationEntryCommitted((details:LoadCommittedDetails) => {
         console.log('Navigation url : ' + details.url)
         console.log('Navigation type: ' + details.navigationType);
         this.webNavigationType = details.navigationType;
       })
        .onControllerAttached(() => {
          try {
            this.schemeHandler.onRequestStart(
              (request: webview.WebSchemeHandlerRequest, resourceHandler: webview.WebResourceHandler) => {
                console.log('[schemeHandler] onRequestStart');
                let response = new webview.WebSchemeHandlerResponse();
                try {
                  response.setNetErrorCode(WebNetErrorList.NET_OK);
                  response.setStatus(200);
                  response.setStatusText('OK');
                  response.setMimeType('text/html');
                  response.setEncoding('utf-8');
                  response.setHeaderByName('header1', 'value1', false);
                } catch (error) {
                  console.error(`[schemeHandler] ErrorCode: ${(error as BusinessError).code}`);
                }

                // 调用 didFinish/didFail 前需要优先调用 didReceiveResponse 将构造的响应头传递给被拦截的请求。
                let buf = buffer.from(this.htmlData)
                try {
                  if (buf.length == 0) {
                    console.log('[schemeHandler] length 0');
                    resourceHandler.didReceiveResponse(response);
                    // 如果认为buf.length为0是正常情况，则调用resourceHandler.didFinish，否则调用resourceHandler.didFail
                    resourceHandler.didFail(WebNetErrorList.ERR_FAILED);
                  } else {
                    console.log('[schemeHandler] length 1');
                    resourceHandler.didReceiveResponse(response);
                    resourceHandler.didReceiveResponseBody(buf.buffer);
                    resourceHandler.didFinish();
                  }
                } catch (error) {
                  console.error(`[schemeHandler] ErrorCode: ${(error as BusinessError).code}`);
                }
                try {
                  resourceHandler.didReceiveResponse(response);
                } catch (error) {
                  console.error(`[schemeHandler] ErrorCode didReceiveResponse: ${(error as BusinessError).code}`);
                  this.testDidReceiveResponse = (error as BusinessError).code;
                }

                try {
                  resourceHandler.didReceiveResponseBody(buf.buffer);
                } catch (error) {
                  console.error(`[schemeHandler] ErrorCode didReceiveResponseBody: ${(error as BusinessError).code}`);
                  this.testDidReceiveResponseBody = (error as BusinessError).code;

                }

                try {
                  resourceHandler.didFinish();
                } catch (error) {
                  console.error(`[schemeHandler] ErrorCode didFinish: ${(error as BusinessError).code}`);
                  this.testDidFinish = (error as BusinessError).code;
                }

                try {
                  resourceHandler.didFail(WebNetErrorList.ERR_FAILED);
                } catch (error) {
                  console.error(`[schemeHandler] ErrorCode didFail: ${(error as BusinessError).code}`);
                  this.testDidFail = (error as BusinessError).code;
                }

                return false;
              })

            this.controller.setWebSchemeHandler('https', this.schemeHandler);
            this.controller.setWebSchemeHandler('http', this.schemeHandler);
            this.controller.setWebSchemeHandler('resource', this.schemeHandler);
            webview.WebviewController.setServiceWorkerWebSchemeHandler('https', this.schemeHandler)
          } catch (error) {
            error = error as BusinessError;
            console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
          }
        })
    }
  }
}
