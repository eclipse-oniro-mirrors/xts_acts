/*
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

import Utils from '../../test/Utils.test';
import events_emitter from '@ohos.events.emitter';
import AbilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import { Hypium } from '@ohos/hypium';
import testsuite from '../../test/List.test';
import web_webview from '@ohos.web.webview';
import { WebNetErrorList } from '@ohos.web.netErrorList'
import { BusinessError } from '@ohos.base';
const EVENT_ID_SET_EIMIT_KEY = 101000;

@Entry
@Component
struct WebInitTest {
  controller: web_webview.WebviewController = new web_webview.WebviewController();
  @State str: string = ""
  @State webInit: boolean = false
  @State webCreated: boolean = false
  @State interceptUrl: string = ''
  @State consoleMsg: string = ''
  @State consoleCorsError: boolean = false
  @State isReceive: number = -1;
  @State isPageEnd: number = -1;

  onPageShow() {
    let valueChangeEvent: events_emitter.InnerEvent = {
      eventId: EVENT_ID_SET_EIMIT_KEY,
      priority: events_emitter.EventPriority.LOW
    }
    events_emitter.on(valueChangeEvent, this.valueChangeCallBack)
  }

  onPageHide() {
    events_emitter.off(EVENT_ID_SET_EIMIT_KEY)
  }

  private valueChangeCallBack = (eventData: events_emitter.EventData) => {
    console.info('web page valueChangeCallBack');
    if (eventData != null) {
      console.info('valueChangeCallBack:' + JSON.stringify(eventData));
      if (eventData.data != null && eventData.data.ACTION != null) {
        this.str = eventData.data.ACTION;
        this.isReceive = 1;
        try {
          this.controller.loadUrl("resource://rawfile/index.html");
        } catch (error) {
          console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
        }
      }
    }
  }

  aboutToAppear() {
    let abilityDelegator = AbilityDelegatorRegistry.getAbilityDelegator()
    let abilityDelegatorArguments = AbilityDelegatorRegistry.getArguments()
    console.info('start run testcase!!!')
    Hypium.hypiumTest(abilityDelegator, abilityDelegatorArguments, testsuite)
  }

  build() {
    Row() {
      Column() {
        Button('WebSchemeHandlerResponse')
          .key('WebSchemeHandlerResponse')
          .onClick(async () => {
            await Utils.waitForExist(()=>this.isPageEnd, 'WebSchemeHandlerResponseIsPageEnd', 1, 1000);
            await Utils.waitForExist(()=>this.isReceive, 'WebSchemeHandlerResponseIsReceive', 1, 1000);
            console.info('key==>' + this.str)
            this.isReceive = -1;
            this.isPageEnd = -1;
            switch (this.str) {
              case "WebNetErrorList_03100": {
                let response = new web_webview.WebSchemeHandlerResponse();
                try {
                  response.setNetErrorCode(WebNetErrorList.ERR_BLOCKED_BY_ORB)
                  console.log('[schemeHandler] getNetErrorCode:' + response.getNetErrorCode())
                  Utils.emitEvent(response.getNetErrorCode(), 101310)
                } catch (error) {
                  console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
                }
                break;
              }
              case "WebNetErrorList_03200": {
                let response = new web_webview.WebSchemeHandlerResponse();
                try {
                  response.setNetErrorCode(WebNetErrorList.ERR_CONNECTION_CLOSED)
                  console.log('[schemeHandler] getNetErrorCode:' + response.getNetErrorCode())
                  Utils.emitEvent(response.getNetErrorCode(), 101320)
                } catch (error) {
                  console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
                }
                break;
              }
              case "WebNetErrorList_03300": {
                let response = new web_webview.WebSchemeHandlerResponse();
                try {
                  response.setNetErrorCode(WebNetErrorList.ERR_CONNECTION_RESET)
                  console.log('[schemeHandler] getNetErrorCode:' + response.getNetErrorCode())
                  Utils.emitEvent(response.getNetErrorCode(), 101330)
                } catch (error) {
                  console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
                }
                break;
              }
              case "WebNetErrorList_03400": {
                let response = new web_webview.WebSchemeHandlerResponse();
                try {
                  response.setNetErrorCode(WebNetErrorList.ERR_CONNECTION_REFUSED)
                  console.log('[schemeHandler] getNetErrorCode:' + response.getNetErrorCode())
                  Utils.emitEvent(response.getNetErrorCode(), 101340)
                } catch (error) {
                  console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
                }
                break;
              }
              case "WebNetErrorList_03500": {
                let response = new web_webview.WebSchemeHandlerResponse();
                try {
                  response.setNetErrorCode(WebNetErrorList.ERR_CONNECTION_ABORTED)
                  console.log('[schemeHandler] getNetErrorCode:' + response.getNetErrorCode())
                  Utils.emitEvent(response.getNetErrorCode(), 101350)
                } catch (error) {
                  console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
                }
                break;
              }
              case "WebNetErrorList_03600": {
                let response = new web_webview.WebSchemeHandlerResponse();
                try {
                  response.setNetErrorCode(WebNetErrorList.ERR_CONNECTION_FAILED)
                  console.log('[schemeHandler] getNetErrorCode:' + response.getNetErrorCode())
                  Utils.emitEvent(response.getNetErrorCode(), 101360)
                } catch (error) {
                  console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
                }
                break;
              }
              case "WebNetErrorList_03700": {
                let response = new web_webview.WebSchemeHandlerResponse();
                try {
                  response.setNetErrorCode(WebNetErrorList.ERR_NAME_NOT_RESOLVED)
                  console.log('[schemeHandler] getNetErrorCode:' + response.getNetErrorCode())
                  Utils.emitEvent(response.getNetErrorCode(), 101370)
                } catch (error) {
                  console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
                }
                break;
              }
              case "WebNetErrorList_03800": {
                let response = new web_webview.WebSchemeHandlerResponse();
                try {
                  response.setNetErrorCode(WebNetErrorList.ERR_INTERNET_DISCONNECTED)
                  console.log('[schemeHandler] getNetErrorCode:' + response.getNetErrorCode())
                  Utils.emitEvent(response.getNetErrorCode(), 101380)
                } catch (error) {
                  console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
                }
                break;
              }
              case "WebNetErrorList_03900": {
                let response = new web_webview.WebSchemeHandlerResponse();
                try {
                  response.setNetErrorCode(WebNetErrorList.ERR_SSL_PROTOCOL_ERROR)
                  console.log('[schemeHandler] getNetErrorCode:' + response.getNetErrorCode())
                  Utils.emitEvent(response.getNetErrorCode(), 101390)
                } catch (error) {
                  console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
                }
                break;
              }
              case "WebNetErrorList_04000": {
                let response = new web_webview.WebSchemeHandlerResponse();
                try {
                  response.setNetErrorCode(WebNetErrorList.ERR_ADDRESS_INVALID)
                  console.log('[schemeHandler] getNetErrorCode:' + response.getNetErrorCode())
                  Utils.emitEvent(response.getNetErrorCode(), 101400)
                } catch (error) {
                  console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
                }
                break;
              }
              case "WebNetErrorList_04100": {
                let response = new web_webview.WebSchemeHandlerResponse();
                try {
                  response.setNetErrorCode(WebNetErrorList.ERR_ADDRESS_UNREACHABLE)
                  console.log('[schemeHandler] getNetErrorCode:' + response.getNetErrorCode())
                  Utils.emitEvent(response.getNetErrorCode(), 101410)
                } catch (error) {
                  console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
                }
                break;
              }
              case "WebNetErrorList_04200": {
                let response = new web_webview.WebSchemeHandlerResponse();
                try {
                  response.setNetErrorCode(WebNetErrorList.ERR_SSL_CLIENT_AUTH_CERT_NEEDED)
                  console.log('[schemeHandler] getNetErrorCode:' + response.getNetErrorCode())
                  Utils.emitEvent(response.getNetErrorCode(), 101420)
                } catch (error) {
                  console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
                }
                break;
              }
              case "WebNetErrorList_04300": {
                let response = new web_webview.WebSchemeHandlerResponse();
                try {
                  response.setNetErrorCode(WebNetErrorList.ERR_TUNNEL_CONNECTION_FAILED)
                  console.log('[schemeHandler] getNetErrorCode:' + response.getNetErrorCode())
                  Utils.emitEvent(response.getNetErrorCode(), 101430)
                } catch (error) {
                  console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
                }
                break;
              }
              case "WebNetErrorList_04400": {
                let response = new web_webview.WebSchemeHandlerResponse();
                try {
                  response.setNetErrorCode(WebNetErrorList.ERR_NO_SSL_VERSIONS_ENABLED)
                  console.log('[schemeHandler] getNetErrorCode:' + response.getNetErrorCode())
                  Utils.emitEvent(response.getNetErrorCode(), 101440)
                } catch (error) {
                  console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
                }
                break;
              }
              case "WebNetErrorList_04500": {
                let response = new web_webview.WebSchemeHandlerResponse();
                try {
                  response.setNetErrorCode(WebNetErrorList.ERR_SSL_VERSION_OR_CIPHER_MISMATCH)
                  console.log('[schemeHandler] getNetErrorCode:' + response.getNetErrorCode())
                  Utils.emitEvent(response.getNetErrorCode(), 101450)
                } catch (error) {
                  console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
                }
                break;
              }
              case "WebNetErrorList_04600": {
                let response = new web_webview.WebSchemeHandlerResponse();
                try {
                  response.setNetErrorCode(WebNetErrorList.ERR_SSL_RENEGOTIATION_REQUESTED)
                  console.log('[schemeHandler] getNetErrorCode:' + response.getNetErrorCode())
                  Utils.emitEvent(response.getNetErrorCode(), 101460)
                } catch (error) {
                  console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
                }
                break;
              }
              case "WebNetErrorList_04700": {
                let response = new web_webview.WebSchemeHandlerResponse();
                try {
                  response.setNetErrorCode(WebNetErrorList.ERR_PROXY_AUTH_UNSUPPORTED)
                  console.log('[schemeHandler] getNetErrorCode:' + response.getNetErrorCode())
                  Utils.emitEvent(response.getNetErrorCode(), 101470)
                } catch (error) {
                  console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
                }
                break;
              }
              case "WebNetErrorList_04800": {
                let response = new web_webview.WebSchemeHandlerResponse();
                try {
                  response.setNetErrorCode(WebNetErrorList.ERR_BAD_SSL_CLIENT_AUTH_CERT)
                  console.log('[schemeHandler] getNetErrorCode:' + response.getNetErrorCode())
                  Utils.emitEvent(response.getNetErrorCode(), 101480)
                } catch (error) {
                  console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
                }
                break;
              }
              case "WebNetErrorList_04900": {
                let response = new web_webview.WebSchemeHandlerResponse();
                try {
                  response.setNetErrorCode(WebNetErrorList.ERR_CONNECTION_TIMED_OUT)
                  console.log('[schemeHandler] getNetErrorCode:' + response.getNetErrorCode())
                  Utils.emitEvent(response.getNetErrorCode(), 101490)
                } catch (error) {
                  console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
                }
                break;
              }
              case "WebNetErrorList_05000": {
                let response = new web_webview.WebSchemeHandlerResponse();
                try {
                  response.setNetErrorCode(WebNetErrorList.ERR_HOST_RESOLVER_QUEUE_TOO_LARGE)
                  console.log('[schemeHandler] getNetErrorCode:' + response.getNetErrorCode())
                  Utils.emitEvent(response.getNetErrorCode(), 101500)
                } catch (error) {
                  console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
                }
                break;
              }
              case "WebNetErrorList_05100": {
                let response = new web_webview.WebSchemeHandlerResponse();
                try {
                  response.setNetErrorCode(WebNetErrorList.ERR_SOCKS_CONNECTION_FAILED)
                  console.log('[schemeHandler] getNetErrorCode:' + response.getNetErrorCode())
                  Utils.emitEvent(response.getNetErrorCode(), 101510)
                } catch (error) {
                  console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
                }
                break;
              }
              case "WebNetErrorList_05200": {
                let response = new web_webview.WebSchemeHandlerResponse();
                try {
                  response.setNetErrorCode(WebNetErrorList.ERR_SOCKS_CONNECTION_HOST_UNREACHABLE)
                  console.log('[schemeHandler] getNetErrorCode:' + response.getNetErrorCode())
                  Utils.emitEvent(response.getNetErrorCode(), 101520)
                } catch (error) {
                  console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
                }
                break;
              }
              case "WebNetErrorList_05300": {
                let response = new web_webview.WebSchemeHandlerResponse();
                try {
                  response.setNetErrorCode(WebNetErrorList.ERR_ALPN_NEGOTIATION_FAILED)
                  console.log('[schemeHandler] getNetErrorCode:' + response.getNetErrorCode())
                  Utils.emitEvent(response.getNetErrorCode(), 101530)
                } catch (error) {
                  console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
                }
                break;
              }
              case "WebNetErrorList_05400": {
                let response = new web_webview.WebSchemeHandlerResponse();
                try {
                  response.setNetErrorCode(WebNetErrorList.ERR_SSL_NO_RENEGOTIATION)
                  console.log('[schemeHandler] getNetErrorCode:' + response.getNetErrorCode())
                  Utils.emitEvent(response.getNetErrorCode(), 101540)
                } catch (error) {
                  console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
                }
                break;
              }
              case "WebNetErrorList_05500": {
                let response = new web_webview.WebSchemeHandlerResponse();
                try {
                  response.setNetErrorCode(WebNetErrorList.ERR_WINSOCK_UNEXPECTED_WRITTEN_BYTES)
                  console.log('[schemeHandler] getNetErrorCode:' + response.getNetErrorCode())
                  Utils.emitEvent(response.getNetErrorCode(), 101550)
                } catch (error) {
                  console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
                }
                break;
              }
              case "WebNetErrorList_05600": {
                let response = new web_webview.WebSchemeHandlerResponse();
                try {
                  response.setNetErrorCode(WebNetErrorList.ERR_SSL_DECOMPRESSION_FAILURE_ALERT)
                  console.log('[schemeHandler] getNetErrorCode:' + response.getNetErrorCode())
                  Utils.emitEvent(response.getNetErrorCode(), 101560)
                } catch (error) {
                  console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
                }
                break;
              }
              case "WebNetErrorList_05700": {
                let response = new web_webview.WebSchemeHandlerResponse();
                try {
                  response.setNetErrorCode(WebNetErrorList.ERR_SSL_BAD_RECORD_MAC_ALERT)
                  console.log('[schemeHandler] getNetErrorCode:' + response.getNetErrorCode())
                  Utils.emitEvent(response.getNetErrorCode(), 101570)
                } catch (error) {
                  console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
                }
                break;
              }
              case "WebNetErrorList_05800": {
                let response = new web_webview.WebSchemeHandlerResponse();
                try {
                  response.setNetErrorCode(WebNetErrorList.ERR_PROXY_AUTH_REQUESTED)
                  console.log('[schemeHandler] getNetErrorCode:' + response.getNetErrorCode())
                  Utils.emitEvent(response.getNetErrorCode(), 101580)
                } catch (error) {
                  console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
                }
                break;
              }
              case "WebNetErrorList_05900": {
                let response = new web_webview.WebSchemeHandlerResponse();
                try {
                  response.setNetErrorCode(WebNetErrorList.ERR_PROXY_CONNECTION_FAILED)
                  console.log('[schemeHandler] getNetErrorCode:' + response.getNetErrorCode())
                  Utils.emitEvent(response.getNetErrorCode(), 101590)
                } catch (error) {
                  console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
                }
                break;
              }
              case "WebNetErrorList_06000": {
                let response = new web_webview.WebSchemeHandlerResponse();
                try {
                  response.setNetErrorCode(WebNetErrorList.ERR_MANDATORY_PROXY_CONFIGURATION_FAILED)
                  console.log('[schemeHandler] getNetErrorCode:' + response.getNetErrorCode())
                  Utils.emitEvent(response.getNetErrorCode(), 101600)
                } catch (error) {
                  console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
                }
                break;
              }
            }
          })

        Web({ src: $rawfile('index.html'), controller: this.controller })
          .height('50%')
          .width('100%')
          .javaScriptAccess(true)
          .geolocationAccess(true)
          .databaseAccess(true)
          .onPageEnd((event) => {
            console.log('onPageEnd url:' + event.url);
            this.isPageEnd = 1;
          })
      }
      .width('100%')
    }

    .height('100%')
  }
}