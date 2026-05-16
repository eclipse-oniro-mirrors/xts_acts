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

import Utils from '../../test/Utils';
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
    console.info("web page valueChangeCallBack");
    if (eventData != null) {
      console.info("valueChangeCallBack:" + JSON.stringify(eventData));
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
            console.info("key==>" + this.str)
            this.isReceive = -1;
            this.isPageEnd = -1;
            switch (this.str) {
              case "WebNetErrorList_0100": {
                let response = new web_webview.WebSchemeHandlerResponse();
                try {
                  response.setNetErrorCode(WebNetErrorList.NET_OK)
                  console.log("[schemeHandler] getNetErrorCode:" + response.getNetErrorCode())
                  Utils.emitEvent(response.getNetErrorCode(), 101010)
                } catch (error) {
                  console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
                }
                break;
              }
              case "WebNetErrorList_0200": {
                let response = new web_webview.WebSchemeHandlerResponse();
                try {
                  response.setNetErrorCode(WebNetErrorList.ERR_IO_PENDING)
                  console.log("[schemeHandler] getNetErrorCode:" + response.getNetErrorCode())
                  Utils.emitEvent(response.getNetErrorCode(), 101020)
                } catch (error) {
                  console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
                }
                break;
              }
              case "WebNetErrorList_0300": {
                let response = new web_webview.WebSchemeHandlerResponse();
                try {
                  response.setNetErrorCode(WebNetErrorList.ERR_FAILED)
                  console.log("[schemeHandler] getNetErrorCode:" + response.getNetErrorCode())
                  Utils.emitEvent(response.getNetErrorCode(), 101030)
                } catch (error) {
                  console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
                }
                break;
              }
              case "WebNetErrorList_0400": {
                let response = new web_webview.WebSchemeHandlerResponse();
                try {
                  response.setNetErrorCode(WebNetErrorList.ERR_ABORTED)
                  console.log("[schemeHandler] getNetErrorCode:" + response.getNetErrorCode())
                  Utils.emitEvent(response.getNetErrorCode(), 101040)
                } catch (error) {
                  console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
                }
                break;
              }
              case "WebNetErrorList_0500": {
                let response = new web_webview.WebSchemeHandlerResponse();
                try {
                  response.setNetErrorCode(WebNetErrorList.ERR_INVALID_ARGUMENT)
                  console.log("[schemeHandler] getNetErrorCode:" + response.getNetErrorCode())
                  Utils.emitEvent(response.getNetErrorCode(), 101050)
                } catch (error) {
                  console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
                }
                break;
              }
              case "WebNetErrorList_0600": {
                let response = new web_webview.WebSchemeHandlerResponse();
                try {
                  response.setNetErrorCode(WebNetErrorList.ERR_INVALID_HANDLE)
                  console.log("[schemeHandler] getNetErrorCode:" + response.getNetErrorCode())
                  Utils.emitEvent(response.getNetErrorCode(), 101060)
                } catch (error) {
                  console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
                }
                break;
              }
              case "WebNetErrorList_0700": {
                let response = new web_webview.WebSchemeHandlerResponse();
                try {
                  response.setNetErrorCode(WebNetErrorList.ERR_FILE_NOT_FOUND)
                  console.log("[schemeHandler] getNetErrorCode:" + response.getNetErrorCode())
                  Utils.emitEvent(response.getNetErrorCode(), 101070)
                } catch (error) {
                  console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
                }
                break;
              }
              case "WebNetErrorList_0800": {
                let response = new web_webview.WebSchemeHandlerResponse();
                try {
                  response.setNetErrorCode(WebNetErrorList.ERR_TIMED_OUT)
                  console.log("[schemeHandler] getNetErrorCode:" + response.getNetErrorCode())
                  Utils.emitEvent(response.getNetErrorCode(), 101080)
                } catch (error) {
                  console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
                }
                break;
              }
              case "WebNetErrorList_0900": {
                let response = new web_webview.WebSchemeHandlerResponse();
                try {
                  response.setNetErrorCode(WebNetErrorList.ERR_FILE_TOO_LARGE)
                  console.log("[schemeHandler] getNetErrorCode:" + response.getNetErrorCode())
                  Utils.emitEvent(response.getNetErrorCode(), 101090)
                } catch (error) {
                  console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
                }
                break;
              }
              case "WebNetErrorList_01000": {
                let response = new web_webview.WebSchemeHandlerResponse();
                try {
                  response.setNetErrorCode(WebNetErrorList.ERR_UNEXPECTED)
                  console.log("[schemeHandler] getNetErrorCode:" + response.getNetErrorCode())
                  Utils.emitEvent(response.getNetErrorCode(), 101100)
                } catch (error) {
                  console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
                }
                break;
              }
              case "WebNetErrorList_01100": {
                let response = new web_webview.WebSchemeHandlerResponse();
                try {
                  response.setNetErrorCode(WebNetErrorList.ERR_ACCESS_DENIED)
                  console.log("[schemeHandler] getNetErrorCode:" + response.getNetErrorCode())
                  Utils.emitEvent(response.getNetErrorCode(), 101110)
                } catch (error) {
                  console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
                }
                break;
              }
              case "WebNetErrorList_01200": {
                let response = new web_webview.WebSchemeHandlerResponse();
                try {
                  response.setNetErrorCode(WebNetErrorList.ERR_NOT_IMPLEMENTED)
                  console.log("[schemeHandler] getNetErrorCode:" + response.getNetErrorCode())
                  Utils.emitEvent(response.getNetErrorCode(), 101120)
                } catch (error) {
                  console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
                }
                break;
              }
              case "WebNetErrorList_01300": {
                let response = new web_webview.WebSchemeHandlerResponse();
                try {
                  response.setNetErrorCode(WebNetErrorList.ERR_INSUFFICIENT_RESOURCES)
                  console.log("[schemeHandler] getNetErrorCode:" + response.getNetErrorCode())
                  Utils.emitEvent(response.getNetErrorCode(), 101130)
                } catch (error) {
                  console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
                }
                break;
              }
              case "WebNetErrorList_01400": {
                let response = new web_webview.WebSchemeHandlerResponse();
                try {
                  response.setNetErrorCode(WebNetErrorList.ERR_OUT_OF_MEMORY)
                  console.log("[schemeHandler] getNetErrorCode:" + response.getNetErrorCode())
                  Utils.emitEvent(response.getNetErrorCode(), 101140)
                } catch (error) {
                  console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
                }
                break;
              }
              case "WebNetErrorList_01500": {
                let response = new web_webview.WebSchemeHandlerResponse();
                try {
                  response.setNetErrorCode(WebNetErrorList.ERR_UPLOAD_FILE_CHANGED)
                  console.log("[schemeHandler] getNetErrorCode:" + response.getNetErrorCode())
                  Utils.emitEvent(response.getNetErrorCode(), 101150)
                } catch (error) {
                  console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
                }
                break;
              }
              case "WebNetErrorList_01600": {
                let response = new web_webview.WebSchemeHandlerResponse();
                try {
                  response.setNetErrorCode(WebNetErrorList.ERR_SOCKET_NOT_CONNECTED)
                  console.log("[schemeHandler] getNetErrorCode:" + response.getNetErrorCode())
                  Utils.emitEvent(response.getNetErrorCode(), 101160)
                } catch (error) {
                  console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
                }
                break;
              }
              case "WebNetErrorList_01700": {
                let response = new web_webview.WebSchemeHandlerResponse();
                try {
                  response.setNetErrorCode(WebNetErrorList.ERR_FILE_EXISTS)
                  console.log("[schemeHandler] getNetErrorCode:" + response.getNetErrorCode())
                  Utils.emitEvent(response.getNetErrorCode(), 101170)
                } catch (error) {
                  console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
                }
                break;
              }
              case "WebNetErrorList_01800": {
                let response = new web_webview.WebSchemeHandlerResponse();
                try {
                  response.setNetErrorCode(WebNetErrorList.ERR_FILE_PATH_TOO_LONG)
                  console.log("[schemeHandler] getNetErrorCode:" + response.getNetErrorCode())
                  Utils.emitEvent(response.getNetErrorCode(), 101180)
                } catch (error) {
                  console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
                }
                break;
              }
              case "WebNetErrorList_01900": {
                let response = new web_webview.WebSchemeHandlerResponse();
                try {
                  response.setNetErrorCode(WebNetErrorList.ERR_FILE_NO_SPACE)
                  console.log("[schemeHandler] getNetErrorCode:" + response.getNetErrorCode())
                  Utils.emitEvent(response.getNetErrorCode(), 101190)
                } catch (error) {
                  console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
                }
                break;
              }
              case "WebNetErrorList_02000": {
                let response = new web_webview.WebSchemeHandlerResponse();
                try {
                  response.setNetErrorCode(WebNetErrorList.ERR_FILE_VIRUS_INFECTED)
                  console.log("[schemeHandler] getNetErrorCode:" + response.getNetErrorCode())
                  Utils.emitEvent(response.getNetErrorCode(), 101200)
                } catch (error) {
                  console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
                }
                break;
              }
              case "WebNetErrorList_02100": {
                let response = new web_webview.WebSchemeHandlerResponse();
                try {
                  response.setNetErrorCode(WebNetErrorList.ERR_BLOCKED_BY_CLIENT)
                  console.log("[schemeHandler] getNetErrorCode:" + response.getNetErrorCode())
                  Utils.emitEvent(response.getNetErrorCode(), 101210)
                } catch (error) {
                  console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
                }
                break;
              }
              case "WebNetErrorList_02200": {
                let response = new web_webview.WebSchemeHandlerResponse();
                try {
                  response.setNetErrorCode(WebNetErrorList.ERR_NETWORK_CHANGED)
                  console.log("[schemeHandler] getNetErrorCode:" + response.getNetErrorCode())
                  Utils.emitEvent(response.getNetErrorCode(), 101220)
                } catch (error) {
                  console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
                }
                break;
              }
              case "WebNetErrorList_02300": {
                let response = new web_webview.WebSchemeHandlerResponse();
                try {
                  response.setNetErrorCode(WebNetErrorList.ERR_BLOCKED_BY_ADMINISTRATOR)
                  console.log("[schemeHandler] getNetErrorCode:" + response.getNetErrorCode())
                  Utils.emitEvent(response.getNetErrorCode(), 101230)
                } catch (error) {
                  console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
                }
                break;
              }
              case "WebNetErrorList_02400": {
                let response = new web_webview.WebSchemeHandlerResponse();
                try {
                  response.setNetErrorCode(WebNetErrorList.ERR_SOCKET_CONNECTED)
                  console.log("[schemeHandler] getNetErrorCode:" + response.getNetErrorCode())
                  Utils.emitEvent(response.getNetErrorCode(), 101240)
                } catch (error) {
                  console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
                }
                break;
              }
              case "WebNetErrorList_02500": {
                let response = new web_webview.WebSchemeHandlerResponse();
                try {
                  response.setNetErrorCode(WebNetErrorList.ERR_UPLOAD_STREAM_REWIND_NOT_SUPPORTED)
                  console.log("[schemeHandler] getNetErrorCode:" + response.getNetErrorCode())
                  Utils.emitEvent(response.getNetErrorCode(), 101250)
                } catch (error) {
                  console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
                }
                break;
              }
              case "WebNetErrorList_02600": {
                let response = new web_webview.WebSchemeHandlerResponse();
                try {
                  response.setNetErrorCode(WebNetErrorList.ERR_CONTEXT_SHUT_DOWN)
                  console.log("[schemeHandler] getNetErrorCode:" + response.getNetErrorCode())
                  Utils.emitEvent(response.getNetErrorCode(), 101260)
                } catch (error) {
                  console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
                }
                break;
              }
              case "WebNetErrorList_02700": {
                let response = new web_webview.WebSchemeHandlerResponse();
                try {
                  response.setNetErrorCode(WebNetErrorList.ERR_BLOCKED_BY_RESPONSE)
                  console.log("[schemeHandler] getNetErrorCode:" + response.getNetErrorCode())
                  Utils.emitEvent(response.getNetErrorCode(), 101270)
                } catch (error) {
                  console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
                }
                break;
              }
              case "WebNetErrorList_02800": {
                let response = new web_webview.WebSchemeHandlerResponse();
                try {
                  response.setNetErrorCode(WebNetErrorList.ERR_CLEARTEXT_NOT_PERMITTED)
                  console.log("[schemeHandler] getNetErrorCode:" + response.getNetErrorCode())
                  Utils.emitEvent(response.getNetErrorCode(), 101280)
                } catch (error) {
                  console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
                }
                break;
              }
              case "WebNetErrorList_02900": {
                let response = new web_webview.WebSchemeHandlerResponse();
                try {
                  response.setNetErrorCode(WebNetErrorList.ERR_BLOCKED_BY_CSP)
                  console.log("[schemeHandler] getNetErrorCode:" + response.getNetErrorCode())
                  Utils.emitEvent(response.getNetErrorCode(), 101290)
                } catch (error) {
                  console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
                }
                break;
              }
              case "WebNetErrorList_03000": {
                let response = new web_webview.WebSchemeHandlerResponse();
                try {
                  response.setNetErrorCode(WebNetErrorList.ERR_H2_OR_QUIC_REQUIRED)
                  console.log("[schemeHandler] getNetErrorCode:" + response.getNetErrorCode())
                  Utils.emitEvent(response.getNetErrorCode(), 101300)
                } catch (error) {
                  console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
                }
                break;
              }
              case "WebNetErrorList_03100": {
                let response = new web_webview.WebSchemeHandlerResponse();
                try {
                  response.setNetErrorCode(WebNetErrorList.ERR_BLOCKED_BY_ORB)
                  console.log("[schemeHandler] getNetErrorCode:" + response.getNetErrorCode())
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
                  console.log("[schemeHandler] getNetErrorCode:" + response.getNetErrorCode())
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
                  console.log("[schemeHandler] getNetErrorCode:" + response.getNetErrorCode())
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
                  console.log("[schemeHandler] getNetErrorCode:" + response.getNetErrorCode())
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
                  console.log("[schemeHandler] getNetErrorCode:" + response.getNetErrorCode())
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
                  console.log("[schemeHandler] getNetErrorCode:" + response.getNetErrorCode())
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
                  console.log("[schemeHandler] getNetErrorCode:" + response.getNetErrorCode())
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
                  console.log("[schemeHandler] getNetErrorCode:" + response.getNetErrorCode())
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
                  console.log("[schemeHandler] getNetErrorCode:" + response.getNetErrorCode())
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
                  console.log("[schemeHandler] getNetErrorCode:" + response.getNetErrorCode())
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
                  console.log("[schemeHandler] getNetErrorCode:" + response.getNetErrorCode())
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
                  console.log("[schemeHandler] getNetErrorCode:" + response.getNetErrorCode())
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
                  console.log("[schemeHandler] getNetErrorCode:" + response.getNetErrorCode())
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
                  console.log("[schemeHandler] getNetErrorCode:" + response.getNetErrorCode())
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
                  console.log("[schemeHandler] getNetErrorCode:" + response.getNetErrorCode())
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
                  console.log("[schemeHandler] getNetErrorCode:" + response.getNetErrorCode())
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
                  console.log("[schemeHandler] getNetErrorCode:" + response.getNetErrorCode())
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
                  console.log("[schemeHandler] getNetErrorCode:" + response.getNetErrorCode())
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
                  console.log("[schemeHandler] getNetErrorCode:" + response.getNetErrorCode())
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
                  console.log("[schemeHandler] getNetErrorCode:" + response.getNetErrorCode())
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
                  console.log("[schemeHandler] getNetErrorCode:" + response.getNetErrorCode())
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
                  console.log("[schemeHandler] getNetErrorCode:" + response.getNetErrorCode())
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
                  console.log("[schemeHandler] getNetErrorCode:" + response.getNetErrorCode())
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
                  console.log("[schemeHandler] getNetErrorCode:" + response.getNetErrorCode())
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
                  console.log("[schemeHandler] getNetErrorCode:" + response.getNetErrorCode())
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
                  console.log("[schemeHandler] getNetErrorCode:" + response.getNetErrorCode())
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
                  console.log("[schemeHandler] getNetErrorCode:" + response.getNetErrorCode())
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
                  console.log("[schemeHandler] getNetErrorCode:" + response.getNetErrorCode())
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
                  console.log("[schemeHandler] getNetErrorCode:" + response.getNetErrorCode())
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
                  console.log("[schemeHandler] getNetErrorCode:" + response.getNetErrorCode())
                  Utils.emitEvent(response.getNetErrorCode(), 101600)
                } catch (error) {
                  console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
                }
                break;
              }
              case "WebNetErrorList_06100": {
                let response = new web_webview.WebSchemeHandlerResponse();
                try {
                  response.setNetErrorCode(WebNetErrorList.ERR_PRECONNECT_MAX_SOCKET_LIMIT)
                  console.log("[schemeHandler] getNetErrorCode:" + response.getNetErrorCode())
                  Utils.emitEvent(response.getNetErrorCode(), 101610)
                } catch (error) {
                  console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
                }
                break;
              }
              case "WebNetErrorList_06200": {
                let response = new web_webview.WebSchemeHandlerResponse();
                try {
                  response.setNetErrorCode(WebNetErrorList.ERR_SSL_CLIENT_AUTH_PRIVATE_KEY_ACCESS_DENIED)
                  console.log("[schemeHandler] getNetErrorCode:" + response.getNetErrorCode())
                  Utils.emitEvent(response.getNetErrorCode(), 101620)
                } catch (error) {
                  console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
                }
                break;
              }
              case "WebNetErrorList_06300": {
                let response = new web_webview.WebSchemeHandlerResponse();
                try {
                  response.setNetErrorCode(WebNetErrorList.ERR_SSL_CLIENT_AUTH_CERT_NO_PRIVATE_KEY)
                  console.log("[schemeHandler] getNetErrorCode:" + response.getNetErrorCode())
                  Utils.emitEvent(response.getNetErrorCode(), 101630)
                } catch (error) {
                  console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
                }
                break;
              }
              case "WebNetErrorList_06400": {
                let response = new web_webview.WebSchemeHandlerResponse();
                try {
                  response.setNetErrorCode(WebNetErrorList.ERR_PROXY_CERTIFICATE_INVALID)
                  console.log("[schemeHandler] getNetErrorCode:" + response.getNetErrorCode())
                  Utils.emitEvent(response.getNetErrorCode(), 101640)
                } catch (error) {
                  console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
                }
                break;
              }
              case "WebNetErrorList_06500": {
                let response = new web_webview.WebSchemeHandlerResponse();
                try {
                  response.setNetErrorCode(WebNetErrorList.ERR_NAME_RESOLUTION_FAILED)
                  console.log("[schemeHandler] getNetErrorCode:" + response.getNetErrorCode())
                  Utils.emitEvent(response.getNetErrorCode(), 101650)
                } catch (error) {
                  console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
                }
                break;
              }
              case "WebNetErrorList_06600": {
                let response = new web_webview.WebSchemeHandlerResponse();
                try {
                  response.setNetErrorCode(WebNetErrorList.ERR_NETWORK_ACCESS_DENIED)
                  console.log("[schemeHandler] getNetErrorCode:" + response.getNetErrorCode())
                  Utils.emitEvent(response.getNetErrorCode(), 101660)
                } catch (error) {
                  console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
                }
                break;
              }
              case "WebNetErrorList_06700": {
                let response = new web_webview.WebSchemeHandlerResponse();
                try {
                  response.setNetErrorCode(WebNetErrorList.ERR_TEMPORARILY_THROTTLED)
                  console.log("[schemeHandler] getNetErrorCode:" + response.getNetErrorCode())
                  Utils.emitEvent(response.getNetErrorCode(), 101670)
                } catch (error) {
                  console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
                }
                break;
              }
              case "WebNetErrorList_06800": {
                let response = new web_webview.WebSchemeHandlerResponse();
                try {
                  response.setNetErrorCode(WebNetErrorList.ERR_HTTPS_PROXY_TUNNEL_RESPONSE_REDIRECT)
                  console.log("[schemeHandler] getNetErrorCode:" + response.getNetErrorCode())
                  Utils.emitEvent(response.getNetErrorCode(), 101680)
                } catch (error) {
                  console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
                }
                break;
              }
              case "WebNetErrorList_06900": {
                let response = new web_webview.WebSchemeHandlerResponse();
                try {
                  response.setNetErrorCode(WebNetErrorList.ERR_SSL_CLIENT_AUTH_SIGNATURE_FAILED)
                  console.log("[schemeHandler] getNetErrorCode:" + response.getNetErrorCode())
                  Utils.emitEvent(response.getNetErrorCode(), 101690)
                } catch (error) {
                  console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
                }
                break;
              }
              case "WebNetErrorList_07000": {
                let response = new web_webview.WebSchemeHandlerResponse();
                try {
                  response.setNetErrorCode(WebNetErrorList.ERR_MSG_TOO_BIG)
                  console.log("[schemeHandler] getNetErrorCode:" + response.getNetErrorCode())
                  Utils.emitEvent(response.getNetErrorCode(), 101700)
                } catch (error) {
                  console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
                }
                break;
              }
              case "WebNetErrorList_07100": {
                let response = new web_webview.WebSchemeHandlerResponse();
                try {
                  response.setNetErrorCode(WebNetErrorList.ERR_WS_PROTOCOL_ERROR)
                  console.log("[schemeHandler] getNetErrorCode:" + response.getNetErrorCode())
                  Utils.emitEvent(response.getNetErrorCode(), 101710)
                } catch (error) {
                  console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
                }
                break;
              }
              case "WebNetErrorList_07200": {
                let response = new web_webview.WebSchemeHandlerResponse();
                try {
                  response.setNetErrorCode(WebNetErrorList.ERR_ADDRESS_IN_USE)
                  console.log("[schemeHandler] getNetErrorCode:" + response.getNetErrorCode())
                  Utils.emitEvent(response.getNetErrorCode(), 101720)
                } catch (error) {
                  console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
                }
                break;
              }
              case "WebNetErrorList_07300": {
                let response = new web_webview.WebSchemeHandlerResponse();
                try {
                  response.setNetErrorCode(WebNetErrorList.ERR_SSL_HANDSHAKE_NOT_COMPLETED)
                  console.log("[schemeHandler] getNetErrorCode:" + response.getNetErrorCode())
                  Utils.emitEvent(response.getNetErrorCode(), 101730)
                } catch (error) {
                  console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
                }
                break;
              }
              case "WebNetErrorList_07400": {
                let response = new web_webview.WebSchemeHandlerResponse();
                try {
                  response.setNetErrorCode(WebNetErrorList.ERR_SSL_BAD_PEER_PUBLIC_KEY)
                  console.log("[schemeHandler] getNetErrorCode:" + response.getNetErrorCode())
                  Utils.emitEvent(response.getNetErrorCode(), 101740)
                } catch (error) {
                  console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
                }
                break;
              }
              case "WebNetErrorList_07500": {
                let response = new web_webview.WebSchemeHandlerResponse();
                try {
                  response.setNetErrorCode(WebNetErrorList.ERR_SSL_PINNED_KEY_NOT_IN_CERT_CHAIN)
                  console.log("[schemeHandler] getNetErrorCode:" + response.getNetErrorCode())
                  Utils.emitEvent(response.getNetErrorCode(), 101750)
                } catch (error) {
                  console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
                }
                break;
              }
              case "WebNetErrorList_07600": {
                let response = new web_webview.WebSchemeHandlerResponse();
                try {
                  response.setNetErrorCode(WebNetErrorList.ERR_CLIENT_AUTH_CERT_TYPE_UNSUPPORTED)
                  console.log("[schemeHandler] getNetErrorCode:" + response.getNetErrorCode())
                  Utils.emitEvent(response.getNetErrorCode(), 101760)
                } catch (error) {
                  console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
                }
                break;
              }
              case "WebNetErrorList_07700": {
                let response = new web_webview.WebSchemeHandlerResponse();
                try {
                  response.setNetErrorCode(WebNetErrorList.ERR_SSL_DECRYPT_ERROR_ALERT)
                  console.log("[schemeHandler] getNetErrorCode:" + response.getNetErrorCode())
                  Utils.emitEvent(response.getNetErrorCode(), 101770)
                } catch (error) {
                  console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
                }
                break;
              }
              case "WebNetErrorList_07800": {
                let response = new web_webview.WebSchemeHandlerResponse();
                try {
                  response.setNetErrorCode(WebNetErrorList.ERR_WS_THROTTLE_QUEUE_TOO_LARGE)
                  console.log("[schemeHandler] getNetErrorCode:" + response.getNetErrorCode())
                  Utils.emitEvent(response.getNetErrorCode(), 101780)
                } catch (error) {
                  console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
                }
                break;
              }
              case "WebNetErrorList_07900": {
                let response = new web_webview.WebSchemeHandlerResponse();
                try {
                  response.setNetErrorCode(WebNetErrorList.ERR_SSL_SERVER_CERT_CHANGED)
                  console.log("[schemeHandler] getNetErrorCode:" + response.getNetErrorCode())
                  Utils.emitEvent(response.getNetErrorCode(), 101790)
                } catch (error) {
                  console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
                }
                break;
              }
              case "WebNetErrorList_08000": {
                let response = new web_webview.WebSchemeHandlerResponse();
                try {
                  response.setNetErrorCode(WebNetErrorList.ERR_SSL_UNRECOGNIZED_NAME_ALERT)
                  console.log("[schemeHandler] getNetErrorCode:" + response.getNetErrorCode())
                  Utils.emitEvent(response.getNetErrorCode(), 101800)
                } catch (error) {
                  console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
                }
                break;
              }
              case "WebNetErrorList_08100": {
                let response = new web_webview.WebSchemeHandlerResponse();
                try {
                  response.setNetErrorCode(WebNetErrorList.ERR_SOCKET_SET_RECEIVE_BUFFER_SIZE_ERROR)
                  console.log("[schemeHandler] getNetErrorCode:" + response.getNetErrorCode())
                  Utils.emitEvent(response.getNetErrorCode(), 101810)
                } catch (error) {
                  console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
                }
                break;
              }
              case "WebNetErrorList_08200": {
                let response = new web_webview.WebSchemeHandlerResponse();
                try {
                  response.setNetErrorCode(WebNetErrorList.ERR_SOCKET_SET_SEND_BUFFER_SIZE_ERROR)
                  console.log("[schemeHandler] getNetErrorCode:" + response.getNetErrorCode())
                  Utils.emitEvent(response.getNetErrorCode(), 101820)
                } catch (error) {
                  console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
                }
                break;
              }
              case "WebNetErrorList_08300": {
                let response = new web_webview.WebSchemeHandlerResponse();
                try {
                  response.setNetErrorCode(WebNetErrorList.ERR_SOCKET_RECEIVE_BUFFER_SIZE_UNCHANGEABLE)
                  console.log("[schemeHandler] getNetErrorCode:" + response.getNetErrorCode())
                  Utils.emitEvent(response.getNetErrorCode(), 101830)
                } catch (error) {
                  console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
                }
                break;
              }
              case "WebNetErrorList_08400": {
                let response = new web_webview.WebSchemeHandlerResponse();
                try {
                  response.setNetErrorCode(WebNetErrorList.ERR_SOCKET_SEND_BUFFER_SIZE_UNCHANGEABLE)
                  console.log("[schemeHandler] getNetErrorCode:" + response.getNetErrorCode())
                  Utils.emitEvent(response.getNetErrorCode(), 101840)
                } catch (error) {
                  console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
                }
                break;
              }
              case "WebNetErrorList_08500": {
                let response = new web_webview.WebSchemeHandlerResponse();
                try {
                  response.setNetErrorCode(WebNetErrorList.ERR_SSL_CLIENT_AUTH_CERT_BAD_FORMAT)
                  console.log("[schemeHandler] getNetErrorCode:" + response.getNetErrorCode())
                  Utils.emitEvent(response.getNetErrorCode(), 101850)
                } catch (error) {
                  console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
                }
                break;
              }
              case "WebNetErrorList_08600": {
                let response = new web_webview.WebSchemeHandlerResponse();
                try {
                  response.setNetErrorCode(WebNetErrorList.ERR_ICANN_NAME_COLLISION)
                  console.log("[schemeHandler] getNetErrorCode:" + response.getNetErrorCode())
                  Utils.emitEvent(response.getNetErrorCode(), 101860)
                } catch (error) {
                  console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
                }
                break;
              }
              case "WebNetErrorList_08700": {
                let response = new web_webview.WebSchemeHandlerResponse();
                try {
                  response.setNetErrorCode(WebNetErrorList.ERR_SSL_SERVER_CERT_BAD_FORMAT)
                  console.log("[schemeHandler] getNetErrorCode:" + response.getNetErrorCode())
                  Utils.emitEvent(response.getNetErrorCode(), 101870)
                } catch (error) {
                  console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
                }
                break;
              }
              case "WebNetErrorList_08800": {
                let response = new web_webview.WebSchemeHandlerResponse();
                try {
                  response.setNetErrorCode(WebNetErrorList.ERR_CT_STH_PARSING_FAILED)
                  console.log("[schemeHandler] getNetErrorCode:" + response.getNetErrorCode())
                  Utils.emitEvent(response.getNetErrorCode(), 101880)
                } catch (error) {
                  console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
                }
                break;
              }
              case "WebNetErrorList_08900": {
                let response = new web_webview.WebSchemeHandlerResponse();
                try {
                  response.setNetErrorCode(WebNetErrorList.ERR_CT_STH_INCOMPLETE)
                  console.log("[schemeHandler] getNetErrorCode:" + response.getNetErrorCode())
                  Utils.emitEvent(response.getNetErrorCode(), 101890)
                } catch (error) {
                  console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
                }
                break;
              }
              case "WebNetErrorList_09000": {
                let response = new web_webview.WebSchemeHandlerResponse();
                try {
                  response.setNetErrorCode(WebNetErrorList.ERR_UNABLE_TO_REUSE_CONNECTION_FOR_PROXY_AUTH)
                  console.log("[schemeHandler] getNetErrorCode:" + response.getNetErrorCode())
                  Utils.emitEvent(response.getNetErrorCode(), 101900)
                } catch (error) {
                  console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
                }
                break;
              }
              case "WebNetErrorList_09100": {
                let response = new web_webview.WebSchemeHandlerResponse();
                try {
                  response.setNetErrorCode(WebNetErrorList.ERR_CT_CONSISTENCY_PROOF_PARSING_FAILED)
                  console.log("[schemeHandler] getNetErrorCode:" + response.getNetErrorCode())
                  Utils.emitEvent(response.getNetErrorCode(), 101910)
                } catch (error) {
                  console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
                }
                break;
              }
              case "WebNetErrorList_09200": {
                let response = new web_webview.WebSchemeHandlerResponse();
                try {
                  response.setNetErrorCode(WebNetErrorList.ERR_SSL_OBSOLETE_CIPHER)
                  console.log("[schemeHandler] getNetErrorCode:" + response.getNetErrorCode())
                  Utils.emitEvent(response.getNetErrorCode(), 101920)
                } catch (error) {
                  console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
                }
                break;
              }
              case "WebNetErrorList_09300": {
                let response = new web_webview.WebSchemeHandlerResponse();
                try {
                  response.setNetErrorCode(WebNetErrorList.ERR_WS_UPGRADE)
                  console.log("[schemeHandler] getNetErrorCode:" + response.getNetErrorCode())
                  Utils.emitEvent(response.getNetErrorCode(), 101930)
                } catch (error) {
                  console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
                }
                break;
              }
              case "WebNetErrorList_09400": {
                let response = new web_webview.WebSchemeHandlerResponse();
                try {
                  response.setNetErrorCode(WebNetErrorList.ERR_READ_IF_READY_NOT_IMPLEMENTED)
                  console.log("[schemeHandler] getNetErrorCode:" + response.getNetErrorCode())
                  Utils.emitEvent(response.getNetErrorCode(), 101940)
                } catch (error) {
                  console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
                }
                break;
              }
              case "WebNetErrorList_09500": {
                let response = new web_webview.WebSchemeHandlerResponse();
                try {
                  response.setNetErrorCode(WebNetErrorList.ERR_NO_BUFFER_SPACE)
                  console.log("[schemeHandler] getNetErrorCode:" + response.getNetErrorCode())
                  Utils.emitEvent(response.getNetErrorCode(), 101950)
                } catch (error) {
                  console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
                }
                break;
              }
              case "WebNetErrorList_09600": {
                let response = new web_webview.WebSchemeHandlerResponse();
                try {
                  response.setNetErrorCode(WebNetErrorList.ERR_SSL_CLIENT_AUTH_NO_COMMON_ALGORITHMS)
                  console.log("[schemeHandler] getNetErrorCode:" + response.getNetErrorCode())
                  Utils.emitEvent(response.getNetErrorCode(), 101960)
                } catch (error) {
                  console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
                }
                break;
              }
              case "WebNetErrorList_09700": {
                let response = new web_webview.WebSchemeHandlerResponse();
                try {
                  response.setNetErrorCode(WebNetErrorList.ERR_EARLY_DATA_REJECTED)
                  console.log("[schemeHandler] getNetErrorCode:" + response.getNetErrorCode())
                  Utils.emitEvent(response.getNetErrorCode(), 101970)
                } catch (error) {
                  console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
                }
                break;
              }
              case "WebNetErrorList_09800": {
                let response = new web_webview.WebSchemeHandlerResponse();
                try {
                  response.setNetErrorCode(WebNetErrorList.ERR_WRONG_VERSION_ON_EARLY_DATA)
                  console.log("[schemeHandler] getNetErrorCode:" + response.getNetErrorCode())
                  Utils.emitEvent(response.getNetErrorCode(), 101980)
                } catch (error) {
                  console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
                }
                break;
              }
              case "WebNetErrorList_09900": {
                let response = new web_webview.WebSchemeHandlerResponse();
                try {
                  response.setNetErrorCode(WebNetErrorList.ERR_TLS13_DOWNGRADE_DETECTED)
                  console.log("[schemeHandler] getNetErrorCode:" + response.getNetErrorCode())
                  Utils.emitEvent(response.getNetErrorCode(), 101990)
                } catch (error) {
                  console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
                }
                break;
              }
              case "WebNetErrorList_010000": {
                let response = new web_webview.WebSchemeHandlerResponse();
                try {
                  response.setNetErrorCode(WebNetErrorList.ERR_SSL_KEY_USAGE_INCOMPATIBLE)
                  console.log("[schemeHandler] getNetErrorCode:" + response.getNetErrorCode())
                  Utils.emitEvent(response.getNetErrorCode(), 102000)
                } catch (error) {
                  console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
                }
                break;
              }
              case "WebNetErrorList_010100": {
                let response = new web_webview.WebSchemeHandlerResponse();
                try {
                  response.setNetErrorCode(WebNetErrorList.ERR_INVALID_ECH_CONFIG_LIST)
                  console.log("[schemeHandler] getNetErrorCode:" + response.getNetErrorCode())
                  Utils.emitEvent(response.getNetErrorCode(), 102010)
                } catch (error) {
                  console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
                }
                break;
              }
              case "WebNetErrorList_010200": {
                let response = new web_webview.WebSchemeHandlerResponse();
                try {
                  response.setNetErrorCode(WebNetErrorList.ERR_ECH_NOT_NEGOTIATED)
                  console.log("[schemeHandler] getNetErrorCode:" + response.getNetErrorCode())
                  Utils.emitEvent(response.getNetErrorCode(), 102020)
                } catch (error) {
                  console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
                }
                break;
              }
              case "WebNetErrorList_010300": {
                let response = new web_webview.WebSchemeHandlerResponse();
                try {
                  response.setNetErrorCode(WebNetErrorList.ERR_ECH_FALLBACK_CERTIFICATE_INVALID)
                  console.log("[schemeHandler] getNetErrorCode:" + response.getNetErrorCode())
                  Utils.emitEvent(response.getNetErrorCode(), 102030)
                } catch (error) {
                  console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
                }
                break;
              }
              case "WebNetErrorList_010400": {
                let response = new web_webview.WebSchemeHandlerResponse();
                try {
                  response.setNetErrorCode(WebNetErrorList.ERR_CERT_COMMON_NAME_INVALID)
                  console.log("[schemeHandler] getNetErrorCode:" + response.getNetErrorCode())
                  Utils.emitEvent(response.getNetErrorCode(), 102040)
                } catch (error) {
                  console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
                }
                break;
              }
              case "WebNetErrorList_010500": {
                let response = new web_webview.WebSchemeHandlerResponse();
                try {
                  response.setNetErrorCode(WebNetErrorList.ERR_CERT_DATE_INVALID)
                  console.log("[schemeHandler] getNetErrorCode:" + response.getNetErrorCode())
                  Utils.emitEvent(response.getNetErrorCode(), 102050)
                } catch (error) {
                  console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
                }
                break;
              }
              case "WebNetErrorList_010600": {
                let response = new web_webview.WebSchemeHandlerResponse();
                try {
                  response.setNetErrorCode(WebNetErrorList.ERR_CERT_AUTHORITY_INVALID)
                  console.log("[schemeHandler] getNetErrorCode:" + response.getNetErrorCode())
                  Utils.emitEvent(response.getNetErrorCode(), 102060)
                } catch (error) {
                  console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
                }
                break;
              }
              case "WebNetErrorList_010700": {
                let response = new web_webview.WebSchemeHandlerResponse();
                try {
                  response.setNetErrorCode(WebNetErrorList.ERR_CERT_CONTAINS_ERRORS)
                  console.log("[schemeHandler] getNetErrorCode:" + response.getNetErrorCode())
                  Utils.emitEvent(response.getNetErrorCode(), 102070)
                } catch (error) {
                  console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
                }
                break;
              }
              case "WebNetErrorList_010800": {
                let response = new web_webview.WebSchemeHandlerResponse();
                try {
                  response.setNetErrorCode(WebNetErrorList.ERR_CERT_NO_REVOCATION_MECHANISM)
                  console.log("[schemeHandler] getNetErrorCode:" + response.getNetErrorCode())
                  Utils.emitEvent(response.getNetErrorCode(), 102080)
                } catch (error) {
                  console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
                }
                break;
              }
              case "WebNetErrorList_010900": {
                let response = new web_webview.WebSchemeHandlerResponse();
                try {
                  response.setNetErrorCode(WebNetErrorList.ERR_CERT_UNABLE_TO_CHECK_REVOCATION)
                  console.log("[schemeHandler] getNetErrorCode:" + response.getNetErrorCode())
                  Utils.emitEvent(response.getNetErrorCode(), 102090)
                } catch (error) {
                  console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
                }
                break;
              }
              case "WebNetErrorList_011000": {
                let response = new web_webview.WebSchemeHandlerResponse();
                try {
                  response.setNetErrorCode(WebNetErrorList.ERR_CERT_REVOKED)
                  console.log("[schemeHandler] getNetErrorCode:" + response.getNetErrorCode())
                  Utils.emitEvent(response.getNetErrorCode(), 102100)
                } catch (error) {
                  console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
                }
                break;
              }
              case "WebNetErrorList_011100": {
                let response = new web_webview.WebSchemeHandlerResponse();
                try {
                  response.setNetErrorCode(WebNetErrorList.ERR_CERT_INVALID)
                  console.log("[schemeHandler] getNetErrorCode:" + response.getNetErrorCode())
                  Utils.emitEvent(response.getNetErrorCode(), 102110)
                } catch (error) {
                  console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
                }
                break;
              }
              case "WebNetErrorList_011200": {
                let response = new web_webview.WebSchemeHandlerResponse();
                try {
                  response.setNetErrorCode(WebNetErrorList.ERR_CERT_WEAK_SIGNATURE_ALGORITHM)
                  console.log("[schemeHandler] getNetErrorCode:" + response.getNetErrorCode())
                  Utils.emitEvent(response.getNetErrorCode(), 102120)
                } catch (error) {
                  console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
                }
                break;
              }
              case "WebNetErrorList_011300": {
                let response = new web_webview.WebSchemeHandlerResponse();
                try {
                  response.setNetErrorCode(WebNetErrorList.ERR_CERT_NON_UNIQUE_NAME)
                  console.log("[schemeHandler] getNetErrorCode:" + response.getNetErrorCode())
                  Utils.emitEvent(response.getNetErrorCode(), 102130)
                } catch (error) {
                  console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
                }
                break;
              }
              case "WebNetErrorList_011400": {
                let response = new web_webview.WebSchemeHandlerResponse();
                try {
                  response.setNetErrorCode(WebNetErrorList.ERR_CERT_WEAK_KEY)
                  console.log("[schemeHandler] getNetErrorCode:" + response.getNetErrorCode())
                  Utils.emitEvent(response.getNetErrorCode(), 102140)
                } catch (error) {
                  console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
                }
                break;
              }
              case "WebNetErrorList_011500": {
                let response = new web_webview.WebSchemeHandlerResponse();
                try {
                  response.setNetErrorCode(WebNetErrorList.ERR_CERT_NAME_CONSTRAINT_VIOLATION)
                  console.log("[schemeHandler] getNetErrorCode:" + response.getNetErrorCode())
                  Utils.emitEvent(response.getNetErrorCode(), 102150)
                } catch (error) {
                  console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
                }
                break;
              }
              case "WebNetErrorList_011600": {
                let response = new web_webview.WebSchemeHandlerResponse();
                try {
                  response.setNetErrorCode(WebNetErrorList.ERR_CERT_VALIDITY_TOO_LONG)
                  console.log("[schemeHandler] getNetErrorCode:" + response.getNetErrorCode())
                  Utils.emitEvent(response.getNetErrorCode(), 102160)
                } catch (error) {
                  console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
                }
                break;
              }
              case "WebNetErrorList_011700": {
                let response = new web_webview.WebSchemeHandlerResponse();
                try {
                  response.setNetErrorCode(WebNetErrorList.ERR_CERTIFICATE_TRANSPARENCY_REQUIRED)
                  console.log("[schemeHandler] getNetErrorCode:" + response.getNetErrorCode())
                  Utils.emitEvent(response.getNetErrorCode(), 102170)
                } catch (error) {
                  console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
                }
                break;
              }
              case "WebNetErrorList_011800": {
                let response = new web_webview.WebSchemeHandlerResponse();
                try {
                  response.setNetErrorCode(WebNetErrorList.ERR_CERT_SYMANTEC_LEGACY)
                  console.log("[schemeHandler] getNetErrorCode:" + response.getNetErrorCode())
                  Utils.emitEvent(response.getNetErrorCode(), 102180)
                } catch (error) {
                  console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
                }
                break;
              }
              case "WebNetErrorList_011900": {
                let response = new web_webview.WebSchemeHandlerResponse();
                try {
                  response.setNetErrorCode(WebNetErrorList.ERR_CERT_KNOWN_INTERCEPTION_BLOCKED)
                  console.log("[schemeHandler] getNetErrorCode:" + response.getNetErrorCode())
                  Utils.emitEvent(response.getNetErrorCode(), 102190)
                } catch (error) {
                  console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
                }
                break;
              }
              case "WebNetErrorList_012000": {
                let response = new web_webview.WebSchemeHandlerResponse();
                try {
                  response.setNetErrorCode(WebNetErrorList.ERR_SSL_OBSOLETE_VERSION_OR_CIPHER)
                  console.log("[schemeHandler] getNetErrorCode:" + response.getNetErrorCode())
                  Utils.emitEvent(response.getNetErrorCode(), 102200)
                } catch (error) {
                  console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
                }
                break;
              }
              case "WebNetErrorList_012100": {
                let response = new web_webview.WebSchemeHandlerResponse();
                try {
                  response.setNetErrorCode(WebNetErrorList.ERR_CERT_END)
                  console.log("[schemeHandler] getNetErrorCode:" + response.getNetErrorCode())
                  Utils.emitEvent(response.getNetErrorCode(), 102210)
                } catch (error) {
                  console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
                }
                break;
              }
              case "WebNetErrorList_012200": {
                let response = new web_webview.WebSchemeHandlerResponse();
                try {
                  response.setNetErrorCode(WebNetErrorList.ERR_INVALID_URL)
                  console.log("[schemeHandler] getNetErrorCode:" + response.getNetErrorCode())
                  Utils.emitEvent(response.getNetErrorCode(), 102220)
                } catch (error) {
                  console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
                }
                break;
              }
              case "WebNetErrorList_012300": {
                let response = new web_webview.WebSchemeHandlerResponse();
                try {
                  response.setNetErrorCode(WebNetErrorList.ERR_DISALLOWED_URL_SCHEME)
                  console.log("[schemeHandler] getNetErrorCode:" + response.getNetErrorCode())
                  Utils.emitEvent(response.getNetErrorCode(), 102230)
                } catch (error) {
                  console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
                }
                break;
              }
              case "WebNetErrorList_012400": {
                let response = new web_webview.WebSchemeHandlerResponse();
                try {
                  response.setNetErrorCode(WebNetErrorList.ERR_UNKNOWN_URL_SCHEME)
                  console.log("[schemeHandler] getNetErrorCode:" + response.getNetErrorCode())
                  Utils.emitEvent(response.getNetErrorCode(), 102240)
                } catch (error) {
                  console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
                }
                break;
              }
              case "WebNetErrorList_012500": {
                let response = new web_webview.WebSchemeHandlerResponse();
                try {
                  response.setNetErrorCode(WebNetErrorList.ERR_INVALID_REDIRECT)
                  console.log("[schemeHandler] getNetErrorCode:" + response.getNetErrorCode())
                  Utils.emitEvent(response.getNetErrorCode(), 102250)
                } catch (error) {
                  console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
                }
                break;
              }
              case "WebNetErrorList_012600": {
                let response = new web_webview.WebSchemeHandlerResponse();
                try {
                  response.setNetErrorCode(WebNetErrorList.ERR_TOO_MANY_REDIRECTS)
                  console.log("[schemeHandler] getNetErrorCode:" + response.getNetErrorCode())
                  Utils.emitEvent(response.getNetErrorCode(), 102260)
                } catch (error) {
                  console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
                }
                break;
              }
              case "WebNetErrorList_012700": {
                let response = new web_webview.WebSchemeHandlerResponse();
                try {
                  response.setNetErrorCode(WebNetErrorList.ERR_UNSAFE_REDIRECT)
                  console.log("[schemeHandler] getNetErrorCode:" + response.getNetErrorCode())
                  Utils.emitEvent(response.getNetErrorCode(), 102270)
                } catch (error) {
                  console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
                }
                break;
              }
              case "WebNetErrorList_012800": {
                let response = new web_webview.WebSchemeHandlerResponse();
                try {
                  response.setNetErrorCode(WebNetErrorList.ERR_UNSAFE_PORT)
                  console.log("[schemeHandler] getNetErrorCode:" + response.getNetErrorCode())
                  Utils.emitEvent(response.getNetErrorCode(), 102280)
                } catch (error) {
                  console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
                }
                break;
              }
              case "WebNetErrorList_012900": {
                let response = new web_webview.WebSchemeHandlerResponse();
                try {
                  response.setNetErrorCode(WebNetErrorList.ERR_INVALID_RESPONSE)
                  console.log("[schemeHandler] getNetErrorCode:" + response.getNetErrorCode())
                  Utils.emitEvent(response.getNetErrorCode(), 102290)
                } catch (error) {
                  console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
                }
                break;
              }
              case "WebNetErrorList_013000": {
                let response = new web_webview.WebSchemeHandlerResponse();
                try {
                  response.setNetErrorCode(WebNetErrorList.ERR_INVALID_CHUNKED_ENCODING)
                  console.log("[schemeHandler] getNetErrorCode:" + response.getNetErrorCode())
                  Utils.emitEvent(response.getNetErrorCode(), 102300)
                } catch (error) {
                  console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
                }
                break;
              }
              case "WebNetErrorList_013100": {
                let response = new web_webview.WebSchemeHandlerResponse();
                try {
                  response.setNetErrorCode(WebNetErrorList.ERR_METHOD_UNSUPPORTED)
                  console.log("[schemeHandler] getNetErrorCode:" + response.getNetErrorCode())
                  Utils.emitEvent(response.getNetErrorCode(), 102310)
                } catch (error) {
                  console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
                }
                break;
              }
              case "WebNetErrorList_013200": {
                let response = new web_webview.WebSchemeHandlerResponse();
                try {
                  response.setNetErrorCode(WebNetErrorList.ERR_UNEXPECTED_PROXY_AUTH)
                  console.log("[schemeHandler] getNetErrorCode:" + response.getNetErrorCode())
                  Utils.emitEvent(response.getNetErrorCode(), 102320)
                } catch (error) {
                  console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
                }
                break;
              }
              case "WebNetErrorList_013300": {
                let response = new web_webview.WebSchemeHandlerResponse();
                try {
                  response.setNetErrorCode(WebNetErrorList.ERR_EMPTY_RESPONSE)
                  console.log("[schemeHandler] getNetErrorCode:" + response.getNetErrorCode())
                  Utils.emitEvent(response.getNetErrorCode(), 102330)
                } catch (error) {
                  console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
                }
                break;
              }
              case "WebNetErrorList_013400": {
                let response = new web_webview.WebSchemeHandlerResponse();
                try {
                  response.setNetErrorCode(WebNetErrorList.ERR_RESPONSE_HEADERS_TOO_BIG)
                  console.log("[schemeHandler] getNetErrorCode:" + response.getNetErrorCode())
                  Utils.emitEvent(response.getNetErrorCode(), 102340)
                } catch (error) {
                  console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
                }
                break;
              }
              case "WebNetErrorList_013500": {
                let response = new web_webview.WebSchemeHandlerResponse();
                try {
                  response.setNetErrorCode(WebNetErrorList.ERR_PAC_SCRIPT_FAILED)
                  console.log("[schemeHandler] getNetErrorCode:" + response.getNetErrorCode())
                  Utils.emitEvent(response.getNetErrorCode(), 102350)
                } catch (error) {
                  console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
                }
                break;
              }
              case "WebNetErrorList_013600": {
                let response = new web_webview.WebSchemeHandlerResponse();
                try {
                  response.setNetErrorCode(WebNetErrorList.ERR_REQUEST_RANGE_NOT_SATISFIABLE)
                  console.log("[schemeHandler] getNetErrorCode:" + response.getNetErrorCode())
                  Utils.emitEvent(response.getNetErrorCode(), 102360)
                } catch (error) {
                  console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
                }
                break;
              }
              case "WebNetErrorList_013700": {
                let response = new web_webview.WebSchemeHandlerResponse();
                try {
                  response.setNetErrorCode(WebNetErrorList.ERR_MALFORMED_IDENTITY)
                  console.log("[schemeHandler] getNetErrorCode:" + response.getNetErrorCode())
                  Utils.emitEvent(response.getNetErrorCode(), 102370)
                } catch (error) {
                  console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
                }
                break;
              }
              case "WebNetErrorList_013800": {
                let response = new web_webview.WebSchemeHandlerResponse();
                try {
                  response.setNetErrorCode(WebNetErrorList.ERR_CONTENT_DECODING_FAILED)
                  console.log("[schemeHandler] getNetErrorCode:" + response.getNetErrorCode())
                  Utils.emitEvent(response.getNetErrorCode(), 102380)
                } catch (error) {
                  console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
                }
                break;
              }
              case "WebNetErrorList_013900": {
                let response = new web_webview.WebSchemeHandlerResponse();
                try {
                  response.setNetErrorCode(WebNetErrorList.ERR_NETWORK_IO_SUSPENDED)
                  console.log("[schemeHandler] getNetErrorCode:" + response.getNetErrorCode())
                  Utils.emitEvent(response.getNetErrorCode(), 102390)
                } catch (error) {
                  console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
                }
                break;
              }
              case "WebNetErrorList_014000": {
                let response = new web_webview.WebSchemeHandlerResponse();
                try {
                  response.setNetErrorCode(WebNetErrorList.ERR_SYN_REPLY_NOT_RECEIVED)
                  console.log("[schemeHandler] getNetErrorCode:" + response.getNetErrorCode())
                  Utils.emitEvent(response.getNetErrorCode(), 102400)
                } catch (error) {
                  console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
                }
                break;
              }
              case "WebNetErrorList_014100": {
                let response = new web_webview.WebSchemeHandlerResponse();
                try {
                  response.setNetErrorCode(WebNetErrorList.ERR_ENCODING_CONVERSION_FAILED)
                  console.log("[schemeHandler] getNetErrorCode:" + response.getNetErrorCode())
                  Utils.emitEvent(response.getNetErrorCode(), 102410)
                } catch (error) {
                  console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
                }
                break;
              }
              case "WebNetErrorList_014200": {
                let response = new web_webview.WebSchemeHandlerResponse();
                try {
                  response.setNetErrorCode(WebNetErrorList.ERR_UNRECOGNIZED_FTP_DIRECTORY_LISTING_FORMAT)
                  console.log("[schemeHandler] getNetErrorCode:" + response.getNetErrorCode())
                  Utils.emitEvent(response.getNetErrorCode(), 102420)
                } catch (error) {
                  console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
                }
                break;
              }
              case "WebNetErrorList_014300": {
                let response = new web_webview.WebSchemeHandlerResponse();
                try {
                  response.setNetErrorCode(WebNetErrorList.ERR_NO_SUPPORTED_PROXIES)
                  console.log("[schemeHandler] getNetErrorCode:" + response.getNetErrorCode())
                  Utils.emitEvent(response.getNetErrorCode(), 102430)
                } catch (error) {
                  console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
                }
                break;
              }
              case "WebNetErrorList_014400": {
                let response = new web_webview.WebSchemeHandlerResponse();
                try {
                  response.setNetErrorCode(WebNetErrorList.ERR_HTTP2_PROTOCOL_ERROR)
                  console.log("[schemeHandler] getNetErrorCode:" + response.getNetErrorCode())
                  Utils.emitEvent(response.getNetErrorCode(), 102440)
                } catch (error) {
                  console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
                }
                break;
              }
              case "WebNetErrorList_014500": {
                let response = new web_webview.WebSchemeHandlerResponse();
                try {
                  response.setNetErrorCode(WebNetErrorList.ERR_INVALID_AUTH_CREDENTIALS)
                  console.log("[schemeHandler] getNetErrorCode:" + response.getNetErrorCode())
                  Utils.emitEvent(response.getNetErrorCode(), 102450)
                } catch (error) {
                  console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
                }
                break;
              }
              case "WebNetErrorList_014600": {
                let response = new web_webview.WebSchemeHandlerResponse();
                try {
                  response.setNetErrorCode(WebNetErrorList.ERR_UNSUPPORTED_AUTH_SCHEME)
                  console.log("[schemeHandler] getNetErrorCode:" + response.getNetErrorCode())
                  Utils.emitEvent(response.getNetErrorCode(), 102460)
                } catch (error) {
                  console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
                }
                break;
              }
              case "WebNetErrorList_014700": {
                let response = new web_webview.WebSchemeHandlerResponse();
                try {
                  response.setNetErrorCode(WebNetErrorList.ERR_ENCODING_DETECTION_FAILED)
                  console.log("[schemeHandler] getNetErrorCode:" + response.getNetErrorCode())
                  Utils.emitEvent(response.getNetErrorCode(), 102470)
                } catch (error) {
                  console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
                }
                break;
              }
              case "WebNetErrorList_014800": {
                let response = new web_webview.WebSchemeHandlerResponse();
                try {
                  response.setNetErrorCode(WebNetErrorList.ERR_MISSING_AUTH_CREDENTIALS)
                  console.log("[schemeHandler] getNetErrorCode:" + response.getNetErrorCode())
                  Utils.emitEvent(response.getNetErrorCode(), 102480)
                } catch (error) {
                  console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
                }
                break;
              }
              case "WebNetErrorList_014900": {
                let response = new web_webview.WebSchemeHandlerResponse();
                try {
                  response.setNetErrorCode(WebNetErrorList.ERR_UNEXPECTED_SECURITY_LIBRARY_STATUS)
                  console.log("[schemeHandler] getNetErrorCode:" + response.getNetErrorCode())
                  Utils.emitEvent(response.getNetErrorCode(), 102490)
                } catch (error) {
                  console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
                }
                break;
              }
              case "WebNetErrorList_015000": {
                let response = new web_webview.WebSchemeHandlerResponse();
                try {
                  response.setNetErrorCode(WebNetErrorList.ERR_MISCONFIGURED_AUTH_ENVIRONMENT)
                  console.log("[schemeHandler] getNetErrorCode:" + response.getNetErrorCode())
                  Utils.emitEvent(response.getNetErrorCode(), 102500)
                } catch (error) {
                  console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
                }
                break;
              }
              case "WebNetErrorList_015100": {
                let response = new web_webview.WebSchemeHandlerResponse();
                try {
                  response.setNetErrorCode(WebNetErrorList.ERR_UNDOCUMENTED_SECURITY_LIBRARY_STATUS)
                  console.log("[schemeHandler] getNetErrorCode:" + response.getNetErrorCode())
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
                  console.log("[schemeHandler] getNetErrorCode:" + response.getNetErrorCode())
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
                  console.log("[schemeHandler] getNetErrorCode:" + response.getNetErrorCode())
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
                  console.log("[schemeHandler] getNetErrorCode:" + response.getNetErrorCode())
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
                  console.log("[schemeHandler] getNetErrorCode:" + response.getNetErrorCode())
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
                  console.log("[schemeHandler] getNetErrorCode:" + response.getNetErrorCode())
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
                  console.log("[schemeHandler] getNetErrorCode:" + response.getNetErrorCode())
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
                  console.log("[schemeHandler] getNetErrorCode:" + response.getNetErrorCode())
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
                  console.log("[schemeHandler] getNetErrorCode:" + response.getNetErrorCode())
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
                  console.log("[schemeHandler] getNetErrorCode:" + response.getNetErrorCode())
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
                  console.log("[schemeHandler] getNetErrorCode:" + response.getNetErrorCode())
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
                  console.log("[schemeHandler] getNetErrorCode:" + response.getNetErrorCode())
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
                  console.log("[schemeHandler] getNetErrorCode:" + response.getNetErrorCode())
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
                  console.log("[schemeHandler] getNetErrorCode:" + response.getNetErrorCode())
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
                  console.log("[schemeHandler] getNetErrorCode:" + response.getNetErrorCode())
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
                  console.log("[schemeHandler] getNetErrorCode:" + response.getNetErrorCode())
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
                  console.log("[schemeHandler] getNetErrorCode:" + response.getNetErrorCode())
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
                  console.log("[schemeHandler] getNetErrorCode:" + response.getNetErrorCode())
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
                  console.log("[schemeHandler] getNetErrorCode:" + response.getNetErrorCode())
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
                  console.log("[schemeHandler] getNetErrorCode:" + response.getNetErrorCode())
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
                  console.log("[schemeHandler] getNetErrorCode:" + response.getNetErrorCode())
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
                  console.log("[schemeHandler] getNetErrorCode:" + response.getNetErrorCode())
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
                  console.log("[schemeHandler] getNetErrorCode:" + response.getNetErrorCode())
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
                  console.log("[schemeHandler] getNetErrorCode:" + response.getNetErrorCode())
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
                  console.log("[schemeHandler] getNetErrorCode:" + response.getNetErrorCode())
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
                  console.log("[schemeHandler] getNetErrorCode:" + response.getNetErrorCode())
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
                  console.log("[schemeHandler] getNetErrorCode:" + response.getNetErrorCode())
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
                  console.log("[schemeHandler] getNetErrorCode:" + response.getNetErrorCode())
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
                  console.log("[schemeHandler] getNetErrorCode:" + response.getNetErrorCode())
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
                  console.log("[schemeHandler] getNetErrorCode:" + response.getNetErrorCode())
                  Utils.emitEvent(response.getNetErrorCode(), 102800)
                } catch (error) {
                  console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
                }
                break;
              }
              case "WebNetErrorList_018100": {
                let response = new web_webview.WebSchemeHandlerResponse();
                try {
                  response.setNetErrorCode(WebNetErrorList.ERR_HTTP2_PUSHED_RESPONSE_DOES_NOT_MATCH)
                  console.log("[schemeHandler] getNetErrorCode:" + response.getNetErrorCode())
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
                  console.log("[schemeHandler] getNetErrorCode:" + response.getNetErrorCode())
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
                  console.log("[schemeHandler] getNetErrorCode:" + response.getNetErrorCode())
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
                  console.log("[schemeHandler] getNetErrorCode:" + response.getNetErrorCode())
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
                  console.log("[schemeHandler] getNetErrorCode:" + response.getNetErrorCode())
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
                  console.log("[schemeHandler] getNetErrorCode:" + response.getNetErrorCode())
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
                  console.log("[schemeHandler] getNetErrorCode:" + response.getNetErrorCode())
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
                  console.log("[schemeHandler] getNetErrorCode:" + response.getNetErrorCode())
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
                  console.log("[schemeHandler] getNetErrorCode:" + response.getNetErrorCode())
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
                  console.log("[schemeHandler] getNetErrorCode:" + response.getNetErrorCode())
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
                  console.log("[schemeHandler] getNetErrorCode:" + response.getNetErrorCode())
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
                  console.log("[schemeHandler] getNetErrorCode:" + response.getNetErrorCode())
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
                  console.log("[schemeHandler] getNetErrorCode:" + response.getNetErrorCode())
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
                  console.log("[schemeHandler] getNetErrorCode:" + response.getNetErrorCode())
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
                  console.log("[schemeHandler] getNetErrorCode:" + response.getNetErrorCode())
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
                  console.log("[schemeHandler] getNetErrorCode:" + response.getNetErrorCode())
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
                  console.log("[schemeHandler] getNetErrorCode:" + response.getNetErrorCode())
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
                  console.log("[schemeHandler] getNetErrorCode:" + response.getNetErrorCode())
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
                  console.log("[schemeHandler] getNetErrorCode:" + response.getNetErrorCode())
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
                  console.log("[schemeHandler] getNetErrorCode:" + response.getNetErrorCode())
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
                  console.log("[schemeHandler] getNetErrorCode:" + response.getNetErrorCode())
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
                  console.log("[schemeHandler] getNetErrorCode:" + response.getNetErrorCode())
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
                  console.log("[schemeHandler] getNetErrorCode:" + response.getNetErrorCode())
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
                  console.log("[schemeHandler] getNetErrorCode:" + response.getNetErrorCode())
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
                  console.log("[schemeHandler] getNetErrorCode:" + response.getNetErrorCode())
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
                  console.log("[schemeHandler] getNetErrorCode:" + response.getNetErrorCode())
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
                  console.log("[schemeHandler] getNetErrorCode:" + response.getNetErrorCode())
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
                  console.log("[schemeHandler] getNetErrorCode:" + response.getNetErrorCode())
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
                  console.log("[schemeHandler] getNetErrorCode:" + response.getNetErrorCode())
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
                  console.log("[schemeHandler] getNetErrorCode:" + response.getNetErrorCode())
                  Utils.emitEvent(response.getNetErrorCode(), 103100)
                } catch (error) {
                  console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
                }
                break;
              }
              case "WebNetErrorList_021100": {
                let response = new web_webview.WebSchemeHandlerResponse();
                try {
                  response.setNetErrorCode(WebNetErrorList.ERR_FTP_TRANSFER_ABORTED)
                  console.log("[schemeHandler] getNetErrorCode:" + response.getNetErrorCode())
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
                  console.log("[schemeHandler] getNetErrorCode:" + response.getNetErrorCode())
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
                  console.log("[schemeHandler] getNetErrorCode:" + response.getNetErrorCode())
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
                  console.log("[schemeHandler] getNetErrorCode:" + response.getNetErrorCode())
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
                  console.log("[schemeHandler] getNetErrorCode:" + response.getNetErrorCode())
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
                  console.log("[schemeHandler] getNetErrorCode:" + response.getNetErrorCode())
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
                  console.log("[schemeHandler] getNetErrorCode:" + response.getNetErrorCode())
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
                  console.log("[schemeHandler] getNetErrorCode:" + response.getNetErrorCode())
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
                  console.log("[schemeHandler] getNetErrorCode:" + response.getNetErrorCode())
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
                  console.log("[schemeHandler] getNetErrorCode:" + response.getNetErrorCode())
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
                  console.log("[schemeHandler] getNetErrorCode:" + response.getNetErrorCode())
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
                  console.log("[schemeHandler] getNetErrorCode:" + response.getNetErrorCode())
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
                  console.log("[schemeHandler] getNetErrorCode:" + response.getNetErrorCode())
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
                  console.log("[schemeHandler] getNetErrorCode:" + response.getNetErrorCode())
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
                  console.log("[schemeHandler] getNetErrorCode:" + response.getNetErrorCode())
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
                  console.log("[schemeHandler] getNetErrorCode:" + response.getNetErrorCode())
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
                  console.log("[schemeHandler] getNetErrorCode:" + response.getNetErrorCode())
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
                  console.log("[schemeHandler] getNetErrorCode:" + response.getNetErrorCode())
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
                  console.log("[schemeHandler] getNetErrorCode:" + response.getNetErrorCode())
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
                  console.log("[schemeHandler] getNetErrorCode:" + response.getNetErrorCode())
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
                  console.log("[schemeHandler] getNetErrorCode:" + response.getNetErrorCode())
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
                  console.log("[schemeHandler] getNetErrorCode:" + response.getNetErrorCode())
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
                  console.log("[schemeHandler] getNetErrorCode:" + response.getNetErrorCode())
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
                  console.log("[schemeHandler] getNetErrorCode:" + response.getNetErrorCode())
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
                  console.log("[schemeHandler] getNetErrorCode:" + response.getNetErrorCode())
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
                  console.log("[schemeHandler] getNetErrorCode:" + response.getNetErrorCode())
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
                  console.log("[schemeHandler] getNetErrorCode:" + response.getNetErrorCode())
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
                  console.log("[schemeHandler] getNetErrorCode:" + response.getNetErrorCode())
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
                  console.log("[schemeHandler] getNetErrorCode:" + response.getNetErrorCode())
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
                  console.log("[schemeHandler] getNetErrorCode:" + response.getNetErrorCode())
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