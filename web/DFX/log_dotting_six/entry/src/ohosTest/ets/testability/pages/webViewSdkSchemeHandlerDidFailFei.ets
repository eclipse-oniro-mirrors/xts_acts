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
import {waitForExist} from '../../test/WaitTest';
@Entry
@Component
struct webViewSdkSchemeHandler {
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
  @State isReceive: number = -1;
  @State isPageEnd: number = -1;
  requests:webview.WebSchemeHandlerRequest[] = []
  scheme1: webview.WebCustomScheme = {
    schemeName: 'custom', isSupportCORS: true, isSupportFetch: true
  }
  htmlData: string = '{"test":1}';

  
  onPageShow() {
      let valueChangeEvent: events_emitter.InnerEvent = {
          eventId: 121190,
          priority: events_emitter.EventPriority.LOW
      }
      events_emitter.on(valueChangeEvent, this.valueChangeCallBack)
  }

  onPageHide() {
    events_emitter.off(121190)
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
          Row() {
              Button('webViewSdkSchemeHandlerDidFailFlyButton')
              .key('webViewSdkSchemeHandlerDidFailFlyButton')
              .onClick(async () => {
                await waitForExist(()=>this.isReceive, 'webViewSdkSchemeHandlerDidFailFlyButtonIsReceive', 0);
                console.info('key==>' + this.emitKey);
                this.isReceive = -1;
                switch (this.emitKey) {
                  case 'emitWebViewSdkSchemeHandlerDidFailNegative0': {
                    this.isPageEnd = -1;
                    this.controller.loadUrl($rawfile('sdkSchemeHandler.html'))
                    await waitForExist(()=>this.isPageEnd, 'emitWebViewSdkSchemeHandlerDidFailNegative0 IsPageEnd', 0);
                    break;
                  }
                  case 'emitWebViewSdkSchemeHandlerDidFailNegative1': {
                    this.isPageEnd = -1;
                    this.controller.loadUrl($rawfile('sdkSchemeHandler.html'))
                    await waitForExist(()=>this.isPageEnd, 'emitWebViewSdkSchemeHandlerDidFailNegative1 IsPageEnd', 0);
                    break;
                  }
                  case 'emitWebViewSdkSchemeHandlerDidFailNegative2': {
                    this.isPageEnd = -1;
                    this.controller.loadUrl($rawfile('sdkSchemeHandler.html'))
                    await waitForExist(()=>this.isPageEnd, 'emitWebViewSdkSchemeHandlerDidFailNegative2 IsPageEnd', 0);
                    break;
                  }
                  case 'emitWebViewSdkSchemeHandlerDidFailNegative3': {
                    this.isPageEnd = -1;
                    this.controller.loadUrl($rawfile('sdkSchemeHandler.html'))
                    await waitForExist(()=>this.isPageEnd, 'emitWebViewSdkSchemeHandlerDidFailNegative3 IsPageEnd', 0);
                    break;
                  }
                  case 'emitWebViewSdkSchemeHandlerDidFailNegative4': {
                    this.isPageEnd = -1;
                    this.controller.loadUrl($rawfile('sdkSchemeHandler.html'))
                    await waitForExist(()=>this.isPageEnd, 'emitWebViewSdkSchemeHandlerDidFailNegative4 IsPageEnd', 0);
                    break;
                  }
                  case 'emitWebViewSdkSchemeHandlerDidFailNegative5': {
                    this.isPageEnd = -1;
                    this.controller.loadUrl($rawfile('sdkSchemeHandler.html'))
                    await waitForExist(()=>this.isPageEnd, 'emitWebViewSdkSchemeHandlerDidFailNegative5 IsPageEnd', 0);
                    break;
                  }
                  case 'emitWebViewSdkSchemeHandlerDidFailNegative6': {
                    this.isPageEnd = -1;
                    this.controller.loadUrl($rawfile('sdkSchemeHandler.html'))
                    await waitForExist(()=>this.isPageEnd, 'emitWebViewSdkSchemeHandlerDidFailNegative6 IsPageEnd', 0);
                    break;
                  }
                  case 'emitWebViewSdkSchemeHandlerDidFailNegative7': {
                    this.isPageEnd = -1;
                    this.controller.loadUrl($rawfile('sdkSchemeHandler.html'))
                    await waitForExist(()=>this.isPageEnd, 'emitWebViewSdkSchemeHandlerDidFailNegative7 IsPageEnd', 0);
                    break;
                  }
                  case 'emitWebViewSdkSchemeHandlerDidFailNegative8': {
                    this.isPageEnd = -1;
                    this.controller.loadUrl($rawfile('sdkSchemeHandler.html'))
                    await waitForExist(()=>this.isPageEnd, 'emitWebViewSdkSchemeHandlerDidFailNegative8 IsPageEnd', 0);
                    break;
                  }
                  case 'emitWebViewSdkSchemeHandlerDidFailNegative9': {
                    this.isPageEnd = -1;
                    this.controller.loadUrl($rawfile('sdkSchemeHandler.html'))
                    await waitForExist(()=>this.isPageEnd, 'emitWebViewSdkSchemeHandlerDidFailNegative9 IsPageEnd', 0);
                    break;
                  }
                  case 'emitWebViewSdkSchemeHandlerDidFailNegative10': {
                    this.isPageEnd = -1;
                    this.controller.loadUrl($rawfile('sdkSchemeHandler.html'))
                    await waitForExist(()=>this.isPageEnd, 'emitWebViewSdkSchemeHandlerDidFailNegative10 IsPageEnd', 0);
                    break;
                  }
                  case 'emitWebViewSdkSchemeHandlerDidFailNegative11': {
                    this.isPageEnd = -1;
                    this.controller.loadUrl($rawfile('sdkSchemeHandler.html'))
                    await waitForExist(()=>this.isPageEnd, 'emitWebViewSdkSchemeHandlerDidFailNegative11 IsPageEnd', 0);
                    break;
                  }
                  case 'emitWebViewSdkSchemeHandlerDidFailNegative12': {
                    this.isPageEnd = -1;
                    this.controller.loadUrl($rawfile('sdkSchemeHandler.html'))
                    await waitForExist(()=>this.isPageEnd, 'emitWebViewSdkSchemeHandlerDidFailNegative12 IsPageEnd', 0);
                    break;
                  }
                  case 'emitWebViewSdkSchemeHandlerDidFailNegative13': {
                    this.isPageEnd = -1;
                    this.controller.loadUrl($rawfile('sdkSchemeHandler.html'))
                    await waitForExist(()=>this.isPageEnd, 'emitWebViewSdkSchemeHandlerDidFailNegative13 IsPageEnd', 0);
                    break;
                  }
                  case 'emitWebViewSdkSchemeHandlerDidFailNegative14': {
                    this.isPageEnd = -1;
                    this.controller.loadUrl($rawfile('sdkSchemeHandler.html'))
                    await waitForExist(()=>this.isPageEnd, 'emitWebViewSdkSchemeHandlerDidFailNegative14 IsPageEnd', 0);
                    break;
                  }
                  case 'emitWebViewSdkSchemeHandlerDidFailNegative15': {
                    this.isPageEnd = -1;
                    this.controller.loadUrl($rawfile('sdkSchemeHandler.html'))
                    await waitForExist(()=>this.isPageEnd, 'emitWebViewSdkSchemeHandlerDidFailNegative15 IsPageEnd', 0);
                    break;
                  }
                  case 'emitWebViewSdkSchemeHandlerDidFailNegative16': {
                    this.isPageEnd = -1;
                    this.controller.loadUrl($rawfile('sdkSchemeHandler.html'))
                    await waitForExist(()=>this.isPageEnd, 'emitWebViewSdkSchemeHandlerDidFailNegative16 IsPageEnd', 0);
                    break;
                  }
                  case 'emitWebViewSdkSchemeHandlerDidFailNegative17': {
                    this.isPageEnd = -1;
                    this.controller.loadUrl($rawfile('sdkSchemeHandler.html'))
                    await waitForExist(()=>this.isPageEnd, 'emitWebViewSdkSchemeHandlerDidFailNegative17 IsPageEnd', 0);
                    break;
                  }
                  case 'emitWebViewSdkSchemeHandlerDidFailNegative18': {
                    this.isPageEnd = -1;
                    this.controller.loadUrl($rawfile('sdkSchemeHandler.html'))
                    await waitForExist(()=>this.isPageEnd, 'emitWebViewSdkSchemeHandlerDidFailNegative18 IsPageEnd', 0);
                    break;
                  }
                  case 'emitWebViewSdkSchemeHandlerDidFailNegative19': {
                    this.isPageEnd = -1;
                    this.controller.loadUrl($rawfile('sdkSchemeHandler.html'))
                    await waitForExist(()=>this.isPageEnd, 'emitWebViewSdkSchemeHandlerDidFailNegative19 IsPageEnd', 0);
                    break;
                  }
                  case 'emitWebViewSdkSchemeHandlerDidFailNegative20': {
                    this.isPageEnd = -1;
                    this.controller.loadUrl($rawfile('sdkSchemeHandler.html'))
                    await waitForExist(()=>this.isPageEnd, 'emitWebViewSdkSchemeHandlerDidFailNegative20 IsPageEnd', 0);
                    break;
                  }
                  case 'emitWebViewSdkSchemeHandlerDidFailNegative21': {
                    this.isPageEnd = -1;
                    this.controller.loadUrl($rawfile('sdkSchemeHandler.html'))
                    await waitForExist(()=>this.isPageEnd, 'emitWebViewSdkSchemeHandlerDidFailNegative21 IsPageEnd', 0);
                    break;
                  }
                  case 'emitWebViewSdkSchemeHandlerDidFailNegative22': {
                    this.isPageEnd = -1;
                    this.controller.loadUrl($rawfile('sdkSchemeHandler.html'))
                    await waitForExist(()=>this.isPageEnd, 'emitWebViewSdkSchemeHandlerDidFailNegative22 IsPageEnd', 0);
                    break;
                  }
                  case 'emitWebViewSdkSchemeHandlerDidFailNegative23': {
                    this.isPageEnd = -1;
                    this.controller.loadUrl($rawfile('sdkSchemeHandler.html'))
                    await waitForExist(()=>this.isPageEnd, 'emitWebViewSdkSchemeHandlerDidFailNegative23 IsPageEnd', 0);
                    break;
                  }
                  case 'emitWebViewSdkSchemeHandlerDidFailNegative25': {
                    this.isPageEnd = -1;
                    this.controller.loadUrl($rawfile('sdkSchemeHandler.html'))
                    await waitForExist(()=>this.isPageEnd, 'emitWebViewSdkSchemeHandlerDidFailNegative25 IsPageEnd', 0);
                    break;
                  }
                  case 'emitWebViewSdkSchemeHandlerDidFailNegative26': {
                    this.isPageEnd = -1;
                    this.controller.loadUrl($rawfile('sdkSchemeHandler.html'))
                    await waitForExist(()=>this.isPageEnd, 'emitWebViewSdkSchemeHandlerDidFailNegative26 IsPageEnd', 0);
                    break;
                  }
                  case 'emitWebViewSdkSchemeHandlerDidFailNegative27': {
                    this.isPageEnd = -1;
                    this.controller.loadUrl($rawfile('sdkSchemeHandler.html'))
                    await waitForExist(()=>this.isPageEnd, 'emitWebViewSdkSchemeHandlerDidFailNegative27 IsPageEnd', 0);
                    break;
                  }
                  case 'emitWebViewSdkSchemeHandlerDidFailNegative29': {
                    this.isPageEnd = -1;
                    this.controller.loadUrl($rawfile('sdkSchemeHandler.html'))
                    await waitForExist(()=>this.isPageEnd, 'emitWebViewSdkSchemeHandlerDidFailNegative29 IsPageEnd', 0);
                    break;
                  }
                  case 'emitWebViewSdkSchemeHandlerDidFailNegative30': {
                    this.isPageEnd = -1;
                    this.controller.loadUrl($rawfile('sdkSchemeHandler.html'))
                    await waitForExist(()=>this.isPageEnd, 'emitWebViewSdkSchemeHandlerDidFailNegative30 IsPageEnd', 0);
                    break;
                  }
                  case 'emitWebViewSdkSchemeHandlerDidFailNegative31': {
                    this.isPageEnd = -1;
                    this.controller.loadUrl($rawfile('sdkSchemeHandler.html'))
                    await waitForExist(()=>this.isPageEnd, 'emitWebViewSdkSchemeHandlerDidFailNegative31 IsPageEnd', 0);
                    break;
                  }
                  case 'emitWebViewSdkSchemeHandlerDidFailNegative32': {
                    this.isPageEnd = -1;
                    this.controller.loadUrl($rawfile('sdkSchemeHandler.html'))
                    await waitForExist(()=>this.isPageEnd, 'emitWebViewSdkSchemeHandlerDidFailNegative32 IsPageEnd', 0);
                    break;
                  }
                  case 'emitWebViewSdkSchemeHandlerDidFailNegative100': {
                    this.isPageEnd = -1;
                    this.controller.loadUrl($rawfile('sdkSchemeHandler.html'))
                    await waitForExist(()=>this.isPageEnd, 'emitWebViewSdkSchemeHandlerDidFailNegative100 IsPageEnd', 0);
                    break;
                  }
                  case 'emitWebViewSdkSchemeHandlerDidFailNegative101': {
                    this.isPageEnd = -1;
                    this.controller.loadUrl($rawfile('sdkSchemeHandler.html'))
                    await waitForExist(()=>this.isPageEnd, 'emitWebViewSdkSchemeHandlerDidFailNegative101 IsPageEnd', 0);
                    break;
                  }
                  case 'emitWebViewSdkSchemeHandlerDidFailNegative102': {
                    this.isPageEnd = -1;
                    this.controller.loadUrl($rawfile('sdkSchemeHandler.html'))
                    await waitForExist(()=>this.isPageEnd, 'emitWebViewSdkSchemeHandlerDidFailNegative102 IsPageEnd', 0);
                    break;
                  }
                  case 'emitWebViewSdkSchemeHandlerDidFailNegative103': {
                    this.isPageEnd = -1;
                    this.controller.loadUrl($rawfile('sdkSchemeHandler.html'))
                    await waitForExist(()=>this.isPageEnd, 'emitWebViewSdkSchemeHandlerDidFailNegative103 IsPageEnd', 0);
                    break;
                  }
                  case 'emitWebViewSdkSchemeHandlerDidFailNegative104': {
                    this.isPageEnd = -1;
                    this.controller.loadUrl($rawfile('sdkSchemeHandler.html'))
                    await waitForExist(()=>this.isPageEnd, 'emitWebViewSdkSchemeHandlerDidFailNegative104 IsPageEnd', 0);
                    break;
                  }
                  case 'emitWebViewSdkSchemeHandlerDidFailNegative105': {
                    this.isPageEnd = -1;
                    this.controller.loadUrl($rawfile('sdkSchemeHandler.html'))
                    await waitForExist(()=>this.isPageEnd, 'emitWebViewSdkSchemeHandlerDidFailNegative105 IsPageEnd', 0);
                    break;
                  }
                  case 'emitWebViewSdkSchemeHandlerDidFailNegative106': {
                    this.isPageEnd = -1;
                    this.controller.loadUrl($rawfile('sdkSchemeHandler.html'))
                    await waitForExist(()=>this.isPageEnd, 'emitWebViewSdkSchemeHandlerDidFailNegative106 IsPageEnd', 0);
                    break;
                  }
                  case 'emitWebViewSdkSchemeHandlerDidFailNegative107': {
                    this.isPageEnd = -1;
                    this.controller.loadUrl($rawfile('sdkSchemeHandler.html'))
                    await waitForExist(()=>this.isPageEnd, 'emitWebViewSdkSchemeHandlerDidFailNegative107 IsPageEnd', 0);
                    break;
                  }
                  case 'emitWebViewSdkSchemeHandlerDidFailNegative108': {
                    this.isPageEnd = -1;
                    this.controller.loadUrl($rawfile('sdkSchemeHandler.html'))
                    await waitForExist(()=>this.isPageEnd, 'emitWebViewSdkSchemeHandlerDidFailNegative108 IsPageEnd', 0);
                    break;
                  }
                  case 'emitWebViewSdkSchemeHandlerDidFailNegative109': {
                    this.isPageEnd = -1;
                    this.controller.loadUrl($rawfile('sdkSchemeHandler.html'))
                    await waitForExist(()=>this.isPageEnd, 'emitWebViewSdkSchemeHandlerDidFailNegative109 IsPageEnd', 0);
                    break;
                  }
                  case 'emitWebViewSdkSchemeHandlerDidFailNegative110': {
                    this.isPageEnd = -1;
                    this.controller.loadUrl($rawfile('sdkSchemeHandler.html'))
                    await waitForExist(()=>this.isPageEnd, 'emitWebViewSdkSchemeHandlerDidFailNegative110 IsPageEnd', 0);
                    break;
                  }
                  case 'emitWebViewSdkSchemeHandlerDidFailNegative111': {
                    this.isPageEnd = -1;
                    this.controller.loadUrl($rawfile('sdkSchemeHandler.html'))
                    await waitForExist(()=>this.isPageEnd, 'emitWebViewSdkSchemeHandlerDidFailNegative111 IsPageEnd', 0);
                    break;
                  }
                  case 'emitWebViewSdkSchemeHandlerDidFailNegative112': {
                    this.isPageEnd = -1;
                    this.controller.loadUrl($rawfile('sdkSchemeHandler.html'))
                    await waitForExist(()=>this.isPageEnd, 'emitWebViewSdkSchemeHandlerDidFailNegative112 IsPageEnd', 0);
                    break;
                  }
                  case 'emitWebViewSdkSchemeHandlerDidFailNegative113': {
                    this.isPageEnd = -1;
                    this.controller.loadUrl($rawfile('sdkSchemeHandler.html'))
                    await waitForExist(()=>this.isPageEnd, 'emitWebViewSdkSchemeHandlerDidFailNegative113 IsPageEnd', 0);
                    break;
                  }
                  case 'emitWebViewSdkSchemeHandlerDidFailNegative114': {
                    this.isPageEnd = -1;
                    this.controller.loadUrl($rawfile('sdkSchemeHandler.html'))
                    await waitForExist(()=>this.isPageEnd, 'emitWebViewSdkSchemeHandlerDidFailNegative114 IsPageEnd', 0);
                    break;
                  }
                  case 'emitWebViewSdkSchemeHandlerDidFailNegative115': {
                    this.isPageEnd = -1;
                    this.controller.loadUrl($rawfile('sdkSchemeHandler.html'))
                    await waitForExist(()=>this.isPageEnd, 'emitWebViewSdkSchemeHandlerDidFailNegative115 IsPageEnd', 0);
                    break;
                  }
                  case 'emitWebViewSdkSchemeHandlerDidFailNegative117': {
                    this.isPageEnd = -1;
                    this.controller.loadUrl($rawfile('sdkSchemeHandler.html'))
                    await waitForExist(()=>this.isPageEnd, 'emitWebViewSdkSchemeHandlerDidFailNegative117 IsPageEnd', 0);
                    break;
                  }
                  case 'emitWebViewSdkSchemeHandlerDidFailNegative118': {
                    this.isPageEnd = -1;
                    this.controller.loadUrl($rawfile('sdkSchemeHandler.html'))
                    await waitForExist(()=>this.isPageEnd, 'emitWebViewSdkSchemeHandlerDidFailNegative118 IsPageEnd', 0);
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
                        console.info('request key==>' + this.emitKey)
                        if (this.emitKey == 'emitWebViewSdkSchemeHandlerDidFailNegative0') {
                          resourceHandler.didFail(WebNetErrorList.NET_OK)
                          Utils.emitEvent('success',121200)
                        }
                        if (this.emitKey == 'emitWebViewSdkSchemeHandlerDidFailNegative1') {
                          resourceHandler.didFail(WebNetErrorList.ERR_IO_PENDING)
                          Utils.emitEvent('success',121210)
                        }
                        if (this.emitKey == 'emitWebViewSdkSchemeHandlerDidFailNegative2') {
                          resourceHandler.didFail(WebNetErrorList.ERR_FAILED)
                          Utils.emitEvent('success',121220)
                        }
                        if (this.emitKey == 'emitWebViewSdkSchemeHandlerDidFailNegative3') {
                          resourceHandler.didFail(WebNetErrorList.ERR_ABORTED)
                          Utils.emitEvent('success',121230)
                        }
                        if (this.emitKey == 'emitWebViewSdkSchemeHandlerDidFailNegative4') {
                          resourceHandler.didFail(WebNetErrorList.ERR_INVALID_ARGUMENT)
                          Utils.emitEvent('success',121240)
                        }
                        if (this.emitKey == 'emitWebViewSdkSchemeHandlerDidFailNegative5') {
                          resourceHandler.didFail(WebNetErrorList.ERR_INVALID_HANDLE)
                          Utils.emitEvent('success',121250)
                        }
                        if (this.emitKey == 'emitWebViewSdkSchemeHandlerDidFailNegative6') {
                          resourceHandler.didFail(WebNetErrorList.ERR_FILE_NOT_FOUND)
                          Utils.emitEvent('success',121260)
                        }
                        if (this.emitKey == 'emitWebViewSdkSchemeHandlerDidFailNegative7') {
                          resourceHandler.didFail(WebNetErrorList.ERR_TIMED_OUT)
                          Utils.emitEvent('success',121270)
                        }
                        if (this.emitKey == 'emitWebViewSdkSchemeHandlerDidFailNegative8') {
                          resourceHandler.didFail(WebNetErrorList.ERR_FILE_TOO_LARGE)
                          Utils.emitEvent('success',121280)
                        }
                        if (this.emitKey == 'emitWebViewSdkSchemeHandlerDidFailNegative9') {
                          resourceHandler.didFail(WebNetErrorList.ERR_UNEXPECTED)
                          Utils.emitEvent('success',121290)
                        }
                        if (this.emitKey == 'emitWebViewSdkSchemeHandlerDidFailNegative10') {
                          resourceHandler.didFail(WebNetErrorList.ERR_ACCESS_DENIED)
                          Utils.emitEvent('success',121300)
                        }
                        if (this.emitKey == 'emitWebViewSdkSchemeHandlerDidFailNegative11') {
                          resourceHandler.didFail(WebNetErrorList.ERR_NOT_IMPLEMENTED)
                          Utils.emitEvent('success',121310)
                        }
                        if (this.emitKey == 'emitWebViewSdkSchemeHandlerDidFailNegative12') {
                          resourceHandler.didFail(WebNetErrorList.ERR_INSUFFICIENT_RESOURCES)
                          Utils.emitEvent('success',121320)
                        }
                        if (this.emitKey == 'emitWebViewSdkSchemeHandlerDidFailNegative13') {
                          resourceHandler.didFail(WebNetErrorList.ERR_OUT_OF_MEMORY)
                          Utils.emitEvent('success',121330)
                        }
                        if (this.emitKey == 'emitWebViewSdkSchemeHandlerDidFailNegative14') {
                          resourceHandler.didFail(WebNetErrorList.ERR_UPLOAD_FILE_CHANGED)
                          Utils.emitEvent('success',121340)
                        }
                        if (this.emitKey == 'emitWebViewSdkSchemeHandlerDidFailNegative15') {
                          resourceHandler.didFail(WebNetErrorList.ERR_SOCKET_NOT_CONNECTED)
                          Utils.emitEvent('success',121350)
                        }
                        if (this.emitKey == 'emitWebViewSdkSchemeHandlerDidFailNegative16') {
                          resourceHandler.didFail(WebNetErrorList.ERR_FILE_EXISTS)
                          Utils.emitEvent('success',121360)
                        }
                        if (this.emitKey == 'emitWebViewSdkSchemeHandlerDidFailNegative17') {
                          resourceHandler.didFail(WebNetErrorList.ERR_FILE_PATH_TOO_LONG)
                          Utils.emitEvent('success',121370)
                        }
                        if (this.emitKey == 'emitWebViewSdkSchemeHandlerDidFailNegative18') {
                          resourceHandler.didFail(WebNetErrorList.ERR_FILE_NO_SPACE)
                          Utils.emitEvent('success',121380)
                        }
                        if (this.emitKey == 'emitWebViewSdkSchemeHandlerDidFailNegative19') {
                          resourceHandler.didFail(WebNetErrorList.ERR_FILE_VIRUS_INFECTED)
                          Utils.emitEvent('success',121390)
                        }
                        if (this.emitKey == 'emitWebViewSdkSchemeHandlerDidFailNegative20') {
                          resourceHandler.didFail(WebNetErrorList.ERR_BLOCKED_BY_CLIENT)
                          Utils.emitEvent('success',121400)
                        }
                        if (this.emitKey == 'emitWebViewSdkSchemeHandlerDidFailNegative21') {
                          resourceHandler.didFail(WebNetErrorList.ERR_NETWORK_CHANGED)
                          Utils.emitEvent('success',121410)
                        }
                        if (this.emitKey == 'emitWebViewSdkSchemeHandlerDidFailNegative22') {
                          resourceHandler.didFail(WebNetErrorList.ERR_BLOCKED_BY_ADMINISTRATOR)
                          Utils.emitEvent('success',121420)
                        }
                        if (this.emitKey == 'emitWebViewSdkSchemeHandlerDidFailNegative23') {
                          resourceHandler.didFail(WebNetErrorList.ERR_SOCKET_CONNECTED)
                          Utils.emitEvent('success',121430)
                        }
                        if (this.emitKey == 'emitWebViewSdkSchemeHandlerDidFailNegative25') {
                          resourceHandler.didFail(WebNetErrorList.ERR_UPLOAD_STREAM_REWIND_NOT_SUPPORTED)
                          Utils.emitEvent('success',121440)
                        }
                        if (this.emitKey == 'emitWebViewSdkSchemeHandlerDidFailNegative26') {
                          resourceHandler.didFail(WebNetErrorList.ERR_CONTEXT_SHUT_DOWN)
                          Utils.emitEvent('success',121450)
                        }
                        if (this.emitKey == 'emitWebViewSdkSchemeHandlerDidFailNegative27') {
                          resourceHandler.didFail(WebNetErrorList.ERR_BLOCKED_BY_RESPONSE)
                          Utils.emitEvent('success',121460)
                        }
                        if (this.emitKey == 'emitWebViewSdkSchemeHandlerDidFailNegative29') {
                          resourceHandler.didFail(WebNetErrorList.ERR_CLEARTEXT_NOT_PERMITTED)
                          Utils.emitEvent('success',121470)
                        }
                        if (this.emitKey == 'emitWebViewSdkSchemeHandlerDidFailNegative30') {
                          resourceHandler.didFail(WebNetErrorList.ERR_BLOCKED_BY_CSP)
                          Utils.emitEvent('success',121480)
                        }
                        if (this.emitKey == 'emitWebViewSdkSchemeHandlerDidFailNegative31') {
                          resourceHandler.didFail(WebNetErrorList.ERR_H2_OR_QUIC_REQUIRED)
                          Utils.emitEvent('success',121490)
                        }
                        if (this.emitKey == 'emitWebViewSdkSchemeHandlerDidFailNegative32') {
                          resourceHandler.didFail(WebNetErrorList.ERR_BLOCKED_BY_ORB)
                          Utils.emitEvent('success',121500)
                        }
                        if (this.emitKey == 'emitWebViewSdkSchemeHandlerDidFailNegative100') {
                          resourceHandler.didFail(WebNetErrorList.ERR_CONNECTION_CLOSED)
                          Utils.emitEvent('success',121510)
                        }
                        if (this.emitKey == 'emitWebViewSdkSchemeHandlerDidFailNegative101') {
                          resourceHandler.didFail(WebNetErrorList.ERR_CONNECTION_RESET)
                          Utils.emitEvent('success',121520)
                        }
                        if (this.emitKey == 'emitWebViewSdkSchemeHandlerDidFailNegative102') {
                          resourceHandler.didFail(WebNetErrorList.ERR_CONNECTION_REFUSED)
                          Utils.emitEvent('success',121530)
                        }
                        if (this.emitKey == 'emitWebViewSdkSchemeHandlerDidFailNegative103') {
                          resourceHandler.didFail(WebNetErrorList.ERR_CONNECTION_ABORTED)
                          Utils.emitEvent('success',121540)
                        }
                        if (this.emitKey == 'emitWebViewSdkSchemeHandlerDidFailNegative104') {
                          resourceHandler.didFail(WebNetErrorList.ERR_CONNECTION_FAILED)
                          Utils.emitEvent('success',121550)
                        }
                        if (this.emitKey == 'emitWebViewSdkSchemeHandlerDidFailNegative105') {
                          resourceHandler.didFail(WebNetErrorList.ERR_NAME_NOT_RESOLVED)
                          Utils.emitEvent('success',121560)
                        }
                        if (this.emitKey == 'emitWebViewSdkSchemeHandlerDidFailNegative106') {
                          resourceHandler.didFail(WebNetErrorList.ERR_INTERNET_DISCONNECTED)
                          Utils.emitEvent('success',121570)
                        }
                        if (this.emitKey == 'emitWebViewSdkSchemeHandlerDidFailNegative107') {
                          resourceHandler.didFail(WebNetErrorList.ERR_SSL_PROTOCOL_ERROR)
                          Utils.emitEvent('success',121580)
                        }
                        if (this.emitKey == 'emitWebViewSdkSchemeHandlerDidFailNegative108') {
                          resourceHandler.didFail(WebNetErrorList.ERR_ADDRESS_INVALID)
                          Utils.emitEvent('success',121590)
                        }
                        if (this.emitKey == 'emitWebViewSdkSchemeHandlerDidFailNegative109') {
                          resourceHandler.didFail(WebNetErrorList.ERR_ADDRESS_UNREACHABLE)
                          Utils.emitEvent('success',121600)
                        }
                        if (this.emitKey == 'emitWebViewSdkSchemeHandlerDidFailNegative110') {
                          resourceHandler.didFail(WebNetErrorList.ERR_SSL_CLIENT_AUTH_CERT_NEEDED)
                          Utils.emitEvent('success',121610)
                        }
                        if (this.emitKey == 'emitWebViewSdkSchemeHandlerDidFailNegative111') {
                          resourceHandler.didFail(WebNetErrorList.ERR_TUNNEL_CONNECTION_FAILED)
                          Utils.emitEvent('success',121620)
                        }
                        if (this.emitKey == 'emitWebViewSdkSchemeHandlerDidFailNegative112') {
                          resourceHandler.didFail(WebNetErrorList.ERR_NO_SSL_VERSIONS_ENABLED)
                          Utils.emitEvent('success',121630)
                        }
                        if (this.emitKey == 'emitWebViewSdkSchemeHandlerDidFailNegative113') {
                          resourceHandler.didFail(WebNetErrorList.ERR_SSL_VERSION_OR_CIPHER_MISMATCH)
                          Utils.emitEvent('success',121640)
                        }
                        if (this.emitKey == 'emitWebViewSdkSchemeHandlerDidFailNegative114') {
                          resourceHandler.didFail(WebNetErrorList.ERR_SSL_RENEGOTIATION_REQUESTED)
                          Utils.emitEvent('success',121650)
                        }
                        if (this.emitKey == 'emitWebViewSdkSchemeHandlerDidFailNegative115') {
                          resourceHandler.didFail(WebNetErrorList.ERR_PROXY_AUTH_UNSUPPORTED)
                          Utils.emitEvent('success',121660)
                        }
                        if (this.emitKey == 'emitWebViewSdkSchemeHandlerDidFailNegative117') {
                          resourceHandler.didFail(WebNetErrorList.ERR_BAD_SSL_CLIENT_AUTH_CERT)
                          Utils.emitEvent('success',121670)
                        }
                        if (this.emitKey == 'emitWebViewSdkSchemeHandlerDidFailNegative118') {
                          resourceHandler.didFail(WebNetErrorList.ERR_CONNECTION_TIMED_OUT)
                          Utils.emitEvent('success',121680)
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
