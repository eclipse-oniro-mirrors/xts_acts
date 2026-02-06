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
import { URL_EXAMPLE, URL_BAIDU } from '../../test/Config.test'
import business_error from '@ohos.base'
import buffer from '@ohos.buffer'
import {waitForAssert} from '../../test/WaitTest.test'

const EVENT_ID_SET_EMIT_KEY = 127;

@Entry
@Component
struct webViewSdkSchemeHandlerEnhancedThree {
  controller: webview.WebviewController = new webview.WebviewController();
  schemeHandler: webview.WebSchemeHandler = new webview.WebSchemeHandler()
  httpBodyStream: webview.WebHttpBodyStream|null = null
  existHttpBodyStream: webview.WebHttpBodyStream|null = null
  @State emitKey: string = '';
  @State isReceive: number = -1;
  @State isPageEnd: number = -1;
  @State isMainFrame: boolean = false;
  requests:webview.WebSchemeHandlerRequest[] = []
  htmlData: string = '<html><body bgcolor=\"white\">Source:<pre>source</pre></body></html>';
  
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
        Button('web click')
          .key('webViewSdkSchemeHandlerThreeButton')
          .onClick(async () => {
            await Utils.waitForExist(()=>this.isReceive, this.emitKey, 1, 1000);
            console.info('key==>' + this.emitKey);
            this.isReceive = -1;
            switch (this.emitKey) {
              case 'emitWebViewSdkSchemeHandler_isChunked_true': {
                this.controller.loadUrl('resource://rawfile/chunked_post_stream_two.html');
                await Utils.waitForExist(()=>this.isPageEnd, this.emitKey, 1, 1000);
                this.controller.runJavaScript('test()', (error, result) => {
                  if (error) {
                    console.log('runJavaScript error==>' + JSON.stringify(error));
                  }
                  if (result) {
                    console.log('runJavaScript result==>' + result);
                  }
                })
                let check = (v1: boolean|undefined, v2: boolean|undefined): boolean => {
                  return v1 === v2 ? true: false;
                }
                await waitForAssert(()=>this.httpBodyStream?.isChunked(), check, true, 2025102108, this.emitKey);
                break;
              }

              case 'emitWebViewSdkSchemeHandler_isEof_true': {
                let postData = buffer.from(this.htmlData);
                this.controller.postUrl(URL_BAIDU, postData.buffer);
                let check = (v1: boolean|undefined, v2: boolean|undefined): boolean => {
                  return v1 === v2 ? true: false;
                }
                await waitForAssert(()=>this.httpBodyStream?.isEof(), check, true, 2025102109, this.emitKey);
                break;
              }
              case 'emitWebViewSdkSchemeHandler_isMainFrame_true': {
                this.isPageEnd = -1;
                this.isMainFrame = false;
                this.controller.loadUrl('resource://rawfile/index.html');
                await Utils.waitForExist(()=>this.isPageEnd, this.emitKey, 1, 1000);
                let check = (v1: boolean, v2: boolean): boolean => {
                  return v1 === v2 ? true: false;
                }
                await waitForAssert(()=>this.isMainFrame, check, true, 2025102110, this.emitKey);
                break;
              }
            }
          })
      }
      Web({ src: '', controller: this.controller })
        .onControllerAttached(() => {
          try {
            this.schemeHandler.onRequestStart(
              (request: webview.WebSchemeHandlerRequest, resourceHandler: webview.WebResourceHandler) => {
                console.log('[schemeHandler] onRequestStart')
                console.log('onRequestStart request.getRequestUrl() url==>' + request.getRequestUrl() );
                console.log('onRequestStart request.isMainFrame():' + request.isMainFrame() );
                this.isMainFrame = request.isMainFrame();
                this.httpBodyStream = request.getHttpBodyStream();
                console.log('this.httpBodyStream:' + this.httpBodyStream);
                console.log('this.httpBodyStream isChunked:' + this.httpBodyStream?.isChunked());
                console.log('this.httpBodyStream isEof:' + this.httpBodyStream?.isEof());
                let stream = request.getHttpBodyStream();
                if (stream) {
                  stream.initialize().then(() => {
                    if (!stream) {
                      return;
                    }
                    stream.read(stream.getSize()).then((buffer) => {
                      if (!stream) {
                        return;
                      }
                      console.log('[schemeHandler] onRequestStart postDataStream isEof:' + stream.isEof());
                      console.log('[schemeHandler] onRequestStart postDataStream isChunked:' + stream.isChunked());
                    }).catch((error: business_error.BusinessError) => {
                      console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                    })
                  }).catch((error: business_error.BusinessError) => {
                    console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                  })
                } else {
                  console.info('[schemeHandler] onRequestStart has no http body stream');
                }
                if(request.getRequestUrl().indexOf('www.example.com') > -1) {
                  let response = new webview.WebSchemeHandlerResponse();
                  response.setStatus(200)
                  response.setStatusText('text')
                  response.setHeaderByName('Access-Control-Allow-Origin', '*' ,true)
                  resourceHandler.didReceiveResponse(response);
                  return true
                }
                return false;
              })
            this.schemeHandler.onRequestStop((request: webview.WebSchemeHandlerRequest) => {
              console.log('[schemeHandler] onRequestStop')
            });
            this.controller.setWebSchemeHandler('https', this.schemeHandler);
            this.controller.setWebSchemeHandler('resource', this.schemeHandler);
          } catch (error) {
            let e: business_error.BusinessError = error as business_error.BusinessError;
            console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
          }
        })
        .onPageBegin((event) => {
          console.log('onPageBegin ==>' + event.url);
        })
        .onPageEnd((event) => {
          console.log('onPageEnd ==>' + event.url);
          this.isPageEnd = 1
        })
      }
  }
}