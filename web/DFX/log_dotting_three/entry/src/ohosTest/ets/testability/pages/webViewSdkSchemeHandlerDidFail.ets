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
              .key('webViewSdkSchemeHandlerDidFailButton')
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
                        if (this.emitKey == 'emitWebViewSdkSchemeHandlerDidFailNegative367') {
                          resourceHandler.didFail(WebNetErrorList.ERR_PAC_SCRIPT_TERMINATED)
                          Utils.emitEvent('success',11367)
                        }
                        if (this.emitKey == 'emitWebViewSdkSchemeHandlerDidFailNegative370') {
                          resourceHandler.didFail(WebNetErrorList.ERR_INVALID_HTTP_RESPONSE)
                          Utils.emitEvent('success',11370)
                        }
                        if (this.emitKey == 'emitWebViewSdkSchemeHandlerDidFailNegative371') {
                          resourceHandler.didFail(WebNetErrorList.ERR_CONTENT_DECODING_INIT_FAILED)
                          Utils.emitEvent('success',11371)
                        }
                        if (this.emitKey == 'emitWebViewSdkSchemeHandlerDidFailNegative372') {
                          resourceHandler.didFail(WebNetErrorList.ERR_HTTP2_RST_STREAM_NO_ERROR_RECEIVED)
                          Utils.emitEvent('success',11372)
                        }
                        if (this.emitKey == 'emitWebViewSdkSchemeHandlerDidFailNegative373') {
                          resourceHandler.didFail(WebNetErrorList.ERR_HTTP2_PUSHED_STREAM_NOT_AVAILABLE)
                          Utils.emitEvent('success',11373)
                        }
                        if (this.emitKey == 'emitWebViewSdkSchemeHandlerDidFailNegative374') {
                          resourceHandler.didFail(WebNetErrorList.ERR_HTTP2_CLAIMED_PUSHED_STREAM_RESET_BY_SERVER)
                          Utils.emitEvent('success',11374)
                        }
                        if (this.emitKey == 'emitWebViewSdkSchemeHandlerDidFailNegative375') {
                          resourceHandler.didFail(WebNetErrorList.ERR_TOO_MANY_RETRIES)
                          Utils.emitEvent('success',11375)
                        }
                        if (this.emitKey == 'emitWebViewSdkSchemeHandlerDidFailNegative376') {
                          resourceHandler.didFail(WebNetErrorList.ERR_HTTP2_STREAM_CLOSED)
                          Utils.emitEvent('success',11376)
                        }
                        if (this.emitKey == 'emitWebViewSdkSchemeHandlerDidFailNegative377') {
                          resourceHandler.didFail(WebNetErrorList.ERR_HTTP2_CLIENT_REFUSED_STREAM)
                          Utils.emitEvent('success',11377)
                        }
                        if (this.emitKey == 'emitWebViewSdkSchemeHandlerDidFailNegative378') {
                          resourceHandler.didFail(WebNetErrorList.ERR_HTTP2_PUSHED_RESPONSE_DOES_NOT_MATCH)
                          Utils.emitEvent('success',11378)
                        }
                        if (this.emitKey == 'emitWebViewSdkSchemeHandlerDidFailNegative379') {
                          resourceHandler.didFail(WebNetErrorList.ERR_HTTP_RESPONSE_CODE_FAILURE)
                          Utils.emitEvent('success',11379)
                        }
                        if (this.emitKey == 'emitWebViewSdkSchemeHandlerDidFailNegative380') {
                          resourceHandler.didFail(WebNetErrorList.ERR_QUIC_UNKNOWN_CERT_ROOT)
                          Utils.emitEvent('success',11380)
                        }
                        if (this.emitKey == 'emitWebViewSdkSchemeHandlerDidFailNegative381') {
                          resourceHandler.didFail(WebNetErrorList.ERR_QUIC_GOAWAY_REQUEST_CAN_BE_RETRIED)
                          Utils.emitEvent('success',11381)
                        }
                        if (this.emitKey == 'emitWebViewSdkSchemeHandlerDidFailNegative382') {
                          resourceHandler.didFail(WebNetErrorList.ERR_TOO_MANY_ACCEPT_CH_RESTARTS)
                          Utils.emitEvent('success',11382)
                        }
                        if (this.emitKey == 'emitWebViewSdkSchemeHandlerDidFailNegative383') {
                          resourceHandler.didFail(WebNetErrorList.ERR_INCONSISTENT_IP_ADDRESS_SPACE)
                          Utils.emitEvent('success',11383)
                        }
                        if (this.emitKey == 'emitWebViewSdkSchemeHandlerDidFailNegative384') {
                          let code = WebNetErrorList.ERR_CACHED_IP_ADDRESS_SPACE_BLOCKED_BY_LOCAL_NETWORK_ACCESS_POLICY
                          resourceHandler.didFail(code)
                          Utils.emitEvent('success',11384)
                        }
                        if (this.emitKey == 'emitWebViewSdkSchemeHandlerDidFailNegative400') {
                          resourceHandler.didFail(WebNetErrorList.ERR_CACHE_MISS)
                          Utils.emitEvent('success',11400)
                        }
                        if (this.emitKey == 'emitWebViewSdkSchemeHandlerDidFailNegative401') {
                          resourceHandler.didFail(WebNetErrorList.ERR_CACHE_READ_FAILURE)
                          Utils.emitEvent('success',11401)
                        }
                        if (this.emitKey == 'emitWebViewSdkSchemeHandlerDidFailNegative402') {
                          resourceHandler.didFail(WebNetErrorList.ERR_CACHE_WRITE_FAILURE)
                          Utils.emitEvent('success',11402)
                        }
                        if (this.emitKey == 'emitWebViewSdkSchemeHandlerDidFailNegative403') {
                          resourceHandler.didFail(WebNetErrorList.ERR_CACHE_OPERATION_UNSUPPORTED)
                          Utils.emitEvent('success',11403)
                        }
                        if (this.emitKey == 'emitWebViewSdkSchemeHandlerDidFailNegative404') {
                          resourceHandler.didFail(WebNetErrorList.ERR_CACHE_OPEN_FAILURE)
                          Utils.emitEvent('success',11404)
                        }
                        if (this.emitKey == 'emitWebViewSdkSchemeHandlerDidFailNegative405') {
                          resourceHandler.didFail(WebNetErrorList.ERR_CACHE_CREATE_FAILURE)
                          Utils.emitEvent('success',11405)
                        }
                        if (this.emitKey == 'emitWebViewSdkSchemeHandlerDidFailNegative406') {
                          resourceHandler.didFail(WebNetErrorList.ERR_CACHE_RACE)
                          Utils.emitEvent('success',11406)
                        }
                        if (this.emitKey == 'emitWebViewSdkSchemeHandlerDidFailNegative407') {
                          resourceHandler.didFail(WebNetErrorList.ERR_CACHE_CHECKSUM_READ_FAILURE)
                          Utils.emitEvent('success',11407)
                        }
                        if (this.emitKey == 'emitWebViewSdkSchemeHandlerDidFailNegative408') {
                          resourceHandler.didFail(WebNetErrorList.ERR_CACHE_CHECKSUM_MISMATCH)
                          Utils.emitEvent('success',11408)
                        }
                        if (this.emitKey == 'emitWebViewSdkSchemeHandlerDidFailNegative409') {
                          resourceHandler.didFail(WebNetErrorList.ERR_CACHE_LOCK_TIMEOUT)
                          Utils.emitEvent('success',11409)
                        }
                        if (this.emitKey == 'emitWebViewSdkSchemeHandlerDidFailNegative410') {
                          resourceHandler.didFail(WebNetErrorList.ERR_CACHE_AUTH_FAILURE_AFTER_READ)
                          Utils.emitEvent('success',11410)
                        }
                        if (this.emitKey == 'emitWebViewSdkSchemeHandlerDidFailNegative411') {
                          resourceHandler.didFail(WebNetErrorList.ERR_CACHE_ENTRY_NOT_SUITABLE)
                          Utils.emitEvent('success',11411)
                        }
                        if (this.emitKey == 'emitWebViewSdkSchemeHandlerDidFailNegative412') {
                          resourceHandler.didFail(WebNetErrorList.ERR_CACHE_DOOM_FAILURE)
                          Utils.emitEvent('success',11412)
                        }
                        if (this.emitKey == 'emitWebViewSdkSchemeHandlerDidFailNegative413') {
                          resourceHandler.didFail(WebNetErrorList.ERR_CACHE_OPEN_OR_CREATE_FAILURE)
                          Utils.emitEvent('success',11413)
                        }
                        if (this.emitKey == 'emitWebViewSdkSchemeHandlerDidFailNegative501') {
                          resourceHandler.didFail(WebNetErrorList.ERR_INSECURE_RESPONSE)
                          Utils.emitEvent('success',11501)
                        }
                        if (this.emitKey == 'emitWebViewSdkSchemeHandlerDidFailNegative502') {
                          resourceHandler.didFail(WebNetErrorList.ERR_NO_PRIVATE_KEY_FOR_CERT)
                          Utils.emitEvent('success',11502)
                        }
                        if (this.emitKey == 'emitWebViewSdkSchemeHandlerDidFailNegative503') {
                          resourceHandler.didFail(WebNetErrorList.ERR_ADD_USER_CERT_FAILED)
                          Utils.emitEvent('success',11503)
                        }
                        if (this.emitKey == 'emitWebViewSdkSchemeHandlerDidFailNegative504') {
                          resourceHandler.didFail(WebNetErrorList.ERR_INVALID_SIGNED_EXCHANGE)
                          Utils.emitEvent('success',11504)
                        }
                        if (this.emitKey == 'emitWebViewSdkSchemeHandlerDidFailNegative505') {
                          resourceHandler.didFail(WebNetErrorList.ERR_INVALID_WEB_BUNDLE)
                          Utils.emitEvent('success',11505)
                        }
                        if (this.emitKey == 'emitWebViewSdkSchemeHandlerDidFailNegative506') {
                          resourceHandler.didFail(WebNetErrorList.ERR_TRUST_TOKEN_OPERATION_FAILED)
                          Utils.emitEvent('success',11506)
                        }
                        if (this.emitKey == 'emitWebViewSdkSchemeHandlerDidFailNegative507') {
                          let code = WebNetErrorList.ERR_TRUST_TOKEN_OPERATION_SUCCESS_WITHOUT_SENDING_REQUEST
                          resourceHandler.didFail(code)
                          Utils.emitEvent('success',11507)
                        }
                        if (this.emitKey == 'emitWebViewSdkSchemeHandlerDidFailNegative601') {
                          resourceHandler.didFail(WebNetErrorList.ERR_FTP_FAILED)
                          Utils.emitEvent('success',11601)
                        }
                        if (this.emitKey == 'emitWebViewSdkSchemeHandlerDidFailNegative602') {
                          resourceHandler.didFail(WebNetErrorList.ERR_FTP_SERVICE_UNAVAILABLE)
                          Utils.emitEvent('success',11602)
                        }
                        if (this.emitKey == 'emitWebViewSdkSchemeHandlerDidFailNegative603') {
                          resourceHandler.didFail(WebNetErrorList.ERR_FTP_TRANSFER_ABORTED)
                          Utils.emitEvent('success',11603)
                        }
                        if (this.emitKey == 'emitWebViewSdkSchemeHandlerDidFailNegative604') {
                          resourceHandler.didFail(WebNetErrorList.ERR_FTP_FILE_BUSY)
                          Utils.emitEvent('success',11604)
                        }
                        if (this.emitKey == 'emitWebViewSdkSchemeHandlerDidFailNegative605') {
                          resourceHandler.didFail(WebNetErrorList.ERR_FTP_SYNTAX_ERROR)
                          Utils.emitEvent('success',11605)
                        }
                        if (this.emitKey == 'emitWebViewSdkSchemeHandlerDidFailNegative606') {
                          resourceHandler.didFail(WebNetErrorList.ERR_FTP_COMMAND_UNSUPPORTED)
                          Utils.emitEvent('success',11606)
                        }
                        if (this.emitKey == 'emitWebViewSdkSchemeHandlerDidFailNegative607') {
                          resourceHandler.didFail(WebNetErrorList.ERR_FTP_BAD_COMMAND_SEQUENCE)
                          Utils.emitEvent('success',11607)
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
