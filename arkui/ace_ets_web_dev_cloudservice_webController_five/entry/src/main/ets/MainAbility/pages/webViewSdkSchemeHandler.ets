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
              .key('webViewSdkSchemeHandler')
              .onClick(async () => {
                  this.controller.refresh()
                  await Utils.sleep(2000)
                  console.info('key==>' + this.emitKey)
                  switch (this.emitKey) {
                    case 'emitWebViewSdkSchemeHandler_getHeader': {
                        await Utils.sleep(2000)
                        if(this.requests.length>0 && this.requests[0].getHeader()){
                          Utils.emitEvent(true,1501)
                        }
                        break;
                    }
                    case 'emitWebViewSdkSchemeHandler_getRequestUrl': {
                      await Utils.sleep(2000)
                      if(this.requests.length>0 && this.requests[0].getRequestUrl()){
                        Utils.emitEvent(true,1502)
                      }
                      break;
                    }
                    case 'emitWebViewSdkSchemeHandler_getRequestMethod': {
                      await Utils.sleep(2000)
                      if(this.requests.length>0 && this.requests[0].getRequestMethod()){
                        Utils.emitEvent(true,1503)
                      }
                      break;
                    }
                    case 'emitWebViewSdkSchemeHandler_getReferrer': {
                      await Utils.sleep(2000)
                      if(this.requests.length>0 && this.requests[0].getReferrer() !== undefined){
                        Utils.emitEvent(true,1504)
                      }
                      break;
                    }
                    case 'emitWebViewSdkSchemeHandler_isMainFrame': {
                      await Utils.sleep(2000)
                      if(this.requests.length>0 && this.requests[0].isMainFrame() !== undefined){
                        Utils.emitEvent(true,1505)
                      }
                      break;
                    }

                    case 'emitWebViewSdkSchemeHandler_onRequestStart': {
                      await Utils.sleep(2000)
                      if(this.requests.length>0){
                        Utils.emitEvent(true,1533)
                      }
                      break;
                    }

                    case 'emitWebViewSdkSchemeHandler_onRequestStop': {
                      await Utils.sleep(2000)
                      if(this.requests.length>0){
                        Utils.emitEvent(true,1534)
                      }
                      break;
                    }
                    case 'emitWebViewSdkSchemeHandler_constructor': {
                      await Utils.sleep(2000)
                      this.controller.loadUrl($rawfile('sdkSchemeHandler.html'))
                      await Utils.sleep(2000)
                      if(this.requests.length>0){
                        Utils.emitEvent(true,1513)
                      }
                      break;
                    }
                    case 'emitWebViewSdkSchemeHandler_didFinish':
                    case 'emitWebViewSdkSchemeHandler_didReceiveResponse':
                    case 'testWebViewSdkSchemeHandler_didReceiveResponseBody': {
                      await Utils.sleep(2000)
                      this.controller.loadUrl($rawfile('chunked_post_stream.html'))
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
            .onControllerAttached(() => {
              try {
                this.schemeHandler.onRequestStart(
                  (request: webview.WebSchemeHandlerRequest, resourceHandler: webview.WebResourceHandler) => {
                    console.log('[schemeHandler] onRequestStart')
                    this.requests.push(request)
                    Utils.emitEvent(true, 1533)
                    Utils.emitEvent(true, 1513)
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
                      Utils.emitEvent(true, 1529)
                      let buf = buffer.from(this.htmlData)
                      resourceHandler.didReceiveResponseBody(buf.buffer);
                      Utils.emitEvent(true, 1530)
                      resourceHandler.didFinish();
                      Utils.emitEvent(true, 1531)
                      return true
                    }
                    if(request.getHeader() !== undefined) {
                      Utils.emitEvent(true,1501)
                    }

                    if(request.getRequestUrl() !== '') {
                      Utils.emitEvent(true,1502)
                    }

                    if(request.getRequestMethod() !== '') {
                      Utils.emitEvent(true,1503)
                    }

                    if(request.getReferrer() !== undefined) {
                      Utils.emitEvent(true,1504)
                    }

                    if(request.isMainFrame() !== undefined) {
                      Utils.emitEvent(true,1505)
                    }

                    if(request.hasGesture() !== undefined) {
                      Utils.emitEvent(true,1506)
                    }


                    if(this.httpBodyStream !== undefined) {
                      this.existHttpBodyStream = this.httpBodyStream
                      Utils.emitEvent(true,1507)

                    }

                    if(this.httpBodyStream?.getSize() !== undefined) {
                      Utils.emitEvent(true,1508)
                    }

                    if(this.httpBodyStream?.getPosition() !== undefined) {
                      Utils.emitEvent(true,1509)
                    }

                    if(this.httpBodyStream?.isChunked() !== undefined) {
                      Utils.emitEvent(true,1510)
                    }

                    if(this.httpBodyStream?.isEof() !== undefined) {
                      Utils.emitEvent(true,1511)
                    }

                    if(this.httpBodyStream?.isInMemory() !== undefined) {
                      Utils.emitEvent(true,1512)
                    }

                    let response = new webview.WebSchemeHandlerResponse();
                    response.setUrl('https://www.weibo.com')
                    if(response.getUrl().indexOf('weibo')>-1){
                      Utils.emitEvent(true,1514)
                      Utils.emitEvent(true,1515)
                    }


                    response.setNetErrorCode(-2)
                    if(response.getNetErrorCode() == -2){
                      Utils.emitEvent(true,1516)
                      Utils.emitEvent(true,1517)
                    }

                    response.setStatus(200)
                    if(response.getStatus() == 200){
                      Utils.emitEvent(true,1518)
                      Utils.emitEvent(true,1519)
                    }

                    response.setStatusText('ok')
                    if(response.getStatusText() == 'ok'){
                      Utils.emitEvent(true,1520)
                      Utils.emitEvent(true,1521)
                    }

                    response.setMimeType('text/html')
                    if(response.getMimeType() == 'text/html'){
                      Utils.emitEvent(true,1522)
                      Utils.emitEvent(true,1523)
                    }

                    response.setEncoding('utf-8')
                    if(response.getEncoding() == 'utf-8'){
                      Utils.emitEvent(true,1524)
                      Utils.emitEvent(true,1525)
                    }
                    response.setHeaderByName('Access-Control-Allow-Origin', '*' , true)
                    if( response.getHeaderByName('Access-Control-Allow-Origin') === '*' ) {
                      Utils.emitEvent(true,1526)
                      Utils.emitEvent(true,1528)
                    }
                    response.setHeaderByName('Access-Control-Allow-Origin', 'none' , false)
                    if( response.getHeaderByName('Access-Control-Allow-Origin') === '*' ) {
                      Utils.emitEvent(true,1527)
                      Utils.emitEvent(true,1528)
                    }
                    let newResponse = new webview.WebSchemeHandlerResponse();
                    resourceHandler.didReceiveResponse(newResponse);
                    Utils.emitEvent(true, 1529)
                    let buf = buffer.from(this.htmlData)
                    resourceHandler.didReceiveResponseBody(buf.buffer);
                    Utils.emitEvent(true, 1530)
                    resourceHandler.didFail(WebNetErrorList.ERR_FAILED)
                    Utils.emitEvent(true, 1531)
                    Utils.emitEvent(true,1532)
                    try {
                      resourceHandler.didFinish();
                      Utils.emitEvent(true, 1531)
                    } catch (e) {
                      console.log('finish error')
                    }

                    return false;
                })



                this.schemeHandler.onRequestStop((request: webview.WebSchemeHandlerRequest) => {
                  console.log('[schemeHandler] onRequestStop')
                  Utils.emitEvent(true,1534)
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
