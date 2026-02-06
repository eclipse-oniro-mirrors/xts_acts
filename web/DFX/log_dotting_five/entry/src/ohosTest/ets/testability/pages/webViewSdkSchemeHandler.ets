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
import {waitForExist} from '../../test/WaitTest';
@Entry
@Component
struct webViewSdkSchemeHandler {
  controller: webview.WebviewController = new webview.WebviewController();
  schemeHandler: webview.WebSchemeHandler = new webview.WebSchemeHandler()
  httpBodyStream: webview.WebHttpBodyStream|null = null
  existHttpBodyStream: webview.WebHttpBodyStream|null = null
  @State emitKey: string = 'emitWebViewSdkSchemeHandler_setNetErrorCode';
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
  @State isPageEnd: number = -1;
  
  onPageShow() {
      let valueChangeEvent: events_emitter.InnerEvent = {
          eventId: 120030,
          priority: events_emitter.EventPriority.LOW
      }
      events_emitter.on(valueChangeEvent, this.valueChangeCallBack)
  }

  onPageHide() {
    events_emitter.off(120030)
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
            this.isReceive = 0;
          }
      }
  }
  
  build() {
      Column() {
          Button('web click').key('webViewSdkSchemeHandler').onClick(async () => {
            await waitForExist(()=>this.isReceive, 'webViewSdkSchemeHandlerIsReceive', 0);
            await waitForExist(()=>this.isPageEnd, 'webViewSdkSchemeHandlerIsPageEnd', 0);
            console.info('key==>' + this.emitKey);
            this.isReceive = -1;
           switch (this.emitKey) {
              case 'emitWebViewSdkSchemeHandler_setNetErrorCode': {
                this.controller.loadUrl('https://www.baidu.com');
                break;
              }
              case 'emitWebViewSdkSchemeHandler_getNetErrorCode': {
                this.controller.loadUrl('https://www.baidu.com');
                break;
              }
           }
          })
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
                      let buf = buffer.from(this.htmlData)
                      resourceHandler.didReceiveResponseBody(buf.buffer);
                      resourceHandler.didFinish();
                      return true
                    }

                    let response = new webview.WebSchemeHandlerResponse();
                    response.setUrl('https://www.weibo.com');

                    response.setNetErrorCode(-2)
                    if(response.getNetErrorCode() == -2){
                      Utils.emitEvent(true,120040)
                      Utils.emitEvent(true,120050)
                    }
                    return false;
                })



                this.schemeHandler.onRequestStop((request: webview.WebSchemeHandlerRequest) => {
                  console.log('[schemeHandler] onRequestStop');
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
            .onPageEnd(()=>{
              this.isPageEnd = 0;
            })
      }
  }
}
