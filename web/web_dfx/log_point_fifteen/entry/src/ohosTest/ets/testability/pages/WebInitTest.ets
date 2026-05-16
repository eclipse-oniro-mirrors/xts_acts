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
              case "WebNetErrorList_018100": {
                let response = new web_webview.WebSchemeHandlerResponse();
                try {
                  response.setNetErrorCode(WebNetErrorList.ERR_HTTP2_PUSHED_RESPONSE_DOES_NOT_MATCH)
                  console.log('[schemeHandler] getNetErrorCode:' + response.getNetErrorCode())
                  Utils.emitEvent(response.getNetErrorCode(), 102810)
                } catch (error) {
                  console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
                }
                break;
              }
              case "WebNetErrorList_018200": {
                let response = new web_webview.WebSchemeHandlerResponse();
                try {
                  response.setNetErrorCode(WebNetErrorList.ERR_HTTP_RESPONSE_CODE_FAILURE)
                  console.log('[schemeHandler] getNetErrorCode:' + response.getNetErrorCode())
                  Utils.emitEvent(response.getNetErrorCode(), 102820)
                } catch (error) {
                  console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
                }
                break;
              }
              case "WebNetErrorList_018300": {
                let response = new web_webview.WebSchemeHandlerResponse();
                try {
                  response.setNetErrorCode(WebNetErrorList.ERR_QUIC_UNKNOWN_CERT_ROOT)
                  console.log('[schemeHandler] getNetErrorCode:' + response.getNetErrorCode())
                  Utils.emitEvent(response.getNetErrorCode(), 102830)
                } catch (error) {
                  console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
                }
                break;
              }
              case "WebNetErrorList_018400": {
                let response = new web_webview.WebSchemeHandlerResponse();
                try {
                  response.setNetErrorCode(WebNetErrorList.ERR_QUIC_GOAWAY_REQUEST_CAN_BE_RETRIED)
                  console.log('[schemeHandler] getNetErrorCode:' + response.getNetErrorCode())
                  Utils.emitEvent(response.getNetErrorCode(), 102840)
                } catch (error) {
                  console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
                }
                break;
              }
              case "WebNetErrorList_018500": {
                let response = new web_webview.WebSchemeHandlerResponse();
                try {
                  response.setNetErrorCode(WebNetErrorList.ERR_TOO_MANY_ACCEPT_CH_RESTARTS)
                  console.log('[schemeHandler] getNetErrorCode:' + response.getNetErrorCode())
                  Utils.emitEvent(response.getNetErrorCode(), 102850)
                } catch (error) {
                  console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
                }
                break;
              }
              case "WebNetErrorList_018600": {
                let response = new web_webview.WebSchemeHandlerResponse();
                try {
                  response.setNetErrorCode(WebNetErrorList.ERR_INCONSISTENT_IP_ADDRESS_SPACE)
                  console.log('[schemeHandler] getNetErrorCode:' + response.getNetErrorCode())
                  Utils.emitEvent(response.getNetErrorCode(), 102860)
                } catch (error) {
                  console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
                }
                break;
              }
              case "WebNetErrorList_018700": {
                let response = new web_webview.WebSchemeHandlerResponse();
                try {
                  response.setNetErrorCode(WebNetErrorList.ERR_CACHED_IP_ADDRESS_SPACE_BLOCKED_BY_LOCAL_NETWORK_ACCESS_POLICY)
                  console.log('[schemeHandler] getNetErrorCode:' + response.getNetErrorCode())
                  Utils.emitEvent(response.getNetErrorCode(), 102870)
                } catch (error) {
                  console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
                }
                break;
              }
              case "WebNetErrorList_018800": {
                let response = new web_webview.WebSchemeHandlerResponse();
                try {
                  response.setNetErrorCode(WebNetErrorList.ERR_CACHE_MISS)
                  console.log('[schemeHandler] getNetErrorCode:' + response.getNetErrorCode())
                  Utils.emitEvent(response.getNetErrorCode(), 102880)
                } catch (error) {
                  console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
                }
                break;
              }
              case "WebNetErrorList_018900": {
                let response = new web_webview.WebSchemeHandlerResponse();
                try {
                  response.setNetErrorCode(WebNetErrorList.ERR_CACHE_READ_FAILURE)
                  console.log('[schemeHandler] getNetErrorCode:' + response.getNetErrorCode())
                  Utils.emitEvent(response.getNetErrorCode(), 102890)
                } catch (error) {
                  console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
                }
                break;
              }
              case "WebNetErrorList_019000": {
                let response = new web_webview.WebSchemeHandlerResponse();
                try {
                  response.setNetErrorCode(WebNetErrorList.ERR_CACHE_WRITE_FAILURE)
                  console.log('[schemeHandler] getNetErrorCode:' + response.getNetErrorCode())
                  Utils.emitEvent(response.getNetErrorCode(), 102900)
                } catch (error) {
                  console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
                }
                break;
              }
              case "WebNetErrorList_019100": {
                let response = new web_webview.WebSchemeHandlerResponse();
                try {
                  response.setNetErrorCode(WebNetErrorList.ERR_CACHE_OPERATION_UNSUPPORTED)
                  console.log('[schemeHandler] getNetErrorCode:' + response.getNetErrorCode())
                  Utils.emitEvent(response.getNetErrorCode(), 102910)
                } catch (error) {
                  console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
                }
                break;
              }
              case "WebNetErrorList_019200": {
                let response = new web_webview.WebSchemeHandlerResponse();
                try {
                  response.setNetErrorCode(WebNetErrorList.ERR_CACHE_OPEN_FAILURE)
                  console.log('[schemeHandler] getNetErrorCode:' + response.getNetErrorCode())
                  Utils.emitEvent(response.getNetErrorCode(), 102920)
                } catch (error) {
                  console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
                }
                break;
              }
              case "WebNetErrorList_019300": {
                let response = new web_webview.WebSchemeHandlerResponse();
                try {
                  response.setNetErrorCode(WebNetErrorList.ERR_CACHE_CREATE_FAILURE)
                  console.log('[schemeHandler] getNetErrorCode:' + response.getNetErrorCode())
                  Utils.emitEvent(response.getNetErrorCode(), 102930)
                } catch (error) {
                  console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
                }
                break;
              }
              case "WebNetErrorList_019400": {
                let response = new web_webview.WebSchemeHandlerResponse();
                try {
                  response.setNetErrorCode(WebNetErrorList.ERR_CACHE_RACE)
                  console.log('[schemeHandler] getNetErrorCode:' + response.getNetErrorCode())
                  Utils.emitEvent(response.getNetErrorCode(), 102940)
                } catch (error) {
                  console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
                }
                break;
              }
              case "WebNetErrorList_019500": {
                let response = new web_webview.WebSchemeHandlerResponse();
                try {
                  response.setNetErrorCode(WebNetErrorList.ERR_CACHE_CHECKSUM_READ_FAILURE)
                  console.log('[schemeHandler] getNetErrorCode:' + response.getNetErrorCode())
                  Utils.emitEvent(response.getNetErrorCode(), 102950)
                } catch (error) {
                  console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
                }
                break;
              }
              case "WebNetErrorList_019600": {
                let response = new web_webview.WebSchemeHandlerResponse();
                try {
                  response.setNetErrorCode(WebNetErrorList.ERR_CACHE_CHECKSUM_MISMATCH)
                  console.log('[schemeHandler] getNetErrorCode:' + response.getNetErrorCode())
                  Utils.emitEvent(response.getNetErrorCode(), 102960)
                } catch (error) {
                  console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
                }
                break;
              }
              case "WebNetErrorList_019700": {
                let response = new web_webview.WebSchemeHandlerResponse();
                try {
                  response.setNetErrorCode(WebNetErrorList.ERR_CACHE_LOCK_TIMEOUT)
                  console.log('[schemeHandler] getNetErrorCode:' + response.getNetErrorCode())
                  Utils.emitEvent(response.getNetErrorCode(), 102970)
                } catch (error) {
                  console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
                }
                break;
              }
              case "WebNetErrorList_019800": {
                let response = new web_webview.WebSchemeHandlerResponse();
                try {
                  response.setNetErrorCode(WebNetErrorList.ERR_CACHE_AUTH_FAILURE_AFTER_READ)
                  console.log('[schemeHandler] getNetErrorCode:' + response.getNetErrorCode())
                  Utils.emitEvent(response.getNetErrorCode(), 102980)
                } catch (error) {
                  console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
                }
                break;
              }
              case "WebNetErrorList_019900": {
                let response = new web_webview.WebSchemeHandlerResponse();
                try {
                  response.setNetErrorCode(WebNetErrorList.ERR_CACHE_ENTRY_NOT_SUITABLE)
                  console.log('[schemeHandler] getNetErrorCode:' + response.getNetErrorCode())
                  Utils.emitEvent(response.getNetErrorCode(), 102990)
                } catch (error) {
                  console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
                }
                break;
              }
              case "WebNetErrorList_020000": {
                let response = new web_webview.WebSchemeHandlerResponse();
                try {
                  response.setNetErrorCode(WebNetErrorList.ERR_CACHE_DOOM_FAILURE)
                  console.log('[schemeHandler] getNetErrorCode:' + response.getNetErrorCode())
                  Utils.emitEvent(response.getNetErrorCode(), 103000)
                } catch (error) {
                  console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
                }
                break;
              }
              case "WebNetErrorList_020100": {
                let response = new web_webview.WebSchemeHandlerResponse();
                try {
                  response.setNetErrorCode(WebNetErrorList.ERR_CACHE_OPEN_OR_CREATE_FAILURE)
                  console.log('[schemeHandler] getNetErrorCode:' + response.getNetErrorCode())
                  Utils.emitEvent(response.getNetErrorCode(), 103010)
                } catch (error) {
                  console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
                }
                break;
              }
              case "WebNetErrorList_020200": {
                let response = new web_webview.WebSchemeHandlerResponse();
                try {
                  response.setNetErrorCode(WebNetErrorList.ERR_INSECURE_RESPONSE)
                  console.log('[schemeHandler] getNetErrorCode:' + response.getNetErrorCode())
                  Utils.emitEvent(response.getNetErrorCode(), 103020)
                } catch (error) {
                  console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
                }
                break;
              }
              case "WebNetErrorList_020300": {
                let response = new web_webview.WebSchemeHandlerResponse();
                try {
                  response.setNetErrorCode(WebNetErrorList.ERR_NO_PRIVATE_KEY_FOR_CERT)
                  console.log('[schemeHandler] getNetErrorCode:' + response.getNetErrorCode())
                  Utils.emitEvent(response.getNetErrorCode(), 103030)
                } catch (error) {
                  console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
                }
                break;
              }
              case "WebNetErrorList_020400": {
                let response = new web_webview.WebSchemeHandlerResponse();
                try {
                  response.setNetErrorCode(WebNetErrorList.ERR_ADD_USER_CERT_FAILED)
                  console.log('[schemeHandler] getNetErrorCode:' + response.getNetErrorCode())
                  Utils.emitEvent(response.getNetErrorCode(), 103040)
                } catch (error) {
                  console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
                }
                break;
              }
              case "WebNetErrorList_020500": {
                let response = new web_webview.WebSchemeHandlerResponse();
                try {
                  response.setNetErrorCode(WebNetErrorList.ERR_INVALID_SIGNED_EXCHANGE)
                  console.log('[schemeHandler] getNetErrorCode:' + response.getNetErrorCode())
                  Utils.emitEvent(response.getNetErrorCode(), 103050)
                } catch (error) {
                  console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
                }
                break;
              }
              case "WebNetErrorList_020600": {
                let response = new web_webview.WebSchemeHandlerResponse();
                try {
                  response.setNetErrorCode(WebNetErrorList.ERR_INVALID_WEB_BUNDLE)
                  console.log('[schemeHandler] getNetErrorCode:' + response.getNetErrorCode())
                  Utils.emitEvent(response.getNetErrorCode(), 103060)
                } catch (error) {
                  console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
                }
                break;
              }
              case "WebNetErrorList_020700": {
                let response = new web_webview.WebSchemeHandlerResponse();
                try {
                  response.setNetErrorCode(WebNetErrorList.ERR_TRUST_TOKEN_OPERATION_FAILED)
                  console.log('[schemeHandler] getNetErrorCode:' + response.getNetErrorCode())
                  Utils.emitEvent(response.getNetErrorCode(), 103070)
                } catch (error) {
                  console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
                }
                break;
              }
              case "WebNetErrorList_020800": {
                let response = new web_webview.WebSchemeHandlerResponse();
                try {
                  response.setNetErrorCode(WebNetErrorList.ERR_TRUST_TOKEN_OPERATION_SUCCESS_WITHOUT_SENDING_REQUEST)
                  console.log('[schemeHandler] getNetErrorCode:' + response.getNetErrorCode())
                  Utils.emitEvent(response.getNetErrorCode(), 103080)
                } catch (error) {
                  console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
                }
                break;
              }
              case "WebNetErrorList_020900": {
                let response = new web_webview.WebSchemeHandlerResponse();
                try {
                  response.setNetErrorCode(WebNetErrorList.ERR_FTP_FAILED)
                  console.log('[schemeHandler] getNetErrorCode:' + response.getNetErrorCode())
                  Utils.emitEvent(response.getNetErrorCode(), 103090)
                } catch (error) {
                  console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
                }
                break;
              }
              case "WebNetErrorList_021000": {
                let response = new web_webview.WebSchemeHandlerResponse();
                try {
                  response.setNetErrorCode(WebNetErrorList.ERR_FTP_SERVICE_UNAVAILABLE)
                  console.log('[schemeHandler] getNetErrorCode:' + response.getNetErrorCode())
                  Utils.emitEvent(response.getNetErrorCode(), 103100)
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