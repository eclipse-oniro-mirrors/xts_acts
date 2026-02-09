/**
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
import events_emitter from '@ohos.events.emitter'
import webview from '@ohos.web.webview'
import Utils from '../../test/Utils'
import business_error, { BusinessError } from '@ohos.base'
import { buffer } from '@kit.ArkTS';
import { WebNetErrorList } from '@kit.ArkWeb';
import { URL } from '../../test/Config';

const EVENT_ID_SET_EMIT_KEY = 114610;

@Entry
@Component
struct webHttpBodyStreamTest {
  controller: webview.WebviewController = new webview.WebviewController();
  schemeHandler: webview.WebSchemeHandler = new webview.WebSchemeHandler()
  httpBodyStream: webview.WebHttpBodyStream|null = null
  @State emitKey: string = '';
  @State javaScriptAccess: boolean = true;
  @State fileAccess: boolean = true;
  @State domStorageAccess: boolean = true;
  @State imageAccess: boolean = true;
  @State onlineImageAccess: boolean = true;
  @State databaseAccess: boolean = true;
  requests: webview.WebSchemeHandlerRequest[] = []

  htmlData: string = '<html><body bgcolor=\"white\">Source:<pre>source</pre></body></html>';
  @State isPageEnd: number = -1;
  @State isReceive: number = -1;
  @State testBodyStreamError: number = -1;

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
      if (eventData != null) {
          console.info('valueChangeCallBack:' + JSON.stringify(eventData));
          if (eventData.data != null && eventData.data.ACTION != null) {
              this.emitKey = eventData.data.ACTION;
              this.isReceive = 1;
          }
      }
  }
  
  build() {
      Column() {
          Row() {
            Button('web click').key('webView').onClick(async () => {
              await Utils.waitForExist(()=>this.isPageEnd, 'webViewIsPageEnd', 1, 1000);
              await Utils.waitForExist(()=>this.isReceive, 'webViewIsReceive', 1, 1000);
              console.info('key==>' + this.emitKey)
              this.isReceive = -1;
              switch (this.emitKey) {
                case 'emitWebView_WebHttpBodyStream_READ': {
                  try {
                    let postData = buffer.from(this.htmlData);
                    this.controller.postUrl(URL, postData.buffer);
                  } catch (error) {
                    console.error(`postUrl ErrorCode: ${(error as BusinessError).code},
                       postUrl Message: ${(error as BusinessError).message}`);
                  }
                  break;
                }
              }
            })
          }
          Web({ src: $rawfile('post_data.html'), controller: this.controller })
            .javaScriptAccess(this.javaScriptAccess)
            .fileAccess(this.fileAccess)
            .imageAccess(this.imageAccess)
            .domStorageAccess(this.domStorageAccess)
            .onlineImageAccess(this.onlineImageAccess)
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
                          if (!stream) {
                            return;
                          }
                          console.log('[schemeHandler] onRequestStart postDataStream size:' + stream.getSize());
                          console.log('[schemeHandler] onRequestStart postDataStream position:' + stream.getPosition());
                          console.log('[schemeHandler] onRequestStart postDataStream isChunked:' + stream.isChunked());
                          console.log('[schemeHandler] onRequestStart postDataStream isEof:' + stream.isEof());
                          console.log('[schemeHandler] onRequestStart postDataStream isInMemory:' + 
                          stream.isInMemory());
                          stream.read(stream.getSize()).then((buffer) => {
                            console.log('[schemeHandler] onRequestStart postDataStream read:' + buffer.byteLength);
                            if (!stream) {
                              return;
                            }
                            console.log('[schemeHandler] onRequestStart postDataStream readlength:' + 
                            buffer.byteLength);
                            console.log('[schemeHandler] onRequestStart postDataStream isEof:' + stream.isEof());
                            console.log('[schemeHandler] onRequestStart postDataStream position:' + 
                            stream.getPosition());
                            if (this.emitKey === 'emitWebView_WebHttpBodyStream_READ') {
                              Utils.emitEvent(0, 114620);
                            }
                          }).catch((error: BusinessError) => {
                            console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                          })
                        }).catch((error: BusinessError) => {
                          console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                        })
                      } else {
                        console.log('[schemeHandler] onRequestStart has no http body stream');
                      }
                    } catch (error) {
                      console.error(`ErrorCode: ${(error as BusinessError).code}`);
                      this.testBodyStreamError = (error as BusinessError).code;
                    }

                    return false;

                })

                this.controller.setWebSchemeHandler('https', this.schemeHandler);
                this.controller.setWebSchemeHandler('http', this.schemeHandler);
                this.controller.setWebSchemeHandler('resource', this.schemeHandler);
                webview.WebviewController.setServiceWorkerWebSchemeHandler('https', this.schemeHandler)
              } catch (error) {
                let e: business_error.BusinessError = error as business_error.BusinessError;
                console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
              }
            })
            .onPageEnd((event) => {
              console.log('onPageEnd url:' + event.url);
              this.isPageEnd = 1;
            })
      }
  }
}
