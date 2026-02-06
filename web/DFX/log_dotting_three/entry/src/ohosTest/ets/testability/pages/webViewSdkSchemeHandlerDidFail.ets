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
import { WebNetErrorList } from '@ohos.web.netErrorList'

const EVENT_ID_SET_EMIT_KEY = 116010;

@Entry
@Component
struct webViewSdkSchemeHandler {
  controller: webview.WebviewController = new webview.WebviewController();
  schemeHandler: webview.WebSchemeHandler = new webview.WebSchemeHandler()
  httpBodyStream: webview.WebHttpBodyStream | null = null
  @State emitKey: string = '';
  @State javaScriptAccess: boolean = true;
  @State fileAccess: boolean = true;
  @State domStorageAccess: boolean = true;
  @State imageAccess: boolean = true;
  @State onlineImageAccess: boolean = true;
  @State databaseAccess: boolean = true;
  @State isReceive: number = -1;
  requests: webview.WebSchemeHandlerRequest[] = []
  scheme1: webview.WebCustomScheme = {
    schemeName: 'custom', isSupportCORS: true, isSupportFetch: true
  }
  htmlData: string = '{"test":1}';

  onPageShow() {
    let valueChangeEvent: events_emitter.InnerEvent = {
      eventId: EVENT_ID_SET_EMIT_KEY,
      priority: events_emitter.EventPriority.LOW
    }
    events_emitter.on(valueChangeEvent, this.valueChangeCallBack)
  }

  onPageHide() {
    events_emitter.off(EVENT_ID_SET_EMIT_KEY)
  }

  aboutToAppear(): void {
    try {
      webview.WebviewController.customizeSchemes([this.scheme1])
    } catch (error) {
      let e: business_error.BusinessError = error as business_error.BusinessError;
      console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
    }
  }

  private valueChangeCallBack = (eventData: events_emitter.EventData) => {
    if (eventData != null) {
      console.info('valueChangeCallBack:' + JSON.stringify(eventData));
      if (eventData.data != null && eventData.data.ACTION != null) {
        this.emitKey = eventData.data.ACTION;
        this.isReceive = 1;
      }
    }
  }

