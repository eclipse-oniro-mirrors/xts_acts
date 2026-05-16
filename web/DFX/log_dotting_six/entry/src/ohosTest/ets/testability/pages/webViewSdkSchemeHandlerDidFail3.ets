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
          eventId: 121010,
          priority: events_emitter.EventPriority.LOW
      }
      events_emitter.on(valueChangeEvent, this.valueChangeCallBack)
  }

  onPageHide() {
    events_emitter.off(121010)
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
              Button('web click')
              .key('webViewSdkSchemeHandlerDidFail3Button')
              .onClick(async () => {
                  await waitForExist(() => this.isReceive, 'webViewSdkSchemeHandlerDidFail3ButtonIsReceive', 0, 1000);
                  console.info('key==>' + this.emitKey)
                  this.isReceive = -1;
                  this.controller.loadUrl($rawfile('sdkSchemeHandler.html'))
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

                        if (this.emitKey == 'emitWebViewSdkSchemeHandlerDidFailNegative341') {
                          resourceHandler.didFail(WebNetErrorList.ERR_MISSING_AUTH_CREDENTIALS)
                          Utils.emitEvent('success',121020)
                        }
                        if (this.emitKey == 'emitWebViewSdkSchemeHandlerDidFailNegative342') {
                          resourceHandler.didFail(WebNetErrorList.ERR_UNEXPECTED_SECURITY_LIBRARY_STATUS)
                          Utils.emitEvent('success',121030)
                        }
                        if (this.emitKey == 'emitWebViewSdkSchemeHandlerDidFailNegative343') {
                          resourceHandler.didFail(WebNetErrorList.ERR_MISCONFIGURED_AUTH_ENVIRONMENT)
                          Utils.emitEvent('success',121040)
                        }
                        if (this.emitKey == 'emitWebViewSdkSchemeHandlerDidFailNegative344') {
                          resourceHandler.didFail(WebNetErrorList.ERR_UNDOCUMENTED_SECURITY_LIBRARY_STATUS)
                          Utils.emitEvent('success',121050)
                        }
                        if (this.emitKey == 'emitWebViewSdkSchemeHandlerDidFailNegative345') {
                          resourceHandler.didFail(WebNetErrorList.ERR_RESPONSE_BODY_TOO_BIG_TO_DRAIN)
                          Utils.emitEvent('success',121060)
                        }
                        if (this.emitKey == 'emitWebViewSdkSchemeHandlerDidFailNegative346') {
                          resourceHandler.didFail(WebNetErrorList.ERR_RESPONSE_HEADERS_MULTIPLE_CONTENT_LENGTH)
                          Utils.emitEvent('success',121070)
                        }
                        if (this.emitKey == 'emitWebViewSdkSchemeHandlerDidFailNegative347') {
                          resourceHandler.didFail(WebNetErrorList.ERR_INCOMPLETE_HTTP2_HEADERS)
                          Utils.emitEvent('success',121080)
                        }
                        if (this.emitKey == 'emitWebViewSdkSchemeHandlerDidFailNegative348') {
                          resourceHandler.didFail(WebNetErrorList.ERR_PAC_NOT_IN_DHCP)
                          Utils.emitEvent('success',121090)
                        }
                        if (this.emitKey == 'emitWebViewSdkSchemeHandlerDidFailNegative349') {
                          resourceHandler.didFail(WebNetErrorList.ERR_RESPONSE_HEADERS_MULTIPLE_CONTENT_DISPOSITION)
                          Utils.emitEvent('success',121100)
                        }
                        if (this.emitKey == 'emitWebViewSdkSchemeHandlerDidFailNegative350') {
                          resourceHandler.didFail(WebNetErrorList.ERR_RESPONSE_HEADERS_MULTIPLE_LOCATION)
                          Utils.emitEvent('success',121110)
                        }
                        if (this.emitKey == 'emitWebViewSdkSchemeHandlerDidFailNegative351') {
                          resourceHandler.didFail(WebNetErrorList.ERR_HTTP2_SERVER_REFUSED_STREAM)
                          Utils.emitEvent('success',121120)
                        }
                        if (this.emitKey == 'emitWebViewSdkSchemeHandlerDidFailNegative352') {
                          resourceHandler.didFail(WebNetErrorList.ERR_HTTP2_PING_FAILED)
                          Utils.emitEvent('success',121130)
                        }
                        if (this.emitKey == 'emitWebViewSdkSchemeHandlerDidFailNegative354') {
                          resourceHandler.didFail(WebNetErrorList.ERR_CONTENT_LENGTH_MISMATCH)
                          Utils.emitEvent('success',121140)
                        }
                        if (this.emitKey == 'emitWebViewSdkSchemeHandlerDidFailNegative355') {
                          resourceHandler.didFail(WebNetErrorList.ERR_INCOMPLETE_CHUNKED_ENCODING)
                          Utils.emitEvent('success',121150)
                        }
                        if (this.emitKey == 'emitWebViewSdkSchemeHandlerDidFailNegative356') {
                          resourceHandler.didFail(WebNetErrorList.ERR_QUIC_PROTOCOL_ERROR)
                          Utils.emitEvent('success',121160)
                        }
                        if (this.emitKey == 'emitWebViewSdkSchemeHandlerDidFailNegative357') {
                          resourceHandler.didFail(WebNetErrorList.ERR_RESPONSE_HEADERS_TRUNCATED)
                          Utils.emitEvent('success',121170)
                        }
                        if (this.emitKey == 'emitWebViewSdkSchemeHandlerDidFailNegative358') {
                          resourceHandler.didFail(WebNetErrorList.ERR_QUIC_HANDSHAKE_FAILED)
                          Utils.emitEvent('success',121180)
                        }
                        
                        return false;
                    })


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
