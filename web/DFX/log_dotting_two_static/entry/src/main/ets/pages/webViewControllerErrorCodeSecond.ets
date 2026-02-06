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
  Entry,
  Component,
  Column,
  Row,
  Button,
  ClickEvent,
  Web
} from '@ohos.arkui.component'
import webview from '@ohos.web.webview'
import events_emitter from '@ohos.events.emitter'
import Utils from '../../src/test/Util.test';
import { BusinessError,Callback, RecordData } from '@ohos.base'
import { WebNetErrorList } from '@ohos.web.netErrorList';
import { State } from '@ohos.arkui.stateManagement' // should be insert by ui-plugins
import { buffer } from '@kit.ArkTS';
import { UIContext, Router } from '@ohos.arkui.UIContext'

class StringFields {
  public str: string = '';
}

@Entry
@Component
struct webViewController {
  stringObj: StringFields  = new StringFields ();
  schemeHandler: webview.WebSchemeHandler = new webview.WebSchemeHandler()
  controller: webview.WebviewController = new webview.WebviewController(undefined);
  @State test: boolean = true;
  @State javaScriptAccess: boolean = true;
  @State databaseAccess: boolean = true;
  @State testRead: number = -1;
  htmlData: string = '<html><body bgcolor=\"white\">Source:<pre>source</pre></body></html>';

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
        Button("click").key('WebViewControllerErrorCodeSecondButton').onClick((e: ClickEvent) => {
          console.info("key==>" +  this.stringObj.str)
          switch ( this.stringObj.str) {

            case 'testGetDefaultUserAgent001': {
              try {
                let isGetDefaultUserAgent = false;
                let userAgent = webview.WebviewController.getDefaultUserAgent();
                console.log('getDefaultUserAgent userAgent===>' + userAgent)
                if (userAgent.includes('Mozilla')) {
                  isGetDefaultUserAgent = true
                }
                Utils.emitEvent(isGetDefaultUserAgent, 202503209);
              } catch (error) {
                error = error as BusinessError;
                console.error(`testGetDefaultUserAgentError001 ErrorCode: ${error.code},  Message: ${error.message}`);
                Utils.emitEvent(String(error.code), 202503209);
              }
              break;
            }

            case 'emitWebView_WebHttpBodyStream_READ': {
              let URL1: string = 'https://'
              let URL2: string = 'www.example'
              let URL: string = URL1 + URL2
              this.controller.loadUrl("resource://rawfile/post_data.html")
              setTimeout(() => {
              try {
                let postData = buffer.from(this.htmlData);
                this.controller.postUrl(URL, postData.buffer);
                if (postData !== undefined) {
                  Utils.emitEvent(this.test, 1555);
                }
              } catch (error) {
                error = error as BusinessError;
                console.error(`postUrl ErrorCode: ${error .code},
                       postUrl Message: ${error.message}`);
              }
              }, 2000)
              break;
            }

            case 'SwitchNextPageStatic' : {
              let uiContext: UIContext = this.getUIContext();
              let router: Router = uiContext.getRouter();
              router.pushUrl({ url: 'pages/webResourceHandlerTest' })
              console.log('push URL success')
            }
          }
        })
      }

      Web({ src: 'resource://rawfile/index.html', controller: this.controller })
        .javaScriptAccess(this.javaScriptAccess)
        .zoomAccess(false)
        .databaseAccess(this.databaseAccess)
        .onControllerAttached(() => {
          try {
            this.schemeHandler.onRequestStart(
              (request: webview.WebSchemeHandlerRequest, resourceHandler: webview.WebResourceHandler) => {
                console.log('[schemeHandler] onRequestStart');

                try {
                  console.log(request.getRequestUrl())
                  console.log(request.getRequestMethod())
                  if (request.getRequestMethod() == 'OPTIONS') {
                    let response = new webview.WebSchemeHandlerResponse();
                    let buf = buffer.from(this.htmlData)
                    this.test = true;
                    response.setNetErrorCode(WebNetErrorList.NET_OK);
                    response.setStatus(200);
                    response.setStatusText('OK');
                    response.setMimeType('text/html');
                    response.setEncoding('utf-8');
                    response.setHeaderByName('Access-Control-Allow-Methods', 'POST, GET, OPTIONS', true);
                    response.setHeaderByName('Access-Control-Allow-Origin', '*' ,true)
                    response.setHeaderByName('Access-Control-Allow-Headers',
                      'Content-Type, Authorization,X-Requested', true)

                    resourceHandler.didReceiveResponse(response);
                    resourceHandler.didReceiveResponseBody(buf.buffer);
                    resourceHandler.didFinish();

                    return true;
                  }

                  let stream = request.getHttpBodyStream();

                  if (stream) {
                    stream.initialize().then(() => {
                      this.test = true;
                      console.log('[schemeHandler] onRequestStart :' + this.test);
                      console.log('[schemeHandler] onRequestStart postDataStream size:' + stream.getSize());
                      console.log('[schemeHandler] onRequestStart postDataStream position:' + stream.getPosition());
                      console.log('[schemeHandler] onRequestStart postDataStream isChunked:' + stream.isChunked());
                      console.log('[schemeHandler] onRequestStart postDataStream isEof:' + stream.isEof());
                      console.log('[schemeHandler] onRequestStart postDataStream isInMemory:' +
                      stream.isInMemory());
                      if (stream.getSize() !== 66) {
                        stream.read(66).then(buff => {
                          console.log('[schemeHandler] onRequestStart postDataStream read:' + buffer.byteLength);
                          this.testRead = 0
                          console.log('[schemeHandler] onRequestStart postDataStream readlength:' +
                          buffer.byteLength);
                          console.log('[schemeHandler] onRequestStart postDataStream isEof:' + stream.isEof());
                          console.log('[schemeHandler] onRequestStart postDataStream position:' +
                          stream.getPosition());
                        })
                    }
                    })
                  } else {
                    console.log('[schemeHandler] onRequestStart has no http body stream');
                  }
                } catch (error) {
                  error = error as BusinessError;
                  console.error(`ErrorCode: ${error .code}`);
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
