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

const EVENT_ID_SET_EMIT_KEY = 117000;

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
          .key('webViewSdkSchemeHandlerDidFailWan2Button')
          .onClick(async () => {
            await Utils.waitForExist(() => this.isReceive, 'webViewSdkSchemeHandlerDidFailWan2ButtonIsReceive', 1,
              1000);
            console.info('key==>' + this.emitKey);
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
                  case 'emitWebViewSdkSchemeHandlerDidFailNegative701': {
                    try {
                      resourceHandler.didFail(WebNetErrorList.ERR_PKCS12_IMPORT_BAD_PASSWORD);
                      Utils.emitEvent('success', 117010);
                    } catch (error) {
                      let e: business_error.BusinessError = error as business_error.BusinessError;
                      console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                    }
                    break;
                  }
                  case 'emitWebViewSdkSchemeHandlerDidFailNegative702': {
                    try {
                      resourceHandler.didFail(WebNetErrorList.ERR_PKCS12_IMPORT_FAILED);
                      Utils.emitEvent('success', 117020);
                    } catch (error) {
                      let e: business_error.BusinessError = error as business_error.BusinessError;
                      console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                    }
                    break;
                  }
                  case 'emitWebViewSdkSchemeHandlerDidFailNegative703': {
                    try {
                      resourceHandler.didFail(WebNetErrorList.ERR_IMPORT_CA_CERT_NOT_CA);
                      Utils.emitEvent('success', 117030);
                    } catch (error) {
                      let e: business_error.BusinessError = error as business_error.BusinessError;
                      console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                    }
                    break;
                  }
                  case 'emitWebViewSdkSchemeHandlerDidFailNegative704': {
                    try {
                      resourceHandler.didFail(WebNetErrorList.ERR_IMPORT_CERT_ALREADY_EXISTS);
                      Utils.emitEvent('success', 117040);
                    } catch (error) {
                      let e: business_error.BusinessError = error as business_error.BusinessError;
                      console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                    }
                    break;
                  }
                  case 'emitWebViewSdkSchemeHandlerDidFailNegative705': {
                    try {
                      resourceHandler.didFail(WebNetErrorList.ERR_IMPORT_CA_CERT_FAILED);
                      Utils.emitEvent('success', 117050);
                    } catch (error) {
                      let e: business_error.BusinessError = error as business_error.BusinessError;
                      console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                    }
                    break;
                  }
                  case 'emitWebViewSdkSchemeHandlerDidFailNegative706': {
                    try {
                      resourceHandler.didFail(WebNetErrorList.ERR_IMPORT_SERVER_CERT_FAILED);
                      Utils.emitEvent('success', 117060);
                    } catch (error) {
                      let e: business_error.BusinessError = error as business_error.BusinessError;
                      console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                    }
                    break;
                  }
                  case 'emitWebViewSdkSchemeHandlerDidFailNegative707': {
                    try {
                      resourceHandler.didFail(WebNetErrorList.ERR_PKCS12_IMPORT_INVALID_MAC);
                      Utils.emitEvent('success', 117070);
                    } catch (error) {
                      let e: business_error.BusinessError = error as business_error.BusinessError;
                      console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                    }
                    break;
                  }
                  case 'emitWebViewSdkSchemeHandlerDidFailNegative708': {
                    try {
                      resourceHandler.didFail(WebNetErrorList.ERR_PKCS12_IMPORT_INVALID_FILE);
                      Utils.emitEvent('success', 117080);
                    } catch (error) {
                      let e: business_error.BusinessError = error as business_error.BusinessError;
                      console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                    }
                    break;
                  }
                  case 'emitWebViewSdkSchemeHandlerDidFailNegative709': {
                    try {
                      resourceHandler.didFail(WebNetErrorList.ERR_PKCS12_IMPORT_UNSUPPORTED);
                      Utils.emitEvent('success', 117090);
                    } catch (error) {
                      let e: business_error.BusinessError = error as business_error.BusinessError;
                      console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                    }
                    break;
                  }
                  case 'emitWebViewSdkSchemeHandlerDidFailNegative710': {
                    try {
                      resourceHandler.didFail(WebNetErrorList.ERR_KEY_GENERATION_FAILED);
                      Utils.emitEvent('success', 117100);
                    } catch (error) {
                      let e: business_error.BusinessError = error as business_error.BusinessError;
                      console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                    }
                    break;
                  }
                  case 'emitWebViewSdkSchemeHandlerDidFailNegative712': {
                    try {
                      resourceHandler.didFail(WebNetErrorList.ERR_PRIVATE_KEY_EXPORT_FAILED);
                      Utils.emitEvent('success', 117110);
                    } catch (error) {
                      let e: business_error.BusinessError = error as business_error.BusinessError;
                      console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                    }
                    break;
                  }
                  case 'emitWebViewSdkSchemeHandlerDidFailNegative713': {
                    try {
                      resourceHandler.didFail(WebNetErrorList.ERR_SELF_SIGNED_CERT_GENERATION_FAILED);
                      Utils.emitEvent('success', 117120);
                    } catch (error) {
                      let e: business_error.BusinessError = error as business_error.BusinessError;
                      console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                    }
                    break;
                  }
                  case 'emitWebViewSdkSchemeHandlerDidFailNegative714': {
                    try {
                      resourceHandler.didFail(WebNetErrorList.ERR_CERT_DATABASE_CHANGED);
                      Utils.emitEvent('success', 117130);
                    } catch (error) {
                      let e: business_error.BusinessError = error as business_error.BusinessError;
                      console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                    }
                    break;
                  }
                  case 'emitWebViewSdkSchemeHandlerDidFailNegative716': {
                    try {
                      resourceHandler.didFail(WebNetErrorList.ERR_CERT_VERIFIER_CHANGED);
                      Utils.emitEvent('success', 117140);
                    } catch (error) {
                      let e: business_error.BusinessError = error as business_error.BusinessError;
                      console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                    }
                    break;
                  }
                  case 'emitWebViewSdkSchemeHandlerDidFailNegative800': {
                    try {
                      resourceHandler.didFail(WebNetErrorList.ERR_DNS_MALFORMED_RESPONSE);
                      Utils.emitEvent('success', 117150);
                    } catch (error) {
                      let e: business_error.BusinessError = error as business_error.BusinessError;
                      console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                    }
                    break;
                  }
                  case 'emitWebViewSdkSchemeHandlerDidFailNegative801': {
                    try {
                      resourceHandler.didFail(WebNetErrorList.ERR_DNS_SERVER_REQUIRES_TCP);
                      Utils.emitEvent('success', 117160);
                    } catch (error) {
                      let e: business_error.BusinessError = error as business_error.BusinessError;
                      console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                    }
                    break;
                  }
                  case 'emitWebViewSdkSchemeHandlerDidFailNegative802': {
                    try {
                      resourceHandler.didFail(WebNetErrorList.ERR_DNS_SERVER_FAILED);
                      Utils.emitEvent('success', 117170);
                    } catch (error) {
                      let e: business_error.BusinessError = error as business_error.BusinessError;
                      console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                    }
                    break;
                  }
                  case 'emitWebViewSdkSchemeHandlerDidFailNegative803': {
                    try {
                      resourceHandler.didFail(WebNetErrorList.ERR_DNS_TIMED_OUT);
                      Utils.emitEvent('success', 117180);
                    } catch (error) {
                      let e: business_error.BusinessError = error as business_error.BusinessError;
                      console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                    }
                    break;
                  }
                  case 'emitWebViewSdkSchemeHandlerDidFailNegative804': {
                    try {
                      resourceHandler.didFail(WebNetErrorList.ERR_DNS_CACHE_MISS);
                      Utils.emitEvent('success', 117190);
                    } catch (error) {
                      let e: business_error.BusinessError = error as business_error.BusinessError;
                      console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                    }
                    break;
                  }
                  case 'emitWebViewSdkSchemeHandlerDidFailNegative805': {
                    try {
                      resourceHandler.didFail(WebNetErrorList.ERR_DNS_SEARCH_EMPTY);
                      Utils.emitEvent('success', 117200);
                    } catch (error) {
                      let e: business_error.BusinessError = error as business_error.BusinessError;
                      console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                    }
                    break;
                  }
                  case 'emitWebViewSdkSchemeHandlerDidFailNegative806': {
                    try {
                      resourceHandler.didFail(WebNetErrorList.ERR_DNS_SORT_ERROR);
                      Utils.emitEvent('success', 117210);
                    } catch (error) {
                      let e: business_error.BusinessError = error as business_error.BusinessError;
                      console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                    }
                    break;
                  }
                  case 'emitWebViewSdkSchemeHandlerDidFailNegative808': {
                    try {
                      resourceHandler.didFail(WebNetErrorList.ERR_DNS_SECURE_RESOLVER_HOSTNAME_RESOLUTION_FAILED);
                      Utils.emitEvent('success', 117220);
                    } catch (error) {
                      let e: business_error.BusinessError = error as business_error.BusinessError;
                      console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                    }
                    break;
                  }
                  case 'emitWebViewSdkSchemeHandlerDidFailNegative809': {
                    try {
                      resourceHandler.didFail(WebNetErrorList.ERR_DNS_NAME_HTTPS_ONLY);
                      Utils.emitEvent('success', 117230);
                    } catch (error) {
                      let e: business_error.BusinessError = error as business_error.BusinessError;
                      console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                    }
                    break;
                  }
                  case 'emitWebViewSdkSchemeHandlerDidFailNegative810': {
                    try {
                      resourceHandler.didFail(WebNetErrorList.ERR_DNS_REQUEST_CANCELED);
                      Utils.emitEvent('success', 117240);
                    } catch (error) {
                      let e: business_error.BusinessError = error as business_error.BusinessError;
                      console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                    }
                    break;
                  }
                  case 'emitWebViewSdkSchemeHandlerDidFailNegative811': {
                    try {
                      resourceHandler.didFail(WebNetErrorList.ERR_DNS_NO_MATCHING_SUPPORTED_ALPN);
                      Utils.emitEvent('success', 117250);
                    } catch (error) {
                      let e: business_error.BusinessError = error as business_error.BusinessError;
                      console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                    }
                    break;
                  }
                  case 'emitWebViewSdkSchemeHandlerDidFailNegativeNull': {
                    try {
                      resourceHandler.didFail(null);
                    } catch (error) {
                      let e: business_error.BusinessError = error as business_error.BusinessError;
                      console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                      if (e.code.toString() === '401') {
                        Utils.emitEvent('success', 117260);
                      } else {
                        Utils.emitEvent('error code error', 117260);
                      }
                    }
                    break;
                  }
                  case 'emitWebViewSdkSchemeHandlerDidFailMore': {
                    try {
                      resourceHandler.didFail(5);
                      Utils.emitEvent('success', 117270);
                    } catch (error) {
                      let e: business_error.BusinessError = error as business_error.BusinessError;
                      console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                    }
                    break;
                  }
                  case 'emitWebViewSdkSchemeHandlerDidFailResourceInvalid': {
                    try {
                      resourceHandler = new webview.WebResourceHandler();
                      resourceHandler.didFail(WebNetErrorList.ERR_DNS_REQUEST_CANCELED);
                    } catch (error) {
                      let e: business_error.BusinessError = error as business_error.BusinessError;
                      console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                      Utils.emitEvent('success', 117280);
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