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
      Utils.setEmitKey(this.emitKey);
  }
  
  build() {
      Column() {
          Row() {
              Button('webViewSdkSchemeHandlerDidFailFlyButton')
              .key('webViewSdkSchemeHandlerDidFailFlyButton')
              .onClick(async () => {
                console.info('key==>' + this.emitKey)
                switch (this.emitKey) {
                  case 'emitWebViewSdkSchemeHandlerDidFailNegative0': {
                    this.controller.loadUrl($rawfile('sdkSchemeHandler.html'))
                    await Utils.sleep(2000)
                    break;
                  }
                  case 'emitWebViewSdkSchemeHandlerDidFailNegative1': {
                    this.controller.loadUrl($rawfile('sdkSchemeHandler.html'))
                    await Utils.sleep(2000)
                    break;
                  }
                  case 'emitWebViewSdkSchemeHandlerDidFailNegative2': {
                    this.controller.loadUrl($rawfile('sdkSchemeHandler.html'))
                    await Utils.sleep(2000)
                    break;
                  }
                  case 'emitWebViewSdkSchemeHandlerDidFailNegative3': {
                    this.controller.loadUrl($rawfile('sdkSchemeHandler.html'))
                    await Utils.sleep(2000)
                    break;
                  }
                  case 'emitWebViewSdkSchemeHandlerDidFailNegative4': {
                    this.controller.loadUrl($rawfile('sdkSchemeHandler.html'))
                    await Utils.sleep(2000)
                    break;
                  }
                  case 'emitWebViewSdkSchemeHandlerDidFailNegative5': {
                    this.controller.loadUrl($rawfile('sdkSchemeHandler.html'))
                    await Utils.sleep(2000)
                    break;
                  }
                  case 'emitWebViewSdkSchemeHandlerDidFailNegative6': {
                    this.controller.loadUrl($rawfile('sdkSchemeHandler.html'))
                    await Utils.sleep(2000)
                    break;
                  }
                  case 'emitWebViewSdkSchemeHandlerDidFailNegative7': {
                    this.controller.loadUrl($rawfile('sdkSchemeHandler.html'))
                    await Utils.sleep(2000)
                    break;
                  }
                  case 'emitWebViewSdkSchemeHandlerDidFailNegative8': {
                    this.controller.loadUrl($rawfile('sdkSchemeHandler.html'))
                    await Utils.sleep(2000)
                    break;
                  }
                  case 'emitWebViewSdkSchemeHandlerDidFailNegative9': {
                    this.controller.loadUrl($rawfile('sdkSchemeHandler.html'))
                    await Utils.sleep(2000)
                    break;
                  }
                  case 'emitWebViewSdkSchemeHandlerDidFailNegative10': {
                    this.controller.loadUrl($rawfile('sdkSchemeHandler.html'))
                    await Utils.sleep(2000)
                    break;
                  }
                  case 'emitWebViewSdkSchemeHandlerDidFailNegative11': {
                    this.controller.loadUrl($rawfile('sdkSchemeHandler.html'))
                    await Utils.sleep(2000)
                    break;
                  }
                  case 'emitWebViewSdkSchemeHandlerDidFailNegative12': {
                    this.controller.loadUrl($rawfile('sdkSchemeHandler.html'))
                    await Utils.sleep(2000)
                    break;
                  }
                  case 'emitWebViewSdkSchemeHandlerDidFailNegative13': {
                    this.controller.loadUrl($rawfile('sdkSchemeHandler.html'))
                    await Utils.sleep(2000)
                    break;
                  }
                  case 'emitWebViewSdkSchemeHandlerDidFailNegative14': {
                    this.controller.loadUrl($rawfile('sdkSchemeHandler.html'))
                    await Utils.sleep(2000)
                    break;
                  }
                  case 'emitWebViewSdkSchemeHandlerDidFailNegative15': {
                    this.controller.loadUrl($rawfile('sdkSchemeHandler.html'))
                    await Utils.sleep(2000)
                    break;
                  }
                  case 'emitWebViewSdkSchemeHandlerDidFailNegative16': {
                    this.controller.loadUrl($rawfile('sdkSchemeHandler.html'))
                    await Utils.sleep(2000)
                    break;
                  }
                  case 'emitWebViewSdkSchemeHandlerDidFailNegative17': {
                    this.controller.loadUrl($rawfile('sdkSchemeHandler.html'))
                    await Utils.sleep(2000)
                    break;
                  }
                  case 'emitWebViewSdkSchemeHandlerDidFailNegative18': {
                    this.controller.loadUrl($rawfile('sdkSchemeHandler.html'))
                    await Utils.sleep(2000)
                    break;
                  }
                  case 'emitWebViewSdkSchemeHandlerDidFailNegative19': {
                    this.controller.loadUrl($rawfile('sdkSchemeHandler.html'))
                    await Utils.sleep(2000)
                    break;
                  }
                  case 'emitWebViewSdkSchemeHandlerDidFailNegative20': {
                    this.controller.loadUrl($rawfile('sdkSchemeHandler.html'))
                    await Utils.sleep(2000)
                    break;
                  }
                  case 'emitWebViewSdkSchemeHandlerDidFailNegative21': {
                    this.controller.loadUrl($rawfile('sdkSchemeHandler.html'))
                    await Utils.sleep(2000)
                    break;
                  }
                  case 'emitWebViewSdkSchemeHandlerDidFailNegative22': {
                    this.controller.loadUrl($rawfile('sdkSchemeHandler.html'))
                    await Utils.sleep(2000)
                    break;
                  }
                  case 'emitWebViewSdkSchemeHandlerDidFailNegative23': {
                    this.controller.loadUrl($rawfile('sdkSchemeHandler.html'))
                    await Utils.sleep(2000)
                    break;
                  }
                  case 'emitWebViewSdkSchemeHandlerDidFailNegative25': {
                    this.controller.loadUrl($rawfile('sdkSchemeHandler.html'))
                    await Utils.sleep(2000)
                    break;
                  }
                  case 'emitWebViewSdkSchemeHandlerDidFailNegative26': {
                    this.controller.loadUrl($rawfile('sdkSchemeHandler.html'))
                    await Utils.sleep(2000)
                    break;
                  }
                  case 'emitWebViewSdkSchemeHandlerDidFailNegative27': {
                    this.controller.loadUrl($rawfile('sdkSchemeHandler.html'))
                    await Utils.sleep(2000)
                    break;
                  }
                  case 'emitWebViewSdkSchemeHandlerDidFailNegative29': {
                    this.controller.loadUrl($rawfile('sdkSchemeHandler.html'))
                    await Utils.sleep(2000)
                    break;
                  }
                  case 'emitWebViewSdkSchemeHandlerDidFailNegative30': {
                    this.controller.loadUrl($rawfile('sdkSchemeHandler.html'))
                    await Utils.sleep(2000)
                    break;
                  }
                  case 'emitWebViewSdkSchemeHandlerDidFailNegative31': {
                    this.controller.loadUrl($rawfile('sdkSchemeHandler.html'))
                    await Utils.sleep(2000)
                    break;
                  }
                  case 'emitWebViewSdkSchemeHandlerDidFailNegative32': {
                    this.controller.loadUrl($rawfile('sdkSchemeHandler.html'))
                    await Utils.sleep(2000)
                    break;
                  }
                  case 'emitWebViewSdkSchemeHandlerDidFailNegative100': {
                    this.controller.loadUrl($rawfile('sdkSchemeHandler.html'))
                    await Utils.sleep(2000)
                    break;
                  }
                  case 'emitWebViewSdkSchemeHandlerDidFailNegative101': {
                    this.controller.loadUrl($rawfile('sdkSchemeHandler.html'))
                    await Utils.sleep(2000)
                    break;
                  }
                  case 'emitWebViewSdkSchemeHandlerDidFailNegative102': {
                    this.controller.loadUrl($rawfile('sdkSchemeHandler.html'))
                    await Utils.sleep(2000)
                    break;
                  }
                  case 'emitWebViewSdkSchemeHandlerDidFailNegative103': {
                    this.controller.loadUrl($rawfile('sdkSchemeHandler.html'))
                    await Utils.sleep(2000)
                    break;
                  }
                  case 'emitWebViewSdkSchemeHandlerDidFailNegative104': {
                    this.controller.loadUrl($rawfile('sdkSchemeHandler.html'))
                    await Utils.sleep(2000)
                    break;
                  }
                  case 'emitWebViewSdkSchemeHandlerDidFailNegative105': {
                    this.controller.loadUrl($rawfile('sdkSchemeHandler.html'))
                    await Utils.sleep(2000)
                    break;
                  }
                  case 'emitWebViewSdkSchemeHandlerDidFailNegative106': {
                    this.controller.loadUrl($rawfile('sdkSchemeHandler.html'))
                    await Utils.sleep(2000)
                    break;
                  }
                  case 'emitWebViewSdkSchemeHandlerDidFailNegative107': {
                    this.controller.loadUrl($rawfile('sdkSchemeHandler.html'))
                    await Utils.sleep(2000)
                    break;
                  }
                  case 'emitWebViewSdkSchemeHandlerDidFailNegative108': {
                    this.controller.loadUrl($rawfile('sdkSchemeHandler.html'))
                    await Utils.sleep(2000)
                    break;
                  }
                  case 'emitWebViewSdkSchemeHandlerDidFailNegative109': {
                    this.controller.loadUrl($rawfile('sdkSchemeHandler.html'))
                    await Utils.sleep(2000)
                    break;
                  }
                  case 'emitWebViewSdkSchemeHandlerDidFailNegative110': {
                    this.controller.loadUrl($rawfile('sdkSchemeHandler.html'))
                    await Utils.sleep(2000)
                    break;
                  }
                  case 'emitWebViewSdkSchemeHandlerDidFailNegative111': {
                    this.controller.loadUrl($rawfile('sdkSchemeHandler.html'))
                    await Utils.sleep(2000)
                    break;
                  }
                  case 'emitWebViewSdkSchemeHandlerDidFailNegative112': {
                    this.controller.loadUrl($rawfile('sdkSchemeHandler.html'))
                    await Utils.sleep(2000)
                    break;
                  }
                  case 'emitWebViewSdkSchemeHandlerDidFailNegative113': {
                    this.controller.loadUrl($rawfile('sdkSchemeHandler.html'))
                    await Utils.sleep(2000)
                    break;
                  }
                  case 'emitWebViewSdkSchemeHandlerDidFailNegative114': {
                    this.controller.loadUrl($rawfile('sdkSchemeHandler.html'))
                    await Utils.sleep(2000)
                    break;
                  }
                  case 'emitWebViewSdkSchemeHandlerDidFailNegative115': {
                    this.controller.loadUrl($rawfile('sdkSchemeHandler.html'))
                    await Utils.sleep(2000)
                    break;
                  }
                  case 'emitWebViewSdkSchemeHandlerDidFailNegative117': {
                    this.controller.loadUrl($rawfile('sdkSchemeHandler.html'))
                    await Utils.sleep(2000)
                    break;
                  }
                  case 'emitWebViewSdkSchemeHandlerDidFailNegative118': {
                    this.controller.loadUrl($rawfile('sdkSchemeHandler.html'))
                    await Utils.sleep(2000)
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
                          Utils.emitEvent('success',11000)
                        }
                        if (this.emitKey == 'emitWebViewSdkSchemeHandlerDidFailNegative1') {
                          resourceHandler.didFail(WebNetErrorList.ERR_IO_PENDING)
                          Utils.emitEvent('success',11001)
                        }
                        if (this.emitKey == 'emitWebViewSdkSchemeHandlerDidFailNegative2') {
                          resourceHandler.didFail(WebNetErrorList.ERR_FAILED)
                          Utils.emitEvent('success',11002)
                        }
                        if (this.emitKey == 'emitWebViewSdkSchemeHandlerDidFailNegative3') {
                          resourceHandler.didFail(WebNetErrorList.ERR_ABORTED)
                          Utils.emitEvent('success',11003)
                        }
                        if (this.emitKey == 'emitWebViewSdkSchemeHandlerDidFailNegative4') {
                          resourceHandler.didFail(WebNetErrorList.ERR_INVALID_ARGUMENT)
                          Utils.emitEvent('success',11004)
                        }
                        if (this.emitKey == 'emitWebViewSdkSchemeHandlerDidFailNegative5') {
                          resourceHandler.didFail(WebNetErrorList.ERR_INVALID_HANDLE)
                          Utils.emitEvent('success',11005)
                        }
                        if (this.emitKey == 'emitWebViewSdkSchemeHandlerDidFailNegative6') {
                          resourceHandler.didFail(WebNetErrorList.ERR_FILE_NOT_FOUND)
                          Utils.emitEvent('success',11006)
                        }
                        if (this.emitKey == 'emitWebViewSdkSchemeHandlerDidFailNegative7') {
                          resourceHandler.didFail(WebNetErrorList.ERR_TIMED_OUT)
                          Utils.emitEvent('success',11007)
                        }
                        if (this.emitKey == 'emitWebViewSdkSchemeHandlerDidFailNegative8') {
                          resourceHandler.didFail(WebNetErrorList.ERR_FILE_TOO_LARGE)
                          Utils.emitEvent('success',11008)
                        }
                        if (this.emitKey == 'emitWebViewSdkSchemeHandlerDidFailNegative9') {
                          resourceHandler.didFail(WebNetErrorList.ERR_UNEXPECTED)
                          Utils.emitEvent('success',11009)
                        }
                        if (this.emitKey == 'emitWebViewSdkSchemeHandlerDidFailNegative10') {
                          resourceHandler.didFail(WebNetErrorList.ERR_ACCESS_DENIED)
                          Utils.emitEvent('success',11010)
                        }
                        if (this.emitKey == 'emitWebViewSdkSchemeHandlerDidFailNegative11') {
                          resourceHandler.didFail(WebNetErrorList.ERR_NOT_IMPLEMENTED)
                          Utils.emitEvent('success',11011)
                        }
                        if (this.emitKey == 'emitWebViewSdkSchemeHandlerDidFailNegative12') {
                          resourceHandler.didFail(WebNetErrorList.ERR_INSUFFICIENT_RESOURCES)
                          Utils.emitEvent('success',11012)
                        }
                        if (this.emitKey == 'emitWebViewSdkSchemeHandlerDidFailNegative13') {
                          resourceHandler.didFail(WebNetErrorList.ERR_OUT_OF_MEMORY)
                          Utils.emitEvent('success',11013)
                        }
                        if (this.emitKey == 'emitWebViewSdkSchemeHandlerDidFailNegative14') {
                          resourceHandler.didFail(WebNetErrorList.ERR_UPLOAD_FILE_CHANGED)
                          Utils.emitEvent('success',11014)
                        }
                        if (this.emitKey == 'emitWebViewSdkSchemeHandlerDidFailNegative15') {
                          resourceHandler.didFail(WebNetErrorList.ERR_SOCKET_NOT_CONNECTED)
                          Utils.emitEvent('success',11015)
                        }
                        if (this.emitKey == 'emitWebViewSdkSchemeHandlerDidFailNegative16') {
                          resourceHandler.didFail(WebNetErrorList.ERR_FILE_EXISTS)
                          Utils.emitEvent('success',11016)
                        }
                        if (this.emitKey == 'emitWebViewSdkSchemeHandlerDidFailNegative17') {
                          resourceHandler.didFail(WebNetErrorList.ERR_FILE_PATH_TOO_LONG)
                          Utils.emitEvent('success',11017)
                        }
                        if (this.emitKey == 'emitWebViewSdkSchemeHandlerDidFailNegative18') {
                          resourceHandler.didFail(WebNetErrorList.ERR_FILE_NO_SPACE)
                          Utils.emitEvent('success',11018)
                        }
                        if (this.emitKey == 'emitWebViewSdkSchemeHandlerDidFailNegative19') {
                          resourceHandler.didFail(WebNetErrorList.ERR_FILE_VIRUS_INFECTED)
                          Utils.emitEvent('success',11019)
                        }
                        if (this.emitKey == 'emitWebViewSdkSchemeHandlerDidFailNegative20') {
                          resourceHandler.didFail(WebNetErrorList.ERR_BLOCKED_BY_CLIENT)
                          Utils.emitEvent('success',11020)
                        }
                        if (this.emitKey == 'emitWebViewSdkSchemeHandlerDidFailNegative21') {
                          resourceHandler.didFail(WebNetErrorList.ERR_NETWORK_CHANGED)
                          Utils.emitEvent('success',11021)
                        }
                        if (this.emitKey == 'emitWebViewSdkSchemeHandlerDidFailNegative22') {
                          resourceHandler.didFail(WebNetErrorList.ERR_BLOCKED_BY_ADMINISTRATOR)
                          Utils.emitEvent('success',11022)
                        }
                        if (this.emitKey == 'emitWebViewSdkSchemeHandlerDidFailNegative23') {
                          resourceHandler.didFail(WebNetErrorList.ERR_SOCKET_CONNECTED)
                          Utils.emitEvent('success',11023)
                        }
                        if (this.emitKey == 'emitWebViewSdkSchemeHandlerDidFailNegative25') {
                          resourceHandler.didFail(WebNetErrorList.ERR_UPLOAD_STREAM_REWIND_NOT_SUPPORTED)
                          Utils.emitEvent('success',11025)
                        }
                        if (this.emitKey == 'emitWebViewSdkSchemeHandlerDidFailNegative26') {
                          resourceHandler.didFail(WebNetErrorList.ERR_CONTEXT_SHUT_DOWN)
                          Utils.emitEvent('success',11026)
                        }
                        if (this.emitKey == 'emitWebViewSdkSchemeHandlerDidFailNegative27') {
                          resourceHandler.didFail(WebNetErrorList.ERR_BLOCKED_BY_RESPONSE)
                          Utils.emitEvent('success',11027)
                        }
                        if (this.emitKey == 'emitWebViewSdkSchemeHandlerDidFailNegative29') {
                          resourceHandler.didFail(WebNetErrorList.ERR_CLEARTEXT_NOT_PERMITTED)
                          Utils.emitEvent('success',11029)
                        }
                        if (this.emitKey == 'emitWebViewSdkSchemeHandlerDidFailNegative30') {
                          resourceHandler.didFail(WebNetErrorList.ERR_BLOCKED_BY_CSP)
                          Utils.emitEvent('success',11030)
                        }
                        if (this.emitKey == 'emitWebViewSdkSchemeHandlerDidFailNegative31') {
                          resourceHandler.didFail(WebNetErrorList.ERR_H2_OR_QUIC_REQUIRED)
                          Utils.emitEvent('success',11031)
                        }
                        if (this.emitKey == 'emitWebViewSdkSchemeHandlerDidFailNegative32') {
                          resourceHandler.didFail(WebNetErrorList.ERR_BLOCKED_BY_ORB)
                          Utils.emitEvent('success',11032)
                        }
                        if (this.emitKey == 'emitWebViewSdkSchemeHandlerDidFailNegative100') {
                          resourceHandler.didFail(WebNetErrorList.ERR_CONNECTION_CLOSED)
                          Utils.emitEvent('success',11100)
                        }
                        if (this.emitKey == 'emitWebViewSdkSchemeHandlerDidFailNegative101') {
                          resourceHandler.didFail(WebNetErrorList.ERR_CONNECTION_RESET)
                          Utils.emitEvent('success',11101)
                        }
                        if (this.emitKey == 'emitWebViewSdkSchemeHandlerDidFailNegative102') {
                          resourceHandler.didFail(WebNetErrorList.ERR_CONNECTION_REFUSED)
                          Utils.emitEvent('success',11102)
                        }
                        if (this.emitKey == 'emitWebViewSdkSchemeHandlerDidFailNegative103') {
                          resourceHandler.didFail(WebNetErrorList.ERR_CONNECTION_ABORTED)
                          Utils.emitEvent('success',11103)
                        }
                        if (this.emitKey == 'emitWebViewSdkSchemeHandlerDidFailNegative104') {
                          resourceHandler.didFail(WebNetErrorList.ERR_CONNECTION_FAILED)
                          Utils.emitEvent('success',11104)
                        }
                        if (this.emitKey == 'emitWebViewSdkSchemeHandlerDidFailNegative105') {
                          resourceHandler.didFail(WebNetErrorList.ERR_NAME_NOT_RESOLVED)
                          Utils.emitEvent('success',11105)
                        }
                        if (this.emitKey == 'emitWebViewSdkSchemeHandlerDidFailNegative106') {
                          resourceHandler.didFail(WebNetErrorList.ERR_INTERNET_DISCONNECTED)
                          Utils.emitEvent('success',11106)
                        }
                        if (this.emitKey == 'emitWebViewSdkSchemeHandlerDidFailNegative107') {
                          resourceHandler.didFail(WebNetErrorList.ERR_SSL_PROTOCOL_ERROR)
                          Utils.emitEvent('success',11107)
                        }
                        if (this.emitKey == 'emitWebViewSdkSchemeHandlerDidFailNegative108') {
                          resourceHandler.didFail(WebNetErrorList.ERR_ADDRESS_INVALID)
                          Utils.emitEvent('success',11108)
                        }
                        if (this.emitKey == 'emitWebViewSdkSchemeHandlerDidFailNegative109') {
                          resourceHandler.didFail(WebNetErrorList.ERR_ADDRESS_UNREACHABLE)
                          Utils.emitEvent('success',11109)
                        }
                        if (this.emitKey == 'emitWebViewSdkSchemeHandlerDidFailNegative110') {
                          resourceHandler.didFail(WebNetErrorList.ERR_SSL_CLIENT_AUTH_CERT_NEEDED)
                          Utils.emitEvent('success',11110)
                        }
                        if (this.emitKey == 'emitWebViewSdkSchemeHandlerDidFailNegative111') {
                          resourceHandler.didFail(WebNetErrorList.ERR_TUNNEL_CONNECTION_FAILED)
                          Utils.emitEvent('success',11111)
                        }
                        if (this.emitKey == 'emitWebViewSdkSchemeHandlerDidFailNegative112') {
                          resourceHandler.didFail(WebNetErrorList.ERR_NO_SSL_VERSIONS_ENABLED)
                          Utils.emitEvent('success',11112)
                        }
                        if (this.emitKey == 'emitWebViewSdkSchemeHandlerDidFailNegative113') {
                          resourceHandler.didFail(WebNetErrorList.ERR_SSL_VERSION_OR_CIPHER_MISMATCH)
                          Utils.emitEvent('success',11113)
                        }
                        if (this.emitKey == 'emitWebViewSdkSchemeHandlerDidFailNegative114') {
                          resourceHandler.didFail(WebNetErrorList.ERR_SSL_RENEGOTIATION_REQUESTED)
                          Utils.emitEvent('success',11114)
                        }
                        if (this.emitKey == 'emitWebViewSdkSchemeHandlerDidFailNegative115') {
                          resourceHandler.didFail(WebNetErrorList.ERR_PROXY_AUTH_UNSUPPORTED)
                          Utils.emitEvent('success',11115)
                        }
                        if (this.emitKey == 'emitWebViewSdkSchemeHandlerDidFailNegative117') {
                          resourceHandler.didFail(WebNetErrorList.ERR_BAD_SSL_CLIENT_AUTH_CERT)
                          Utils.emitEvent('success',11117)
                        }
                        if (this.emitKey == 'emitWebViewSdkSchemeHandlerDidFailNegative118') {
                          resourceHandler.didFail(WebNetErrorList.ERR_CONNECTION_TIMED_OUT)
                          Utils.emitEvent('success',11118)
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
