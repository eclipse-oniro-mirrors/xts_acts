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
              .key('webViewSdkSchemeHandlerDidFail3Button')
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
                        if (this.emitKey == 'emitWebViewSdkSchemeHandlerDidFailNegative173') {
                          resourceHandler.didFail(WebNetErrorList.ERR_WS_UPGRADE)
                          Utils.emitEvent('success',11173)
                        }
                        if (this.emitKey == 'emitWebViewSdkSchemeHandlerDidFailNegative174') {
                          resourceHandler.didFail(WebNetErrorList.ERR_READ_IF_READY_NOT_IMPLEMENTED)
                          Utils.emitEvent('success',11174)
                        }
                        if (this.emitKey == 'emitWebViewSdkSchemeHandlerDidFailNegative176') {
                          resourceHandler.didFail(WebNetErrorList.ERR_NO_BUFFER_SPACE)
                          Utils.emitEvent('success',11176)
                        }
                        if (this.emitKey == 'emitWebViewSdkSchemeHandlerDidFailNegative177') {
                          resourceHandler.didFail(WebNetErrorList.ERR_SSL_CLIENT_AUTH_NO_COMMON_ALGORITHMS)
                          Utils.emitEvent('success',11177)
                        }
                        if (this.emitKey == 'emitWebViewSdkSchemeHandlerDidFailNegative178') {
                          resourceHandler.didFail(WebNetErrorList.ERR_EARLY_DATA_REJECTED)
                          Utils.emitEvent('success',11178)
                        }
                        if (this.emitKey == 'emitWebViewSdkSchemeHandlerDidFailNegative179') {
                          resourceHandler.didFail(WebNetErrorList.ERR_WRONG_VERSION_ON_EARLY_DATA)
                          Utils.emitEvent('success',11179)
                        }
                        if (this.emitKey == 'emitWebViewSdkSchemeHandlerDidFailNegative180') {
                          resourceHandler.didFail(WebNetErrorList.ERR_TLS13_DOWNGRADE_DETECTED)
                          Utils.emitEvent('success',11180)
                        }
                        if (this.emitKey == 'emitWebViewSdkSchemeHandlerDidFailNegative181') {
                          resourceHandler.didFail(WebNetErrorList.ERR_SSL_KEY_USAGE_INCOMPATIBLE)
                          Utils.emitEvent('success',11181)
                        }
                        if (this.emitKey == 'emitWebViewSdkSchemeHandlerDidFailNegative182') {
                          resourceHandler.didFail(WebNetErrorList.ERR_INVALID_ECH_CONFIG_LIST)
                          Utils.emitEvent('success',11182)
                        }
                        if (this.emitKey == 'emitWebViewSdkSchemeHandlerDidFailNegative183') {
                          resourceHandler.didFail(WebNetErrorList.ERR_ECH_NOT_NEGOTIATED)
                          Utils.emitEvent('success',11183)
                        }
                        if (this.emitKey == 'emitWebViewSdkSchemeHandlerDidFailNegative184') {
                          resourceHandler.didFail(WebNetErrorList.ERR_ECH_FALLBACK_CERTIFICATE_INVALID)
                          Utils.emitEvent('success',11184)
                        }
                        if (this.emitKey == 'emitWebViewSdkSchemeHandlerDidFailNegative200') {
                          resourceHandler.didFail(WebNetErrorList.ERR_CERT_COMMON_NAME_INVALID)
                          Utils.emitEvent('success',11200)
                        }
                        if (this.emitKey == 'emitWebViewSdkSchemeHandlerDidFailNegative201') {
                          resourceHandler.didFail(WebNetErrorList.ERR_CERT_DATE_INVALID)
                          Utils.emitEvent('success',11201)
                        }
                        if (this.emitKey == 'emitWebViewSdkSchemeHandlerDidFailNegative202') {
                          resourceHandler.didFail(WebNetErrorList.ERR_CERT_AUTHORITY_INVALID)
                          Utils.emitEvent('success',11202)
                        }
                        if (this.emitKey == 'emitWebViewSdkSchemeHandlerDidFailNegative203') {
                          resourceHandler.didFail(WebNetErrorList.ERR_CERT_CONTAINS_ERRORS)
                          Utils.emitEvent('success',11203)
                        }
                        if (this.emitKey == 'emitWebViewSdkSchemeHandlerDidFailNegative204') {
                          let code = WebNetErrorList.ERR_CERT_NO_REVOCATION_MECHANISM
                          resourceHandler.didFail(code)
                          Utils.emitEvent('success',11204)
                        }
                        if (this.emitKey == 'emitWebViewSdkSchemeHandlerDidFailNegative205') {
                          resourceHandler.didFail(WebNetErrorList.ERR_CERT_UNABLE_TO_CHECK_REVOCATION)
                          Utils.emitEvent('success',11205)
                        }
                        if (this.emitKey == 'emitWebViewSdkSchemeHandlerDidFailNegative206') {
                          resourceHandler.didFail(WebNetErrorList.ERR_CERT_REVOKED)
                          Utils.emitEvent('success',11206)
                        }
                        if (this.emitKey == 'emitWebViewSdkSchemeHandlerDidFailNegative207') {
                          resourceHandler.didFail(WebNetErrorList.ERR_CERT_INVALID)
                          Utils.emitEvent('success',11207)
                        }
                        if (this.emitKey == 'emitWebViewSdkSchemeHandlerDidFailNegative208') {
                          resourceHandler.didFail(WebNetErrorList.ERR_CERT_WEAK_SIGNATURE_ALGORITHM)
                          Utils.emitEvent('success',11208)
                        }
                        if (this.emitKey == 'emitWebViewSdkSchemeHandlerDidFailNegative210') {
                          resourceHandler.didFail(WebNetErrorList.ERR_CERT_NON_UNIQUE_NAME)
                          Utils.emitEvent('success',11210)
                        }
                        if (this.emitKey == 'emitWebViewSdkSchemeHandlerDidFailNegative211') {
                          resourceHandler.didFail(WebNetErrorList.ERR_CERT_WEAK_KEY)
                          Utils.emitEvent('success',11211)
                        }
                        if (this.emitKey == 'emitWebViewSdkSchemeHandlerDidFailNegative212') {
                          resourceHandler.didFail(WebNetErrorList.ERR_CERT_NAME_CONSTRAINT_VIOLATION)
                          Utils.emitEvent('success',11212)
                        }
                        if (this.emitKey == 'emitWebViewSdkSchemeHandlerDidFailNegative213') {
                          resourceHandler.didFail(WebNetErrorList.ERR_CERT_VALIDITY_TOO_LONG)
                          Utils.emitEvent('success',11213)
                        }
                        if (this.emitKey == 'emitWebViewSdkSchemeHandlerDidFailNegative214') {
                          resourceHandler.didFail(WebNetErrorList.ERR_CERTIFICATE_TRANSPARENCY_REQUIRED)
                          Utils.emitEvent('success',11214)
                        }
                        if (this.emitKey == 'emitWebViewSdkSchemeHandlerDidFailNegative215') {
                          resourceHandler.didFail(WebNetErrorList.ERR_CERT_SYMANTEC_LEGACY)
                          Utils.emitEvent('success',11215)
                        }
                        if (this.emitKey == 'emitWebViewSdkSchemeHandlerDidFailNegative217') {
                          resourceHandler.didFail(WebNetErrorList.ERR_CERT_KNOWN_INTERCEPTION_BLOCKED)
                          Utils.emitEvent('success',11217)
                        }
                        if (this.emitKey == 'emitWebViewSdkSchemeHandlerDidFailNegative218') {
                          resourceHandler.didFail(WebNetErrorList.ERR_SSL_OBSOLETE_VERSION_OR_CIPHER)
                          Utils.emitEvent('success',11218)
                        }
                        if (this.emitKey == 'emitWebViewSdkSchemeHandlerDidFailNegative219') {
                          resourceHandler.didFail(WebNetErrorList.ERR_CERT_END)
                          Utils.emitEvent('success',11219)
                        }
                        if (this.emitKey == 'emitWebViewSdkSchemeHandlerDidFailNegative300') {
                          resourceHandler.didFail(WebNetErrorList.ERR_INVALID_URL)
                          Utils.emitEvent('success',11300)
                        }
                        if (this.emitKey == 'emitWebViewSdkSchemeHandlerDidFailNegative301') {
                          resourceHandler.didFail(WebNetErrorList.ERR_DISALLOWED_URL_SCHEME)
                          Utils.emitEvent('success',11301)
                        }
                        if (this.emitKey == 'emitWebViewSdkSchemeHandlerDidFailNegative302') {
                          resourceHandler.didFail(WebNetErrorList.ERR_UNKNOWN_URL_SCHEME)
                          Utils.emitEvent('success',11302)
                        }
                        if (this.emitKey == 'emitWebViewSdkSchemeHandlerDidFailNegative303') {
                          resourceHandler.didFail(WebNetErrorList.ERR_INVALID_REDIRECT)
                          Utils.emitEvent('success',11303)
                        }
                        if (this.emitKey == 'emitWebViewSdkSchemeHandlerDidFailNegative310') {
                          resourceHandler.didFail(WebNetErrorList.ERR_TOO_MANY_REDIRECTS)
                          Utils.emitEvent('success',11310)
                        }
                        if (this.emitKey == 'emitWebViewSdkSchemeHandlerDidFailNegative311') {
                          resourceHandler.didFail(WebNetErrorList.ERR_UNSAFE_REDIRECT)
                          Utils.emitEvent('success',11311)
                        }
                        if (this.emitKey == 'emitWebViewSdkSchemeHandlerDidFailNegative312') {
                          resourceHandler.didFail(WebNetErrorList.ERR_UNSAFE_PORT)
                          Utils.emitEvent('success',11312)
                        }
                        if (this.emitKey == 'emitWebViewSdkSchemeHandlerDidFailNegative320') {
                          let code = WebNetErrorList.ERR_INVALID_RESPONSE
                          resourceHandler.didFail(code)
                          Utils.emitEvent('success',11320)
                        }
                        if (this.emitKey == 'emitWebViewSdkSchemeHandlerDidFailNegative321') {
                          resourceHandler.didFail(WebNetErrorList.ERR_INVALID_CHUNKED_ENCODING)
                          Utils.emitEvent('success',11321)
                        }
                        if (this.emitKey == 'emitWebViewSdkSchemeHandlerDidFailNegative322') {
                          resourceHandler.didFail(WebNetErrorList.ERR_METHOD_UNSUPPORTED)
                          Utils.emitEvent('success',11322)
                        }
                        if (this.emitKey == 'emitWebViewSdkSchemeHandlerDidFailNegative323') {
                          resourceHandler.didFail(WebNetErrorList.ERR_UNEXPECTED_PROXY_AUTH)
                          Utils.emitEvent('success',11323)
                        }
                        if (this.emitKey == 'emitWebViewSdkSchemeHandlerDidFailNegative324') {
                          resourceHandler.didFail(WebNetErrorList.ERR_EMPTY_RESPONSE)
                          Utils.emitEvent('success',11324)
                        }
                        if (this.emitKey == 'emitWebViewSdkSchemeHandlerDidFailNegative325') {
                          resourceHandler.didFail(WebNetErrorList.ERR_RESPONSE_HEADERS_TOO_BIG)
                          Utils.emitEvent('success',11325)
                        }
                        if (this.emitKey == 'emitWebViewSdkSchemeHandlerDidFailNegative327') {
                          resourceHandler.didFail(WebNetErrorList.ERR_PAC_SCRIPT_FAILED)
                          Utils.emitEvent('success',11327)
                        }
                        if (this.emitKey == 'emitWebViewSdkSchemeHandlerDidFailNegative328') {
                          resourceHandler.didFail(WebNetErrorList.ERR_REQUEST_RANGE_NOT_SATISFIABLE)
                          Utils.emitEvent('success',11328)
                        }
                        if (this.emitKey == 'emitWebViewSdkSchemeHandlerDidFailNegative329') {
                          resourceHandler.didFail(WebNetErrorList.ERR_MALFORMED_IDENTITY)
                          Utils.emitEvent('success',11329)
                        }
                        if (this.emitKey == 'emitWebViewSdkSchemeHandlerDidFailNegative330') {
                          resourceHandler.didFail(WebNetErrorList.ERR_CONTENT_DECODING_FAILED)
                          Utils.emitEvent('success',11330)
                        }
                        if (this.emitKey == 'emitWebViewSdkSchemeHandlerDidFailNegative331') {
                          resourceHandler.didFail(WebNetErrorList.ERR_NETWORK_IO_SUSPENDED)
                          Utils.emitEvent('success',11331)
                        }
                        if (this.emitKey == 'emitWebViewSdkSchemeHandlerDidFailNegative332') {
                          resourceHandler.didFail(WebNetErrorList.ERR_SYN_REPLY_NOT_RECEIVED)
                          Utils.emitEvent('success',11332)
                        }
                        if (this.emitKey == 'emitWebViewSdkSchemeHandlerDidFailNegative333') {
                          resourceHandler.didFail(WebNetErrorList.ERR_ENCODING_CONVERSION_FAILED)
                          Utils.emitEvent('success',11333)
                        }
                        if (this.emitKey == 'emitWebViewSdkSchemeHandlerDidFailNegative334') {
                          resourceHandler.didFail(WebNetErrorList.ERR_UNRECOGNIZED_FTP_DIRECTORY_LISTING_FORMAT)
                          Utils.emitEvent('success',11334)
                        }
                        if (this.emitKey == 'emitWebViewSdkSchemeHandlerDidFailNegative336') {
                          resourceHandler.didFail(WebNetErrorList.ERR_NO_SUPPORTED_PROXIES)
                          Utils.emitEvent('success',11336)
                        }
                        if (this.emitKey == 'emitWebViewSdkSchemeHandlerDidFailNegative337') {
                          resourceHandler.didFail(WebNetErrorList.ERR_HTTP2_PROTOCOL_ERROR)
                          Utils.emitEvent('success',11337)
                        }
                        if (this.emitKey == 'emitWebViewSdkSchemeHandlerDidFailNegative338') {
                          resourceHandler.didFail(WebNetErrorList.ERR_INVALID_AUTH_CREDENTIALS)
                          Utils.emitEvent('success',11338)
                        }
                        if (this.emitKey == 'emitWebViewSdkSchemeHandlerDidFailNegative339') {
                          resourceHandler.didFail(WebNetErrorList.ERR_UNSUPPORTED_AUTH_SCHEME)
                          Utils.emitEvent('success',11339)
                        }
                        if (this.emitKey == 'emitWebViewSdkSchemeHandlerDidFailNegative340') {
                          resourceHandler.didFail(WebNetErrorList.ERR_ENCODING_DETECTION_FAILED)
                          Utils.emitEvent('success',11340)
                        }
                        if (this.emitKey == 'emitWebViewSdkSchemeHandlerDidFailNegative341') {
                          resourceHandler.didFail(WebNetErrorList.ERR_MISSING_AUTH_CREDENTIALS)
                          Utils.emitEvent('success',11341)
                        }
                        if (this.emitKey == 'emitWebViewSdkSchemeHandlerDidFailNegative342') {
                          resourceHandler.didFail(WebNetErrorList.ERR_UNEXPECTED_SECURITY_LIBRARY_STATUS)
                          Utils.emitEvent('success',11342)
                        }
                        if (this.emitKey == 'emitWebViewSdkSchemeHandlerDidFailNegative343') {
                          resourceHandler.didFail(WebNetErrorList.ERR_MISCONFIGURED_AUTH_ENVIRONMENT)
                          Utils.emitEvent('success',11343)
                        }
                        if (this.emitKey == 'emitWebViewSdkSchemeHandlerDidFailNegative344') {
                          resourceHandler.didFail(WebNetErrorList.ERR_UNDOCUMENTED_SECURITY_LIBRARY_STATUS)
                          Utils.emitEvent('success',11344)
                        }
                        if (this.emitKey == 'emitWebViewSdkSchemeHandlerDidFailNegative345') {
                          resourceHandler.didFail(WebNetErrorList.ERR_RESPONSE_BODY_TOO_BIG_TO_DRAIN)
                          Utils.emitEvent('success',11345)
                        }
                        if (this.emitKey == 'emitWebViewSdkSchemeHandlerDidFailNegative346') {
                          resourceHandler.didFail(WebNetErrorList.ERR_RESPONSE_HEADERS_MULTIPLE_CONTENT_LENGTH)
                          Utils.emitEvent('success',11346)
                        }
                        if (this.emitKey == 'emitWebViewSdkSchemeHandlerDidFailNegative347') {
                          resourceHandler.didFail(WebNetErrorList.ERR_INCOMPLETE_HTTP2_HEADERS)
                          Utils.emitEvent('success',11347)
                        }
                        if (this.emitKey == 'emitWebViewSdkSchemeHandlerDidFailNegative348') {
                          resourceHandler.didFail(WebNetErrorList.ERR_PAC_NOT_IN_DHCP)
                          Utils.emitEvent('success',11348)
                        }
                        if (this.emitKey == 'emitWebViewSdkSchemeHandlerDidFailNegative349') {
                          resourceHandler.didFail(WebNetErrorList.ERR_RESPONSE_HEADERS_MULTIPLE_CONTENT_DISPOSITION)
                          Utils.emitEvent('success',11349)
                        }
                        if (this.emitKey == 'emitWebViewSdkSchemeHandlerDidFailNegative350') {
                          resourceHandler.didFail(WebNetErrorList.ERR_RESPONSE_HEADERS_MULTIPLE_LOCATION)
                          Utils.emitEvent('success',11350)
                        }
                        if (this.emitKey == 'emitWebViewSdkSchemeHandlerDidFailNegative351') {
                          resourceHandler.didFail(WebNetErrorList.ERR_HTTP2_SERVER_REFUSED_STREAM)
                          Utils.emitEvent('success',11351)
                        }
                        if (this.emitKey == 'emitWebViewSdkSchemeHandlerDidFailNegative352') {
                          resourceHandler.didFail(WebNetErrorList.ERR_HTTP2_PING_FAILED)
                          Utils.emitEvent('success',11352)
                        }
                        if (this.emitKey == 'emitWebViewSdkSchemeHandlerDidFailNegative354') {
                          resourceHandler.didFail(WebNetErrorList.ERR_CONTENT_LENGTH_MISMATCH)
                          Utils.emitEvent('success',11354)
                        }
                        if (this.emitKey == 'emitWebViewSdkSchemeHandlerDidFailNegative355') {
                          resourceHandler.didFail(WebNetErrorList.ERR_INCOMPLETE_CHUNKED_ENCODING)
                          Utils.emitEvent('success',11355)
                        }
                        if (this.emitKey == 'emitWebViewSdkSchemeHandlerDidFailNegative356') {
                          resourceHandler.didFail(WebNetErrorList.ERR_QUIC_PROTOCOL_ERROR)
                          Utils.emitEvent('success',11356)
                        }
                        if (this.emitKey == 'emitWebViewSdkSchemeHandlerDidFailNegative357') {
                          resourceHandler.didFail(WebNetErrorList.ERR_RESPONSE_HEADERS_TRUNCATED)
                          Utils.emitEvent('success',11357)
                        }
                        if (this.emitKey == 'emitWebViewSdkSchemeHandlerDidFailNegative358') {
                          resourceHandler.didFail(WebNetErrorList.ERR_QUIC_HANDSHAKE_FAILED)
                          Utils.emitEvent('success',11358)
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
