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
              case "WebNetErrorList_021100": {
                let response = new web_webview.WebSchemeHandlerResponse();
                try {
                  response.setNetErrorCode(WebNetErrorList.ERR_FTP_TRANSFER_ABORTED)
                  console.log('[schemeHandler] getNetErrorCode:' + response.getNetErrorCode())
                  Utils.emitEvent(response.getNetErrorCode(), 103110)
                } catch (error) {
                  console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
                }
                break;
              }
              case "WebNetErrorList_021200": {
                let response = new web_webview.WebSchemeHandlerResponse();
                try {
                  response.setNetErrorCode(WebNetErrorList.ERR_FTP_FILE_BUSY)
                  console.log('[schemeHandler] getNetErrorCode:' + response.getNetErrorCode())
                  Utils.emitEvent(response.getNetErrorCode(), 103120)
                } catch (error) {
                  console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
                }
                break;
              }
              case "WebNetErrorList_021300": {
                let response = new web_webview.WebSchemeHandlerResponse();
                try {
                  response.setNetErrorCode(WebNetErrorList.ERR_FTP_SYNTAX_ERROR)
                  console.log('[schemeHandler] getNetErrorCode:' + response.getNetErrorCode())
                  Utils.emitEvent(response.getNetErrorCode(), 103130)
                } catch (error) {
                  console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
                }
                break;
              }
              case "WebNetErrorList_021400": {
                let response = new web_webview.WebSchemeHandlerResponse();
                try {
                  response.setNetErrorCode(WebNetErrorList.ERR_FTP_COMMAND_UNSUPPORTED)
                  console.log('[schemeHandler] getNetErrorCode:' + response.getNetErrorCode())
                  Utils.emitEvent(response.getNetErrorCode(), 103140)
                } catch (error) {
                  console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
                }
                break;
              }
              case "WebNetErrorList_021500": {
                let response = new web_webview.WebSchemeHandlerResponse();
                try {
                  response.setNetErrorCode(WebNetErrorList.ERR_FTP_BAD_COMMAND_SEQUENCE)
                  console.log('[schemeHandler] getNetErrorCode:' + response.getNetErrorCode())
                  Utils.emitEvent(response.getNetErrorCode(), 103150)
                } catch (error) {
                  console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
                }
                break;
              }
              case "WebNetErrorList_021600": {
                let response = new web_webview.WebSchemeHandlerResponse();
                try {
                  response.setNetErrorCode(WebNetErrorList.ERR_PKCS12_IMPORT_BAD_PASSWORD)
                  console.log('[schemeHandler] getNetErrorCode:' + response.getNetErrorCode())
                  Utils.emitEvent(response.getNetErrorCode(), 103160)
                } catch (error) {
                  console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
                }
                break;
              }
              case "WebNetErrorList_021700": {
                let response = new web_webview.WebSchemeHandlerResponse();
                try {
                  response.setNetErrorCode(WebNetErrorList.ERR_PKCS12_IMPORT_FAILED)
                  console.log('[schemeHandler] getNetErrorCode:' + response.getNetErrorCode())
                  Utils.emitEvent(response.getNetErrorCode(), 103170)
                } catch (error) {
                  console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
                }
                break;
              }
              case "WebNetErrorList_021800": {
                let response = new web_webview.WebSchemeHandlerResponse();
                try {
                  response.setNetErrorCode(WebNetErrorList.ERR_IMPORT_CA_CERT_NOT_CA)
                  console.log('[schemeHandler] getNetErrorCode:' + response.getNetErrorCode())
                  Utils.emitEvent(response.getNetErrorCode(), 103180)
                } catch (error) {
                  console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
                }
                break;
              }
              case "WebNetErrorList_021900": {
                let response = new web_webview.WebSchemeHandlerResponse();
                try {
                  response.setNetErrorCode(WebNetErrorList.ERR_IMPORT_CERT_ALREADY_EXISTS)
                  console.log('[schemeHandler] getNetErrorCode:' + response.getNetErrorCode())
                  Utils.emitEvent(response.getNetErrorCode(), 103190)
                } catch (error) {
                  console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
                }
                break;
              }
              case "WebNetErrorList_022000": {
                let response = new web_webview.WebSchemeHandlerResponse();
                try {
                  response.setNetErrorCode(WebNetErrorList.ERR_IMPORT_CA_CERT_FAILED)
                  console.log('[schemeHandler] getNetErrorCode:' + response.getNetErrorCode())
                  Utils.emitEvent(response.getNetErrorCode(), 103200)
                } catch (error) {
                  console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
                }
                break;
              }
              case "WebNetErrorList_022100": {
                let response = new web_webview.WebSchemeHandlerResponse();
                try {
                  response.setNetErrorCode(WebNetErrorList.ERR_IMPORT_SERVER_CERT_FAILED)
                  console.log('[schemeHandler] getNetErrorCode:' + response.getNetErrorCode())
                  Utils.emitEvent(response.getNetErrorCode(), 103210)
                } catch (error) {
                  console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
                }
                break;
              }
              case "WebNetErrorList_022200": {
                let response = new web_webview.WebSchemeHandlerResponse();
                try {
                  response.setNetErrorCode(WebNetErrorList.ERR_PKCS12_IMPORT_INVALID_MAC)
                  console.log('[schemeHandler] getNetErrorCode:' + response.getNetErrorCode())
                  Utils.emitEvent(response.getNetErrorCode(), 103220)
                } catch (error) {
                  console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
                }
                break;
              }
              case "WebNetErrorList_022300": {
                let response = new web_webview.WebSchemeHandlerResponse();
                try {
                  response.setNetErrorCode(WebNetErrorList.ERR_PKCS12_IMPORT_INVALID_FILE)
                  console.log('[schemeHandler] getNetErrorCode:' + response.getNetErrorCode())
                  Utils.emitEvent(response.getNetErrorCode(), 103230)
                } catch (error) {
                  console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
                }
                break;
              }
              case "WebNetErrorList_022400": {
                let response = new web_webview.WebSchemeHandlerResponse();
                try {
                  response.setNetErrorCode(WebNetErrorList.ERR_PKCS12_IMPORT_UNSUPPORTED)
                  console.log('[schemeHandler] getNetErrorCode:' + response.getNetErrorCode())
                  Utils.emitEvent(response.getNetErrorCode(), 103240)
                } catch (error) {
                  console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
                }
                break;
              }
              case "WebNetErrorList_022500": {
                let response = new web_webview.WebSchemeHandlerResponse();
                try {
                  response.setNetErrorCode(WebNetErrorList.ERR_KEY_GENERATION_FAILED)
                  console.log('[schemeHandler] getNetErrorCode:' + response.getNetErrorCode())
                  Utils.emitEvent(response.getNetErrorCode(), 103250)
                } catch (error) {
                  console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
                }
                break;
              }
              case "WebNetErrorList_022600": {
                let response = new web_webview.WebSchemeHandlerResponse();
                try {
                  response.setNetErrorCode(WebNetErrorList.ERR_PRIVATE_KEY_EXPORT_FAILED)
                  console.log('[schemeHandler] getNetErrorCode:' + response.getNetErrorCode())
                  Utils.emitEvent(response.getNetErrorCode(), 103260)
                } catch (error) {
                  console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
                }
                break;
              }
              case "WebNetErrorList_022700": {
                let response = new web_webview.WebSchemeHandlerResponse();
                try {
                  response.setNetErrorCode(WebNetErrorList.ERR_SELF_SIGNED_CERT_GENERATION_FAILED)
                  console.log('[schemeHandler] getNetErrorCode:' + response.getNetErrorCode())
                  Utils.emitEvent(response.getNetErrorCode(), 103270)
                } catch (error) {
                  console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
                }
                break;
              }
              case "WebNetErrorList_022800": {
                let response = new web_webview.WebSchemeHandlerResponse();
                try {
                  response.setNetErrorCode(WebNetErrorList.ERR_CERT_DATABASE_CHANGED)
                  console.log('[schemeHandler] getNetErrorCode:' + response.getNetErrorCode())
                  Utils.emitEvent(response.getNetErrorCode(), 103280)
                } catch (error) {
                  console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
                }
                break;
              }
              case "WebNetErrorList_022900": {
                let response = new web_webview.WebSchemeHandlerResponse();
                try {
                  response.setNetErrorCode(WebNetErrorList.ERR_CERT_VERIFIER_CHANGED)
                  console.log('[schemeHandler] getNetErrorCode:' + response.getNetErrorCode())
                  Utils.emitEvent(response.getNetErrorCode(), 103290)
                } catch (error) {
                  console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
                }
                break;
              }
              case "WebNetErrorList_023000": {
                let response = new web_webview.WebSchemeHandlerResponse();
                try {
                  response.setNetErrorCode(WebNetErrorList.ERR_DNS_MALFORMED_RESPONSE)
                  console.log('[schemeHandler] getNetErrorCode:' + response.getNetErrorCode())
                  Utils.emitEvent(response.getNetErrorCode(), 103300)
                } catch (error) {
                  console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
                }
                break;
              }
              case "WebNetErrorList_023100": {
                let response = new web_webview.WebSchemeHandlerResponse();
                try {
                  response.setNetErrorCode(WebNetErrorList.ERR_DNS_SERVER_REQUIRES_TCP)
                  console.log('[schemeHandler] getNetErrorCode:' + response.getNetErrorCode())
                  Utils.emitEvent(response.getNetErrorCode(), 103310)
                } catch (error) {
                  console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
                }
                break;
              }
              case "WebNetErrorList_023200": {
                let response = new web_webview.WebSchemeHandlerResponse();
                try {
                  response.setNetErrorCode(WebNetErrorList.ERR_DNS_SERVER_FAILED)
                  console.log('[schemeHandler] getNetErrorCode:' + response.getNetErrorCode())
                  Utils.emitEvent(response.getNetErrorCode(), 103320)
                } catch (error) {
                  console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
                }
                break;
              }
              case "WebNetErrorList_023300": {
                let response = new web_webview.WebSchemeHandlerResponse();
                try {
                  response.setNetErrorCode(WebNetErrorList.ERR_DNS_TIMED_OUT)
                  console.log('[schemeHandler] getNetErrorCode:' + response.getNetErrorCode())
                  Utils.emitEvent(response.getNetErrorCode(), 103330)
                } catch (error) {
                  console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
                }
                break;
              }
              case "WebNetErrorList_023400": {
                let response = new web_webview.WebSchemeHandlerResponse();
                try {
                  response.setNetErrorCode(WebNetErrorList.ERR_DNS_CACHE_MISS)
                  console.log('[schemeHandler] getNetErrorCode:' + response.getNetErrorCode())
                  Utils.emitEvent(response.getNetErrorCode(), 103340)
                } catch (error) {
                  console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
                }
                break;
              }
              case "WebNetErrorList_023500": {
                let response = new web_webview.WebSchemeHandlerResponse();
                try {
                  response.setNetErrorCode(WebNetErrorList.ERR_DNS_SEARCH_EMPTY)
                  console.log('[schemeHandler] getNetErrorCode:' + response.getNetErrorCode())
                  Utils.emitEvent(response.getNetErrorCode(), 103350)
                } catch (error) {
                  console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
                }
                break;
              }
              case "WebNetErrorList_023600": {
                let response = new web_webview.WebSchemeHandlerResponse();
                try {
                  response.setNetErrorCode(WebNetErrorList.ERR_DNS_SORT_ERROR)
                  console.log('[schemeHandler] getNetErrorCode:' + response.getNetErrorCode())
                  Utils.emitEvent(response.getNetErrorCode(), 103360)
                } catch (error) {
                  console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
                }
                break;
              }
              case "WebNetErrorList_023700": {
                let response = new web_webview.WebSchemeHandlerResponse();
                try {
                  response.setNetErrorCode(WebNetErrorList.ERR_DNS_SECURE_RESOLVER_HOSTNAME_RESOLUTION_FAILED)
                  console.log('[schemeHandler] getNetErrorCode:' + response.getNetErrorCode())
                  Utils.emitEvent(response.getNetErrorCode(), 103370)
                } catch (error) {
                  console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
                }
                break;
              }
              case "WebNetErrorList_023800": {
                let response = new web_webview.WebSchemeHandlerResponse();
                try {
                  response.setNetErrorCode(WebNetErrorList.ERR_DNS_NAME_HTTPS_ONLY)
                  console.log('[schemeHandler] getNetErrorCode:' + response.getNetErrorCode())
                  Utils.emitEvent(response.getNetErrorCode(), 103380)
                } catch (error) {
                  console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
                }
                break;
              }
              case "WebNetErrorList_023900": {
                let response = new web_webview.WebSchemeHandlerResponse();
                try {
                  response.setNetErrorCode(WebNetErrorList.ERR_DNS_REQUEST_CANCELED)
                  console.log('[schemeHandler] getNetErrorCode:' + response.getNetErrorCode())
                  Utils.emitEvent(response.getNetErrorCode(), 103390)
                } catch (error) {
                  console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
                }
                break;
              }
              case "WebNetErrorList_024000": {
                let response = new web_webview.WebSchemeHandlerResponse();
                try {
                  response.setNetErrorCode(WebNetErrorList.ERR_DNS_NO_MATCHING_SUPPORTED_ALPN)
                  console.log('[schemeHandler] getNetErrorCode:' + response.getNetErrorCode())
                  Utils.emitEvent(response.getNetErrorCode(), 103400)
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