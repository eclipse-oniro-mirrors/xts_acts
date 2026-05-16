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
import { waitForExist } from '../../test/WaitTest'

@Entry
@Component
struct webViewSdkTestFrameUrl {
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
  @State isMainFrameUrl: boolean = false;
  @State isLoadUrlFrameUrl: boolean = false;
  @State isSubFrameUrl: boolean = false;
  @State isEnd:number = -1;
  @State isReceive:number= -1;
  onPageShow() {
      let valueChangeEvent: events_emitter.InnerEvent = {
          eventId: 142011,
          priority: events_emitter.EventPriority.LOW
      }
      events_emitter.on(valueChangeEvent, this.valueChangeCallBack)
  }
  onPageHide() {
    events_emitter.off(142011)
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
          Row() {
              Button('web click')
              .key('webViewSdkTestFrameUrl')
              .onClick(async () => {
                await waitForExist(() => this.isReceive, this.emitKey, 0)
                this.isReceive = -1;
                  console.info('key==>' + this.emitKey)
                  switch (this.emitKey) {
                    case 'emitWebViewSdkTestMainFrameUrl': {
                      this.isMainFrameUrl = false
                      this.controller.refresh()
                      await waitForExist(() => this.isEnd, this.emitKey, 0)
                      if (this.isMainFrameUrl) {
                        Utils.emitEvent(true, 142020)
                      }
                      break;
                    }
                    case 'emitWebViewSdkTestServiceWorkerFrameUrl': {
                      this.isEnd = -1;
                      this.controller.loadUrl('www.example.com')
                      await waitForExist(() => this.isEnd, this.emitKey, 0)
                      let requestLength = this.requests.length
                      for(let i=0; i < requestLength; i++){
                        let request: webview.WebSchemeHandlerRequest =  this.requests[i]
                        if(request.getRequestResourceType() === webview.WebResourceType.SERVICE_WORKER || request.getRequestUrl().toLowerCase().indexOf('iqiyi.com')>-1){
                          if(request.getFrameUrl() === ''){
                            Utils.emitEvent(true, 142050)
                          }
                        }
                      }
                      break;
                    }
                    case 'emitWebViewSdkTestLoadUrlFrameUrl': {
                      this.isLoadUrlFrameUrl = false
                      this.isEnd = -1;
                      this.controller.loadUrl($rawfile('schemeHandler_loader.html'))
                      await waitForExist(() => this.isEnd, this.emitKey, 0)
                      if (this.isLoadUrlFrameUrl) {
                        Utils.emitEvent(true, 142030)
                      }
                      break;
                    }
                    case 'emitWebViewSdkTestSubFrameUrl': {
                      this.isSubFrameUrl = false
                      this.isEnd = -1;
                      this.controller.loadUrl($rawfile('sdkSchemeHandler.html'))
                      await waitForExist(() => this.isEnd, this.emitKey, 0)
                      if (this.isSubFrameUrl) {
                        Utils.emitEvent(true, 142040)
                      }
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
              this.isEnd = 0
              try {
                this.schemeHandler.onRequestStart(
                  (request: webview.WebSchemeHandlerRequest, resourceHandler: webview.WebResourceHandler) => {
                  console.log('[schemeHandler] onRequestStart')
                  this.requests.push(request)
                  if(request.getRequestUrl().indexOf('sdkSchemeHandler') > -1){
                    if(request.getFrameUrl() === ''){
                      this.isMainFrameUrl = true
                      Utils.emitEvent(true, 142020)
                      Utils.emitEvent(true, 142040)
                    }
                  }
                  if(request.getRequestResourceType() === webview.WebResourceType.MAIN_FRAME){
                    if(request.getFrameUrl() === ''){
                      this.isMainFrameUrl = true
                      Utils.emitEvent(true, 142020)
                    }
                  }
                  if(request.getRequestResourceType() === webview.WebResourceType.SERVICE_WORKER || request.getRequestUrl().toLowerCase().indexOf('example.com')>-1){
                    if(request.getFrameUrl() === ''){
                      Utils.emitEvent(true, 142050)
                    }
                  }
                  if(request.getRequestUrl().indexOf('schemeHandler_loader') > -1){
                    console.log('schemeHandler_loader')
                    if(request.getFrameUrl() === ''){
                      this.isLoadUrlFrameUrl = true
                      Utils.emitEvent(true, 142030)
                    }
                  }

                  if(request.getFrameUrl().indexOf('sdkSchemeHandler') > -1) {
                    console.log('sdkSchemeHandler')
                    this.isSubFrameUrl = true
                    Utils.emitEvent(true, 142040)
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
      }
  }
}
