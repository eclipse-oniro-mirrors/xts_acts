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
  @State isReceive: number = -1;
  @State isPageEnd: number = -1;
  requests:webview.WebSchemeHandlerRequest[] = []
  scheme1: webview.WebCustomScheme = {
    schemeName: 'custom', isSupportCORS: true, isSupportFetch: true
  }
  htmlData: string = '{"test":1}';

  onPageShow() {
    let valueChangeEvent: events_emitter.InnerEvent = {
      eventId: 121690,
      priority: events_emitter.EventPriority.LOW
    }
    events_emitter.on(valueChangeEvent, this.valueChangeCallBack)
  }

  onPageHide() {
    events_emitter.off(121690)
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
              case 'emitWebViewSdkSchemeHandlerDidFailNegative119':{
                this.isPageEnd = -1;
                this.controller.loadUrl($rawfile('sdkSchemeHandler.html'))
                await waitForExist(()=>this.isPageEnd, 'emitWebViewSdkSchemeHandlerDidFailNegative119 IsPageEnd', 0);
                break;
              }
              case 'emitWebViewSdkSchemeHandlerDidFailNegative120':{
                this.isPageEnd = -1;
                this.controller.loadUrl($rawfile('sdkSchemeHandler.html'))
                await waitForExist(()=>this.isPageEnd, 'emitWebViewSdkSchemeHandlerDidFailNegative120 IsPageEnd', 0);
                break;
              }
              case 'emitWebViewSdkSchemeHandlerDidFailNegative121':{
                this.isPageEnd = -1;
                this.controller.loadUrl($rawfile('sdkSchemeHandler.html'))
                await waitForExist(()=>this.isPageEnd, 'emitWebViewSdkSchemeHandlerDidFailNegative121 IsPageEnd', 0);
                break;
              }
              case 'emitWebViewSdkSchemeHandlerDidFailNegative122':{
                this.isPageEnd = -1;
                this.controller.loadUrl($rawfile('sdkSchemeHandler.html'))
                await waitForExist(()=>this.isPageEnd, 'emitWebViewSdkSchemeHandlerDidFailNegative122 IsPageEnd', 0);
                break;
              }
              case 'emitWebViewSdkSchemeHandlerDidFailNegative123':{
                this.isPageEnd = -1;
                this.controller.loadUrl($rawfile('sdkSchemeHandler.html'))
                await waitForExist(()=>this.isPageEnd, 'emitWebViewSdkSchemeHandlerDidFailNegative123 IsPageEnd', 0);
                break;
              }
              case 'emitWebViewSdkSchemeHandlerDidFailNegative124':{
                this.isPageEnd = -1;
                this.controller.loadUrl($rawfile('sdkSchemeHandler.html'))
                await waitForExist(()=>this.isPageEnd, 'emitWebViewSdkSchemeHandlerDidFailNegative124 IsPageEnd', 0);
                break;
              }
              case 'emitWebViewSdkSchemeHandlerDidFailNegative125':{
                this.isPageEnd = -1;
                this.controller.loadUrl($rawfile('sdkSchemeHandler.html'))
                await waitForExist(()=>this.isPageEnd, 'emitWebViewSdkSchemeHandlerDidFailNegative125 IsPageEnd', 0);
                break;
              }
              case 'emitWebViewSdkSchemeHandlerDidFailNegative126':{
                this.isPageEnd = -1;
                this.controller.loadUrl($rawfile('sdkSchemeHandler.html'))
                await waitForExist(()=>this.isPageEnd, 'emitWebViewSdkSchemeHandlerDidFailNegative126 IsPageEnd', 0);
                break;
              }
              case 'emitWebViewSdkSchemeHandlerDidFailNegative127':{
                this.isPageEnd = -1;
                this.controller.loadUrl($rawfile('sdkSchemeHandler.html'))
                await waitForExist(()=>this.isPageEnd, 'emitWebViewSdkSchemeHandlerDidFailNegative127 IsPageEnd', 0);
                break;
              }
              case 'emitWebViewSdkSchemeHandlerDidFailNegative130':{
                this.isPageEnd = -1;
                this.controller.loadUrl($rawfile('sdkSchemeHandler.html'))
                await waitForExist(()=>this.isPageEnd, 'emitWebViewSdkSchemeHandlerDidFailNegative130 IsPageEnd', 0);
                break;
              }
              case 'emitWebViewSdkSchemeHandlerDidFailNegative131':{
                this.isPageEnd = -1;
                this.controller.loadUrl($rawfile('sdkSchemeHandler.html'))
                await waitForExist(()=>this.isPageEnd, 'emitWebViewSdkSchemeHandlerDidFailNegative131 IsPageEnd', 0);
                break;
              }
              case 'emitWebViewSdkSchemeHandlerDidFailNegative133':{
                this.isPageEnd = -1;
                this.controller.loadUrl($rawfile('sdkSchemeHandler.html'))
                await waitForExist(()=>this.isPageEnd, 'emitWebViewSdkSchemeHandlerDidFailNegative133 IsPageEnd', 0);
                break;
              }
              case 'emitWebViewSdkSchemeHandlerDidFailNegative134':{
                this.isPageEnd = -1;
                this.controller.loadUrl($rawfile('sdkSchemeHandler.html'))
                await waitForExist(()=>this.isPageEnd, 'emitWebViewSdkSchemeHandlerDidFailNegative134 IsPageEnd', 0);
                break;
              }
              case 'emitWebViewSdkSchemeHandlerDidFailNegative135':{
                this.isPageEnd = -1;
                this.controller.loadUrl($rawfile('sdkSchemeHandler.html'))
                await waitForExist(()=>this.isPageEnd, 'emitWebViewSdkSchemeHandlerDidFailNegative135 IsPageEnd', 0);
                break;
              }
              case 'emitWebViewSdkSchemeHandlerDidFailNegative136':{
                this.isPageEnd = -1;
                this.controller.loadUrl($rawfile('sdkSchemeHandler.html'))
                await waitForExist(()=>this.isPageEnd, 'emitWebViewSdkSchemeHandlerDidFailNegative136 IsPageEnd', 0);
                break;
              }
              case 'emitWebViewSdkSchemeHandlerDidFailNegative137':{
                this.isPageEnd = -1;
                this.controller.loadUrl($rawfile('sdkSchemeHandler.html'))
                await waitForExist(()=>this.isPageEnd, 'emitWebViewSdkSchemeHandlerDidFailNegative137 IsPageEnd', 0);
                break;
              }
              case 'emitWebViewSdkSchemeHandlerDidFailNegative138':{
                this.isPageEnd = -1;
                this.controller.loadUrl($rawfile('sdkSchemeHandler.html'))
                await waitForExist(()=>this.isPageEnd, 'emitWebViewSdkSchemeHandlerDidFailNegative138 IsPageEnd', 0);
                break;
              }
              case 'emitWebViewSdkSchemeHandlerDidFailNegative139':{
                this.isPageEnd = -1;
                this.controller.loadUrl($rawfile('sdkSchemeHandler.html'))
                await waitForExist(()=>this.isPageEnd, 'emitWebViewSdkSchemeHandlerDidFailNegative139 IsPageEnd', 0);
                break;
              }
              case 'emitWebViewSdkSchemeHandlerDidFailNegative140':{
                this.isPageEnd = -1;
                this.controller.loadUrl($rawfile('sdkSchemeHandler.html'))
                await waitForExist(()=>this.isPageEnd, 'emitWebViewSdkSchemeHandlerDidFailNegative140 IsPageEnd', 0);
                break;
              }
              case 'emitWebViewSdkSchemeHandlerDidFailNegative141':{
                this.isPageEnd = -1;
                this.controller.loadUrl($rawfile('sdkSchemeHandler.html'))
                await waitForExist(()=>this.isPageEnd, 'emitWebViewSdkSchemeHandlerDidFailNegative141 IsPageEnd', 0);
                break;
              }
              case 'emitWebViewSdkSchemeHandlerDidFailNegative142':{
                this.isPageEnd = -1;
                this.controller.loadUrl($rawfile('sdkSchemeHandler.html'))
                await waitForExist(()=>this.isPageEnd, 'emitWebViewSdkSchemeHandlerDidFailNegative142 IsPageEnd', 0);
                break;
              }
              case 'emitWebViewSdkSchemeHandlerDidFailNegative145':{
                this.isPageEnd = -1;
                this.controller.loadUrl($rawfile('sdkSchemeHandler.html'))
                await waitForExist(()=>this.isPageEnd, 'emitWebViewSdkSchemeHandlerDidFailNegative145 IsPageEnd', 0);
                break;
              }
              case 'emitWebViewSdkSchemeHandlerDidFailNegative147':{
                this.isPageEnd = -1;
                this.controller.loadUrl($rawfile('sdkSchemeHandler.html'))
                await waitForExist(()=>this.isPageEnd, 'emitWebViewSdkSchemeHandlerDidFailNegative147 IsPageEnd', 0);
                break;
              }
              case 'emitWebViewSdkSchemeHandlerDidFailNegative148':{
                this.isPageEnd = -1;
                this.controller.loadUrl($rawfile('sdkSchemeHandler.html'))
                await waitForExist(()=>this.isPageEnd, 'emitWebViewSdkSchemeHandlerDidFailNegative148 IsPageEnd', 0);
                break;
              }
              case 'emitWebViewSdkSchemeHandlerDidFailNegative149':{
                this.isPageEnd = -1;
                this.controller.loadUrl($rawfile('sdkSchemeHandler.html'))
                await waitForExist(()=>this.isPageEnd, 'emitWebViewSdkSchemeHandlerDidFailNegative149 IsPageEnd', 0);
                break;
              }
              case 'emitWebViewSdkSchemeHandlerDidFailNegative150':{
                this.isPageEnd = -1;
                this.controller.loadUrl($rawfile('sdkSchemeHandler.html'))
                await waitForExist(()=>this.isPageEnd, 'emitWebViewSdkSchemeHandlerDidFailNegative150 IsPageEnd', 0);
                break;
              }
              case 'emitWebViewSdkSchemeHandlerDidFailNegative151':{
                this.isPageEnd = -1;
                this.controller.loadUrl($rawfile('sdkSchemeHandler.html'))
                await waitForExist(()=>this.isPageEnd, 'emitWebViewSdkSchemeHandlerDidFailNegative151 IsPageEnd', 0);
                break;
              }
              case 'emitWebViewSdkSchemeHandlerDidFailNegative153':{
                this.isPageEnd = -1;
                this.controller.loadUrl($rawfile('sdkSchemeHandler.html'))
                await waitForExist(()=>this.isPageEnd, 'emitWebViewSdkSchemeHandlerDidFailNegative153 IsPageEnd', 0);
                break;
              }
              case 'emitWebViewSdkSchemeHandlerDidFailNegative154':{
                this.isPageEnd = -1;
                this.controller.loadUrl($rawfile('sdkSchemeHandler.html'))
                await waitForExist(()=>this.isPageEnd, 'emitWebViewSdkSchemeHandlerDidFailNegative154 IsPageEnd', 0);
                break;
              }
              case 'emitWebViewSdkSchemeHandlerDidFailNegative156':{
                this.isPageEnd = -1;
                this.controller.loadUrl($rawfile('sdkSchemeHandler.html'))
                await waitForExist(()=>this.isPageEnd, 'emitWebViewSdkSchemeHandlerDidFailNegative156 IsPageEnd', 0);
                break;
              }
              case 'emitWebViewSdkSchemeHandlerDidFailNegative159':{
                this.isPageEnd = -1;
                this.controller.loadUrl($rawfile('sdkSchemeHandler.html'))
                await waitForExist(()=>this.isPageEnd, 'emitWebViewSdkSchemeHandlerDidFailNegative159 IsPageEnd', 0);
                break;
              }
              case 'emitWebViewSdkSchemeHandlerDidFailNegative160':{
                this.isPageEnd = -1;
                this.controller.loadUrl($rawfile('sdkSchemeHandler.html'))
                await waitForExist(()=>this.isPageEnd, 'emitWebViewSdkSchemeHandlerDidFailNegative160 IsPageEnd', 0);
                break;
              }
              case 'emitWebViewSdkSchemeHandlerDidFailNegative161':{
                this.isPageEnd = -1;
                this.controller.loadUrl($rawfile('sdkSchemeHandler.html'))
                await waitForExist(()=>this.isPageEnd, 'emitWebViewSdkSchemeHandlerDidFailNegative161 IsPageEnd', 0);
                break;
              }
              case 'emitWebViewSdkSchemeHandlerDidFailNegative162':{
                this.isPageEnd = -1;
                this.controller.loadUrl($rawfile('sdkSchemeHandler.html'))
                await waitForExist(()=>this.isPageEnd, 'emitWebViewSdkSchemeHandlerDidFailNegative162 IsPageEnd', 0);
                break;
              }
              case 'emitWebViewSdkSchemeHandlerDidFailNegative163':{
                this.isPageEnd = -1;
                this.controller.loadUrl($rawfile('sdkSchemeHandler.html'))
                await waitForExist(()=>this.isPageEnd, 'emitWebViewSdkSchemeHandlerDidFailNegative163 IsPageEnd', 0);
                break;
              }
              case 'emitWebViewSdkSchemeHandlerDidFailNegative164':{
                this.isPageEnd = -1;
                this.controller.loadUrl($rawfile('sdkSchemeHandler.html'))
                await waitForExist(()=>this.isPageEnd, 'emitWebViewSdkSchemeHandlerDidFailNegative164 IsPageEnd', 0);
                break;
              }
              case 'emitWebViewSdkSchemeHandlerDidFailNegative166':{
                this.isPageEnd = -1;
                this.controller.loadUrl($rawfile('sdkSchemeHandler.html'))
                await waitForExist(()=>this.isPageEnd, 'emitWebViewSdkSchemeHandlerDidFailNegative166 IsPageEnd', 0);
                break;
              }
              case 'emitWebViewSdkSchemeHandlerDidFailNegative167':{
                this.isPageEnd = -1;
                this.controller.loadUrl($rawfile('sdkSchemeHandler.html'))
                await waitForExist(()=>this.isPageEnd, 'emitWebViewSdkSchemeHandlerDidFailNegative167 IsPageEnd', 0);
                break;
              }
              case 'emitWebViewSdkSchemeHandlerDidFailNegative168':{
                this.isPageEnd = -1;
                this.controller.loadUrl($rawfile('sdkSchemeHandler.html'))
                await waitForExist(()=>this.isPageEnd, 'emitWebViewSdkSchemeHandlerDidFailNegative168 IsPageEnd', 0);
                break;
              }
              case 'emitWebViewSdkSchemeHandlerDidFailNegative169':{
                this.isPageEnd = -1;
                this.controller.loadUrl($rawfile('sdkSchemeHandler.html'))
                await waitForExist(()=>this.isPageEnd, 'emitWebViewSdkSchemeHandlerDidFailNegative169 IsPageEnd', 0);
                break;
              }
              case 'emitWebViewSdkSchemeHandlerDidFailNegative170':{
                this.isPageEnd = -1;
                this.controller.loadUrl($rawfile('sdkSchemeHandler.html'))
                await waitForExist(()=>this.isPageEnd, 'emitWebViewSdkSchemeHandlerDidFailNegative170 IsPageEnd', 0);
                break;
              }
              case 'emitWebViewSdkSchemeHandlerDidFailNegative171':{
                this.isPageEnd = -1;
                this.controller.loadUrl($rawfile('sdkSchemeHandler.html'))
                await waitForExist(()=>this.isPageEnd, 'emitWebViewSdkSchemeHandlerDidFailNegative171 IsPageEnd', 0);
                break;
              }
              case 'emitWebViewSdkSchemeHandlerDidFailNegative172':{
                this.isPageEnd = -1;
                this.controller.loadUrl($rawfile('sdkSchemeHandler.html'))
                await waitForExist(()=>this.isPageEnd, 'emitWebViewSdkSchemeHandlerDidFailNegative172 IsPageEnd', 0);
                break;
              }
              case 'emitWebViewSdkSchemeHandlerDidFailNegative360':{
                this.isPageEnd = -1;
                this.controller.loadUrl($rawfile('sdkSchemeHandler.html'))
                await waitForExist(()=>this.isPageEnd, 'emitWebViewSdkSchemeHandlerDidFailNegative360 IsPageEnd', 0);
                break;
              }
              case 'emitWebViewSdkSchemeHandlerDidFailNegative361':{
                this.isPageEnd = -1;
                this.controller.loadUrl($rawfile('sdkSchemeHandler.html'))
                await waitForExist(()=>this.isPageEnd, 'emitWebViewSdkSchemeHandlerDidFailNegative361 IsPageEnd', 0);
                break;
              }
              case 'emitWebViewSdkSchemeHandlerDidFailNegative362':{
                this.isPageEnd = -1;
                this.controller.loadUrl($rawfile('sdkSchemeHandler.html'))
                await waitForExist(()=>this.isPageEnd, 'emitWebViewSdkSchemeHandlerDidFailNegative362 IsPageEnd', 0);
                break;
              }
              case 'emitWebViewSdkSchemeHandlerDidFailNegative363':{
                this.isPageEnd = -1;
                this.controller.loadUrl($rawfile('sdkSchemeHandler.html'))
                await waitForExist(()=>this.isPageEnd, 'emitWebViewSdkSchemeHandlerDidFailNegative363 IsPageEnd', 0);
                break;
              }
              case 'emitWebViewSdkSchemeHandlerDidFailNegative364':{
                this.isPageEnd = -1;
                this.controller.loadUrl($rawfile('sdkSchemeHandler.html'))
                await waitForExist(()=>this.isPageEnd, 'emitWebViewSdkSchemeHandlerDidFailNegative364 IsPageEnd', 0);
                break;
              }
              case 'emitWebViewSdkSchemeHandlerDidFailNegative365':{
                this.isPageEnd = -1;
                this.controller.loadUrl($rawfile('sdkSchemeHandler.html'))
                await waitForExist(()=>this.isPageEnd, 'emitWebViewSdkSchemeHandlerDidFailNegative365 IsPageEnd', 0);
                break;
              }
              case 'emitWebViewSdkSchemeHandlerDidFailNegative366':{
                this.isPageEnd = -1;
                this.controller.loadUrl($rawfile('sdkSchemeHandler.html'))
                await waitForExist(()=>this.isPageEnd, 'emitWebViewSdkSchemeHandlerDidFailNegative366 IsPageEnd', 0);
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
                  Utils.emitEvent('success',121700)
                }
                if (this.emitKey == 'emitWebViewSdkSchemeHandlerDidFailNegative120') {
                  resourceHandler.didFail(WebNetErrorList.ERR_SOCKS_CONNECTION_FAILED)
                  Utils.emitEvent('success',121710)
                }
                if (this.emitKey == 'emitWebViewSdkSchemeHandlerDidFailNegative121') {
                  resourceHandler.didFail(WebNetErrorList.ERR_SOCKS_CONNECTION_HOST_UNREACHABLE)
                  Utils.emitEvent('success',121720)
                }
                if (this.emitKey == 'emitWebViewSdkSchemeHandlerDidFailNegative122') {
                  resourceHandler.didFail(WebNetErrorList.ERR_ALPN_NEGOTIATION_FAILED)
                  Utils.emitEvent('success',121730)
                }
                if (this.emitKey == 'emitWebViewSdkSchemeHandlerDidFailNegative123') {
                  resourceHandler.didFail(WebNetErrorList.ERR_SSL_NO_RENEGOTIATION)
                  Utils.emitEvent('success',121740)
                }
                if (this.emitKey == 'emitWebViewSdkSchemeHandlerDidFailNegative124') {
                  resourceHandler.didFail(WebNetErrorList.ERR_WINSOCK_UNEXPECTED_WRITTEN_BYTES)
                  Utils.emitEvent('success',121750)
                }
                if (this.emitKey == 'emitWebViewSdkSchemeHandlerDidFailNegative125') {
                  resourceHandler.didFail(WebNetErrorList.ERR_SSL_DECOMPRESSION_FAILURE_ALERT)
                  Utils.emitEvent('success',121760)
                }
                if (this.emitKey == 'emitWebViewSdkSchemeHandlerDidFailNegative126') {
                  resourceHandler.didFail(WebNetErrorList.ERR_SSL_BAD_RECORD_MAC_ALERT)
                  Utils.emitEvent('success',121770)
                }
                if (this.emitKey == 'emitWebViewSdkSchemeHandlerDidFailNegative127') {
                  resourceHandler.didFail(WebNetErrorList.ERR_PROXY_AUTH_REQUESTED)
                  Utils.emitEvent('success',121780)
                }
                if (this.emitKey == 'emitWebViewSdkSchemeHandlerDidFailNegative130') {
                  resourceHandler.didFail(WebNetErrorList.ERR_PROXY_CONNECTION_FAILED)
                  Utils.emitEvent('success',121790)
                }
                if (this.emitKey == 'emitWebViewSdkSchemeHandlerDidFailNegative131') {
                  resourceHandler.didFail(WebNetErrorList.ERR_MANDATORY_PROXY_CONFIGURATION_FAILED)
                  Utils.emitEvent('success',121800)
                }
                if (this.emitKey == 'emitWebViewSdkSchemeHandlerDidFailNegative133') {
                  resourceHandler.didFail(WebNetErrorList.ERR_PRECONNECT_MAX_SOCKET_LIMIT)
                  Utils.emitEvent('success',121810)
                }
                if (this.emitKey == 'emitWebViewSdkSchemeHandlerDidFailNegative134') {
                  resourceHandler.didFail(WebNetErrorList.ERR_SSL_CLIENT_AUTH_PRIVATE_KEY_ACCESS_DENIED)
                  Utils.emitEvent('success',121820)
                }
                if (this.emitKey == 'emitWebViewSdkSchemeHandlerDidFailNegative135') {
                  resourceHandler.didFail(WebNetErrorList.ERR_SSL_CLIENT_AUTH_CERT_NO_PRIVATE_KEY)
                  Utils.emitEvent('success',121830)
                }
                if (this.emitKey == 'emitWebViewSdkSchemeHandlerDidFailNegative136') {
                  resourceHandler.didFail(WebNetErrorList.ERR_PROXY_CERTIFICATE_INVALID)
                  Utils.emitEvent('success',121840)
                }
                if (this.emitKey == 'emitWebViewSdkSchemeHandlerDidFailNegative137') {
                  resourceHandler.didFail(WebNetErrorList.ERR_NAME_RESOLUTION_FAILED)
                  Utils.emitEvent('success',121850)
                }
                if (this.emitKey == 'emitWebViewSdkSchemeHandlerDidFailNegative138') {
                  resourceHandler.didFail(WebNetErrorList.ERR_NETWORK_ACCESS_DENIED)
                  Utils.emitEvent('success',121860)
                }
                if (this.emitKey == 'emitWebViewSdkSchemeHandlerDidFailNegative139') {
                  resourceHandler.didFail(WebNetErrorList.ERR_TEMPORARILY_THROTTLED)
                  Utils.emitEvent('success',121870)
                }
                if (this.emitKey == 'emitWebViewSdkSchemeHandlerDidFailNegative140') {
                  resourceHandler.didFail(WebNetErrorList.ERR_HTTPS_PROXY_TUNNEL_RESPONSE_REDIRECT)
                  Utils.emitEvent('success',121880)
                }
                if (this.emitKey == 'emitWebViewSdkSchemeHandlerDidFailNegative141') {
                  resourceHandler.didFail(WebNetErrorList.ERR_SSL_CLIENT_AUTH_SIGNATURE_FAILED)
                  Utils.emitEvent('success',121890)
                }
                if (this.emitKey == 'emitWebViewSdkSchemeHandlerDidFailNegative142') {
                  resourceHandler.didFail(WebNetErrorList.ERR_MSG_TOO_BIG)
                  Utils.emitEvent('success',121900)
                }
                if (this.emitKey == 'emitWebViewSdkSchemeHandlerDidFailNegative145') {
                  resourceHandler.didFail(WebNetErrorList.ERR_WS_PROTOCOL_ERROR)
                  Utils.emitEvent('success',121910)
                }
                if (this.emitKey == 'emitWebViewSdkSchemeHandlerDidFailNegative147') {
                  resourceHandler.didFail(WebNetErrorList.ERR_ADDRESS_IN_USE)
                  Utils.emitEvent('success',121920)
                }
                if (this.emitKey == 'emitWebViewSdkSchemeHandlerDidFailNegative148') {
                  resourceHandler.didFail(WebNetErrorList.ERR_SSL_HANDSHAKE_NOT_COMPLETED)
                  Utils.emitEvent('success',121930)
                }
                if (this.emitKey == 'emitWebViewSdkSchemeHandlerDidFailNegative149') {
                  resourceHandler.didFail(WebNetErrorList.ERR_SSL_BAD_PEER_PUBLIC_KEY)
                  Utils.emitEvent('success',121940)
                }
                if (this.emitKey == 'emitWebViewSdkSchemeHandlerDidFailNegative150') {
                  resourceHandler.didFail(WebNetErrorList.ERR_SSL_PINNED_KEY_NOT_IN_CERT_CHAIN)
                  Utils.emitEvent('success',121950)
                }
                if (this.emitKey == 'emitWebViewSdkSchemeHandlerDidFailNegative151') {
                  resourceHandler.didFail(WebNetErrorList.ERR_CLIENT_AUTH_CERT_TYPE_UNSUPPORTED)
                  Utils.emitEvent('success',121960)
                }
                if (this.emitKey == 'emitWebViewSdkSchemeHandlerDidFailNegative153') {
                  resourceHandler.didFail(WebNetErrorList.ERR_SSL_DECRYPT_ERROR_ALERT)
                  Utils.emitEvent('success',121970)
                }
                if (this.emitKey == 'emitWebViewSdkSchemeHandlerDidFailNegative154') {
                  resourceHandler.didFail(WebNetErrorList.ERR_WS_THROTTLE_QUEUE_TOO_LARGE)
                  Utils.emitEvent('success',121980)
                }
                if (this.emitKey == 'emitWebViewSdkSchemeHandlerDidFailNegative156') {
                  resourceHandler.didFail(WebNetErrorList.ERR_SSL_SERVER_CERT_CHANGED)
                  Utils.emitEvent('success',121990)
                }
                if (this.emitKey == 'emitWebViewSdkSchemeHandlerDidFailNegative159') {
                  resourceHandler.didFail(WebNetErrorList.ERR_SSL_UNRECOGNIZED_NAME_ALERT)
                  Utils.emitEvent('success',122000)
                }
                if (this.emitKey == 'emitWebViewSdkSchemeHandlerDidFailNegative160') {
                  resourceHandler.didFail(WebNetErrorList.ERR_SOCKET_SET_RECEIVE_BUFFER_SIZE_ERROR)
                  Utils.emitEvent('success',122010)
                }
                if (this.emitKey == 'emitWebViewSdkSchemeHandlerDidFailNegative161') {
                  resourceHandler.didFail(WebNetErrorList.ERR_SOCKET_SET_SEND_BUFFER_SIZE_ERROR)
                  Utils.emitEvent('success',122020)
                }
                if (this.emitKey == 'emitWebViewSdkSchemeHandlerDidFailNegative162') {
                  resourceHandler.didFail(WebNetErrorList.ERR_SOCKET_RECEIVE_BUFFER_SIZE_UNCHANGEABLE)
                  Utils.emitEvent('success',122030)
                }
                if (this.emitKey == 'emitWebViewSdkSchemeHandlerDidFailNegative163') {
                  resourceHandler.didFail(WebNetErrorList.ERR_SOCKET_SEND_BUFFER_SIZE_UNCHANGEABLE)
                  Utils.emitEvent('success',122040)
                }
                if (this.emitKey == 'emitWebViewSdkSchemeHandlerDidFailNegative164') {
                  resourceHandler.didFail(WebNetErrorList.ERR_SSL_CLIENT_AUTH_CERT_BAD_FORMAT)
                  Utils.emitEvent('success',122050)
                }
                if (this.emitKey == 'emitWebViewSdkSchemeHandlerDidFailNegative166') {
                  resourceHandler.didFail(WebNetErrorList.ERR_ICANN_NAME_COLLISION)
                  Utils.emitEvent('success',122060)
                }
                if (this.emitKey == 'emitWebViewSdkSchemeHandlerDidFailNegative167') {
                  resourceHandler.didFail(WebNetErrorList.ERR_SSL_SERVER_CERT_BAD_FORMAT)
                  Utils.emitEvent('success',122070)
                }
                if (this.emitKey == 'emitWebViewSdkSchemeHandlerDidFailNegative168') {
                  resourceHandler.didFail(WebNetErrorList.ERR_CT_STH_PARSING_FAILED)
                  Utils.emitEvent('success',122080)
                }
                if (this.emitKey == 'emitWebViewSdkSchemeHandlerDidFailNegative169') {
                  resourceHandler.didFail(WebNetErrorList.ERR_CT_STH_INCOMPLETE)
                  Utils.emitEvent('success',122090)
                }
                if (this.emitKey == 'emitWebViewSdkSchemeHandlerDidFailNegative170') {
                  resourceHandler.didFail(WebNetErrorList.ERR_UNABLE_TO_REUSE_CONNECTION_FOR_PROXY_AUTH)
                  Utils.emitEvent('success',122100)
                }
                if (this.emitKey == 'emitWebViewSdkSchemeHandlerDidFailNegative171') {
                  resourceHandler.didFail(WebNetErrorList.ERR_CT_CONSISTENCY_PROOF_PARSING_FAILED)
                  Utils.emitEvent('success',122110)
                }
                if (this.emitKey == 'emitWebViewSdkSchemeHandlerDidFailNegative172') {
                  resourceHandler.didFail(WebNetErrorList.ERR_SSL_OBSOLETE_CIPHER)
                  Utils.emitEvent('success',122120)
                }
                if (this.emitKey == 'emitWebViewSdkSchemeHandlerDidFailNegative360') {
                  resourceHandler.didFail(WebNetErrorList.ERR_HTTP2_INADEQUATE_TRANSPORT_SECURITY)
                  Utils.emitEvent('success',122130)
                }
                if (this.emitKey == 'emitWebViewSdkSchemeHandlerDidFailNegative361') {
                  resourceHandler.didFail(WebNetErrorList.ERR_HTTP2_FLOW_CONTROL_ERROR)
                  Utils.emitEvent('success',122140)
                }
                if (this.emitKey == 'emitWebViewSdkSchemeHandlerDidFailNegative362') {
                  resourceHandler.didFail(WebNetErrorList.ERR_HTTP2_FRAME_SIZE_ERROR)
                  Utils.emitEvent('success',122150)
                }
                if (this.emitKey == 'emitWebViewSdkSchemeHandlerDidFailNegative363') {
                  resourceHandler.didFail(WebNetErrorList.ERR_HTTP2_COMPRESSION_ERROR)
                  Utils.emitEvent('success',122160)
                }
                if (this.emitKey == 'emitWebViewSdkSchemeHandlerDidFailNegative364') {
                  resourceHandler.didFail(WebNetErrorList.ERR_PROXY_AUTH_REQUESTED_WITH_NO_CONNECTION)
                  Utils.emitEvent('success',122170)
                }
                if (this.emitKey == 'emitWebViewSdkSchemeHandlerDidFailNegative365') {
                  resourceHandler.didFail(WebNetErrorList.ERR_HTTP_1_1_REQUIRED)
                  Utils.emitEvent('success',122180)
                }
                if (this.emitKey == 'emitWebViewSdkSchemeHandlerDidFailNegative366') {
                  resourceHandler.didFail(WebNetErrorList.ERR_PROXY_HTTP_1_1_REQUIRED)
                  Utils.emitEvent('success',122190)
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
