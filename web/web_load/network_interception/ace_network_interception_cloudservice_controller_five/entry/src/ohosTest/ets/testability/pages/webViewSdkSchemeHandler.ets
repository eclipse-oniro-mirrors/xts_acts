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
import { waitForExist } from '../../test/WaitTest.test'

@Entry
@Component
struct webViewSdkSchemeHandler {
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
  htmlData: string = '{"test":1}';
  @State isReceive: number = -1;
  @State isPageEnd: number = -1
  onPageShow() {
      let valueChangeEvent: events_emitter.InnerEvent = {
          eventId: 142301,
          priority: events_emitter.EventPriority.LOW
      }
      events_emitter.on(valueChangeEvent, this.valueChangeCallBack)
  }
  onPageHide() {
    events_emitter.off(142301)
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
            this.emitKey = eventData.data.ACTION
            this.isReceive = 0;
          }
      }
  }
  
  build() {
      Column() {
          Row() {
              Button('web click')
              .key('webViewSdkSchemeHandler')
              .onClick(async () => {
                await waitForExist(() => this.isReceive, this.emitKey, 0)
                this.isReceive = -1;
                this.controller.refresh()
                await waitForExist(() => this.isPageEnd, this.emitKey, 0)
                  console.info('key==>' + this.emitKey)
                  switch (this.emitKey) {
                    case 'emitWebViewSdkSchemeHandler_getHeader': {
                        if(this.requests.length>0 && this.requests[0].getHeader()){
                          Utils.emitEvent(true,142110)
                        }
                        break;
                    }
                    case 'emitWebViewSdkSchemeHandler_getRequestUrl': {
                      if(this.requests.length>0 && this.requests[0].getRequestUrl()){
                        Utils.emitEvent(true,142120)
                      }
                      break;
                    }
                    case 'emitWebViewSdkSchemeHandler_getRequestMethod': {
                      if(this.requests.length>0 && this.requests[0].getRequestMethod()){
                        Utils.emitEvent(true,142130)
                      }
                      break;
                    }
                    case 'emitWebViewSdkSchemeHandler_getReferrer': {
                      if(this.requests.length>0 && this.requests[0].getReferrer() !== undefined){
                        Utils.emitEvent(true,142140)
                      }
                      break;
                    }
                    case 'emitWebViewSdkSchemeHandler_isMainFrame': {
                      if(this.requests.length>0 && this.requests[0].isMainFrame() !== undefined){
                        Utils.emitEvent(true,142150)
                      }
                      break;
                    }

                    case 'emitWebViewSdkSchemeHandler_onRequestStart': {
                      if(this.requests.length>0){
                        Utils.emitEvent(true,142350)
                      }
                      break;
                    }

                    case 'emitWebViewSdkSchemeHandler_onRequestStop': {
                      if(this.requests.length>0){
                        Utils.emitEvent(true,142360)
                      }
                      break;
                    }
                    case 'emitWebViewSdkSchemeHandler_constructor': {
                      this.isPageEnd = -1;
                      this.controller.loadUrl($rawfile('sdkSchemeHandler.html'))
                      await waitForExist(() => this.isPageEnd, this.emitKey, 0)
                      if(this.requests.length>0){
                        Utils.emitEvent(true,142170)
                      }
                      break;
                    }
                    case 'emitWebViewSdkSchemeHandler_didFinish':
                    case 'emitWebViewSdkSchemeHandler_didReceiveResponse':
                    case 'testWebViewSdkSchemeHandler_didReceiveResponseBody': {
                      // await Utils.sleep(2000)
                      this.isPageEnd = -1;
                      this.controller.loadUrl($rawfile('chunked_post_stream.html'))
                      await waitForExist(() => this.isPageEnd, this.emitKey, 0)
                      break;
                    }
                  }
              })
          }
          Web({ src: $rawfile('sdkSchemeHandler.html'), controller: this.controller })
            .javaScriptAccess(this.javaScriptAccess)
            .fileAccess(this.fileAccess)
            .imageAccess(this.imageAccess)
            .domStorageAccess(this.domStorageAccess)
            .onlineImageAccess(this.onlineImageAccess)
            .databaseAccess(this.databaseAccess)
            .onPageEnd(()=>{
              this.isPageEnd = 0;
            })
            .onControllerAttached(() => {
              try {
                this.schemeHandler.onRequestStart(
                  (request: webview.WebSchemeHandlerRequest, resourceHandler: webview.WebResourceHandler) => {
                    console.log('[schemeHandler] onRequestStart')
                    this.requests.push(request)
                    Utils.emitEvent(true, 142350)
                    Utils.emitEvent(true, 142170)
                    if(request.getRequestUrl().toLowerCase().indexOf('custom') > -1 ||
                    request.getRequestUrl().indexOf('www.example.com') > -1) {
                      if(this.httpBodyStream == null || this.httpBodyStream == undefined) {
                        this.httpBodyStream = request.getHttpBodyStream()
                      }
                      let response = new webview.WebSchemeHandlerResponse();
                      response.setStatus(200)
                      response.setStatusText('text')
                      response.setHeaderByName('Access-Control-Allow-Origin', '*' ,true)
                      resourceHandler.didReceiveResponse(response);
                      Utils.emitEvent(true, 142310)
                      let buf = buffer.from(this.htmlData)
                      resourceHandler.didReceiveResponseBody(buf.buffer);
                      Utils.emitEvent(true, 142320)
                      resourceHandler.didFinish();
                      Utils.emitEvent(true, 142330)
                      return true
                    }
                    if(request.getHeader() !== undefined) {
                      Utils.emitEvent(true,142110)
                    }

                    if(request.getRequestUrl() !== '') {
                      Utils.emitEvent(true,142120)
                    }

                    if(request.getRequestMethod() !== '') {
                      Utils.emitEvent(true,142130)
                    }

                    if(request.getReferrer() !== undefined) {
                      Utils.emitEvent(true,142140)
                    }

                    if(request.isMainFrame() !== undefined) {
                      Utils.emitEvent(true,142150)
                    }

                    if(request.hasGesture() !== undefined) {
                      Utils.emitEvent(true,142160)
                    }


                    if(this.httpBodyStream !== undefined) {
                      this.existHttpBodyStream = this.httpBodyStream
                      Utils.emitEvent(true,142370)

                    }

                    if(this.httpBodyStream?.getSize() !== undefined) {
                      Utils.emitEvent(true,142380)
                    }

                    if(this.httpBodyStream?.getPosition() !== undefined) {
                      Utils.emitEvent(true,142390)
                    }

                    if(this.httpBodyStream?.isChunked() !== undefined) {
                      Utils.emitEvent(true,142400)
                    }

                    if(this.httpBodyStream?.isEof() !== undefined) {
                      Utils.emitEvent(true,142410)
                    }

                    if(this.httpBodyStream?.isInMemory() !== undefined) {
                      Utils.emitEvent(true,142420)
                    }

                    let response = new webview.WebSchemeHandlerResponse();
                    response.setUrl('https://www.example.com')
                    if(response.getUrl().indexOf('example')>-1){
                      Utils.emitEvent(true,142180)
                      Utils.emitEvent(true,142190)
                    }


                    response.setNetErrorCode(-2)
                    if(response.getNetErrorCode() == -2){
                      Utils.emitEvent(true,1516)
                      Utils.emitEvent(true,1517)
                    }

                    response.setStatus(200)
                    if(response.getStatus() == 200){
                      Utils.emitEvent(true,142200)
                      Utils.emitEvent(true,142210)
                    }

                    response.setStatusText('ok')
                    if(response.getStatusText() == 'ok'){
                      Utils.emitEvent(true,142220)
                      Utils.emitEvent(true,142230)
                    }

                    response.setMimeType('text/html')
                    if(response.getMimeType() == 'text/html'){
                      Utils.emitEvent(true,142240)
                      Utils.emitEvent(true,142250)
                    }

                    response.setEncoding('utf-8')
                    if(response.getEncoding() == 'utf-8'){
                      Utils.emitEvent(true,142260)
                      Utils.emitEvent(true,142270)
                    }
                    response.setHeaderByName('Access-Control-Allow-Origin', '*' , true)
                    if( response.getHeaderByName('Access-Control-Allow-Origin') === '*' ) {
                      Utils.emitEvent(true,142280)
                      Utils.emitEvent(true,142300)
                    }
                    response.setHeaderByName('Access-Control-Allow-Origin', 'none' , false)
                    if( response.getHeaderByName('Access-Control-Allow-Origin') === '*' ) {
                      Utils.emitEvent(true,142290)
                      Utils.emitEvent(true,142300)
                    }
                    let newResponse = new webview.WebSchemeHandlerResponse();
                    resourceHandler.didReceiveResponse(newResponse);
                    Utils.emitEvent(true, 142310)
                    let buf = buffer.from(this.htmlData)
                    resourceHandler.didReceiveResponseBody(buf.buffer);
                    Utils.emitEvent(true, 142320)
                    resourceHandler.didFail(WebNetErrorList.ERR_FAILED)
                    Utils.emitEvent(true, 142330)
                    Utils.emitEvent(true,142340)
                    try {
                      resourceHandler.didFinish();
                      Utils.emitEvent(true, 142330)
                    } catch (e) {
                      console.log('finish error')
                    }

                    return false;
                })



                this.schemeHandler.onRequestStop((request: webview.WebSchemeHandlerRequest) => {
                  console.log('[schemeHandler] onRequestStop')
                  Utils.emitEvent(true,142360)
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
