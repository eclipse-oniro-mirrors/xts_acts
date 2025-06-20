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
              .key('webViewSdkSchemeHandlerDidFailWan2Button')
              .onClick(async () => {
                  this.controller.loadUrl($rawfile('sdkSchemeHandler.html'))
                  await Utils.sleep(2000)
                  console.info('key==>' + this.emitKey)
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
                        if (this.emitKey == 'emitWebViewSdkSchemeHandlerDidFailNegative701') {
                          resourceHandler.didFail(WebNetErrorList.ERR_PKCS12_IMPORT_BAD_PASSWORD)
                          Utils.emitEvent('success',11701)
                        }
                        if (this.emitKey == 'emitWebViewSdkSchemeHandlerDidFailNegative702') {
                          resourceHandler.didFail(WebNetErrorList.ERR_PKCS12_IMPORT_FAILED)
                          Utils.emitEvent('success',11702)
                        }
                        if (this.emitKey == 'emitWebViewSdkSchemeHandlerDidFailNegative703') {
                          resourceHandler.didFail(WebNetErrorList.ERR_IMPORT_CA_CERT_NOT_CA)
                          Utils.emitEvent('success',11703)
                        }
                        if (this.emitKey == 'emitWebViewSdkSchemeHandlerDidFailNegative704') {
                          resourceHandler.didFail(WebNetErrorList.ERR_IMPORT_CERT_ALREADY_EXISTS)
                          Utils.emitEvent('success',11704)
                        }
                        if (this.emitKey == 'emitWebViewSdkSchemeHandlerDidFailNegative705') {
                          resourceHandler.didFail(WebNetErrorList.ERR_IMPORT_CA_CERT_FAILED)
                          Utils.emitEvent('success',11705)
                        }
                        if (this.emitKey == 'emitWebViewSdkSchemeHandlerDidFailNegative706') {
                          resourceHandler.didFail(WebNetErrorList.ERR_IMPORT_SERVER_CERT_FAILED)
                          Utils.emitEvent('success',11706)
                        }
                        if (this.emitKey == 'emitWebViewSdkSchemeHandlerDidFailNegative707') {
                          resourceHandler.didFail(WebNetErrorList.ERR_PKCS12_IMPORT_INVALID_MAC)
                          Utils.emitEvent('success',11707)
                        }
                        if (this.emitKey == 'emitWebViewSdkSchemeHandlerDidFailNegative708') {
                          resourceHandler.didFail(WebNetErrorList.ERR_PKCS12_IMPORT_INVALID_FILE)
                          Utils.emitEvent('success',11708)
                        }
                        if (this.emitKey == 'emitWebViewSdkSchemeHandlerDidFailNegative709') {
                          resourceHandler.didFail(WebNetErrorList.ERR_PKCS12_IMPORT_UNSUPPORTED)
                          Utils.emitEvent('success',11709)
                        }
                        if (this.emitKey == 'emitWebViewSdkSchemeHandlerDidFailNegative710') {
                          resourceHandler.didFail(WebNetErrorList.ERR_KEY_GENERATION_FAILED)
                          Utils.emitEvent('success',11710)
                        }
                        if (this.emitKey == 'emitWebViewSdkSchemeHandlerDidFailNegative712') {
                          resourceHandler.didFail(WebNetErrorList.ERR_PRIVATE_KEY_EXPORT_FAILED)
                          Utils.emitEvent('success',11712)
                        }
                        if (this.emitKey == 'emitWebViewSdkSchemeHandlerDidFailNegative713') {
                          resourceHandler.didFail(WebNetErrorList.ERR_SELF_SIGNED_CERT_GENERATION_FAILED)
                          Utils.emitEvent('success',11713)
                        }
                        if (this.emitKey == 'emitWebViewSdkSchemeHandlerDidFailNegative714') {
                          resourceHandler.didFail(WebNetErrorList.ERR_CERT_DATABASE_CHANGED)
                          Utils.emitEvent('success',11714)
                        }
                        if (this.emitKey == 'emitWebViewSdkSchemeHandlerDidFailNegative716') {
                          resourceHandler.didFail(WebNetErrorList.ERR_CERT_VERIFIER_CHANGED)
                          Utils.emitEvent('success',11716)
                        }
                        if (this.emitKey == 'emitWebViewSdkSchemeHandlerDidFailNegative800') {
                          resourceHandler.didFail(WebNetErrorList.ERR_DNS_MALFORMED_RESPONSE)
                          Utils.emitEvent('success',11800)
                        }
                        if (this.emitKey == 'emitWebViewSdkSchemeHandlerDidFailNegative801') {
                          resourceHandler.didFail(WebNetErrorList.ERR_DNS_SERVER_REQUIRES_TCP)
                          Utils.emitEvent('success',11801)
                        }
                        if (this.emitKey == 'emitWebViewSdkSchemeHandlerDidFailNegative802') {
                          resourceHandler.didFail(WebNetErrorList.ERR_DNS_SERVER_FAILED)
                          Utils.emitEvent('success',11802)
                        }
                        if (this.emitKey == 'emitWebViewSdkSchemeHandlerDidFailNegative803') {
                          resourceHandler.didFail(WebNetErrorList.ERR_DNS_TIMED_OUT)
                          Utils.emitEvent('success',11803)
                        }
                        if (this.emitKey == 'emitWebViewSdkSchemeHandlerDidFailNegative804') {
                          resourceHandler.didFail(WebNetErrorList.ERR_DNS_CACHE_MISS)
                          Utils.emitEvent('success',11804)
                        }
                        if (this.emitKey == 'emitWebViewSdkSchemeHandlerDidFailNegative805') {
                          resourceHandler.didFail(WebNetErrorList.ERR_DNS_SEARCH_EMPTY)
                          Utils.emitEvent('success',11805)
                        }
                        if (this.emitKey == 'emitWebViewSdkSchemeHandlerDidFailNegative806') {
                          resourceHandler.didFail(WebNetErrorList.ERR_DNS_SORT_ERROR)
                          Utils.emitEvent('success',11806)
                        }
                        if (this.emitKey == 'emitWebViewSdkSchemeHandlerDidFailNegative808') {
                          resourceHandler.didFail(WebNetErrorList.ERR_DNS_SECURE_RESOLVER_HOSTNAME_RESOLUTION_FAILED)
                          Utils.emitEvent('success',11808)
                        }
                        if (this.emitKey == 'emitWebViewSdkSchemeHandlerDidFailNegative809') {
                          resourceHandler.didFail(WebNetErrorList.ERR_DNS_NAME_HTTPS_ONLY)
                          Utils.emitEvent('success',11809)
                        }
                        if (this.emitKey == 'emitWebViewSdkSchemeHandlerDidFailNegative810') {
                          resourceHandler.didFail(WebNetErrorList.ERR_DNS_REQUEST_CANCELED)
                          Utils.emitEvent('success',11810)
                        }
                        if (this.emitKey == 'emitWebViewSdkSchemeHandlerDidFailNegative811') {
                          resourceHandler.didFail(WebNetErrorList.ERR_DNS_NO_MATCHING_SUPPORTED_ALPN)
                          Utils.emitEvent('success',11811)
                        }
                        if (this.emitKey == 'emitWebViewSdkSchemeHandlerDidFailNegativeNull') {
                          try {
                            resourceHandler.didFail(null)
                          } catch(error) {
                            let e: business_error.BusinessError = error as business_error.BusinessError;
                            console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                            if(e.code.toString() === '401' ) {
                              Utils.emitEvent('success',11812)
                            } else {
                              Utils.emitEvent('error code error',11812)
                            }
                          }
                        }
                        if (this.emitKey == 'emitWebViewSdkSchemeHandlerDidFailMore') {
                            resourceHandler.didFail(5)
                            Utils.emitEvent('success',11813)
                        }

                        if (this.emitKey == 'emitWebViewSdkSchemeHandlerDidFailResourceInvalid') {
                          try {
                            resourceHandler = new webview.WebResourceHandler()
                            resourceHandler.didFail(WebNetErrorList.ERR_DNS_REQUEST_CANCELED)
                          } catch(error) {
                            let e: business_error.BusinessError = error as business_error.BusinessError;
                            console.error(`emitWebViewSdkSchemeHandlerDidFailResourceInvalid ErrorCode: ${e.code},  Message: ${e.message}`);
                            Utils.emitEvent('success',11814)
                          }
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
