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
struct webViewSdkSchemeHandlerDidFailFly2 {
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
        Button('webViewSdkSchemeHandlerDidFailFlyButton')
          .key('webViewSdkSchemeHandlerDidFailFlyButton')
          .onClick(async () => {
            console.info('key==>' + this.emitKey)
            switch (this.emitKey) {
              case 'emitWebViewSdkSchemeHandlerDidFailNegative119':{
                this.controller.loadUrl($rawfile('sdkSchemeHandler.html'))
                await Utils.sleep(2000)
                break;
              }
              case 'emitWebViewSdkSchemeHandlerDidFailNegative120':{
                this.controller.loadUrl($rawfile('sdkSchemeHandler.html'))
                await Utils.sleep(2000)
                break;
              }
              case 'emitWebViewSdkSchemeHandlerDidFailNegative121':{
                this.controller.loadUrl($rawfile('sdkSchemeHandler.html'))
                await Utils.sleep(2000)
                break;
              }
              case 'emitWebViewSdkSchemeHandlerDidFailNegative122':{
                this.controller.loadUrl($rawfile('sdkSchemeHandler.html'))
                await Utils.sleep(2000)
                break;
              }
              case 'emitWebViewSdkSchemeHandlerDidFailNegative123':{
                this.controller.loadUrl($rawfile('sdkSchemeHandler.html'))
                await Utils.sleep(2000)
                break;
              }
              case 'emitWebViewSdkSchemeHandlerDidFailNegative124':{
                this.controller.loadUrl($rawfile('sdkSchemeHandler.html'))
                await Utils.sleep(2000)
                break;
              }
              case 'emitWebViewSdkSchemeHandlerDidFailNegative125':{
                this.controller.loadUrl($rawfile('sdkSchemeHandler.html'))
                await Utils.sleep(2000)
                break;
              }
              case 'emitWebViewSdkSchemeHandlerDidFailNegative126':{
                this.controller.loadUrl($rawfile('sdkSchemeHandler.html'))
                await Utils.sleep(2000)
                break;
              }
              case 'emitWebViewSdkSchemeHandlerDidFailNegative127':{
                this.controller.loadUrl($rawfile('sdkSchemeHandler.html'))
                await Utils.sleep(2000)
                break;
              }
              case 'emitWebViewSdkSchemeHandlerDidFailNegative130':{
                this.controller.loadUrl($rawfile('sdkSchemeHandler.html'))
                await Utils.sleep(2000)
                break;
              }
              case 'emitWebViewSdkSchemeHandlerDidFailNegative131':{
                this.controller.loadUrl($rawfile('sdkSchemeHandler.html'))
                await Utils.sleep(2000)
                break;
              }
              case 'emitWebViewSdkSchemeHandlerDidFailNegative133':{
                this.controller.loadUrl($rawfile('sdkSchemeHandler.html'))
                await Utils.sleep(2000)
                break;
              }
              case 'emitWebViewSdkSchemeHandlerDidFailNegative134':{
                this.controller.loadUrl($rawfile('sdkSchemeHandler.html'))
                await Utils.sleep(2000)
                break;
              }
              case 'emitWebViewSdkSchemeHandlerDidFailNegative135':{
                this.controller.loadUrl($rawfile('sdkSchemeHandler.html'))
                await Utils.sleep(2000)
                break;
              }
              case 'emitWebViewSdkSchemeHandlerDidFailNegative136':{
                this.controller.loadUrl($rawfile('sdkSchemeHandler.html'))
                await Utils.sleep(2000)
                break;
              }
              case 'emitWebViewSdkSchemeHandlerDidFailNegative137':{
                this.controller.loadUrl($rawfile('sdkSchemeHandler.html'))
                await Utils.sleep(2000)
                break;
              }
              case 'emitWebViewSdkSchemeHandlerDidFailNegative138':{
                this.controller.loadUrl($rawfile('sdkSchemeHandler.html'))
                await Utils.sleep(2000)
                break;
              }
              case 'emitWebViewSdkSchemeHandlerDidFailNegative139':{
                this.controller.loadUrl($rawfile('sdkSchemeHandler.html'))
                await Utils.sleep(2000)
                break;
              }
              case 'emitWebViewSdkSchemeHandlerDidFailNegative140':{
                this.controller.loadUrl($rawfile('sdkSchemeHandler.html'))
                await Utils.sleep(2000)
                break;
              }
              case 'emitWebViewSdkSchemeHandlerDidFailNegative141':{
                this.controller.loadUrl($rawfile('sdkSchemeHandler.html'))
                await Utils.sleep(2000)
                break;
              }
              case 'emitWebViewSdkSchemeHandlerDidFailNegative142':{
                this.controller.loadUrl($rawfile('sdkSchemeHandler.html'))
                await Utils.sleep(2000)
                break;
              }
              case 'emitWebViewSdkSchemeHandlerDidFailNegative145':{
                this.controller.loadUrl($rawfile('sdkSchemeHandler.html'))
                await Utils.sleep(2000)
                break;
              }
              case 'emitWebViewSdkSchemeHandlerDidFailNegative147':{
                this.controller.loadUrl($rawfile('sdkSchemeHandler.html'))
                await Utils.sleep(2000)
                break;
              }
              case 'emitWebViewSdkSchemeHandlerDidFailNegative148':{
                this.controller.loadUrl($rawfile('sdkSchemeHandler.html'))
                await Utils.sleep(2000)
                break;
              }
              case 'emitWebViewSdkSchemeHandlerDidFailNegative149':{
                this.controller.loadUrl($rawfile('sdkSchemeHandler.html'))
                await Utils.sleep(2000)
                break;
              }
              case 'emitWebViewSdkSchemeHandlerDidFailNegative150':{
                this.controller.loadUrl($rawfile('sdkSchemeHandler.html'))
                await Utils.sleep(2000)
                break;
              }
              case 'emitWebViewSdkSchemeHandlerDidFailNegative151':{
                this.controller.loadUrl($rawfile('sdkSchemeHandler.html'))
                await Utils.sleep(2000)
                break;
              }
              case 'emitWebViewSdkSchemeHandlerDidFailNegative153':{
                this.controller.loadUrl($rawfile('sdkSchemeHandler.html'))
                await Utils.sleep(2000)
                break;
              }
              case 'emitWebViewSdkSchemeHandlerDidFailNegative154':{
                this.controller.loadUrl($rawfile('sdkSchemeHandler.html'))
                await Utils.sleep(2000)
                break;
              }
              case 'emitWebViewSdkSchemeHandlerDidFailNegative156':{
                this.controller.loadUrl($rawfile('sdkSchemeHandler.html'))
                await Utils.sleep(2000)
                break;
              }
              case 'emitWebViewSdkSchemeHandlerDidFailNegative159':{
                this.controller.loadUrl($rawfile('sdkSchemeHandler.html'))
                await Utils.sleep(2000)
                break;
              }
              case 'emitWebViewSdkSchemeHandlerDidFailNegative160':{
                this.controller.loadUrl($rawfile('sdkSchemeHandler.html'))
                await Utils.sleep(2000)
                break;
              }
              case 'emitWebViewSdkSchemeHandlerDidFailNegative161':{
                this.controller.loadUrl($rawfile('sdkSchemeHandler.html'))
                await Utils.sleep(2000)
                break;
              }
              case 'emitWebViewSdkSchemeHandlerDidFailNegative162':{
                this.controller.loadUrl($rawfile('sdkSchemeHandler.html'))
                await Utils.sleep(2000)
                break;
              }
              case 'emitWebViewSdkSchemeHandlerDidFailNegative163':{
                this.controller.loadUrl($rawfile('sdkSchemeHandler.html'))
                await Utils.sleep(2000)
                break;
              }
              case 'emitWebViewSdkSchemeHandlerDidFailNegative164':{
                this.controller.loadUrl($rawfile('sdkSchemeHandler.html'))
                await Utils.sleep(2000)
                break;
              }
              case 'emitWebViewSdkSchemeHandlerDidFailNegative166':{
                this.controller.loadUrl($rawfile('sdkSchemeHandler.html'))
                await Utils.sleep(2000)
                break;
              }
              case 'emitWebViewSdkSchemeHandlerDidFailNegative167':{
                this.controller.loadUrl($rawfile('sdkSchemeHandler.html'))
                await Utils.sleep(2000)
                break;
              }
              case 'emitWebViewSdkSchemeHandlerDidFailNegative168':{
                this.controller.loadUrl($rawfile('sdkSchemeHandler.html'))
                await Utils.sleep(2000)
                break;
              }
              case 'emitWebViewSdkSchemeHandlerDidFailNegative169':{
                this.controller.loadUrl($rawfile('sdkSchemeHandler.html'))
                await Utils.sleep(2000)
                break;
              }
              case 'emitWebViewSdkSchemeHandlerDidFailNegative170':{
                this.controller.loadUrl($rawfile('sdkSchemeHandler.html'))
                await Utils.sleep(2000)
                break;
              }
              case 'emitWebViewSdkSchemeHandlerDidFailNegative171':{
                this.controller.loadUrl($rawfile('sdkSchemeHandler.html'))
                await Utils.sleep(2000)
                break;
              }
              case 'emitWebViewSdkSchemeHandlerDidFailNegative172':{
                this.controller.loadUrl($rawfile('sdkSchemeHandler.html'))
                await Utils.sleep(2000)
                break;
              }
              case 'emitWebViewSdkSchemeHandlerDidFailNegative360':{
                this.controller.loadUrl($rawfile('sdkSchemeHandler.html'))
                await Utils.sleep(2000)
                break;
              }
              case 'emitWebViewSdkSchemeHandlerDidFailNegative361':{
                this.controller.loadUrl($rawfile('sdkSchemeHandler.html'))
                await Utils.sleep(2000)
                break;
              }
              case 'emitWebViewSdkSchemeHandlerDidFailNegative362':{
                this.controller.loadUrl($rawfile('sdkSchemeHandler.html'))
                await Utils.sleep(2000)
                break;
              }
              case 'emitWebViewSdkSchemeHandlerDidFailNegative363':{
                this.controller.loadUrl($rawfile('sdkSchemeHandler.html'))
                await Utils.sleep(2000)
                break;
              }
              case 'emitWebViewSdkSchemeHandlerDidFailNegative364':{
                this.controller.loadUrl($rawfile('sdkSchemeHandler.html'))
                await Utils.sleep(2000)
                break;
              }
              case 'emitWebViewSdkSchemeHandlerDidFailNegative365':{
                this.controller.loadUrl($rawfile('sdkSchemeHandler.html'))
                await Utils.sleep(2000)
                break;
              }
              case 'emitWebViewSdkSchemeHandlerDidFailNegative366':{
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
                if (this.emitKey == 'emitWebViewSdkSchemeHandlerDidFailNegative119') {
                  resourceHandler.didFail(WebNetErrorList.ERR_HOST_RESOLVER_QUEUE_TOO_LARGE)
                  Utils.emitEvent('success',11119)
                }
                if (this.emitKey == 'emitWebViewSdkSchemeHandlerDidFailNegative120') {
                  resourceHandler.didFail(WebNetErrorList.ERR_SOCKS_CONNECTION_FAILED)
                  Utils.emitEvent('success',11120)
                }
                if (this.emitKey == 'emitWebViewSdkSchemeHandlerDidFailNegative121') {
                  resourceHandler.didFail(WebNetErrorList.ERR_SOCKS_CONNECTION_HOST_UNREACHABLE)
                  Utils.emitEvent('success',11121)
                }
                if (this.emitKey == 'emitWebViewSdkSchemeHandlerDidFailNegative122') {
                  resourceHandler.didFail(WebNetErrorList.ERR_ALPN_NEGOTIATION_FAILED)
                  Utils.emitEvent('success',11122)
                }
                if (this.emitKey == 'emitWebViewSdkSchemeHandlerDidFailNegative123') {
                  resourceHandler.didFail(WebNetErrorList.ERR_SSL_NO_RENEGOTIATION)
                  Utils.emitEvent('success',11123)
                }
                if (this.emitKey == 'emitWebViewSdkSchemeHandlerDidFailNegative124') {
                  resourceHandler.didFail(WebNetErrorList.ERR_WINSOCK_UNEXPECTED_WRITTEN_BYTES)
                  Utils.emitEvent('success',11124)
                }
                if (this.emitKey == 'emitWebViewSdkSchemeHandlerDidFailNegative125') {
                  resourceHandler.didFail(WebNetErrorList.ERR_SSL_DECOMPRESSION_FAILURE_ALERT)
                  Utils.emitEvent('success',11125)
                }
                if (this.emitKey == 'emitWebViewSdkSchemeHandlerDidFailNegative126') {
                  resourceHandler.didFail(WebNetErrorList.ERR_SSL_BAD_RECORD_MAC_ALERT)
                  Utils.emitEvent('success',11126)
                }
                if (this.emitKey == 'emitWebViewSdkSchemeHandlerDidFailNegative127') {
                  resourceHandler.didFail(WebNetErrorList.ERR_PROXY_AUTH_REQUESTED)
                  Utils.emitEvent('success',11127)
                }
                if (this.emitKey == 'emitWebViewSdkSchemeHandlerDidFailNegative130') {
                  resourceHandler.didFail(WebNetErrorList.ERR_PROXY_CONNECTION_FAILED)
                  Utils.emitEvent('success',11130)
                }
                if (this.emitKey == 'emitWebViewSdkSchemeHandlerDidFailNegative131') {
                  resourceHandler.didFail(WebNetErrorList.ERR_MANDATORY_PROXY_CONFIGURATION_FAILED)
                  Utils.emitEvent('success',11131)
                }
                if (this.emitKey == 'emitWebViewSdkSchemeHandlerDidFailNegative133') {
                  resourceHandler.didFail(WebNetErrorList.ERR_PRECONNECT_MAX_SOCKET_LIMIT)
                  Utils.emitEvent('success',11133)
                }
                if (this.emitKey == 'emitWebViewSdkSchemeHandlerDidFailNegative134') {
                  resourceHandler.didFail(WebNetErrorList.ERR_SSL_CLIENT_AUTH_PRIVATE_KEY_ACCESS_DENIED)
                  Utils.emitEvent('success',11134)
                }
                if (this.emitKey == 'emitWebViewSdkSchemeHandlerDidFailNegative135') {
                  resourceHandler.didFail(WebNetErrorList.ERR_SSL_CLIENT_AUTH_CERT_NO_PRIVATE_KEY)
                  Utils.emitEvent('success',11135)
                }
                if (this.emitKey == 'emitWebViewSdkSchemeHandlerDidFailNegative136') {
                  resourceHandler.didFail(WebNetErrorList.ERR_PROXY_CERTIFICATE_INVALID)
                  Utils.emitEvent('success',11136)
                }
                if (this.emitKey == 'emitWebViewSdkSchemeHandlerDidFailNegative137') {
                  resourceHandler.didFail(WebNetErrorList.ERR_NAME_RESOLUTION_FAILED)
                  Utils.emitEvent('success',11137)
                }
                if (this.emitKey == 'emitWebViewSdkSchemeHandlerDidFailNegative138') {
                  resourceHandler.didFail(WebNetErrorList.ERR_NETWORK_ACCESS_DENIED)
                  Utils.emitEvent('success',11138)
                }
                if (this.emitKey == 'emitWebViewSdkSchemeHandlerDidFailNegative139') {
                  resourceHandler.didFail(WebNetErrorList.ERR_TEMPORARILY_THROTTLED)
                  Utils.emitEvent('success',11139)
                }
                if (this.emitKey == 'emitWebViewSdkSchemeHandlerDidFailNegative140') {
                  resourceHandler.didFail(WebNetErrorList.ERR_HTTPS_PROXY_TUNNEL_RESPONSE_REDIRECT)
                  Utils.emitEvent('success',11140)
                }
                if (this.emitKey == 'emitWebViewSdkSchemeHandlerDidFailNegative141') {
                  resourceHandler.didFail(WebNetErrorList.ERR_SSL_CLIENT_AUTH_SIGNATURE_FAILED)
                  Utils.emitEvent('success',11141)
                }
                if (this.emitKey == 'emitWebViewSdkSchemeHandlerDidFailNegative142') {
                  resourceHandler.didFail(WebNetErrorList.ERR_MSG_TOO_BIG)
                  Utils.emitEvent('success',11142)
                }
                if (this.emitKey == 'emitWebViewSdkSchemeHandlerDidFailNegative145') {
                  resourceHandler.didFail(WebNetErrorList.ERR_WS_PROTOCOL_ERROR)
                  Utils.emitEvent('success',11145)
                }
                if (this.emitKey == 'emitWebViewSdkSchemeHandlerDidFailNegative147') {
                  resourceHandler.didFail(WebNetErrorList.ERR_ADDRESS_IN_USE)
                  Utils.emitEvent('success',11147)
                }
                if (this.emitKey == 'emitWebViewSdkSchemeHandlerDidFailNegative148') {
                  resourceHandler.didFail(WebNetErrorList.ERR_SSL_HANDSHAKE_NOT_COMPLETED)
                  Utils.emitEvent('success',11148)
                }
                if (this.emitKey == 'emitWebViewSdkSchemeHandlerDidFailNegative149') {
                  resourceHandler.didFail(WebNetErrorList.ERR_SSL_BAD_PEER_PUBLIC_KEY)
                  Utils.emitEvent('success',11149)
                }
                if (this.emitKey == 'emitWebViewSdkSchemeHandlerDidFailNegative150') {
                  resourceHandler.didFail(WebNetErrorList.ERR_SSL_PINNED_KEY_NOT_IN_CERT_CHAIN)
                  Utils.emitEvent('success',11150)
                }
                if (this.emitKey == 'emitWebViewSdkSchemeHandlerDidFailNegative151') {
                  resourceHandler.didFail(WebNetErrorList.ERR_CLIENT_AUTH_CERT_TYPE_UNSUPPORTED)
                  Utils.emitEvent('success',11151)
                }
                if (this.emitKey == 'emitWebViewSdkSchemeHandlerDidFailNegative153') {
                  resourceHandler.didFail(WebNetErrorList.ERR_SSL_DECRYPT_ERROR_ALERT)
                  Utils.emitEvent('success',11153)
                }
                if (this.emitKey == 'emitWebViewSdkSchemeHandlerDidFailNegative154') {
                  resourceHandler.didFail(WebNetErrorList.ERR_WS_THROTTLE_QUEUE_TOO_LARGE)
                  Utils.emitEvent('success',11154)
                }
                if (this.emitKey == 'emitWebViewSdkSchemeHandlerDidFailNegative156') {
                  resourceHandler.didFail(WebNetErrorList.ERR_SSL_SERVER_CERT_CHANGED)
                  Utils.emitEvent('success',11156)
                }
                if (this.emitKey == 'emitWebViewSdkSchemeHandlerDidFailNegative159') {
                  resourceHandler.didFail(WebNetErrorList.ERR_SSL_UNRECOGNIZED_NAME_ALERT)
                  Utils.emitEvent('success',11159)
                }
                if (this.emitKey == 'emitWebViewSdkSchemeHandlerDidFailNegative160') {
                  resourceHandler.didFail(WebNetErrorList.ERR_SOCKET_SET_RECEIVE_BUFFER_SIZE_ERROR)
                  Utils.emitEvent('success',11160)
                }
                if (this.emitKey == 'emitWebViewSdkSchemeHandlerDidFailNegative161') {
                  resourceHandler.didFail(WebNetErrorList.ERR_SOCKET_SET_SEND_BUFFER_SIZE_ERROR)
                  Utils.emitEvent('success',11161)
                }
                if (this.emitKey == 'emitWebViewSdkSchemeHandlerDidFailNegative162') {
                  resourceHandler.didFail(WebNetErrorList.ERR_SOCKET_RECEIVE_BUFFER_SIZE_UNCHANGEABLE)
                  Utils.emitEvent('success',11162)
                }
                if (this.emitKey == 'emitWebViewSdkSchemeHandlerDidFailNegative163') {
                  resourceHandler.didFail(WebNetErrorList.ERR_SOCKET_SEND_BUFFER_SIZE_UNCHANGEABLE)
                  Utils.emitEvent('success',11163)
                }
                if (this.emitKey == 'emitWebViewSdkSchemeHandlerDidFailNegative164') {
                  resourceHandler.didFail(WebNetErrorList.ERR_SSL_CLIENT_AUTH_CERT_BAD_FORMAT)
                  Utils.emitEvent('success',11164)
                }
                if (this.emitKey == 'emitWebViewSdkSchemeHandlerDidFailNegative166') {
                  resourceHandler.didFail(WebNetErrorList.ERR_ICANN_NAME_COLLISION)
                  Utils.emitEvent('success',11166)
                }
                if (this.emitKey == 'emitWebViewSdkSchemeHandlerDidFailNegative167') {
                  resourceHandler.didFail(WebNetErrorList.ERR_SSL_SERVER_CERT_BAD_FORMAT)
                  Utils.emitEvent('success',11167)
                }
                if (this.emitKey == 'emitWebViewSdkSchemeHandlerDidFailNegative168') {
                  resourceHandler.didFail(WebNetErrorList.ERR_CT_STH_PARSING_FAILED)
                  Utils.emitEvent('success',11168)
                }
                if (this.emitKey == 'emitWebViewSdkSchemeHandlerDidFailNegative169') {
                  resourceHandler.didFail(WebNetErrorList.ERR_CT_STH_INCOMPLETE)
                  Utils.emitEvent('success',11169)
                }
                if (this.emitKey == 'emitWebViewSdkSchemeHandlerDidFailNegative170') {
                  resourceHandler.didFail(WebNetErrorList.ERR_UNABLE_TO_REUSE_CONNECTION_FOR_PROXY_AUTH)
                  Utils.emitEvent('success',11170)
                }
                if (this.emitKey == 'emitWebViewSdkSchemeHandlerDidFailNegative171') {
                  resourceHandler.didFail(WebNetErrorList.ERR_CT_CONSISTENCY_PROOF_PARSING_FAILED)
                  Utils.emitEvent('success',11171)
                }
                if (this.emitKey == 'emitWebViewSdkSchemeHandlerDidFailNegative172') {
                  resourceHandler.didFail(WebNetErrorList.ERR_SSL_OBSOLETE_CIPHER)
                  Utils.emitEvent('success',11172)
                }
                if (this.emitKey == 'emitWebViewSdkSchemeHandlerDidFailNegative360') {
                  resourceHandler.didFail(WebNetErrorList.ERR_HTTP2_INADEQUATE_TRANSPORT_SECURITY)
                  Utils.emitEvent('success',11360)
                }
                if (this.emitKey == 'emitWebViewSdkSchemeHandlerDidFailNegative361') {
                  resourceHandler.didFail(WebNetErrorList.ERR_HTTP2_FLOW_CONTROL_ERROR)
                  Utils.emitEvent('success',11361)
                }
                if (this.emitKey == 'emitWebViewSdkSchemeHandlerDidFailNegative362') {
                  resourceHandler.didFail(WebNetErrorList.ERR_HTTP2_FRAME_SIZE_ERROR)
                  Utils.emitEvent('success',11362)
                }
                if (this.emitKey == 'emitWebViewSdkSchemeHandlerDidFailNegative363') {
                  resourceHandler.didFail(WebNetErrorList.ERR_HTTP2_COMPRESSION_ERROR)
                  Utils.emitEvent('success',11363)
                }
                if (this.emitKey == 'emitWebViewSdkSchemeHandlerDidFailNegative364') {
                  resourceHandler.didFail(WebNetErrorList.ERR_PROXY_AUTH_REQUESTED_WITH_NO_CONNECTION)
                  Utils.emitEvent('success',11364)
                }
                if (this.emitKey == 'emitWebViewSdkSchemeHandlerDidFailNegative365') {
                  resourceHandler.didFail(WebNetErrorList.ERR_HTTP_1_1_REQUIRED)
                  Utils.emitEvent('success',11365)
                }
                if (this.emitKey == 'emitWebViewSdkSchemeHandlerDidFailNegative366') {
                  resourceHandler.didFail(WebNetErrorList.ERR_PROXY_HTTP_1_1_REQUIRED)
                  Utils.emitEvent('success',11366)
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
