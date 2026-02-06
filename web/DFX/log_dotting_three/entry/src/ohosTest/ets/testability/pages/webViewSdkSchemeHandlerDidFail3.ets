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

const EVENT_ID_SET_EMIT_KEY = 116460;

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
          .key('webViewSdkSchemeHandlerDidFail3Button')
          .onClick(async () => {
            await Utils.waitForExist(() => this.isReceive, 'webViewSdkSchemeHandlerDidFail3ButtonIsReceive', 1, 1000);
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
                switch (this.emitKey) {
                  case 'emitWebViewSdkSchemeHandlerDidFailNegative173': {
                    try {
                      resourceHandler.didFail(WebNetErrorList.ERR_WS_UPGRADE)
                      Utils.emitEvent('success', 116470)
                    } catch (error) {
                      const e: business_error.BusinessError = error as business_error.BusinessError;
                      console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                    }
                    break;
                  }
                  case 'emitWebViewSdkSchemeHandlerDidFailNegative174': {
                    try {
                      resourceHandler.didFail(WebNetErrorList.ERR_READ_IF_READY_NOT_IMPLEMENTED)
                      Utils.emitEvent('success', 116480)
                    } catch (error) {
                      const e: business_error.BusinessError = error as business_error.BusinessError;
                      console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                    }
                    break;
                  }
                  case 'emitWebViewSdkSchemeHandlerDidFailNegative176': {
                    try {
                      resourceHandler.didFail(WebNetErrorList.ERR_NO_BUFFER_SPACE)
                      Utils.emitEvent('success', 116490)
                    } catch (error) {
                      const e: business_error.BusinessError = error as business_error.BusinessError;
                      console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                    }
                    break;
                  }
                  case 'emitWebViewSdkSchemeHandlerDidFailNegative177': {
                    try {
                      resourceHandler.didFail(WebNetErrorList.ERR_SSL_CLIENT_AUTH_NO_COMMON_ALGORITHMS)
                      Utils.emitEvent('success', 116500)
                    } catch (error) {
                      const e: business_error.BusinessError = error as business_error.BusinessError;
                      console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                    }
                    break;
                  }
                  case 'emitWebViewSdkSchemeHandlerDidFailNegative178': {
                    try {
                      resourceHandler.didFail(WebNetErrorList.ERR_EARLY_DATA_REJECTED)
                      Utils.emitEvent('success', 116510)
                    } catch (error) {
                      const e: business_error.BusinessError = error as business_error.BusinessError;
                      console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                    }
                    break;
                  }
                  case 'emitWebViewSdkSchemeHandlerDidFailNegative179': {
                    try {
                      resourceHandler.didFail(WebNetErrorList.ERR_WRONG_VERSION_ON_EARLY_DATA)
                      Utils.emitEvent('success', 116520)
                    } catch (error) {
                      const e: business_error.BusinessError = error as business_error.BusinessError;
                      console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                    }
                    break;
                  }
                  case 'emitWebViewSdkSchemeHandlerDidFailNegative180': {
                    try {
                      resourceHandler.didFail(WebNetErrorList.ERR_TLS13_DOWNGRADE_DETECTED)
                      Utils.emitEvent('success', 116530)
                    } catch (error) {
                      const e: business_error.BusinessError = error as business_error.BusinessError;
                      console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                    }
                    break;
                  }
                  case 'emitWebViewSdkSchemeHandlerDidFailNegative181': {
                    try {
                      resourceHandler.didFail(WebNetErrorList.ERR_SSL_KEY_USAGE_INCOMPATIBLE)
                      Utils.emitEvent('success', 116540)
                    } catch (error) {
                      const e: business_error.BusinessError = error as business_error.BusinessError;
                      console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                    }
                    break;
                  }
                  case 'emitWebViewSdkSchemeHandlerDidFailNegative182': {
                    try {
                      resourceHandler.didFail(WebNetErrorList.ERR_INVALID_ECH_CONFIG_LIST)
                      Utils.emitEvent('success', 116550)
                    } catch (error) {
                      const e: business_error.BusinessError = error as business_error.BusinessError;
                      console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                    }
                    break;
                  }
                  case 'emitWebViewSdkSchemeHandlerDidFailNegative183': {
                    try {
                      resourceHandler.didFail(WebNetErrorList.ERR_ECH_NOT_NEGOTIATED)
                      Utils.emitEvent('success', 116560)
                    } catch (error) {
                      const e: business_error.BusinessError = error as business_error.BusinessError;
                      console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                    }
                    break;
                  }
                  case 'emitWebViewSdkSchemeHandlerDidFailNegative184': {
                    try {
                      resourceHandler.didFail(WebNetErrorList.ERR_ECH_FALLBACK_CERTIFICATE_INVALID)
                      Utils.emitEvent('success', 116570)
                    } catch (error) {
                      const e: business_error.BusinessError = error as business_error.BusinessError;
                      console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                    }
                    break;
                  }
                  case 'emitWebViewSdkSchemeHandlerDidFailNegative200': {
                    try {
                      resourceHandler.didFail(WebNetErrorList.ERR_CERT_COMMON_NAME_INVALID)
                      Utils.emitEvent('success', 116580)
                    } catch (error) {
                      const e: business_error.BusinessError = error as business_error.BusinessError;
                      console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                    }
                    break;
                  }
                  case 'emitWebViewSdkSchemeHandlerDidFailNegative201': {
                    try {
                      resourceHandler.didFail(WebNetErrorList.ERR_CERT_DATE_INVALID)
                      Utils.emitEvent('success', 116590)
                    } catch (error) {
                      const e: business_error.BusinessError = error as business_error.BusinessError;
                      console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                    }
                    break;
                  }
                  case 'emitWebViewSdkSchemeHandlerDidFailNegative202': {
                    try {
                      resourceHandler.didFail(WebNetErrorList.ERR_CERT_AUTHORITY_INVALID)
                      Utils.emitEvent('success', 116600)
                    } catch (error) {
                      const e: business_error.BusinessError = error as business_error.BusinessError;
                      console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                    }
                    break;
                  }
                  case 'emitWebViewSdkSchemeHandlerDidFailNegative203': {
                    try {
                      resourceHandler.didFail(WebNetErrorList.ERR_CERT_CONTAINS_ERRORS)
                      Utils.emitEvent('success', 116610)
                    } catch (error) {
                      const e: business_error.BusinessError = error as business_error.BusinessError;
                      console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                    }
                    break;
                  }
                  case 'emitWebViewSdkSchemeHandlerDidFailNegative204': {
                    try {
                      let code = WebNetErrorList.ERR_CERT_NO_REVOCATION_MECHANISM
                      resourceHandler.didFail(code)
                      Utils.emitEvent('success', 116620)
                    } catch (error) {
                      const e: business_error.BusinessError = error as business_error.BusinessError;
                      console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                    }
                    break;
                  }
                  case 'emitWebViewSdkSchemeHandlerDidFailNegative205': {
                    try {
                      resourceHandler.didFail(WebNetErrorList.ERR_CERT_UNABLE_TO_CHECK_REVOCATION)
                      Utils.emitEvent('success', 116630)
                    } catch (error) {
                      const e: business_error.BusinessError = error as business_error.BusinessError;
                      console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                    }
                    break;
                  }
                  case 'emitWebViewSdkSchemeHandlerDidFailNegative206': {
                    try {
                      resourceHandler.didFail(WebNetErrorList.ERR_CERT_REVOKED)
                      Utils.emitEvent('success', 116640)
                    } catch (error) {
                      const e: business_error.BusinessError = error as business_error.BusinessError;
                      console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                    }
                    break;
                  }
                  case 'emitWebViewSdkSchemeHandlerDidFailNegative207': {
                    try {
                      resourceHandler.didFail(WebNetErrorList.ERR_CERT_INVALID)
                      Utils.emitEvent('success', 116650)
                    } catch (error) {
                      const e: business_error.BusinessError = error as business_error.BusinessError;
                      console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                    }
                    break;
                  }
                  case 'emitWebViewSdkSchemeHandlerDidFailNegative208': {
                    try {
                      resourceHandler.didFail(WebNetErrorList.ERR_CERT_WEAK_SIGNATURE_ALGORITHM)
                      Utils.emitEvent('success', 116660)
                    } catch (error) {
                      const e: business_error.BusinessError = error as business_error.BusinessError;
                      console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                    }
                    break;
                  }
                  case 'emitWebViewSdkSchemeHandlerDidFailNegative210': {
                    try {
                      resourceHandler.didFail(WebNetErrorList.ERR_CERT_NON_UNIQUE_NAME)
                      Utils.emitEvent('success', 116670)
                    } catch (error) {
                      const e: business_error.BusinessError = error as business_error.BusinessError;
                      console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                    }
                    break;
                  }
                  case 'emitWebViewSdkSchemeHandlerDidFailNegative211': {
                    try {
                      resourceHandler.didFail(WebNetErrorList.ERR_CERT_WEAK_KEY)
                      Utils.emitEvent('success', 116680)
                    } catch (error) {
                      const e: business_error.BusinessError = error as business_error.BusinessError;
                      console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                    }
                    break;
                  }
                  case 'emitWebViewSdkSchemeHandlerDidFailNegative212': {
                    try {
                      resourceHandler.didFail(WebNetErrorList.ERR_CERT_NAME_CONSTRAINT_VIOLATION)
                      Utils.emitEvent('success', 116690)
                    } catch (error) {
                      const e: business_error.BusinessError = error as business_error.BusinessError;
                      console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                    }
                    break;
                  }
                  case 'emitWebViewSdkSchemeHandlerDidFailNegative213': {
                    try {
                      resourceHandler.didFail(WebNetErrorList.ERR_CERT_VALIDITY_TOO_LONG)
                      Utils.emitEvent('success', 116700)
                    } catch (error) {
                      const e: business_error.BusinessError = error as business_error.BusinessError;
                      console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                    }
                    break;
                  }
                  case 'emitWebViewSdkSchemeHandlerDidFailNegative214': {
                    try {
                      resourceHandler.didFail(WebNetErrorList.ERR_CERTIFICATE_TRANSPARENCY_REQUIRED)
                      Utils.emitEvent('success', 116710)
                    } catch (error) {
                      const e: business_error.BusinessError = error as business_error.BusinessError;
                      console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                    }
                    break;
                  }
                  case 'emitWebViewSdkSchemeHandlerDidFailNegative215': {
                    try {
                      resourceHandler.didFail(WebNetErrorList.ERR_CERT_SYMANTEC_LEGACY)
                      Utils.emitEvent('success', 116720)
                    } catch (error) {
                      const e: business_error.BusinessError = error as business_error.BusinessError;
                      console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                    }
                    break;
                  }
                  case 'emitWebViewSdkSchemeHandlerDidFailNegative217': {
                    try {
                      resourceHandler.didFail(WebNetErrorList.ERR_CERT_KNOWN_INTERCEPTION_BLOCKED)
                      Utils.emitEvent('success', 116730)
                    } catch (error) {
                      const e: business_error.BusinessError = error as business_error.BusinessError;
                      console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                    }
                    break;
                  }
                  case 'emitWebViewSdkSchemeHandlerDidFailNegative218': {
                    try {
                      resourceHandler.didFail(WebNetErrorList.ERR_SSL_OBSOLETE_VERSION_OR_CIPHER)
                      Utils.emitEvent('success', 116740)
                    } catch (error) {
                      const e: business_error.BusinessError = error as business_error.BusinessError;
                      console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                    }
                    break;
                  }
                  case 'emitWebViewSdkSchemeHandlerDidFailNegative219': {
                    try {
                      resourceHandler.didFail(WebNetErrorList.ERR_CERT_END)
                      Utils.emitEvent('success', 116750)
                    } catch (error) {
                      const e: business_error.BusinessError = error as business_error.BusinessError;
                      console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                    }
                    break;
                  }
                  case 'emitWebViewSdkSchemeHandlerDidFailNegative300': {
                    try {
                      resourceHandler.didFail(WebNetErrorList.ERR_INVALID_URL)
                      Utils.emitEvent('success', 116760)
                    } catch (error) {
                      const e: business_error.BusinessError = error as business_error.BusinessError;
                      console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                    }
                    break;
                  }
                  case 'emitWebViewSdkSchemeHandlerDidFailNegative301': {
                    try {
                      resourceHandler.didFail(WebNetErrorList.ERR_DISALLOWED_URL_SCHEME)
                      Utils.emitEvent('success', 116770)
                    } catch (error) {
                      const e: business_error.BusinessError = error as business_error.BusinessError;
                      console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                    }
                    break;
                  }
                  case 'emitWebViewSdkSchemeHandlerDidFailNegative302': {
                    try {
                      resourceHandler.didFail(WebNetErrorList.ERR_UNKNOWN_URL_SCHEME)
                      Utils.emitEvent('success', 116780)
                    } catch (error) {
                      const e: business_error.BusinessError = error as business_error.BusinessError;
                      console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                    }
                    break;
                  }
                  case 'emitWebViewSdkSchemeHandlerDidFailNegative303': {
                    try {
                      resourceHandler.didFail(WebNetErrorList.ERR_INVALID_REDIRECT)
                      Utils.emitEvent('success', 116790)
                    } catch (error) {
                      const e: business_error.BusinessError = error as business_error.BusinessError;
                      console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                    }
                    break;
                  }
                  case 'emitWebViewSdkSchemeHandlerDidFailNegative310': {
                    try {
                      resourceHandler.didFail(WebNetErrorList.ERR_TOO_MANY_REDIRECTS)
                      Utils.emitEvent('success', 116800)
                    } catch (error) {
                      const e: business_error.BusinessError = error as business_error.BusinessError;
                      console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                    }
                    break;
                  }
                  case 'emitWebViewSdkSchemeHandlerDidFailNegative311': {
                    try {
                      resourceHandler.didFail(WebNetErrorList.ERR_UNSAFE_REDIRECT)
                      Utils.emitEvent('success', 116810)
                    } catch (error) {
                      const e: business_error.BusinessError = error as business_error.BusinessError;
                      console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                    }
                    break;
                  }
                  case 'emitWebViewSdkSchemeHandlerDidFailNegative312': {
                    try {
                      resourceHandler.didFail(WebNetErrorList.ERR_UNSAFE_PORT)
                      Utils.emitEvent('success', 116820)
                    } catch (error) {
                      const e: business_error.BusinessError = error as business_error.BusinessError;
                      console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                    }
                    break;
                  }
                  case 'emitWebViewSdkSchemeHandlerDidFailNegative320': {
                    try {
                      let code = WebNetErrorList.ERR_INVALID_RESPONSE
                      resourceHandler.didFail(code)
                      Utils.emitEvent('success', 116830)
                    } catch (error) {
                      const e: business_error.BusinessError = error as business_error.BusinessError;
                      console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                    }
                    break;
                  }
                  case 'emitWebViewSdkSchemeHandlerDidFailNegative321': {
                    try {
                      resourceHandler.didFail(WebNetErrorList.ERR_INVALID_CHUNKED_ENCODING)
                      Utils.emitEvent('success', 116840)
                    } catch (error) {
                      const e: business_error.BusinessError = error as business_error.BusinessError;
                      console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                    }
                    break;
                  }
                  case 'emitWebViewSdkSchemeHandlerDidFailNegative322': {
                    try {
                      resourceHandler.didFail(WebNetErrorList.ERR_METHOD_UNSUPPORTED)
                      Utils.emitEvent('success', 116850)
                    } catch (error) {
                      const e: business_error.BusinessError = error as business_error.BusinessError;
                      console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                    }
                    break;
                  }
                  case 'emitWebViewSdkSchemeHandlerDidFailNegative323': {
                    try {
                      resourceHandler.didFail(WebNetErrorList.ERR_UNEXPECTED_PROXY_AUTH)
                      Utils.emitEvent('success', 116860)
                    } catch (error) {
                      const e: business_error.BusinessError = error as business_error.BusinessError;
                      console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                    }
                    break;
                  }
                  case 'emitWebViewSdkSchemeHandlerDidFailNegative324': {
                    try {
                      resourceHandler.didFail(WebNetErrorList.ERR_EMPTY_RESPONSE)
                      Utils.emitEvent('success', 116870)
                    } catch (error) {
                      const e: business_error.BusinessError = error as business_error.BusinessError;
                      console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                    }
                    break;
                  }
                  case 'emitWebViewSdkSchemeHandlerDidFailNegative325': {
                    try {
                      resourceHandler.didFail(WebNetErrorList.ERR_RESPONSE_HEADERS_TOO_BIG)
                      Utils.emitEvent('success', 116880)
                    } catch (error) {
                      const e: business_error.BusinessError = error as business_error.BusinessError;
                      console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                    }
                    break;
                  }
                  case 'emitWebViewSdkSchemeHandlerDidFailNegative327': {
                    try {
                      resourceHandler.didFail(WebNetErrorList.ERR_PAC_SCRIPT_FAILED)
                      Utils.emitEvent('success', 116890)
                    } catch (error) {
                      const e: business_error.BusinessError = error as business_error.BusinessError;
                      console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                    }
                    break;
                  }
                  case 'emitWebViewSdkSchemeHandlerDidFailNegative328': {
                    try {
                      resourceHandler.didFail(WebNetErrorList.ERR_REQUEST_RANGE_NOT_SATISFIABLE)
                      Utils.emitEvent('success', 116900)
                    } catch (error) {
                      const e: business_error.BusinessError = error as business_error.BusinessError;
                      console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                    }
                    break;
                  }
                  case 'emitWebViewSdkSchemeHandlerDidFailNegative329': {
                    try {
                      resourceHandler.didFail(WebNetErrorList.ERR_MALFORMED_IDENTITY)
                      Utils.emitEvent('success', 116910)
                    } catch (error) {
                      const e: business_error.BusinessError = error as business_error.BusinessError;
                      console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                    }
                    break;
                  }
                  case 'emitWebViewSdkSchemeHandlerDidFailNegative330': {
                    try {
                      resourceHandler.didFail(WebNetErrorList.ERR_CONTENT_DECODING_FAILED)
                      Utils.emitEvent('success', 116920)
                    } catch (error) {
                      const e: business_error.BusinessError = error as business_error.BusinessError;
                      console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                    }
                    break;
                  }
                  case 'emitWebViewSdkSchemeHandlerDidFailNegative331': {
                    try {
                      resourceHandler.didFail(WebNetErrorList.ERR_NETWORK_IO_SUSPENDED)
                      Utils.emitEvent('success', 116930)
                    } catch (error) {
                      const e: business_error.BusinessError = error as business_error.BusinessError;
                      console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                    }
                    break;
                  }
                  case 'emitWebViewSdkSchemeHandlerDidFailNegative332': {
                    try {
                      resourceHandler.didFail(WebNetErrorList.ERR_SYN_REPLY_NOT_RECEIVED)
                      Utils.emitEvent('success', 116940)
                    } catch (error) {
                      const e: business_error.BusinessError = error as business_error.BusinessError;
                      console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                    }
                    break;
                  }
                  case 'emitWebViewSdkSchemeHandlerDidFailNegative333': {
                    try {
                      resourceHandler.didFail(WebNetErrorList.ERR_ENCODING_CONVERSION_FAILED)
                      Utils.emitEvent('success', 116950)
                    } catch (error) {
                      const e: business_error.BusinessError = error as business_error.BusinessError;
                      console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                    }
                    break;
                  }
                  case 'emitWebViewSdkSchemeHandlerDidFailNegative334': {
                    try {
                      resourceHandler.didFail(WebNetErrorList.ERR_UNRECOGNIZED_FTP_DIRECTORY_LISTING_FORMAT)
                      Utils.emitEvent('success', 116960)
                    } catch (error) {
                      const e: business_error.BusinessError = error as business_error.BusinessError;
                      console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                    }
                    break;
                  }
                  case 'emitWebViewSdkSchemeHandlerDidFailNegative336': {
                    try {
                      resourceHandler.didFail(WebNetErrorList.ERR_NO_SUPPORTED_PROXIES)
                      Utils.emitEvent('success', 116970)
                    } catch (error) {
                      const e: business_error.BusinessError = error as business_error.BusinessError;
                      console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                    }
                    break;
                  }
                  case 'emitWebViewSdkSchemeHandlerDidFailNegative337': {
                    try {
                      resourceHandler.didFail(WebNetErrorList.ERR_HTTP2_PROTOCOL_ERROR)
                      Utils.emitEvent('success', 116980)
                    } catch (error) {
                      const e: business_error.BusinessError = error as business_error.BusinessError;
                      console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                    }
                    break;
                  }
                  case 'emitWebViewSdkSchemeHandlerDidFailNegative338': {
                    try {
                      resourceHandler.didFail(WebNetErrorList.ERR_INVALID_AUTH_CREDENTIALS)
                      Utils.emitEvent('success', 116990)
                    } catch (error) {
                      const e: business_error.BusinessError = error as business_error.BusinessError;
                      console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                    }
                    break;
                  }
                  case 'emitWebViewSdkSchemeHandlerDidFailNegative339': {
                    try {
                      resourceHandler.didFail(WebNetErrorList.ERR_UNSUPPORTED_AUTH_SCHEME)
                      Utils.emitEvent('success', 117000)
                    } catch (error) {
                      const e: business_error.BusinessError = error as business_error.BusinessError;
                      console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                    }
                    break;
                  }
                  case 'emitWebViewSdkSchemeHandlerDidFailNegative340': {
                    try {
                      resourceHandler.didFail(WebNetErrorList.ERR_ENCODING_DETECTION_FAILED)
                      Utils.emitEvent('success', 117010)
                    } catch (error) {
                      const e: business_error.BusinessError = error as business_error.BusinessError;
                      console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                    }
                    break;
                  }
                  case 'emitWebViewSdkSchemeHandlerDidFailNegative341': {
                    try {
                      resourceHandler.didFail(WebNetErrorList.ERR_MISSING_AUTH_CREDENTIALS)
                      Utils.emitEvent('success', 117020)
                    } catch (error) {
                      const e: business_error.BusinessError = error as business_error.BusinessError;
                      console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                    }
                    break;
                  }
                  case 'emitWebViewSdkSchemeHandlerDidFailNegative342': {
                    try {
                      resourceHandler.didFail(WebNetErrorList.ERR_UNEXPECTED_SECURITY_LIBRARY_STATUS)
                      Utils.emitEvent('success', 117030)
                    } catch (error) {
                      const e: business_error.BusinessError = error as business_error.BusinessError;
                      console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                    }
                    break;
                  }
                  case 'emitWebViewSdkSchemeHandlerDidFailNegative343': {
                    try {
                      resourceHandler.didFail(WebNetErrorList.ERR_MISCONFIGURED_AUTH_ENVIRONMENT)
                      Utils.emitEvent('success', 117040)
                    } catch (error) {
                      const e: business_error.BusinessError = error as business_error.BusinessError;
                      console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                    }
                    break;
                  }
                  case 'emitWebViewSdkSchemeHandlerDidFailNegative344': {
                    try {
                      resourceHandler.didFail(WebNetErrorList.ERR_UNDOCUMENTED_SECURITY_LIBRARY_STATUS)
                      Utils.emitEvent('success', 117050)
                    } catch (error) {
                      const e: business_error.BusinessError = error as business_error.BusinessError;
                      console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                    }
                    break;
                  }
                  case 'emitWebViewSdkSchemeHandlerDidFailNegative345': {
                    try {
                      resourceHandler.didFail(WebNetErrorList.ERR_RESPONSE_BODY_TOO_BIG_TO_DRAIN)
                      Utils.emitEvent('success', 117060)
                    } catch (error) {
                      const e: business_error.BusinessError = error as business_error.BusinessError;
                      console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                    }
                    break;
                  }
                  case 'emitWebViewSdkSchemeHandlerDidFailNegative347': {
                    try {
                      resourceHandler.didFail(WebNetErrorList.ERR_INCOMPLETE_HTTP2_HEADERS)
                      Utils.emitEvent('success', 117070)
                    } catch (error) {
                      const e: business_error.BusinessError = error as business_error.BusinessError;
                      console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                    }
                    break;
                  }
                  case 'emitWebViewSdkSchemeHandlerDidFailNegative348': {
                    try {
                      resourceHandler.didFail(WebNetErrorList.ERR_PAC_NOT_IN_DHCP)
                      Utils.emitEvent('success', 117080)
                    } catch (error) {
                      const e: business_error.BusinessError = error as business_error.BusinessError;
                      console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                    }
                    break;
                  }
                  case 'emitWebViewSdkSchemeHandlerDidFailNegative349': {
                    try {
                      resourceHandler.didFail(WebNetErrorList.ERR_RESPONSE_HEADERS_MULTIPLE_CONTENT_DISPOSITION)
                      Utils.emitEvent('success', 117090)
                    } catch (error) {
                      const e: business_error.BusinessError = error as business_error.BusinessError;
                      console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                    }
                    break;
                  }
                  case 'emitWebViewSdkSchemeHandlerDidFailNegative350': {
                    try {
                      resourceHandler.didFail(WebNetErrorList.ERR_RESPONSE_HEADERS_MULTIPLE_LOCATION)
                      Utils.emitEvent('success', 117100)
                    } catch (error) {
                      const e: business_error.BusinessError = error as business_error.BusinessError;
                      console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                    }
                    break;
                  }
                  case 'emitWebViewSdkSchemeHandlerDidFailNegative351': {
                    try {
                      resourceHandler.didFail(WebNetErrorList.ERR_HTTP2_SERVER_REFUSED_STREAM)
                      Utils.emitEvent('success', 117110)
                    } catch (error) {
                      const e: business_error.BusinessError = error as business_error.BusinessError;
                      console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                    }
                    break;
                  }
                  case 'emitWebViewSdkSchemeHandlerDidFailNegative352': {
                    try {
                      resourceHandler.didFail(WebNetErrorList.ERR_HTTP2_PING_FAILED)
                      Utils.emitEvent('success', 117120)
                    } catch (error) {
                      const e: business_error.BusinessError = error as business_error.BusinessError;
                      console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                    }
                    break;
                  }
                  case 'emitWebViewSdkSchemeHandlerDidFailNegative354': {
                    try {
                      resourceHandler.didFail(WebNetErrorList.ERR_CONTENT_LENGTH_MISMATCH)
                      Utils.emitEvent('success', 117130)
                    } catch (error) {
                      const e: business_error.BusinessError = error as business_error.BusinessError;
                      console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                    }
                    break;
                  }
                  case 'emitWebViewSdkSchemeHandlerDidFailNegative355': {
                    try {
                      resourceHandler.didFail(WebNetErrorList.ERR_INCOMPLETE_CHUNKED_ENCODING)
                      Utils.emitEvent('success', 117140)
                    } catch (error) {
                      const e: business_error.BusinessError = error as business_error.BusinessError;
                      console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                    }
                    break;
                  }
                  case 'emitWebViewSdkSchemeHandlerDidFailNegative356': {
                    try {
                      resourceHandler.didFail(WebNetErrorList.ERR_QUIC_PROTOCOL_ERROR)
                      Utils.emitEvent('success', 117150)
                    } catch (error) {
                      const e: business_error.BusinessError = error as business_error.BusinessError;
                      console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                    }
                    break;
                  }
                  case 'emitWebViewSdkSchemeHandlerDidFailNegative357': {
                    try {
                      resourceHandler.didFail(WebNetErrorList.ERR_RESPONSE_HEADERS_TRUNCATED)
                      Utils.emitEvent('success', 117160)
                    } catch (error) {
                      const e: business_error.BusinessError = error as business_error.BusinessError;
                      console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                    }
                    break;
                  }
                  case 'emitWebViewSdkSchemeHandlerDidFailNegative358': {
                    try {
                      resourceHandler.didFail(WebNetErrorList.ERR_QUIC_HANDSHAKE_FAILED)
                      Utils.emitEvent('success', 117170)
                    } catch (error) {
                      const e: business_error.BusinessError = error as business_error.BusinessError;
                      console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                    }
                    break;
                  }
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