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
              case "WebNetErrorList_015100": {
                let response = new web_webview.WebSchemeHandlerResponse();
                try {
                  response.setNetErrorCode(WebNetErrorList.ERR_UNDOCUMENTED_SECURITY_LIBRARY_STATUS)
                  console.log('[schemeHandler] getNetErrorCode:' + response.getNetErrorCode())
                  Utils.emitEvent(response.getNetErrorCode(), 102510)
                } catch (error) {
                  console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
                }
                break;
              }
              case "WebNetErrorList_015200": {
                let response = new web_webview.WebSchemeHandlerResponse();
                try {
                  response.setNetErrorCode(WebNetErrorList.ERR_RESPONSE_BODY_TOO_BIG_TO_DRAIN)
                  console.log('[schemeHandler] getNetErrorCode:' + response.getNetErrorCode())
                  Utils.emitEvent(response.getNetErrorCode(), 102520)
                } catch (error) {
                  console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
                }
                break;
              }
              case "WebNetErrorList_015300": {
                let response = new web_webview.WebSchemeHandlerResponse();
                try {
                  response.setNetErrorCode(WebNetErrorList.ERR_RESPONSE_HEADERS_MULTIPLE_CONTENT_LENGTH)
                  console.log('[schemeHandler] getNetErrorCode:' + response.getNetErrorCode())
                  Utils.emitEvent(response.getNetErrorCode(), 102530)
                } catch (error) {
                  console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
                }
                break;
              }
              case "WebNetErrorList_015400": {
                let response = new web_webview.WebSchemeHandlerResponse();
                try {
                  response.setNetErrorCode(WebNetErrorList.ERR_INCOMPLETE_HTTP2_HEADERS)
                  console.log('[schemeHandler] getNetErrorCode:' + response.getNetErrorCode())
                  Utils.emitEvent(response.getNetErrorCode(), 102540)
                } catch (error) {
                  console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
                }
                break;
              }
              case "WebNetErrorList_015500": {
                let response = new web_webview.WebSchemeHandlerResponse();
                try {
                  response.setNetErrorCode(WebNetErrorList.ERR_PAC_NOT_IN_DHCP)
                  console.log('[schemeHandler] getNetErrorCode:' + response.getNetErrorCode())
                  Utils.emitEvent(response.getNetErrorCode(), 102550)
                } catch (error) {
                  console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
                }
                break;
              }
              case "WebNetErrorList_015600": {
                let response = new web_webview.WebSchemeHandlerResponse();
                try {
                  response.setNetErrorCode(WebNetErrorList.ERR_RESPONSE_HEADERS_MULTIPLE_CONTENT_DISPOSITION)
                  console.log('[schemeHandler] getNetErrorCode:' + response.getNetErrorCode())
                  Utils.emitEvent(response.getNetErrorCode(), 102560)
                } catch (error) {
                  console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
                }
                break;
              }
              case "WebNetErrorList_015700": {
                let response = new web_webview.WebSchemeHandlerResponse();
                try {
                  response.setNetErrorCode(WebNetErrorList.ERR_RESPONSE_HEADERS_MULTIPLE_LOCATION)
                  console.log('[schemeHandler] getNetErrorCode:' + response.getNetErrorCode())
                  Utils.emitEvent(response.getNetErrorCode(), 102570)
                } catch (error) {
                  console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
                }
                break;
              }
              case "WebNetErrorList_015800": {
                let response = new web_webview.WebSchemeHandlerResponse();
                try {
                  response.setNetErrorCode(WebNetErrorList.ERR_HTTP2_SERVER_REFUSED_STREAM)
                  console.log('[schemeHandler] getNetErrorCode:' + response.getNetErrorCode())
                  Utils.emitEvent(response.getNetErrorCode(), 102580)
                } catch (error) {
                  console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
                }
                break;
              }
              case "WebNetErrorList_015900": {
                let response = new web_webview.WebSchemeHandlerResponse();
                try {
                  response.setNetErrorCode(WebNetErrorList.ERR_HTTP2_PING_FAILED)
                  console.log('[schemeHandler] getNetErrorCode:' + response.getNetErrorCode())
                  Utils.emitEvent(response.getNetErrorCode(), 102590)
                } catch (error) {
                  console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
                }
                break;
              }
              case "WebNetErrorList_016000": {
                let response = new web_webview.WebSchemeHandlerResponse();
                try {
                  response.setNetErrorCode(WebNetErrorList.ERR_CONTENT_LENGTH_MISMATCH)
                  console.log('[schemeHandler] getNetErrorCode:' + response.getNetErrorCode())
                  Utils.emitEvent(response.getNetErrorCode(), 102600)
                } catch (error) {
                  console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
                }
                break;
              }
              case "WebNetErrorList_016100": {
                let response = new web_webview.WebSchemeHandlerResponse();
                try {
                  response.setNetErrorCode(WebNetErrorList.ERR_INCOMPLETE_CHUNKED_ENCODING)
                  console.log('[schemeHandler] getNetErrorCode:' + response.getNetErrorCode())
                  Utils.emitEvent(response.getNetErrorCode(), 102610)
                } catch (error) {
                  console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
                }
                break;
              }
              case "WebNetErrorList_016200": {
                let response = new web_webview.WebSchemeHandlerResponse();
                try {
                  response.setNetErrorCode(WebNetErrorList.ERR_QUIC_PROTOCOL_ERROR)
                  console.log('[schemeHandler] getNetErrorCode:' + response.getNetErrorCode())
                  Utils.emitEvent(response.getNetErrorCode(), 102620)
                } catch (error) {
                  console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
                }
                break;
              }
              case "WebNetErrorList_016300": {
                let response = new web_webview.WebSchemeHandlerResponse();
                try {
                  response.setNetErrorCode(WebNetErrorList.ERR_RESPONSE_HEADERS_TRUNCATED)
                  console.log('[schemeHandler] getNetErrorCode:' + response.getNetErrorCode())
                  Utils.emitEvent(response.getNetErrorCode(), 102630)
                } catch (error) {
                  console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
                }
                break;
              }
              case "WebNetErrorList_016400": {
                let response = new web_webview.WebSchemeHandlerResponse();
                try {
                  response.setNetErrorCode(WebNetErrorList.ERR_QUIC_HANDSHAKE_FAILED)
                  console.log('[schemeHandler] getNetErrorCode:' + response.getNetErrorCode())
                  Utils.emitEvent(response.getNetErrorCode(), 102640)
                } catch (error) {
                  console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
                }
                break;
              }
              case "WebNetErrorList_016500": {
                let response = new web_webview.WebSchemeHandlerResponse();
                try {
                  response.setNetErrorCode(WebNetErrorList.ERR_HTTP2_INADEQUATE_TRANSPORT_SECURITY)
                  console.log('[schemeHandler] getNetErrorCode:' + response.getNetErrorCode())
                  Utils.emitEvent(response.getNetErrorCode(), 102650)
                } catch (error) {
                  console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
                }
                break;
              }
              case "WebNetErrorList_016600": {
                let response = new web_webview.WebSchemeHandlerResponse();
                try {
                  response.setNetErrorCode(WebNetErrorList.ERR_HTTP2_FLOW_CONTROL_ERROR)
                  console.log('[schemeHandler] getNetErrorCode:' + response.getNetErrorCode())
                  Utils.emitEvent(response.getNetErrorCode(), 102660)
                } catch (error) {
                  console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
                }
                break;
              }
              case "WebNetErrorList_016700": {
                let response = new web_webview.WebSchemeHandlerResponse();
                try {
                  response.setNetErrorCode(WebNetErrorList.ERR_HTTP2_FRAME_SIZE_ERROR)
                  console.log('[schemeHandler] getNetErrorCode:' + response.getNetErrorCode())
                  Utils.emitEvent(response.getNetErrorCode(), 102670)
                } catch (error) {
                  console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
                }
                break;
              }
              case "WebNetErrorList_016800": {
                let response = new web_webview.WebSchemeHandlerResponse();
                try {
                  response.setNetErrorCode(WebNetErrorList.ERR_HTTP2_COMPRESSION_ERROR)
                  console.log('[schemeHandler] getNetErrorCode:' + response.getNetErrorCode())
                  Utils.emitEvent(response.getNetErrorCode(), 102680)
                } catch (error) {
                  console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
                }
                break;
              }
              case "WebNetErrorList_016900": {
                let response = new web_webview.WebSchemeHandlerResponse();
                try {
                  response.setNetErrorCode(WebNetErrorList.ERR_PROXY_AUTH_REQUESTED_WITH_NO_CONNECTION)
                  console.log('[schemeHandler] getNetErrorCode:' + response.getNetErrorCode())
                  Utils.emitEvent(response.getNetErrorCode(), 102690)
                } catch (error) {
                  console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
                }
                break;
              }
              case "WebNetErrorList_017000": {
                let response = new web_webview.WebSchemeHandlerResponse();
                try {
                  response.setNetErrorCode(WebNetErrorList.ERR_HTTP_1_1_REQUIRED)
                  console.log('[schemeHandler] getNetErrorCode:' + response.getNetErrorCode())
                  Utils.emitEvent(response.getNetErrorCode(), 102700)
                } catch (error) {
                  console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
                }
                break;
              }
              case "WebNetErrorList_017100": {
                let response = new web_webview.WebSchemeHandlerResponse();
                try {
                  response.setNetErrorCode(WebNetErrorList.ERR_PROXY_HTTP_1_1_REQUIRED)
                  console.log('[schemeHandler] getNetErrorCode:' + response.getNetErrorCode())
                  Utils.emitEvent(response.getNetErrorCode(), 102710)
                } catch (error) {
                  console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
                }
                break;
              }
              case "WebNetErrorList_017200": {
                let response = new web_webview.WebSchemeHandlerResponse();
                try {
                  response.setNetErrorCode(WebNetErrorList.ERR_PAC_SCRIPT_TERMINATED)
                  console.log('[schemeHandler] getNetErrorCode:' + response.getNetErrorCode())
                  Utils.emitEvent(response.getNetErrorCode(), 102720)
                } catch (error) {
                  console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
                }
                break;
              }
              case "WebNetErrorList_017300": {
                let response = new web_webview.WebSchemeHandlerResponse();
                try {
                  response.setNetErrorCode(WebNetErrorList.ERR_INVALID_HTTP_RESPONSE)
                  console.log('[schemeHandler] getNetErrorCode:' + response.getNetErrorCode())
                  Utils.emitEvent(response.getNetErrorCode(), 102730)
                } catch (error) {
                  console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
                }
                break;
              }
              case "WebNetErrorList_017400": {
                let response = new web_webview.WebSchemeHandlerResponse();
                try {
                  response.setNetErrorCode(WebNetErrorList.ERR_CONTENT_DECODING_INIT_FAILED)
                  console.log('[schemeHandler] getNetErrorCode:' + response.getNetErrorCode())
                  Utils.emitEvent(response.getNetErrorCode(), 102740)
                } catch (error) {
                  console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
                }
                break;
              }
              case "WebNetErrorList_017500": {
                let response = new web_webview.WebSchemeHandlerResponse();
                try {
                  response.setNetErrorCode(WebNetErrorList.ERR_HTTP2_RST_STREAM_NO_ERROR_RECEIVED)
                  console.log('[schemeHandler] getNetErrorCode:' + response.getNetErrorCode())
                  Utils.emitEvent(response.getNetErrorCode(), 102750)
                } catch (error) {
                  console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
                }
                break;
              }
              case "WebNetErrorList_017600": {
                let response = new web_webview.WebSchemeHandlerResponse();
                try {
                  response.setNetErrorCode(WebNetErrorList.ERR_HTTP2_PUSHED_STREAM_NOT_AVAILABLE)
                  console.log('[schemeHandler] getNetErrorCode:' + response.getNetErrorCode())
                  Utils.emitEvent(response.getNetErrorCode(), 102760)
                } catch (error) {
                  console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
                }
                break;
              }
              case "WebNetErrorList_017700": {
                let response = new web_webview.WebSchemeHandlerResponse();
                try {
                  response.setNetErrorCode(WebNetErrorList.ERR_HTTP2_CLAIMED_PUSHED_STREAM_RESET_BY_SERVER)
                  console.log('[schemeHandler] getNetErrorCode:' + response.getNetErrorCode())
                  Utils.emitEvent(response.getNetErrorCode(), 102770)
                } catch (error) {
                  console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
                }
                break;
              }
              case "WebNetErrorList_017800": {
                let response = new web_webview.WebSchemeHandlerResponse();
                try {
                  response.setNetErrorCode(WebNetErrorList.ERR_TOO_MANY_RETRIES)
                  console.log('[schemeHandler] getNetErrorCode:' + response.getNetErrorCode())
                  Utils.emitEvent(response.getNetErrorCode(), 102780)
                } catch (error) {
                  console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
                }
                break;
              }
              case "WebNetErrorList_017900": {
                let response = new web_webview.WebSchemeHandlerResponse();
                try {
                  response.setNetErrorCode(WebNetErrorList.ERR_HTTP2_STREAM_CLOSED)
                  console.log('[schemeHandler] getNetErrorCode:' + response.getNetErrorCode())
                  Utils.emitEvent(response.getNetErrorCode(), 102790)
                } catch (error) {
                  console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
                }
                break;
              }
              case "WebNetErrorList_018000": {
                let response = new web_webview.WebSchemeHandlerResponse();
                try {
                  response.setNetErrorCode(WebNetErrorList.ERR_HTTP2_CLIENT_REFUSED_STREAM)
                  console.log('[schemeHandler] getNetErrorCode:' + response.getNetErrorCode())
                  Utils.emitEvent(response.getNetErrorCode(), 102800)
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