  build() {
    Column() {
      Row() {
        Button('web click')
          .key('webViewSdkSchemeHandlerDidFailButton')
          .onClick(async () => {
            await Utils.waitForExist(() => this.isReceive, 'webViewSdkSchemeHandlerDidFailButtonIsReceive', 1, 1000);
            this.isReceive = -1;
            console.info('key==>' + this.emitKey)
            this.controller.loadUrl($rawfile('sdkSchemeHandler.html'));
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
                switch (this.emitKey) {
                  case 'emitWebViewSdkSchemeHandlerDidFailNegative367': {
                    try {
                      resourceHandler.didFail(WebNetErrorList.ERR_PAC_SCRIPT_TERMINATED);
                      Utils.emitEvent('success', 116020);
                    } catch (error) {
                      const e: business_error.BusinessError = error as business_error.BusinessError;
                      console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                    }
                    break;
                  }
                  case 'emitWebViewSdkSchemeHandlerDidFailNegative370': {
                    try {
                      resourceHandler.didFail(WebNetErrorList.ERR_INVALID_HTTP_RESPONSE)
                      Utils.emitEvent('success', 116030)
                    } catch (error) {
                      const e: business_error.BusinessError = error as business_error.BusinessError;
                      console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                    }
                    break
                  }
                  case 'emitWebViewSdkSchemeHandlerDidFailNegative371': {
                    try {
                      resourceHandler.didFail(WebNetErrorList.ERR_CONTENT_DECODING_INIT_FAILED)
                      Utils.emitEvent('success', 116040)
                    } catch (error) {
                      const e: business_error.BusinessError = error as business_error.BusinessError;
                      console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                    }
                    break
                  }
                  case 'emitWebViewSdkSchemeHandlerDidFailNegative372': {
                    try {
                      resourceHandler.didFail(WebNetErrorList.ERR_HTTP2_RST_STREAM_NO_ERROR_RECEIVED)
                      Utils.emitEvent('success', 116050)
                    } catch (error) {
                      const e: business_error.BusinessError = error as business_error.BusinessError;
                      console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                    }
                    break
                  }
                  case 'emitWebViewSdkSchemeHandlerDidFailNegative373': {
                    try {
                      resourceHandler.didFail(WebNetErrorList.ERR_HTTP2_PUSHED_STREAM_NOT_AVAILABLE)
                      Utils.emitEvent('success', 116060)
                    } catch (error) {
                      const e: business_error.BusinessError = error as business_error.BusinessError;
                      console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                    }
                    break
                  }
                  case 'emitWebViewSdkSchemeHandlerDidFailNegative374': {
                    try {
                      resourceHandler.didFail(WebNetErrorList.ERR_HTTP2_CLAIMED_PUSHED_STREAM_RESET_BY_SERVER)
                      Utils.emitEvent('success', 116070)
                    } catch (error) {
                      const e: business_error.BusinessError = error as business_error.BusinessError;
                      console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                    }
                    break
                  }
                  case 'emitWebViewSdkSchemeHandlerDidFailNegative375': {
                    try {
                      resourceHandler.didFail(WebNetErrorList.ERR_TOO_MANY_RETRIES)
                      Utils.emitEvent('success', 116080)
                    } catch (error) {
                      const e: business_error.BusinessError = error as business_error.BusinessError;
                      console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                    }
                    break
                  }
                  case 'emitWebViewSdkSchemeHandlerDidFailNegative376': {
                    try {
                      resourceHandler.didFail(WebNetErrorList.ERR_HTTP2_STREAM_CLOSED)
                      Utils.emitEvent('success', 116090)
                    } catch (error) {
                      const e: business_error.BusinessError = error as business_error.BusinessError;
                      console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                    }
                    break
                  }
                  case 'emitWebViewSdkSchemeHandlerDidFailNegative377': {
                    try {
                      resourceHandler.didFail(WebNetErrorList.ERR_HTTP2_CLIENT_REFUSED_STREAM)
                      Utils.emitEvent('success', 116100)
                    } catch (error) {
                      const e: business_error.BusinessError = error as business_error.BusinessError;
                      console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                    }
                    break
                  }
                  case 'emitWebViewSdkSchemeHandlerDidFailNegative378': {
                    try {
                      resourceHandler.didFail(WebNetErrorList.ERR_HTTP2_PUSHED_RESPONSE_DOES_NOT_MATCH)
                      Utils.emitEvent('success', 116110)
                    } catch (error) {
                      const e: business_error.BusinessError = error as business_error.BusinessError;
                      console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                    }
                    break
                  }
                  case 'emitWebViewSdkSchemeHandlerDidFailNegative379': {
                    try {
                      resourceHandler.didFail(WebNetErrorList.ERR_HTTP_RESPONSE_CODE_FAILURE)
                      Utils.emitEvent('success', 116120)
                    } catch (error) {
                      const e: business_error.BusinessError = error as business_error.BusinessError;
                      console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                    }
                    break
                  }
                  case 'emitWebViewSdkSchemeHandlerDidFailNegative380': {
                    try {
                      resourceHandler.didFail(WebNetErrorList.ERR_QUIC_UNKNOWN_CERT_ROOT)
                      Utils.emitEvent('success', 116130)
                    } catch (error) {
                      const e: business_error.BusinessError = error as business_error.BusinessError;
                      console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                    }
                    break
                  }
                  case 'emitWebViewSdkSchemeHandlerDidFailNegative381': {
                    try {
                      resourceHandler.didFail(WebNetErrorList.ERR_QUIC_GOAWAY_REQUEST_CAN_BE_RETRIED)
                      Utils.emitEvent('success', 116140)
                    } catch (error) {
                      const e: business_error.BusinessError = error as business_error.BusinessError;
                      console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                    }
                    break
                  }
                  case 'emitWebViewSdkSchemeHandlerDidFailNegative382': {
                    try {
                      resourceHandler.didFail(WebNetErrorList.ERR_TOO_MANY_ACCEPT_CH_RESTARTS)
                      Utils.emitEvent('success', 116150)
                    } catch (error) {
                      const e: business_error.BusinessError = error as business_error.BusinessError;
                      console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                    }
                    break
                  }
                  case 'emitWebViewSdkSchemeHandlerDidFailNegative383': {
                    try {
                      resourceHandler.didFail(WebNetErrorList.ERR_INCONSISTENT_IP_ADDRESS_SPACE)
                      Utils.emitEvent('success', 116160)
                    } catch (error) {
                      const e: business_error.BusinessError = error as business_error.BusinessError;
                      console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                    }
                    break
                  }
                  case 'emitWebViewSdkSchemeHandlerDidFailNegative384': {
                    try {
                      let code = WebNetErrorList.ERR_CACHED_IP_ADDRESS_SPACE_BLOCKED_BY_LOCAL_NETWORK_ACCESS_POLICY
                      resourceHandler.didFail(code)
                      Utils.emitEvent('success', 116170)
                    } catch (error) {
                      const e: business_error.BusinessError = error as business_error.BusinessError;
                      console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                    }
                    break
                  }
                  case 'emitWebViewSdkSchemeHandlerDidFailNegative400': {
                    try {
                      resourceHandler.didFail(WebNetErrorList.ERR_CACHE_MISS)
                      Utils.emitEvent('success', 116180)
                    } catch (error) {
                      const e: business_error.BusinessError = error as business_error.BusinessError;
                      console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                    }
                    break
                  }
                  case 'emitWebViewSdkSchemeHandlerDidFailNegative401': {
                    try {
                      resourceHandler.didFail(WebNetErrorList.ERR_CACHE_READ_FAILURE)
                      Utils.emitEvent('success', 116190)
                    } catch (error) {
                      const e: business_error.BusinessError = error as business_error.BusinessError;
                      console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                    }
                    break
                  }
                  case 'emitWebViewSdkSchemeHandlerDidFailNegative402': {
                    try {
                      resourceHandler.didFail(WebNetErrorList.ERR_CACHE_WRITE_FAILURE)
                      Utils.emitEvent('success', 116200)
                    } catch (error) {
                      const e: business_error.BusinessError = error as business_error.BusinessError;
                      console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                    }
                    break
                  }
                  case 'emitWebViewSdkSchemeHandlerDidFailNegative403': {
                    try {
                      resourceHandler.didFail(WebNetErrorList.ERR_CACHE_OPERATION_UNSUPPORTED)
                      Utils.emitEvent('success', 116210)
                    } catch (error) {
                      const e: business_error.BusinessError = error as business_error.BusinessError;
                      console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                    }
                    break
                  }
                  case 'emitWebViewSdkSchemeHandlerDidFailNegative404': {
                    try {
                      resourceHandler.didFail(WebNetErrorList.ERR_CACHE_OPEN_FAILURE)
                      Utils.emitEvent('success', 116220)
                    } catch (error) {
                      const e: business_error.BusinessError = error as business_error.BusinessError;
                      console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                    }
                    break
                  }
                  case 'emitWebViewSdkSchemeHandlerDidFailNegative405': {
                    try {
                      resourceHandler.didFail(WebNetErrorList.ERR_CACHE_CREATE_FAILURE)
                      Utils.emitEvent('success', 116230)
                    } catch (error) {
                      const e: business_error.BusinessError = error as business_error.BusinessError;
                      console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                    }
                    break
                  }
                  case 'emitWebViewSdkSchemeHandlerDidFailNegative406': {
                    try {
                      resourceHandler.didFail(WebNetErrorList.ERR_CACHE_RACE)
                      Utils.emitEvent('success', 116240)
                    } catch (error) {
                      const e: business_error.BusinessError = error as business_error.BusinessError;
                      console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                    }
                    break
                  }
                  case 'emitWebViewSdkSchemeHandlerDidFailNegative407': {
                    try {
                      resourceHandler.didFail(WebNetErrorList.ERR_CACHE_CHECKSUM_READ_FAILURE)
                      Utils.emitEvent('success', 116250)
                    } catch (error) {
                      const e: business_error.BusinessError = error as business_error.BusinessError;
                      console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                    }
                    break
                  }
                  case 'emitWebViewSdkSchemeHandlerDidFailNegative408': {
                    try {
                      resourceHandler.didFail(WebNetErrorList.ERR_CACHE_CHECKSUM_MISMATCH)
                      Utils.emitEvent('success', 116260)
                    } catch (error) {
                      const e: business_error.BusinessError = error as business_error.BusinessError;
                      console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                    }
                    break
                  }
                  case 'emitWebViewSdkSchemeHandlerDidFailNegative409': {
                    try {
                      resourceHandler.didFail(WebNetErrorList.ERR_CACHE_LOCK_TIMEOUT)
                      Utils.emitEvent('success', 116270)
                    } catch (error) {
                      const e: business_error.BusinessError = error as business_error.BusinessError;
                      console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                    }
                    break
                  }
                  case 'emitWebViewSdkSchemeHandlerDidFailNegative410': {
                    try {
                      resourceHandler.didFail(WebNetErrorList.ERR_CACHE_AUTH_FAILURE_AFTER_READ)
                      Utils.emitEvent('success', 116280)
                    } catch (error) {
                      const e: business_error.BusinessError = error as business_error.BusinessError;
                      console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                    }
                    break
                  }
                  case 'emitWebViewSdkSchemeHandlerDidFailNegative411': {
                    try {
                      resourceHandler.didFail(WebNetErrorList.ERR_CACHE_ENTRY_NOT_SUITABLE)
                      Utils.emitEvent('success', 116290)
                    } catch (error) {
                      const e: business_error.BusinessError = error as business_error.BusinessError;
                      console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                    }
                    break
                  }
                  case 'emitWebViewSdkSchemeHandlerDidFailNegative412': {
                    try {
                      resourceHandler.didFail(WebNetErrorList.ERR_CACHE_DOOM_FAILURE)
                      Utils.emitEvent('success', 116300)
                    } catch (error) {
                      const e: business_error.BusinessError = error as business_error.BusinessError;
                      console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                    }
                    break
                  }
                  case 'emitWebViewSdkSchemeHandlerDidFailNegative413': {
                    try {
                      resourceHandler.didFail(WebNetErrorList.ERR_CACHE_OPEN_OR_CREATE_FAILURE)
                      Utils.emitEvent('success', 116310)
                    } catch (error) {
                      const e: business_error.BusinessError = error as business_error.BusinessError;
                      console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                    }
                    break
                  }
                  case 'emitWebViewSdkSchemeHandlerDidFailNegative501': {
                    try {
                      resourceHandler.didFail(WebNetErrorList.ERR_INSECURE_RESPONSE)
                      Utils.emitEvent('success', 116320)
                    } catch (error) {
                      const e: business_error.BusinessError = error as business_error.BusinessError;
                      console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                    }
                    break
                  }
                  case 'emitWebViewSdkSchemeHandlerDidFailNegative502': {
                    try {
                      resourceHandler.didFail(WebNetErrorList.ERR_NO_PRIVATE_KEY_FOR_CERT)
                      Utils.emitEvent('success', 116330)
                    } catch (error) {
                      const e: business_error.BusinessError = error as business_error.BusinessError;
                      console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                    }
                    break
                  }
                  case 'emitWebViewSdkSchemeHandlerDidFailNegative503': {
                    try {
                      resourceHandler.didFail(WebNetErrorList.ERR_ADD_USER_CERT_FAILED)
                      Utils.emitEvent('success', 116340)
                    } catch (error) {
                      const e: business_error.BusinessError = error as business_error.BusinessError;
                      console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                    }
                    break
                  }
                  case 'emitWebViewSdkSchemeHandlerDidFailNegative504': {
                    try {
                      resourceHandler.didFail(WebNetErrorList.ERR_INVALID_SIGNED_EXCHANGE)
                      Utils.emitEvent('success', 116350)
                    } catch (error) {
                      const e: business_error.BusinessError = error as business_error.BusinessError;
                      console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                    }
                    break
                  }
                  case 'emitWebViewSdkSchemeHandlerDidFailNegative505': {
                    try {
                      resourceHandler.didFail(WebNetErrorList.ERR_INVALID_WEB_BUNDLE)
                      Utils.emitEvent('success', 116360)
                    } catch (error) {
                      const e: business_error.BusinessError = error as business_error.BusinessError;
                      console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                    }
                    break
                  }
                  case 'emitWebViewSdkSchemeHandlerDidFailNegative506': {
                    try {
                      resourceHandler.didFail(WebNetErrorList.ERR_TRUST_TOKEN_OPERATION_FAILED)
                      Utils.emitEvent('success', 116370)
                    } catch (error) {
                      const e: business_error.BusinessError = error as business_error.BusinessError;
                      console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                    }
                    break
                  }
                  case 'emitWebViewSdkSchemeHandlerDidFailNegative507': {
                    try {
                      let code = WebNetErrorList.ERR_TRUST_TOKEN_OPERATION_SUCCESS_WITHOUT_SENDING_REQUEST
                      resourceHandler.didFail(code)
                      Utils.emitEvent('success', 116380)
                    } catch (error) {
                      const e: business_error.BusinessError = error as business_error.BusinessError;
                      console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                    }
                    break
                  }
                  case 'emitWebViewSdkSchemeHandlerDidFailNegative601': {
                    try {
                      resourceHandler.didFail(WebNetErrorList.ERR_FTP_FAILED)
                      Utils.emitEvent('success', 116390)
                    } catch (error) {
                      const e: business_error.BusinessError = error as business_error.BusinessError;
                      console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                    }
                    break;
                  }
                  case 'emitWebViewSdkSchemeHandlerDidFailNegative602': {
                    try {
                      resourceHandler.didFail(WebNetErrorList.ERR_FTP_SERVICE_UNAVAILABLE);
                      Utils.emitEvent('success', 116400);
                    } catch (error) {
                      const e: business_error.BusinessError = error as business_error.BusinessError;
                      console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                    }
                    break;
                  }
                  case 'emitWebViewSdkSchemeHandlerDidFailNegative603': {
                    try {
                      resourceHandler.didFail(WebNetErrorList.ERR_FTP_TRANSFER_ABORTED);
                      Utils.emitEvent('success', 116410);
                    } catch (error) {
                      const e: business_error.BusinessError = error as business_error.BusinessError;
                      console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                    }
                    break;
                  }
                  case 'emitWebViewSdkSchemeHandlerDidFailNegative604': {
                    try {
                      resourceHandler.didFail(WebNetErrorList.ERR_FTP_FILE_BUSY);
                      Utils.emitEvent('success', 116420);
                    } catch (error) {
                      const e: business_error.BusinessError = error as business_error.BusinessError;
                      console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                    }
                    break;
                  }
                  case 'emitWebViewSdkSchemeHandlerDidFailNegative605': {
                    try {
                      resourceHandler.didFail(WebNetErrorList.ERR_FTP_SYNTAX_ERROR);
                      Utils.emitEvent('success', 116430);
                    } catch (error) {
                      const e: business_error.BusinessError = error as business_error.BusinessError;
                      console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                    }
                    break;
                  }
                  case 'emitWebViewSdkSchemeHandlerDidFailNegative606': {
                    try {
                      resourceHandler.didFail(WebNetErrorList.ERR_FTP_COMMAND_UNSUPPORTED);
                      Utils.emitEvent('success', 116440);
                    } catch (error) {
                      const e: business_error.BusinessError = error as business_error.BusinessError;
                      console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                    }
                    break;
                  }
                  case 'emitWebViewSdkSchemeHandlerDidFailNegative607': {
                    try {
                      resourceHandler.didFail(WebNetErrorList.ERR_FTP_BAD_COMMAND_SEQUENCE);
                      Utils.emitEvent('success', 116450);
                    } catch (error) {
                      const e: business_error.BusinessError = error as business_error.BusinessError;
                      console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                    }
                    break;
                  }
                }
                return false;
              })

            this.schemeHandler.onRequestStop((request: webview.WebSchemeHandlerRequest) => {
              console.log('[schemeHandler] onRequestStop')
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