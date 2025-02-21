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
import business_error from '@ohos.base'
import buffer from '@ohos.buffer'
import { WebNetErrorList } from '@ohos.web.netErrorList'
@Entry
@Component
struct webViewSdkSchemeHandlerEnhanced {
  controller: webview.WebviewController = new webview.WebviewController();
  schemeHandler: webview.WebSchemeHandler = new webview.WebSchemeHandler()
  httpBodyStream: webview.WebHttpBodyStream|null = null
  existHttpBodyStream: webview.WebHttpBodyStream|null = null
  @State emitKey: string = '';
  @State javaScriptAccess: boolean = true;
  @State fileAccess: boolean = true;
  @State domStorageAccess: boolean = true;
  @State imageAccess: boolean = true;
  @State onlineImageAccess: boolean = true;
  @State databaseAccess: boolean = true;
  requests:webview.WebSchemeHandlerRequest[] = []
  scheme1: webview.WebCustomScheme = {
    schemeName: 'custom', isSupportCORS: true, isSupportFetch: true
  }
  htmlData: string = '{"returnStreamResult":1}';
  
  onPageShow() {
      let valueChangeEvent: events_emitter.InnerEvent = {
          eventId: 10,
          priority: events_emitter.EventPriority.LOW
      }
      events_emitter.on(valueChangeEvent, this.valueChangeCallBack)
  }

  aboutToAppear():void {
    try {
      webview.WebviewController.customizeSchemes([this.scheme1])
    } catch(error) {
      let e:business_error.BusinessError = error as business_error.BusinessError;
      console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
    }
  }
  
  private valueChangeCallBack = (eventData: events_emitter.EventData) => {
      if (eventData != null) {
          console.info('valueChangeCallBack:' + JSON.stringify(eventData));
          if (eventData.data != null && eventData.data.ACTION != null) {
              this.emitKey = eventData.data.ACTION;
          }
      }
  }
  
  build() {
      Column() {
          Row() {
              Button('web click')
              .key('webViewSdkSchemeHandlerEnhanced')
              .onClick(async () => {
                  console.info('key==>' + this.emitKey)
                  this.controller.loadUrl($rawfile('chunked_post_stream.html'))
                  await Utils.sleep(2000)
                  this.controller.runJavaScript('test(\'https://www.example.com/xhr\')', (error, result) => {
                  })
                  await Utils.sleep(1000)
                  switch (this.emitKey) {
                    case 'emitWebViewSdkSchemeHandler_isChunked_false': {
                      let isExistChunked = ( this.existHttpBodyStream?.isChunked() !== undefined )
                      if(this.httpBodyStream?.isChunked() === false || isExistChunked){
                        Utils.emitEvent(true,1536)
                      }
                      break;
                    }

                    case 'emitWebViewSdkSchemeHandler_isEof_false': {
                      let isExistEof =  ( this.existHttpBodyStream?.isEof() !== undefined )
                      if(this.httpBodyStream?.isEof() === false || isExistEof){
                        Utils.emitEvent(true,1537)
                      }
                      break;
                    }

                    case 'emitWebViewSdkSchemeHandler_isInMemory_false': {
                      let isInMemory =  ( this.existHttpBodyStream?.isInMemory() !== undefined )
                      if(this.httpBodyStream?.isInMemory() === false || isInMemory){
                        Utils.emitEvent(true,1538)
                      }
                      break;
                    }
                    case 'emitWebViewSdkSchemeHandler_isMainFrame_false': {
                      await Utils.sleep(2000)
                      if(this.requests.length>0 && this.requests[0].isMainFrame() === false){
                        Utils.emitEvent(true,1541)
                      }
                      break;
                    }

                    case 'emitWebViewSdkSchemeHandler_setUrl_null': {
                      let response: webview.WebSchemeHandlerResponse = new webview.WebSchemeHandlerResponse();
                      try {
                        response.setUrl(null);
                        let errorCode:number = response.getNetErrorCode();
                      } catch (error) {
                        let e:business_error.BusinessError = error as business_error.BusinessError;
                        if( e.code.toString() === '401') {
                          Utils.emitEvent(true,1539)
                        }
                        console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                      }
                      break;
                    }
                  }
              })
          }
          Web({ src: '', controller: this.controller })
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
                    console.log('[schemeHandler] onRequestStart')
                    this.requests.push(request)
                    if(request.isMainFrame().toString() === 'false') {
                      Utils.emitEvent(true,1541)
                    }
                    console.log('request.getRequestUrl() start')
                    console.log('request.getRequestUrl() url' + request.getRequestUrl() )
                    if(request.getRequestUrl().toLowerCase().indexOf('custom') > -1 ||
                    request.getRequestUrl().indexOf('www.example.com') > -1) {
                      console.log('request.getRequestUrl()'+request.getRequestUrl())
                      if(this.httpBodyStream == null || this.httpBodyStream == undefined) {
                        this.httpBodyStream = request.getHttpBodyStream()
                        console.log('this.httpBodyStream:' + this.httpBodyStream)
                        if(this.httpBodyStream !== undefined) {
                          this.existHttpBodyStream = this.httpBodyStream
                        }
                      }
                      console.log('this.httpBodyStream:' + this.httpBodyStream)
                      let response = new webview.WebSchemeHandlerResponse();
                      response.setStatus(200)
                      response.setStatusText('text')
                      response.setHeaderByName('Access-Control-Allow-Origin', '*' ,true)

                      if(this.httpBodyStream?.isChunked().toString() == 'false') {
                        Utils.emitEvent(true,1536)
                      }
                      if(this.httpBodyStream?.isEof().toString() == 'false') {
                        Utils.emitEvent(true,1537)
                      }

                      if(this.httpBodyStream?.isInMemory().toString() == 'false') {
                        Utils.emitEvent(true,1538)
                      }




                      resourceHandler.didReceiveResponse(response);
                      let buf = buffer.from(this.htmlData)
                      resourceHandler.didReceiveResponseBody(buf.buffer);
                      resourceHandler.didFinish();
                      return true
                    }


                    return false;
                })



                this.schemeHandler.onRequestStop((request: webview.WebSchemeHandlerRequest) => {
                  console.log('[schemeHandler] onRequestStop')
                });

                this.controller.setWebSchemeHandler('https', this.schemeHandler);
                this.controller.setWebSchemeHandler('http', this.schemeHandler);
                this.controller.setWebSchemeHandler('resource', this.schemeHandler);
                this.controller.setWebSchemeHandler('custom', this.schemeHandler);
              } catch (error) {
                let e: business_error.BusinessError = error as business_error.BusinessError;
                console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
              }
            })
      }
  }
}
