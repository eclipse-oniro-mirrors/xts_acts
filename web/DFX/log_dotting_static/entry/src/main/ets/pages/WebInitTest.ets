/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the 'License');
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an 'AS IS' BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
import { OnRenderExitedEvent, OnPageBeginEvent, RenderProcessNotRespondingReason, RenderProcessNotRespondingData, Entry, Component, Column, Row, Button, ClickEvent, Web } from "@ohos.arkui.component"
import { State } from "@ohos.arkui.stateManagement"
import web_webview from '@ohos.web.webview'
import { BusinessError } from '@ohos.base';
import { WebNetErrorList } from '@ohos.web.netErrorList';
import Utils from '../../src/test/Util.test';
import events_emitter from '@ohos.events.emitter';
import AbilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import emitter from '@ohos.events.emitter';
import { Callback, RecordData } from '@ohos.base'
class StringFields {
  public str: string = '';
}
@Entry
@Component
struct WebInitTest {
  stringObj: StringFields  = new StringFields ();
  controller: web_webview.WebviewController = new web_webview.WebviewController(undefined);
  @State str: string = ""
  @State webInit: boolean = false
  @State webCreated: boolean = false
  @State interceptUrl: string = ''
  @State consoleMsg: string = ''
  @State consoleCorsError: boolean = false

aboutToAppear() {
  let valueChangeEvent: events_emitter.InnerEvent = {
    eventId: 10,
    priority: events_emitter.EventPriority.LOW
  }
  events_emitter.on(valueChangeEvent, this.valueChangeCallBack)
}

private valueChangeCallBack: Callback<events_emitter.EventData> = (eventData: events_emitter.EventData): void => {
  if (eventData != null) {
    console.info('valueChangeCallBack:' + JSON.stringify(eventData));
    const data = eventData.data as Record<string, RecordData>;
    if (data != null && data['ACTION'] != null) {
      let strValue: string = String(data['ACTION']);
      this.stringObj.str = strValue;
    }
  }
}

  build() {
    Column() {
      Row() {
        Button("WebSchemeHandlerResponse").key('WebSchemeHandlerResponse').onClick( (e: ClickEvent) => {
          console.info("key==>" +this.stringObj.str)
          switch (this.stringObj.str) {
            case "WebNetErrorList_Static_0100": {
              let response = new web_webview.WebSchemeHandlerResponse();
              try {
                response.setNetErrorCode(WebNetErrorList.NET_OK)
                console.log("[schemeHandler] getNetErrorCode:" + response.getNetErrorCode())
                Utils.emitEvent(response.getNetErrorCode(), 6600)
              } catch (error) {
                error = error as BusinessError ;
                console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
              }
              break;
            }
            case "WebNetErrorList_Static_0200": {
              let response = new web_webview.WebSchemeHandlerResponse();
              try {
                response.setNetErrorCode(WebNetErrorList.ERR_IO_PENDING)
                console.log("[schemeHandler] getNetErrorCode:" + response.getNetErrorCode())
                Utils.emitEvent(response.getNetErrorCode(), 6601)
              } catch (error) {
                error = error as BusinessError ;
                console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
              }
              break;
            }
            case "WebNetErrorList_Static_0300": {
              let response = new web_webview.WebSchemeHandlerResponse();
              try {
                response.setNetErrorCode(WebNetErrorList.ERR_FAILED)
                console.log("[schemeHandler] getNetErrorCode:" + response.getNetErrorCode())
                Utils.emitEvent(response.getNetErrorCode(), 6602)
              } catch (error) {
                error = error as BusinessError ;
                console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
              }
              break;
            }
            case "WebNetErrorList_Static_0400": {
              let response = new web_webview.WebSchemeHandlerResponse();
              try {
                response.setNetErrorCode(WebNetErrorList.ERR_ABORTED)
                console.log("[schemeHandler] getNetErrorCode:" + response.getNetErrorCode())
                Utils.emitEvent(response.getNetErrorCode(), 6603)
              } catch (error) {
                error = error as BusinessError ;
                console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
              }
              break;
            }
            case "WebNetErrorList_Static_0500": {
              let response = new web_webview.WebSchemeHandlerResponse();
              try {
                response.setNetErrorCode(WebNetErrorList.ERR_INVALID_ARGUMENT)
                console.log("[schemeHandler] getNetErrorCode:" + response.getNetErrorCode())
                Utils.emitEvent(response.getNetErrorCode(), 6604)
              } catch (error) {
                error = error as BusinessError ;
                console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
              }
              break;
            }
            case "WebNetErrorList_Static_0600": {
              let response = new web_webview.WebSchemeHandlerResponse();
              try {
                response.setNetErrorCode(WebNetErrorList.ERR_INVALID_HANDLE)
                console.log("[schemeHandler] getNetErrorCode:" + response.getNetErrorCode())
                Utils.emitEvent(response.getNetErrorCode(), 6605)
              } catch (error) {
                error = error as BusinessError ;
                console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
              }
              break;
            }
            case "WebNetErrorList_Static_0700": {
              let response = new web_webview.WebSchemeHandlerResponse();
              try {
                response.setNetErrorCode(WebNetErrorList.ERR_FILE_NOT_FOUND)
                console.log("[schemeHandler] getNetErrorCode:" + response.getNetErrorCode())
                Utils.emitEvent(response.getNetErrorCode(), 6606)
              } catch (error) {
                error = error as BusinessError ;
                console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
              }
              break;
            }
            case "WebNetErrorList_Static_0800": {
              let response = new web_webview.WebSchemeHandlerResponse();
              try {
                response.setNetErrorCode(WebNetErrorList.ERR_TIMED_OUT)
                console.log("[schemeHandler] getNetErrorCode:" + response.getNetErrorCode())
                Utils.emitEvent(response.getNetErrorCode(), 6607)
              } catch (error) {
                error = error as BusinessError ;
                console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
              }
              break;
            }
            case "WebNetErrorList_Static_0900": {
              let response = new web_webview.WebSchemeHandlerResponse();
              try {
                response.setNetErrorCode(WebNetErrorList.ERR_FILE_TOO_LARGE)
                console.log("[schemeHandler] getNetErrorCode:" + response.getNetErrorCode())
                Utils.emitEvent(response.getNetErrorCode(), 6608)
              } catch (error) {
                error = error as BusinessError ;
                console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
              }
              break;
            }
            case "WebNetErrorList_Static_01000": {
              let response = new web_webview.WebSchemeHandlerResponse();
              try {
                response.setNetErrorCode(WebNetErrorList.ERR_UNEXPECTED)
                console.log("[schemeHandler] getNetErrorCode:" + response.getNetErrorCode())
                Utils.emitEvent(response.getNetErrorCode(), 6609)
              } catch (error) {
                error = error as BusinessError ;
                console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
              }
              break;
            }
            case "WebNetErrorList_Static_01100": {
              let response = new web_webview.WebSchemeHandlerResponse();
              try {
                response.setNetErrorCode(WebNetErrorList.ERR_ACCESS_DENIED)
                console.log("[schemeHandler] getNetErrorCode:" + response.getNetErrorCode())
                Utils.emitEvent(response.getNetErrorCode(), 6610)
              } catch (error) {
                error = error as BusinessError ;
                console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
              }
              break;
            }
            case "WebNetErrorList_Static_01200": {
              let response = new web_webview.WebSchemeHandlerResponse();
              try {
                response.setNetErrorCode(WebNetErrorList.ERR_NOT_IMPLEMENTED)
                console.log("[schemeHandler] getNetErrorCode:" + response.getNetErrorCode())
                Utils.emitEvent(response.getNetErrorCode(), 6611)
              } catch (error) {
                error = error as BusinessError ;
                console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
              }
              break;
            }
            case "WebNetErrorList_Static_01300": {
              let response = new web_webview.WebSchemeHandlerResponse();
              try {
                response.setNetErrorCode(WebNetErrorList.ERR_INSUFFICIENT_RESOURCES)
                console.log("[schemeHandler] getNetErrorCode:" + response.getNetErrorCode())
                Utils.emitEvent(response.getNetErrorCode(), 6612)
              } catch (error) {
                error = error as BusinessError ;
                console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
              }
              break;
            }
            case "WebNetErrorList_Static_01400": {
              let response = new web_webview.WebSchemeHandlerResponse();
              try {
                response.setNetErrorCode(WebNetErrorList.ERR_OUT_OF_MEMORY)
                console.log("[schemeHandler] getNetErrorCode:" + response.getNetErrorCode())
                Utils.emitEvent(response.getNetErrorCode(), 6613)
              } catch (error) {
                error = error as BusinessError ;
                console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
              }
              break;
            }
            case "WebNetErrorList_Static_01500": {
              let response = new web_webview.WebSchemeHandlerResponse();
              try {
                response.setNetErrorCode(WebNetErrorList.ERR_UPLOAD_FILE_CHANGED)
                console.log("[schemeHandler] getNetErrorCode:" + response.getNetErrorCode())
                Utils.emitEvent(response.getNetErrorCode(), 6614)
              } catch (error) {
                error = error as BusinessError ;
                console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
              }
              break;
            }
            case "WebNetErrorList_Static_01600": {
              let response = new web_webview.WebSchemeHandlerResponse();
              try {
                response.setNetErrorCode(WebNetErrorList.ERR_SOCKET_NOT_CONNECTED)
                console.log("[schemeHandler] getNetErrorCode:" + response.getNetErrorCode())
                Utils.emitEvent(response.getNetErrorCode(), 6615)
              } catch (error) {
                error = error as BusinessError ;
                console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
              }
              break;
            }
            case "WebNetErrorList_Static_01700": {
              let response = new web_webview.WebSchemeHandlerResponse();
              try {
                response.setNetErrorCode(WebNetErrorList.ERR_FILE_EXISTS)
                console.log("[schemeHandler] getNetErrorCode:" + response.getNetErrorCode())
                Utils.emitEvent(response.getNetErrorCode(), 6616)
              } catch (error) {
                error = error as BusinessError ;
                console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
              }
              break;
            }
            case "WebNetErrorList_Static_01800": {
              let response = new web_webview.WebSchemeHandlerResponse();
              try {
                response.setNetErrorCode(WebNetErrorList.ERR_FILE_PATH_TOO_LONG)
                console.log("[schemeHandler] getNetErrorCode:" + response.getNetErrorCode())
                Utils.emitEvent(response.getNetErrorCode(), 6617)
              } catch (error) {
                error = error as BusinessError ;
                console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
              }
              break;
            }
            case "WebNetErrorList_Static_01900": {
              let response = new web_webview.WebSchemeHandlerResponse();
              try {
                response.setNetErrorCode(WebNetErrorList.ERR_FILE_NO_SPACE)
                console.log("[schemeHandler] getNetErrorCode:" + response.getNetErrorCode())
                Utils.emitEvent(response.getNetErrorCode(), 6618)
              } catch (error) {
                error = error as BusinessError ;
                console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
              }
              break;
            }
            case "WebNetErrorList_Static_02000": {
              let response = new web_webview.WebSchemeHandlerResponse();
              try {
                response.setNetErrorCode(WebNetErrorList.ERR_FILE_VIRUS_INFECTED)
                console.log("[schemeHandler] getNetErrorCode:" + response.getNetErrorCode())
                Utils.emitEvent(response.getNetErrorCode(), 6619)
              } catch (error) {
                error = error as BusinessError ;
                console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
              }
              break;
            }
            case "WebNetErrorList_Static_02100": {
              let response = new web_webview.WebSchemeHandlerResponse();
              try {
                response.setNetErrorCode(WebNetErrorList.ERR_BLOCKED_BY_CLIENT)
                console.log("[schemeHandler] getNetErrorCode:" + response.getNetErrorCode())
                Utils.emitEvent(response.getNetErrorCode(), 6620)
              } catch (error) {
                error = error as BusinessError ;
                console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
              }
              break;
            }
            case "WebNetErrorList_Static_02200": {
              let response = new web_webview.WebSchemeHandlerResponse();
              try {
                response.setNetErrorCode(WebNetErrorList.ERR_NETWORK_CHANGED)
                console.log("[schemeHandler] getNetErrorCode:" + response.getNetErrorCode())
                Utils.emitEvent(response.getNetErrorCode(), 6621)
              } catch (error) {
                error = error as BusinessError ;
                console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
              }
              break;
            }
            case "WebNetErrorList_Static_02300": {
              let response = new web_webview.WebSchemeHandlerResponse();
              try {
                response.setNetErrorCode(WebNetErrorList.ERR_BLOCKED_BY_ADMINISTRATOR)
                console.log("[schemeHandler] getNetErrorCode:" + response.getNetErrorCode())
                Utils.emitEvent(response.getNetErrorCode(), 6622)
              } catch (error) {
                error = error as BusinessError ;
                console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
              }
              break;
            }
            case "WebNetErrorList_Static_02400": {
              let response = new web_webview.WebSchemeHandlerResponse();
              try {
                response.setNetErrorCode(WebNetErrorList.ERR_SOCKET_CONNECTED)
                console.log("[schemeHandler] getNetErrorCode:" + response.getNetErrorCode())
                Utils.emitEvent(response.getNetErrorCode(), 6623)
              } catch (error) {
                error = error as BusinessError ;
                console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
              }
              break;
            }
            case "WebNetErrorList_Static_02500": {
              let response = new web_webview.WebSchemeHandlerResponse();
              try {
                response.setNetErrorCode(WebNetErrorList.ERR_UPLOAD_STREAM_REWIND_NOT_SUPPORTED)
                console.log("[schemeHandler] getNetErrorCode:" + response.getNetErrorCode())
                Utils.emitEvent(response.getNetErrorCode(), 6624)
              } catch (error) {
                error = error as BusinessError ;
                console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
              }
              break;
            }
            case "WebNetErrorList_Static_02600": {
              let response = new web_webview.WebSchemeHandlerResponse();
              try {
                response.setNetErrorCode(WebNetErrorList.ERR_CONTEXT_SHUT_DOWN)
                console.log("[schemeHandler] getNetErrorCode:" + response.getNetErrorCode())
                Utils.emitEvent(response.getNetErrorCode(), 6625)
              } catch (error) {
                error = error as BusinessError ;
                console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
              }
              break;
            }
            case "WebNetErrorList_Static_02700": {
              let response = new web_webview.WebSchemeHandlerResponse();
              try {
                response.setNetErrorCode(WebNetErrorList.ERR_BLOCKED_BY_RESPONSE)
                console.log("[schemeHandler] getNetErrorCode:" + response.getNetErrorCode())
                Utils.emitEvent(response.getNetErrorCode(), 6626)
              } catch (error) {
                error = error as BusinessError ;
                console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
              }
              break;
            }
            case "WebNetErrorList_Static_02800": {
              let response = new web_webview.WebSchemeHandlerResponse();
              try {
                response.setNetErrorCode(WebNetErrorList.ERR_CLEARTEXT_NOT_PERMITTED)
                console.log("[schemeHandler] getNetErrorCode:" + response.getNetErrorCode())
                Utils.emitEvent(response.getNetErrorCode(), 6627)
              } catch (error) {
                error = error as BusinessError ;
                console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
              }
              break;
            }
            case "WebNetErrorList_Static_02900": {
              let response = new web_webview.WebSchemeHandlerResponse();
              try {
                response.setNetErrorCode(WebNetErrorList.ERR_BLOCKED_BY_CSP)
                console.log("[schemeHandler] getNetErrorCode:" + response.getNetErrorCode())
                Utils.emitEvent(response.getNetErrorCode(), 6628)
              } catch (error) {
                error = error as BusinessError ;
                console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
              }
              break;
            }
            case "WebNetErrorList_Static_03000": {
              let response = new web_webview.WebSchemeHandlerResponse();
              try {
                response.setNetErrorCode(WebNetErrorList.ERR_H2_OR_QUIC_REQUIRED)
                console.log("[schemeHandler] getNetErrorCode:" + response.getNetErrorCode())
                Utils.emitEvent(response.getNetErrorCode(), 6629)
              } catch (error) {
                error = error as BusinessError ;
                console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
              }
              break;
            }
            case "WebNetErrorList_Static_03100": {
              let response = new web_webview.WebSchemeHandlerResponse();
              try {
                response.setNetErrorCode(WebNetErrorList.ERR_BLOCKED_BY_ORB)
                console.log("[schemeHandler] getNetErrorCode:" + response.getNetErrorCode())
                Utils.emitEvent(response.getNetErrorCode(), 6630)
              } catch (error) {
                error = error as BusinessError ;
                console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
              }
              break;
            }
            case "WebNetErrorList_Static_03200": {
              let response = new web_webview.WebSchemeHandlerResponse();
              try {
                response.setNetErrorCode(WebNetErrorList.ERR_CONNECTION_CLOSED)
                console.log("[schemeHandler] getNetErrorCode:" + response.getNetErrorCode())
                Utils.emitEvent(response.getNetErrorCode(), 6631)
              } catch (error) {
                error = error as BusinessError ;
                console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
              }
              break;
            }
            case "WebNetErrorList_Static_03300": {
              let response = new web_webview.WebSchemeHandlerResponse();
              try {
                response.setNetErrorCode(WebNetErrorList.ERR_CONNECTION_RESET)
                console.log("[schemeHandler] getNetErrorCode:" + response.getNetErrorCode())
                Utils.emitEvent(response.getNetErrorCode(), 6632)
              } catch (error) {
                error = error as BusinessError ;
                console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
              }
              break;
            }
            case "WebNetErrorList_Static_03400": {
              let response = new web_webview.WebSchemeHandlerResponse();
              try {
                response.setNetErrorCode(WebNetErrorList.ERR_CONNECTION_REFUSED)
                console.log("[schemeHandler] getNetErrorCode:" + response.getNetErrorCode())
                Utils.emitEvent(response.getNetErrorCode(), 6633)
              } catch (error) {
                error = error as BusinessError ;
                console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
              }
              break;
            }
            case "WebNetErrorList_Static_03500": {
              let response = new web_webview.WebSchemeHandlerResponse();
              try {
                response.setNetErrorCode(WebNetErrorList.ERR_CONNECTION_ABORTED)
                console.log("[schemeHandler] getNetErrorCode:" + response.getNetErrorCode())
                Utils.emitEvent(response.getNetErrorCode(), 6634)
              } catch (error) {
                error = error as BusinessError ;
                console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
              }
              break;
            }
            case "WebNetErrorList_Static_03600": {
              let response = new web_webview.WebSchemeHandlerResponse();
              try {
                response.setNetErrorCode(WebNetErrorList.ERR_CONNECTION_FAILED)
                console.log("[schemeHandler] getNetErrorCode:" + response.getNetErrorCode())
                Utils.emitEvent(response.getNetErrorCode(), 6635)
              } catch (error) {
                error = error as BusinessError ;
                console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
              }
              break;
            }
            case "WebNetErrorList_Static_03700": {
              let response = new web_webview.WebSchemeHandlerResponse();
              try {
                response.setNetErrorCode(WebNetErrorList.ERR_NAME_NOT_RESOLVED)
                console.log("[schemeHandler] getNetErrorCode:" + response.getNetErrorCode())
                Utils.emitEvent(response.getNetErrorCode(), 6636)
              } catch (error) {
                error = error as BusinessError ;
                console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
              }
              break;
            }
            case "WebNetErrorList_Static_03800": {
              let response = new web_webview.WebSchemeHandlerResponse();
              try {
                response.setNetErrorCode(WebNetErrorList.ERR_INTERNET_DISCONNECTED)
                console.log("[schemeHandler] getNetErrorCode:" + response.getNetErrorCode())
                Utils.emitEvent(response.getNetErrorCode(), 6637)
              } catch (error) {
                error = error as BusinessError ;
                console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
              }
              break;
            }
            case "WebNetErrorList_Static_03900": {
              let response = new web_webview.WebSchemeHandlerResponse();
              try {
                response.setNetErrorCode(WebNetErrorList.ERR_SSL_PROTOCOL_ERROR)
                console.log("[schemeHandler] getNetErrorCode:" + response.getNetErrorCode())
                Utils.emitEvent(response.getNetErrorCode(), 6638)
              } catch (error) {
                error = error as BusinessError ;
                console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
              }
              break;
            }
            case "WebNetErrorList_Static_04000": {
              let response = new web_webview.WebSchemeHandlerResponse();
              try {
                response.setNetErrorCode(WebNetErrorList.ERR_ADDRESS_INVALID)
                console.log("[schemeHandler] getNetErrorCode:" + response.getNetErrorCode())
                Utils.emitEvent(response.getNetErrorCode(), 6639)
              } catch (error) {
                error = error as BusinessError ;
                console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
              }
              break;
            }
            case "WebNetErrorList_Static_04100": {
              let response = new web_webview.WebSchemeHandlerResponse();
              try {
                response.setNetErrorCode(WebNetErrorList.ERR_ADDRESS_UNREACHABLE)
                console.log("[schemeHandler] getNetErrorCode:" + response.getNetErrorCode())
                Utils.emitEvent(response.getNetErrorCode(), 6640)
              } catch (error) {
                error = error as BusinessError ;
                console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
              }
              break;
            }
            case "WebNetErrorList_Static_04200": {
              let response = new web_webview.WebSchemeHandlerResponse();
              try {
                response.setNetErrorCode(WebNetErrorList.ERR_SSL_CLIENT_AUTH_CERT_NEEDED)
                console.log("[schemeHandler] getNetErrorCode:" + response.getNetErrorCode())
                Utils.emitEvent(response.getNetErrorCode(), 6641)
              } catch (error) {
                error = error as BusinessError ;
                console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
              }
              break;
            }
            case "WebNetErrorList_Static_04300": {
              let response = new web_webview.WebSchemeHandlerResponse();
              try {
                response.setNetErrorCode(WebNetErrorList.ERR_TUNNEL_CONNECTION_FAILED)
                console.log("[schemeHandler] getNetErrorCode:" + response.getNetErrorCode())
                Utils.emitEvent(response.getNetErrorCode(), 6642)
              } catch (error) {
                error = error as BusinessError ;
                console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
              }
              break;
            }
            case "WebNetErrorList_Static_04400": {
              let response = new web_webview.WebSchemeHandlerResponse();
              try {
                response.setNetErrorCode(WebNetErrorList.ERR_NO_SSL_VERSIONS_ENABLED)
                console.log("[schemeHandler] getNetErrorCode:" + response.getNetErrorCode())
                Utils.emitEvent(response.getNetErrorCode(), 6643)
              } catch (error) {
                error = error as BusinessError ;
                console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
              }
              break;
            }
            case "WebNetErrorList_Static_04500": {
              let response = new web_webview.WebSchemeHandlerResponse();
              try {
                response.setNetErrorCode(WebNetErrorList.ERR_SSL_VERSION_OR_CIPHER_MISMATCH)
                console.log("[schemeHandler] getNetErrorCode:" + response.getNetErrorCode())
                Utils.emitEvent(response.getNetErrorCode(), 6644)
              } catch (error) {
                error = error as BusinessError ;
                console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
              }
              break;
            }
            case "WebNetErrorList_Static_04600": {
              let response = new web_webview.WebSchemeHandlerResponse();
              try {
                response.setNetErrorCode(WebNetErrorList.ERR_SSL_RENEGOTIATION_REQUESTED)
                console.log("[schemeHandler] getNetErrorCode:" + response.getNetErrorCode())
                Utils.emitEvent(response.getNetErrorCode(), 6645)
              } catch (error) {
                error = error as BusinessError ;
                console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
              }
              break;
            }
            case "WebNetErrorList_Static_04700": {
              let response = new web_webview.WebSchemeHandlerResponse();
              try {
                response.setNetErrorCode(WebNetErrorList.ERR_PROXY_AUTH_UNSUPPORTED)
                console.log("[schemeHandler] getNetErrorCode:" + response.getNetErrorCode())
                Utils.emitEvent(response.getNetErrorCode(), 6646)
              } catch (error) {
                error = error as BusinessError ;
                console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
              }
              break;
            }
            case "WebNetErrorList_Static_04800": {
              let response = new web_webview.WebSchemeHandlerResponse();
              try {
                response.setNetErrorCode(WebNetErrorList.ERR_BAD_SSL_CLIENT_AUTH_CERT)
                console.log("[schemeHandler] getNetErrorCode:" + response.getNetErrorCode())
                Utils.emitEvent(response.getNetErrorCode(), 6647)
              } catch (error) {
                error = error as BusinessError ;
                console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
              }
              break;
            }
            case "WebNetErrorList_Static_04900": {
              let response = new web_webview.WebSchemeHandlerResponse();
              try {
                response.setNetErrorCode(WebNetErrorList.ERR_CONNECTION_TIMED_OUT)
                console.log("[schemeHandler] getNetErrorCode:" + response.getNetErrorCode())
                Utils.emitEvent(response.getNetErrorCode(), 6648)
              } catch (error) {
                error = error as BusinessError ;
                console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
              }
              break;
            }
            case "WebNetErrorList_Static_05000": {
              let response = new web_webview.WebSchemeHandlerResponse();
              try {
                response.setNetErrorCode(WebNetErrorList.ERR_HOST_RESOLVER_QUEUE_TOO_LARGE)
                console.log("[schemeHandler] getNetErrorCode:" + response.getNetErrorCode())
                Utils.emitEvent(response.getNetErrorCode(), 6649)
              } catch (error) {
                error = error as BusinessError ;
                console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
              }
              break;
            }
            case "WebNetErrorList_Static_05100": {
              let response = new web_webview.WebSchemeHandlerResponse();
              try {
                response.setNetErrorCode(WebNetErrorList.ERR_SOCKS_CONNECTION_FAILED)
                console.log("[schemeHandler] getNetErrorCode:" + response.getNetErrorCode())
                Utils.emitEvent(response.getNetErrorCode(), 6650)
              } catch (error) {
                error = error as BusinessError ;
                console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
              }
              break;
            }
            case "WebNetErrorList_Static_05200": {
              let response = new web_webview.WebSchemeHandlerResponse();
              try {
                response.setNetErrorCode(WebNetErrorList.ERR_SOCKS_CONNECTION_HOST_UNREACHABLE)
                console.log("[schemeHandler] getNetErrorCode:" + response.getNetErrorCode())
                Utils.emitEvent(response.getNetErrorCode(), 6651)
              } catch (error) {
                error = error as BusinessError ;
                console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
              }
              break;
            }
            case "WebNetErrorList_Static_05300": {
              let response = new web_webview.WebSchemeHandlerResponse();
              try {
                response.setNetErrorCode(WebNetErrorList.ERR_ALPN_NEGOTIATION_FAILED)
                console.log("[schemeHandler] getNetErrorCode:" + response.getNetErrorCode())
                Utils.emitEvent(response.getNetErrorCode(), 6652)
              } catch (error) {
                error = error as BusinessError ;
                console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
              }
              break;
            }
            case "WebNetErrorList_Static_05400": {
              let response = new web_webview.WebSchemeHandlerResponse();
              try {
                response.setNetErrorCode(WebNetErrorList.ERR_SSL_NO_RENEGOTIATION)
                console.log("[schemeHandler] getNetErrorCode:" + response.getNetErrorCode())
                Utils.emitEvent(response.getNetErrorCode(), 6653)
              } catch (error) {
                error = error as BusinessError ;
                console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
              }
              break;
            }
            case "WebNetErrorList_Static_05500": {
              let response = new web_webview.WebSchemeHandlerResponse();
              try {
                response.setNetErrorCode(WebNetErrorList.ERR_WINSOCK_UNEXPECTED_WRITTEN_BYTES)
                console.log("[schemeHandler] getNetErrorCode:" + response.getNetErrorCode())
                Utils.emitEvent(response.getNetErrorCode(), 6654)
              } catch (error) {
                error = error as BusinessError ;
                console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
              }
              break;
            }
            case "WebNetErrorList_Static_05600": {
              let response = new web_webview.WebSchemeHandlerResponse();
              try {
                response.setNetErrorCode(WebNetErrorList.ERR_SSL_DECOMPRESSION_FAILURE_ALERT)
                console.log("[schemeHandler] getNetErrorCode:" + response.getNetErrorCode())
                Utils.emitEvent(response.getNetErrorCode(), 6655)
              } catch (error) {
                error = error as BusinessError ;
                console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
              }
              break;
            }
            case "WebNetErrorList_Static_05700": {
              let response = new web_webview.WebSchemeHandlerResponse();
              try {
                response.setNetErrorCode(WebNetErrorList.ERR_SSL_BAD_RECORD_MAC_ALERT)
                console.log("[schemeHandler] getNetErrorCode:" + response.getNetErrorCode())
                Utils.emitEvent(response.getNetErrorCode(), 6656)
              } catch (error) {
                error = error as BusinessError ;
                console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
              }
              break;
            }
            case "WebNetErrorList_Static_05800": {
              let response = new web_webview.WebSchemeHandlerResponse();
              try {
                response.setNetErrorCode(WebNetErrorList.ERR_PROXY_AUTH_REQUESTED)
                console.log("[schemeHandler] getNetErrorCode:" + response.getNetErrorCode())
                Utils.emitEvent(response.getNetErrorCode(), 6657)
              } catch (error) {
                error = error as BusinessError ;
                console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
              }
              break;
            }
            case "WebNetErrorList_Static_05900": {
              let response = new web_webview.WebSchemeHandlerResponse();
              try {
                response.setNetErrorCode(WebNetErrorList.ERR_PROXY_CONNECTION_FAILED)
                console.log("[schemeHandler] getNetErrorCode:" + response.getNetErrorCode())
                Utils.emitEvent(response.getNetErrorCode(), 6658)
              } catch (error) {
                error = error as BusinessError ;
                console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
              }
              break;
            }
            case "WebNetErrorList_Static_06000": {
              let response = new web_webview.WebSchemeHandlerResponse();
              try {
                response.setNetErrorCode(WebNetErrorList.ERR_MANDATORY_PROXY_CONFIGURATION_FAILED)
                console.log("[schemeHandler] getNetErrorCode:" + response.getNetErrorCode())
                Utils.emitEvent(response.getNetErrorCode(), 6659)
              } catch (error) {
                error = error as BusinessError ;
                console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
              }
              break;
            }
            case "WebNetErrorList_Static_06100": {
              let response = new web_webview.WebSchemeHandlerResponse();
              try {
                response.setNetErrorCode(WebNetErrorList.ERR_PRECONNECT_MAX_SOCKET_LIMIT)
                console.log("[schemeHandler] getNetErrorCode:" + response.getNetErrorCode())
                Utils.emitEvent(response.getNetErrorCode(), 6660)
              } catch (error) {
                error = error as BusinessError ;
                console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
              }
              break;
            }
            case "WebNetErrorList_Static_06200": {
              let response = new web_webview.WebSchemeHandlerResponse();
              try {
                response.setNetErrorCode(WebNetErrorList.ERR_SSL_CLIENT_AUTH_PRIVATE_KEY_ACCESS_DENIED)
                console.log("[schemeHandler] getNetErrorCode:" + response.getNetErrorCode())
                Utils.emitEvent(response.getNetErrorCode(), 6661)
              } catch (error) {
                error = error as BusinessError ;
                console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
              }
              break;
            }
            case "WebNetErrorList_Static_06300": {
              let response = new web_webview.WebSchemeHandlerResponse();
              try {
                response.setNetErrorCode(WebNetErrorList.ERR_SSL_CLIENT_AUTH_CERT_NO_PRIVATE_KEY)
                console.log("[schemeHandler] getNetErrorCode:" + response.getNetErrorCode())
                Utils.emitEvent(response.getNetErrorCode(), 6662)
              } catch (error) {
                error = error as BusinessError ;
                console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
              }
              break;
            }
            case "WebNetErrorList_Static_06400": {
              let response = new web_webview.WebSchemeHandlerResponse();
              try {
                response.setNetErrorCode(WebNetErrorList.ERR_PROXY_CERTIFICATE_INVALID)
                console.log("[schemeHandler] getNetErrorCode:" + response.getNetErrorCode())
                Utils.emitEvent(response.getNetErrorCode(), 6663)
              } catch (error) {
                error = error as BusinessError ;
                console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
              }
              break;
            }
            case "WebNetErrorList_Static_06500": {
              let response = new web_webview.WebSchemeHandlerResponse();
              try {
                response.setNetErrorCode(WebNetErrorList.ERR_NAME_RESOLUTION_FAILED)
                console.log("[schemeHandler] getNetErrorCode:" + response.getNetErrorCode())
                Utils.emitEvent(response.getNetErrorCode(), 6664)
              } catch (error) {
                error = error as BusinessError ;
                console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
              }
              break;
            }
            case "WebNetErrorList_Static_06600": {
              let response = new web_webview.WebSchemeHandlerResponse();
              try {
                response.setNetErrorCode(WebNetErrorList.ERR_NETWORK_ACCESS_DENIED)
                console.log("[schemeHandler] getNetErrorCode:" + response.getNetErrorCode())
                Utils.emitEvent(response.getNetErrorCode(), 6665)
              } catch (error) {
                error = error as BusinessError ;
                console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
              }
              break;
            }
            case "WebNetErrorList_Static_06700": {
              let response = new web_webview.WebSchemeHandlerResponse();
              try {
                response.setNetErrorCode(WebNetErrorList.ERR_TEMPORARILY_THROTTLED)
                console.log("[schemeHandler] getNetErrorCode:" + response.getNetErrorCode())
                Utils.emitEvent(response.getNetErrorCode(), 6666)
              } catch (error) {
                error = error as BusinessError ;
                console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
              }
              break;
            }
            case "WebNetErrorList_Static_06800": {
              let response = new web_webview.WebSchemeHandlerResponse();
              try {
                response.setNetErrorCode(WebNetErrorList.ERR_HTTPS_PROXY_TUNNEL_RESPONSE_REDIRECT)
                console.log("[schemeHandler] getNetErrorCode:" + response.getNetErrorCode())
                Utils.emitEvent(response.getNetErrorCode(), 6668)
              } catch (error) {
                error = error as BusinessError ;
                console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
              }
              break;
            }
            case "WebNetErrorList_Static_06900": {
              let response = new web_webview.WebSchemeHandlerResponse();
              try {
                response.setNetErrorCode(WebNetErrorList.ERR_SSL_CLIENT_AUTH_SIGNATURE_FAILED)
                console.log("[schemeHandler] getNetErrorCode:" + response.getNetErrorCode())
                Utils.emitEvent(response.getNetErrorCode(), 6669)
              } catch (error) {
                error = error as BusinessError ;
                console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
              }
              break;
            }
            case "WebNetErrorList_Static_07000": {
              let response = new web_webview.WebSchemeHandlerResponse();
              try {
                response.setNetErrorCode(WebNetErrorList.ERR_MSG_TOO_BIG)
                console.log("[schemeHandler] getNetErrorCode:" + response.getNetErrorCode())
                Utils.emitEvent(response.getNetErrorCode(), 6670)
              } catch (error) {
                error = error as BusinessError ;
                console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
              }
              break;
            }
            case "WebNetErrorList_Static_07100": {
              let response = new web_webview.WebSchemeHandlerResponse();
              try {
                response.setNetErrorCode(WebNetErrorList.ERR_WS_PROTOCOL_ERROR)
                console.log("[schemeHandler] getNetErrorCode:" + response.getNetErrorCode())
                Utils.emitEvent(response.getNetErrorCode(), 6671)
              } catch (error) {
                error = error as BusinessError ;
                console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
              }
              break;
            }
            case "WebNetErrorList_Static_07200": {
              let response = new web_webview.WebSchemeHandlerResponse();
              try {
                response.setNetErrorCode(WebNetErrorList.ERR_ADDRESS_IN_USE)
                console.log("[schemeHandler] getNetErrorCode:" + response.getNetErrorCode())
                Utils.emitEvent(response.getNetErrorCode(), 6672)
              } catch (error) {
                error = error as BusinessError ;
                console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
              }
              break;
            }
            case "WebNetErrorList_Static_07300": {
              let response = new web_webview.WebSchemeHandlerResponse();
              try {
                response.setNetErrorCode(WebNetErrorList.ERR_SSL_HANDSHAKE_NOT_COMPLETED)
                console.log("[schemeHandler] getNetErrorCode:" + response.getNetErrorCode())
                Utils.emitEvent(response.getNetErrorCode(), 6673)
              } catch (error) {
                error = error as BusinessError ;
                console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
              }
              break;
            }
            case "WebNetErrorList_Static_07400": {
              let response = new web_webview.WebSchemeHandlerResponse();
              try {
                response.setNetErrorCode(WebNetErrorList.ERR_SSL_BAD_PEER_PUBLIC_KEY)
                console.log("[schemeHandler] getNetErrorCode:" + response.getNetErrorCode())
                Utils.emitEvent(response.getNetErrorCode(), 6674)
              } catch (error) {
                error = error as BusinessError ;
                console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
              }
              break;
            }
            case "WebNetErrorList_Static_07500": {
              let response = new web_webview.WebSchemeHandlerResponse();
              try {
                response.setNetErrorCode(WebNetErrorList.ERR_SSL_PINNED_KEY_NOT_IN_CERT_CHAIN)
                console.log("[schemeHandler] getNetErrorCode:" + response.getNetErrorCode())
                Utils.emitEvent(response.getNetErrorCode(), 6675)
              } catch (error) {
                error = error as BusinessError ;
                console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
              }
              break;
            }
            case "WebNetErrorList_Static_07600": {
              let response = new web_webview.WebSchemeHandlerResponse();
              try {
                response.setNetErrorCode(WebNetErrorList.ERR_CLIENT_AUTH_CERT_TYPE_UNSUPPORTED)
                console.log("[schemeHandler] getNetErrorCode:" + response.getNetErrorCode())
                Utils.emitEvent(response.getNetErrorCode(), 6676)
              } catch (error) {
                error = error as BusinessError ;
                console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
              }
              break;
            }
            case "WebNetErrorList_Static_07700": {
              let response = new web_webview.WebSchemeHandlerResponse();
              try {
                response.setNetErrorCode(WebNetErrorList.ERR_SSL_DECRYPT_ERROR_ALERT)
                console.log("[schemeHandler] getNetErrorCode:" + response.getNetErrorCode())
                Utils.emitEvent(response.getNetErrorCode(), 6677)
              } catch (error) {
                error = error as BusinessError ;
                console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
              }
              break;
            }
            case "WebNetErrorList_Static_07800": {
              let response = new web_webview.WebSchemeHandlerResponse();
              try {
                response.setNetErrorCode(WebNetErrorList.ERR_WS_THROTTLE_QUEUE_TOO_LARGE)
                console.log("[schemeHandler] getNetErrorCode:" + response.getNetErrorCode())
                Utils.emitEvent(response.getNetErrorCode(), 6678)
              } catch (error) {
                error = error as BusinessError ;
                console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
              }
              break;
            }
            case "WebNetErrorList_Static_07900": {
              let response = new web_webview.WebSchemeHandlerResponse();
              try {
                response.setNetErrorCode(WebNetErrorList.ERR_SSL_SERVER_CERT_CHANGED)
                console.log("[schemeHandler] getNetErrorCode:" + response.getNetErrorCode())
                Utils.emitEvent(response.getNetErrorCode(), 6679)
              } catch (error) {
                error = error as BusinessError ;
                console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
              }
              break;
            }
            case "WebNetErrorList_Static_08000": {
              let response = new web_webview.WebSchemeHandlerResponse();
              try {
                response.setNetErrorCode(WebNetErrorList.ERR_SSL_UNRECOGNIZED_NAME_ALERT)
                console.log("[schemeHandler] getNetErrorCode:" + response.getNetErrorCode())
                Utils.emitEvent(response.getNetErrorCode(), 6680)
              } catch (error) {
                error = error as BusinessError ;
                console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
              }
              break;
            }
            case "WebNetErrorList_Static_08100": {
              let response = new web_webview.WebSchemeHandlerResponse();
              try {
                response.setNetErrorCode(WebNetErrorList.ERR_SOCKET_SET_RECEIVE_BUFFER_SIZE_ERROR)
                console.log("[schemeHandler] getNetErrorCode:" + response.getNetErrorCode())
                Utils.emitEvent(response.getNetErrorCode(), 6681)
              } catch (error) {
                error = error as BusinessError ;
                console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
              }
              break;
            }
            case "WebNetErrorList_Static_08200": {
              let response = new web_webview.WebSchemeHandlerResponse();
              try {
                response.setNetErrorCode(WebNetErrorList.ERR_SOCKET_SET_SEND_BUFFER_SIZE_ERROR)
                console.log("[schemeHandler] getNetErrorCode:" + response.getNetErrorCode())
                Utils.emitEvent(response.getNetErrorCode(), 6682)
              } catch (error) {
                error = error as BusinessError ;
                console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
              }
              break;
            }
            case "WebNetErrorList_Static_08300": {
              let response = new web_webview.WebSchemeHandlerResponse();
              try {
                response.setNetErrorCode(WebNetErrorList.ERR_SOCKET_RECEIVE_BUFFER_SIZE_UNCHANGEABLE)
                console.log("[schemeHandler] getNetErrorCode:" + response.getNetErrorCode())
                Utils.emitEvent(response.getNetErrorCode(), 6683)
              } catch (error) {
                error = error as BusinessError ;
                console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
              }
              break;
            }
            case "WebNetErrorList_Static_08400": {
              let response = new web_webview.WebSchemeHandlerResponse();
              try {
                response.setNetErrorCode(WebNetErrorList.ERR_SOCKET_SEND_BUFFER_SIZE_UNCHANGEABLE)
                console.log("[schemeHandler] getNetErrorCode:" + response.getNetErrorCode())
                Utils.emitEvent(response.getNetErrorCode(), 6684)
              } catch (error) {
                error = error as BusinessError ;
                console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
              }
              break;
            }
            case "WebNetErrorList_Static_08500": {
              let response = new web_webview.WebSchemeHandlerResponse();
              try {
                response.setNetErrorCode(WebNetErrorList.ERR_SSL_CLIENT_AUTH_CERT_BAD_FORMAT)
                console.log("[schemeHandler] getNetErrorCode:" + response.getNetErrorCode())
                Utils.emitEvent(response.getNetErrorCode(), 6685)
              } catch (error) {
                error = error as BusinessError ;
                console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
              }
              break;
            }
            case "WebNetErrorList_Static_08600": {
              let response = new web_webview.WebSchemeHandlerResponse();
              try {
                response.setNetErrorCode(WebNetErrorList.ERR_ICANN_NAME_COLLISION)
                console.log("[schemeHandler] getNetErrorCode:" + response.getNetErrorCode())
                Utils.emitEvent(response.getNetErrorCode(), 6686)
              } catch (error) {
                error = error as BusinessError ;
                console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
              }
              break;
            }
            case "WebNetErrorList_Static_08700": {
              let response = new web_webview.WebSchemeHandlerResponse();
              try {
                response.setNetErrorCode(WebNetErrorList.ERR_SSL_SERVER_CERT_BAD_FORMAT)
                console.log("[schemeHandler] getNetErrorCode:" + response.getNetErrorCode())
                Utils.emitEvent(response.getNetErrorCode(), 6687)
              } catch (error) {
                error = error as BusinessError ;
                console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
              }
              break;
            }
            case "WebNetErrorList_Static_08800": {
              let response = new web_webview.WebSchemeHandlerResponse();
              try {
                response.setNetErrorCode(WebNetErrorList.ERR_CT_STH_PARSING_FAILED)
                console.log("[schemeHandler] getNetErrorCode:" + response.getNetErrorCode())
                Utils.emitEvent(response.getNetErrorCode(), 6688)
              } catch (error) {
                error = error as BusinessError ;
                console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
              }
              break;
            }
            case "WebNetErrorList_Static_08900": {
              let response = new web_webview.WebSchemeHandlerResponse();
              try {
                response.setNetErrorCode(WebNetErrorList.ERR_CT_STH_INCOMPLETE)
                console.log("[schemeHandler] getNetErrorCode:" + response.getNetErrorCode())
                Utils.emitEvent(response.getNetErrorCode(), 6689)
              } catch (error) {
                error = error as BusinessError ;
                console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
              }
              break;
            }
            case "WebNetErrorList_Static_09000": {
              let response = new web_webview.WebSchemeHandlerResponse();
              try {
                response.setNetErrorCode(WebNetErrorList.ERR_UNABLE_TO_REUSE_CONNECTION_FOR_PROXY_AUTH)
                console.log("[schemeHandler] getNetErrorCode:" + response.getNetErrorCode())
                Utils.emitEvent(response.getNetErrorCode(), 6690)
              } catch (error) {
                error = error as BusinessError ;
                console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
              }
              break;
            }
            case "WebNetErrorList_Static_09100": {
              let response = new web_webview.WebSchemeHandlerResponse();
              try {
                response.setNetErrorCode(WebNetErrorList.ERR_CT_CONSISTENCY_PROOF_PARSING_FAILED)
                console.log("[schemeHandler] getNetErrorCode:" + response.getNetErrorCode())
                Utils.emitEvent(response.getNetErrorCode(), 6691)
              } catch (error) {
                error = error as BusinessError ;
                console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
              }
              break;
            }
            case "WebNetErrorList_Static_09200": {
              let response = new web_webview.WebSchemeHandlerResponse();
              try {
                response.setNetErrorCode(WebNetErrorList.ERR_SSL_OBSOLETE_CIPHER)
                console.log("[schemeHandler] getNetErrorCode:" + response.getNetErrorCode())
                Utils.emitEvent(response.getNetErrorCode(), 6692)
              } catch (error) {
                error = error as BusinessError ;
                console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
              }
              break;
            }
            case "WebNetErrorList_Static_09300": {
              let response = new web_webview.WebSchemeHandlerResponse();
              try {
                response.setNetErrorCode(WebNetErrorList.ERR_WS_UPGRADE)
                console.log("[schemeHandler] getNetErrorCode:" + response.getNetErrorCode())
                Utils.emitEvent(response.getNetErrorCode(), 6693)
              } catch (error) {
                error = error as BusinessError ;
                console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
              }
              break;
            }
            case "WebNetErrorList_Static_09400": {
              let response = new web_webview.WebSchemeHandlerResponse();
              try {
                response.setNetErrorCode(WebNetErrorList.ERR_READ_IF_READY_NOT_IMPLEMENTED)
                console.log("[schemeHandler] getNetErrorCode:" + response.getNetErrorCode())
                Utils.emitEvent(response.getNetErrorCode(), 6694)
              } catch (error) {
                error = error as BusinessError ;
                console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
              }
              break;
            }
            case "WebNetErrorList_Static_09500": {
              let response = new web_webview.WebSchemeHandlerResponse();
              try {
                response.setNetErrorCode(WebNetErrorList.ERR_NO_BUFFER_SPACE)
                console.log("[schemeHandler] getNetErrorCode:" + response.getNetErrorCode())
                Utils.emitEvent(response.getNetErrorCode(), 6695)
              } catch (error) {
                error = error as BusinessError ;
                console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
              }
              break;
            }
            case "WebNetErrorList_Static_09600": {
              let response = new web_webview.WebSchemeHandlerResponse();
              try {
                response.setNetErrorCode(WebNetErrorList.ERR_SSL_CLIENT_AUTH_NO_COMMON_ALGORITHMS)
                console.log("[schemeHandler] getNetErrorCode:" + response.getNetErrorCode())
                Utils.emitEvent(response.getNetErrorCode(), 6696)
              } catch (error) {
                error = error as BusinessError ;
                console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
              }
              break;
            }
            case "WebNetErrorList_Static_09700": {
              let response = new web_webview.WebSchemeHandlerResponse();
              try {
                response.setNetErrorCode(WebNetErrorList.ERR_EARLY_DATA_REJECTED)
                console.log("[schemeHandler] getNetErrorCode:" + response.getNetErrorCode())
                Utils.emitEvent(response.getNetErrorCode(), 6697)
              } catch (error) {
                error = error as BusinessError ;
                console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
              }
              break;
            }
            case "WebNetErrorList_Static_09800": {
              let response = new web_webview.WebSchemeHandlerResponse();
              try {
                response.setNetErrorCode(WebNetErrorList.ERR_WRONG_VERSION_ON_EARLY_DATA)
                console.log("[schemeHandler] getNetErrorCode:" + response.getNetErrorCode())
                Utils.emitEvent(response.getNetErrorCode(), 6698)
              } catch (error) {
                error = error as BusinessError ;
                console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
              }
              break;
            }
            case "WebNetErrorList_Static_09900": {
              let response = new web_webview.WebSchemeHandlerResponse();
              try {
                response.setNetErrorCode(WebNetErrorList.ERR_TLS13_DOWNGRADE_DETECTED)
                console.log("[schemeHandler] getNetErrorCode:" + response.getNetErrorCode())
                Utils.emitEvent(response.getNetErrorCode(), 6699)
              } catch (error) {
                error = error as BusinessError ;
                console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
              }
              break;
            }
            case "WebNetErrorList_Static_010000": {
              let response = new web_webview.WebSchemeHandlerResponse();
              try {
                response.setNetErrorCode(WebNetErrorList.ERR_SSL_KEY_USAGE_INCOMPATIBLE)
                console.log("[schemeHandler] getNetErrorCode:" + response.getNetErrorCode())
                Utils.emitEvent(response.getNetErrorCode(), 6700)
              } catch (error) {
                error = error as BusinessError ;
                console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
              }
              break;
            }
            case "WebNetErrorList_Static_010100": {
              let response = new web_webview.WebSchemeHandlerResponse();
              try {
                response.setNetErrorCode(WebNetErrorList.ERR_INVALID_ECH_CONFIG_LIST)
                console.log("[schemeHandler] getNetErrorCode:" + response.getNetErrorCode())
                Utils.emitEvent(response.getNetErrorCode(), 6701)
              } catch (error) {
                error = error as BusinessError ;
                console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
              }
              break;
            }
            case "WebNetErrorList_Static_010200": {
              let response = new web_webview.WebSchemeHandlerResponse();
              try {
                response.setNetErrorCode(WebNetErrorList.ERR_ECH_NOT_NEGOTIATED)
                console.log("[schemeHandler] getNetErrorCode:" + response.getNetErrorCode())
                Utils.emitEvent(response.getNetErrorCode(), 6702)
              } catch (error) {
                error = error as BusinessError ;
                console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
              }
              break;
            }
            case "WebNetErrorList_Static_010300": {
              let response = new web_webview.WebSchemeHandlerResponse();
              try {
                response.setNetErrorCode(WebNetErrorList.ERR_ECH_FALLBACK_CERTIFICATE_INVALID)
                console.log("[schemeHandler] getNetErrorCode:" + response.getNetErrorCode())
                Utils.emitEvent(response.getNetErrorCode(), 6703)
              } catch (error) {
                error = error as BusinessError ;
                console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
              }
              break;
            }
            case "WebNetErrorList_Static_010400": {
              let response = new web_webview.WebSchemeHandlerResponse();
              try {
                response.setNetErrorCode(WebNetErrorList.ERR_CERT_COMMON_NAME_INVALID)
                console.log("[schemeHandler] getNetErrorCode:" + response.getNetErrorCode())
                Utils.emitEvent(response.getNetErrorCode(), 6704)
              } catch (error) {
                error = error as BusinessError ;
                console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
              }
              break;
            }
            case "WebNetErrorList_Static_010500": {
              let response = new web_webview.WebSchemeHandlerResponse();
              try {
                response.setNetErrorCode(WebNetErrorList.ERR_CERT_DATE_INVALID)
                console.log("[schemeHandler] getNetErrorCode:" + response.getNetErrorCode())
                Utils.emitEvent(response.getNetErrorCode(), 6705)
              } catch (error) {
                error = error as BusinessError ;
                console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
              }
              break;
            }
            case "WebNetErrorList_Static_010600": {
              let response = new web_webview.WebSchemeHandlerResponse();
              try {
                response.setNetErrorCode(WebNetErrorList.ERR_CERT_AUTHORITY_INVALID)
                console.log("[schemeHandler] getNetErrorCode:" + response.getNetErrorCode())
                Utils.emitEvent(response.getNetErrorCode(), 6706)
              } catch (error) {
                error = error as BusinessError ;
                console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
              }
              break;
            }
            case "WebNetErrorList_Static_010700": {
              let response = new web_webview.WebSchemeHandlerResponse();
              try {
                response.setNetErrorCode(WebNetErrorList.ERR_CERT_CONTAINS_ERRORS)
                console.log("[schemeHandler] getNetErrorCode:" + response.getNetErrorCode())
                Utils.emitEvent(response.getNetErrorCode(), 6707)
              } catch (error) {
                error = error as BusinessError ;
                console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
              }
              break;
            }
            case "WebNetErrorList_Static_010800": {
              let response = new web_webview.WebSchemeHandlerResponse();
              try {
                response.setNetErrorCode(WebNetErrorList.ERR_CERT_NO_REVOCATION_MECHANISM)
                console.log("[schemeHandler] getNetErrorCode:" + response.getNetErrorCode())
                Utils.emitEvent(response.getNetErrorCode(), 6708)
              } catch (error) {
                error = error as BusinessError ;
                console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
              }
              break;
            }
            case "WebNetErrorList_Static_010900": {
              let response = new web_webview.WebSchemeHandlerResponse();
              try {
                response.setNetErrorCode(WebNetErrorList.ERR_CERT_UNABLE_TO_CHECK_REVOCATION)
                console.log("[schemeHandler] getNetErrorCode:" + response.getNetErrorCode())
                Utils.emitEvent(response.getNetErrorCode(), 6709)
              } catch (error) {
                error = error as BusinessError ;
                console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
              }
              break;
            }
            case "WebNetErrorList_Static_011000": {
              let response = new web_webview.WebSchemeHandlerResponse();
              try {
                response.setNetErrorCode(WebNetErrorList.ERR_CERT_REVOKED)
                console.log("[schemeHandler] getNetErrorCode:" + response.getNetErrorCode())
                Utils.emitEvent(response.getNetErrorCode(), 6710)
              } catch (error) {
                error = error as BusinessError ;
                console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
              }
              break;
            }
            case "WebNetErrorList_Static_011100": {
              let response = new web_webview.WebSchemeHandlerResponse();
              try {
                response.setNetErrorCode(WebNetErrorList.ERR_CERT_INVALID)
                console.log("[schemeHandler] getNetErrorCode:" + response.getNetErrorCode())
                Utils.emitEvent(response.getNetErrorCode(), 6711)
              } catch (error) {
                error = error as BusinessError ;
                console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
              }
              break;
            }
            case "WebNetErrorList_Static_011200": {
              let response = new web_webview.WebSchemeHandlerResponse();
              try {
                response.setNetErrorCode(WebNetErrorList.ERR_CERT_WEAK_SIGNATURE_ALGORITHM)
                console.log("[schemeHandler] getNetErrorCode:" + response.getNetErrorCode())
                Utils.emitEvent(response.getNetErrorCode(), 6712)
              } catch (error) {
                error = error as BusinessError ;
                console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
              }
              break;
            }
            case "WebNetErrorList_Static_011300": {
              let response = new web_webview.WebSchemeHandlerResponse();
              try {
                response.setNetErrorCode(WebNetErrorList.ERR_CERT_NON_UNIQUE_NAME)
                console.log("[schemeHandler] getNetErrorCode:" + response.getNetErrorCode())
                Utils.emitEvent(response.getNetErrorCode(), 6713)
              } catch (error) {
                error = error as BusinessError ;
                console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
              }
              break;
            }
            case "WebNetErrorList_Static_011400": {
              let response = new web_webview.WebSchemeHandlerResponse();
              try {
                response.setNetErrorCode(WebNetErrorList.ERR_CERT_WEAK_KEY)
                console.log("[schemeHandler] getNetErrorCode:" + response.getNetErrorCode())
                Utils.emitEvent(response.getNetErrorCode(), 6714)
              } catch (error) {
                error = error as BusinessError ;
                console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
              }
              break;
            }
            case "WebNetErrorList_Static_011500": {
              let response = new web_webview.WebSchemeHandlerResponse();
              try {
                response.setNetErrorCode(WebNetErrorList.ERR_CERT_NAME_CONSTRAINT_VIOLATION)
                console.log("[schemeHandler] getNetErrorCode:" + response.getNetErrorCode())
                Utils.emitEvent(response.getNetErrorCode(), 6715)
              } catch (error) {
                error = error as BusinessError ;
                console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
              }
              break;
            }
            case "WebNetErrorList_Static_011600": {
              let response = new web_webview.WebSchemeHandlerResponse();
              try {
                response.setNetErrorCode(WebNetErrorList.ERR_CERT_VALIDITY_TOO_LONG)
                console.log("[schemeHandler] getNetErrorCode:" + response.getNetErrorCode())
                Utils.emitEvent(response.getNetErrorCode(), 6716)
              } catch (error) {
                error = error as BusinessError ;
                console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
              }
              break;
            }
            case "WebNetErrorList_Static_011700": {
              let response = new web_webview.WebSchemeHandlerResponse();
              try {
                response.setNetErrorCode(WebNetErrorList.ERR_CERTIFICATE_TRANSPARENCY_REQUIRED)
                console.log("[schemeHandler] getNetErrorCode:" + response.getNetErrorCode())
                Utils.emitEvent(response.getNetErrorCode(), 6717)
              } catch (error) {
                error = error as BusinessError ;
                console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
              }
              break;
            }
            case "WebNetErrorList_Static_011800": {
              let response = new web_webview.WebSchemeHandlerResponse();
              try {
                response.setNetErrorCode(WebNetErrorList.ERR_CERT_SYMANTEC_LEGACY)
                console.log("[schemeHandler] getNetErrorCode:" + response.getNetErrorCode())
                Utils.emitEvent(response.getNetErrorCode(), 6718)
              } catch (error) {
                error = error as BusinessError ;
                console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
              }
              break;
            }
            case "WebNetErrorList_Static_011900": {
              let response = new web_webview.WebSchemeHandlerResponse();
              try {
                response.setNetErrorCode(WebNetErrorList.ERR_CERT_KNOWN_INTERCEPTION_BLOCKED)
                console.log("[schemeHandler] getNetErrorCode:" + response.getNetErrorCode())
                Utils.emitEvent(response.getNetErrorCode(), 6719)
              } catch (error) {
                error = error as BusinessError ;
                console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
              }
              break;
            }
            case "WebNetErrorList_Static_012000": {
              let response = new web_webview.WebSchemeHandlerResponse();
              try {
                response.setNetErrorCode(WebNetErrorList.ERR_SSL_OBSOLETE_VERSION_OR_CIPHER)
                console.log("[schemeHandler] getNetErrorCode:" + response.getNetErrorCode())
                Utils.emitEvent(response.getNetErrorCode(), 6720)
              } catch (error) {
                error = error as BusinessError ;
                console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
              }
              break;
            }
            case "WebNetErrorList_Static_012100": {
              let response = new web_webview.WebSchemeHandlerResponse();
              try {
                response.setNetErrorCode(WebNetErrorList.ERR_CERT_END)
                console.log("[schemeHandler] getNetErrorCode:" + response.getNetErrorCode())
                Utils.emitEvent(response.getNetErrorCode(), 6721)
              } catch (error) {
                error = error as BusinessError ;
                console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
              }
              break;
            }
            case "WebNetErrorList_Static_012200": {
              let response = new web_webview.WebSchemeHandlerResponse();
              try {
                response.setNetErrorCode(WebNetErrorList.ERR_INVALID_URL)
                console.log("[schemeHandler] getNetErrorCode:" + response.getNetErrorCode())
                Utils.emitEvent(response.getNetErrorCode(), 6722)
              } catch (error) {
                error = error as BusinessError ;
                console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
              }
              break;
            }
            case "WebNetErrorList_Static_012300": {
              let response = new web_webview.WebSchemeHandlerResponse();
              try {
                response.setNetErrorCode(WebNetErrorList.ERR_DISALLOWED_URL_SCHEME)
                console.log("[schemeHandler] getNetErrorCode:" + response.getNetErrorCode())
                Utils.emitEvent(response.getNetErrorCode(), 6723)
              } catch (error) {
                error = error as BusinessError ;
                console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
              }
              break;
            }
            case "WebNetErrorList_Static_012400": {
              let response = new web_webview.WebSchemeHandlerResponse();
              try {
                response.setNetErrorCode(WebNetErrorList.ERR_UNKNOWN_URL_SCHEME)
                console.log("[schemeHandler] getNetErrorCode:" + response.getNetErrorCode())
                Utils.emitEvent(response.getNetErrorCode(), 6724)
              } catch (error) {
                error = error as BusinessError ;
                console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
              }
              break;
            }
            case "WebNetErrorList_Static_012500": {
              let response = new web_webview.WebSchemeHandlerResponse();
              try {
                response.setNetErrorCode(WebNetErrorList.ERR_INVALID_REDIRECT)
                console.log("[schemeHandler] getNetErrorCode:" + response.getNetErrorCode())
                Utils.emitEvent(response.getNetErrorCode(), 6725)
              } catch (error) {
                error = error as BusinessError ;
                console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
              }
              break;
            }
            case "WebNetErrorList_Static_012600": {
              let response = new web_webview.WebSchemeHandlerResponse();
              try {
                response.setNetErrorCode(WebNetErrorList.ERR_TOO_MANY_REDIRECTS)
                console.log("[schemeHandler] getNetErrorCode:" + response.getNetErrorCode())
                Utils.emitEvent(response.getNetErrorCode(), 6726)
              } catch (error) {
                error = error as BusinessError ;
                console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
              }
              break;
            }
            case "WebNetErrorList_Static_012700": {
              let response = new web_webview.WebSchemeHandlerResponse();
              try {
                response.setNetErrorCode(WebNetErrorList.ERR_UNSAFE_REDIRECT)
                console.log("[schemeHandler] getNetErrorCode:" + response.getNetErrorCode())
                Utils.emitEvent(response.getNetErrorCode(), 6727)
              } catch (error) {
                error = error as BusinessError ;
                console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
              }
              break;
            }
            case "WebNetErrorList_Static_012800": {
              let response = new web_webview.WebSchemeHandlerResponse();
              try {
                response.setNetErrorCode(WebNetErrorList.ERR_UNSAFE_PORT)
                console.log("[schemeHandler] getNetErrorCode:" + response.getNetErrorCode())
                Utils.emitEvent(response.getNetErrorCode(), 6728)
              } catch (error) {
                error = error as BusinessError ;
                console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
              }
              break;
            }
            case "WebNetErrorList_Static_012900": {
              let response = new web_webview.WebSchemeHandlerResponse();
              try {
                response.setNetErrorCode(WebNetErrorList.ERR_INVALID_RESPONSE)
                console.log("[schemeHandler] getNetErrorCode:" + response.getNetErrorCode())
                Utils.emitEvent(response.getNetErrorCode(), 6729)
              } catch (error) {
                error = error as BusinessError ;
                console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
              }
              break;
            }
            case "WebNetErrorList_Static_013000": {
              let response = new web_webview.WebSchemeHandlerResponse();
              try {
                response.setNetErrorCode(WebNetErrorList.ERR_INVALID_CHUNKED_ENCODING)
                console.log("[schemeHandler] getNetErrorCode:" + response.getNetErrorCode())
                Utils.emitEvent(response.getNetErrorCode(), 6730)
              } catch (error) {
                error = error as BusinessError ;
                console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
              }
              break;
            }
            case "WebNetErrorList_Static_013100": {
              let response = new web_webview.WebSchemeHandlerResponse();
              try {
                response.setNetErrorCode(WebNetErrorList.ERR_METHOD_UNSUPPORTED)
                console.log("[schemeHandler] getNetErrorCode:" + response.getNetErrorCode())
                Utils.emitEvent(response.getNetErrorCode(), 6731)
              } catch (error) {
                error = error as BusinessError ;
                console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
              }
              break;
            }
            case "WebNetErrorList_Static_013200": {
              let response = new web_webview.WebSchemeHandlerResponse();
              try {
                response.setNetErrorCode(WebNetErrorList.ERR_UNEXPECTED_PROXY_AUTH)
                console.log("[schemeHandler] getNetErrorCode:" + response.getNetErrorCode())
                Utils.emitEvent(response.getNetErrorCode(), 6732)
              } catch (error) {
                error = error as BusinessError ;
                console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
              }
              break;
            }
            case "WebNetErrorList_Static_013300": {
              let response = new web_webview.WebSchemeHandlerResponse();
              try {
                response.setNetErrorCode(WebNetErrorList.ERR_EMPTY_RESPONSE)
                console.log("[schemeHandler] getNetErrorCode:" + response.getNetErrorCode())
                Utils.emitEvent(response.getNetErrorCode(), 6733)
              } catch (error) {
                error = error as BusinessError ;
                console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
              }
              break;
            }
            case "WebNetErrorList_Static_013400": {
              let response = new web_webview.WebSchemeHandlerResponse();
              try {
                response.setNetErrorCode(WebNetErrorList.ERR_RESPONSE_HEADERS_TOO_BIG)
                console.log("[schemeHandler] getNetErrorCode:" + response.getNetErrorCode())
                Utils.emitEvent(response.getNetErrorCode(), 6734)
              } catch (error) {
                error = error as BusinessError ;
                console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
              }
              break;
            }
            case "WebNetErrorList_Static_013500": {
              let response = new web_webview.WebSchemeHandlerResponse();
              try {
                response.setNetErrorCode(WebNetErrorList.ERR_PAC_SCRIPT_FAILED)
                console.log("[schemeHandler] getNetErrorCode:" + response.getNetErrorCode())
                Utils.emitEvent(response.getNetErrorCode(), 6735)
              } catch (error) {
                error = error as BusinessError ;
                console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
              }
              break;
            }
            case "WebNetErrorList_Static_013600": {
              let response = new web_webview.WebSchemeHandlerResponse();
              try {
                response.setNetErrorCode(WebNetErrorList.ERR_REQUEST_RANGE_NOT_SATISFIABLE)
                console.log("[schemeHandler] getNetErrorCode:" + response.getNetErrorCode())
                Utils.emitEvent(response.getNetErrorCode(), 6736)
              } catch (error) {
                error = error as BusinessError ;
                console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
              }
              break;
            }
            case "WebNetErrorList_Static_013700": {
              let response = new web_webview.WebSchemeHandlerResponse();
              try {
                response.setNetErrorCode(WebNetErrorList.ERR_MALFORMED_IDENTITY)
                console.log("[schemeHandler] getNetErrorCode:" + response.getNetErrorCode())
                Utils.emitEvent(response.getNetErrorCode(), 6737)
              } catch (error) {
                error = error as BusinessError ;
                console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
              }
              break;
            }
            case "WebNetErrorList_Static_013800": {
              let response = new web_webview.WebSchemeHandlerResponse();
              try {
                response.setNetErrorCode(WebNetErrorList.ERR_CONTENT_DECODING_FAILED)
                console.log("[schemeHandler] getNetErrorCode:" + response.getNetErrorCode())
                Utils.emitEvent(response.getNetErrorCode(), 6738)
              } catch (error) {
                error = error as BusinessError ;
                console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
              }
              break;
            }
            case "WebNetErrorList_Static_013900": {
              let response = new web_webview.WebSchemeHandlerResponse();
              try {
                response.setNetErrorCode(WebNetErrorList.ERR_NETWORK_IO_SUSPENDED)
                console.log("[schemeHandler] getNetErrorCode:" + response.getNetErrorCode())
                Utils.emitEvent(response.getNetErrorCode(), 6739)
              } catch (error) {
                error = error as BusinessError ;
                console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
              }
              break;
            }
            case "WebNetErrorList_Static_014000": {
              let response = new web_webview.WebSchemeHandlerResponse();
              try {
                response.setNetErrorCode(WebNetErrorList.ERR_SYN_REPLY_NOT_RECEIVED)
                console.log("[schemeHandler] getNetErrorCode:" + response.getNetErrorCode())
                Utils.emitEvent(response.getNetErrorCode(), 6740)
              } catch (error) {
                error = error as BusinessError ;
                console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
              }
              break;
            }
            case "WebNetErrorList_Static_014100": {
              let response = new web_webview.WebSchemeHandlerResponse();
              try {
                response.setNetErrorCode(WebNetErrorList.ERR_ENCODING_CONVERSION_FAILED)
                console.log("[schemeHandler] getNetErrorCode:" + response.getNetErrorCode())
                Utils.emitEvent(response.getNetErrorCode(), 6741)
              } catch (error) {
                error = error as BusinessError ;
                console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
              }
              break;
            }
            case "WebNetErrorList_Static_014200": {
              let response = new web_webview.WebSchemeHandlerResponse();
              try {
                response.setNetErrorCode(WebNetErrorList.ERR_UNRECOGNIZED_FTP_DIRECTORY_LISTING_FORMAT)
                console.log("[schemeHandler] getNetErrorCode:" + response.getNetErrorCode())
                Utils.emitEvent(response.getNetErrorCode(), 6742)
              } catch (error) {
                error = error as BusinessError ;
                console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
              }
              break;
            }
            case "WebNetErrorList_Static_014300": {
              let response = new web_webview.WebSchemeHandlerResponse();
              try {
                response.setNetErrorCode(WebNetErrorList.ERR_NO_SUPPORTED_PROXIES)
                console.log("[schemeHandler] getNetErrorCode:" + response.getNetErrorCode())
                Utils.emitEvent(response.getNetErrorCode(), 6743)
              } catch (error) {
                error = error as BusinessError ;
                console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
              }
              break;
            }
            case "WebNetErrorList_Static_014400": {
              let response = new web_webview.WebSchemeHandlerResponse();
              try {
                response.setNetErrorCode(WebNetErrorList.ERR_HTTP2_PROTOCOL_ERROR)
                console.log("[schemeHandler] getNetErrorCode:" + response.getNetErrorCode())
                Utils.emitEvent(response.getNetErrorCode(), 6744)
              } catch (error) {
                error = error as BusinessError ;
                console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
              }
              break;
            }
            case "WebNetErrorList_Static_014500": {
              let response = new web_webview.WebSchemeHandlerResponse();
              try {
                response.setNetErrorCode(WebNetErrorList.ERR_INVALID_AUTH_CREDENTIALS)
                console.log("[schemeHandler] getNetErrorCode:" + response.getNetErrorCode())
                Utils.emitEvent(response.getNetErrorCode(), 6745)
              } catch (error) {
                error = error as BusinessError ;
                console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
              }
              break;
            }
            case "WebNetErrorList_Static_014600": {
              let response = new web_webview.WebSchemeHandlerResponse();
              try {
                response.setNetErrorCode(WebNetErrorList.ERR_UNSUPPORTED_AUTH_SCHEME)
                console.log("[schemeHandler] getNetErrorCode:" + response.getNetErrorCode())
                Utils.emitEvent(response.getNetErrorCode(), 6746)
              } catch (error) {
                error = error as BusinessError ;
                console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
              }
              break;
            }
            case "WebNetErrorList_Static_014700": {
              let response = new web_webview.WebSchemeHandlerResponse();
              try {
                response.setNetErrorCode(WebNetErrorList.ERR_ENCODING_DETECTION_FAILED)
                console.log("[schemeHandler] getNetErrorCode:" + response.getNetErrorCode())
                Utils.emitEvent(response.getNetErrorCode(), 6747)
              } catch (error) {
                error = error as BusinessError ;
                console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
              }
              break;
            }
            case "WebNetErrorList_Static_014800": {
              let response = new web_webview.WebSchemeHandlerResponse();
              try {
                response.setNetErrorCode(WebNetErrorList.ERR_MISSING_AUTH_CREDENTIALS)
                console.log("[schemeHandler] getNetErrorCode:" + response.getNetErrorCode())
                Utils.emitEvent(response.getNetErrorCode(), 6748)
              } catch (error) {
                error = error as BusinessError ;
                console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
              }
              break;
            }
            case "WebNetErrorList_Static_014900": {
              let response = new web_webview.WebSchemeHandlerResponse();
              try {
                response.setNetErrorCode(WebNetErrorList.ERR_UNEXPECTED_SECURITY_LIBRARY_STATUS)
                console.log("[schemeHandler] getNetErrorCode:" + response.getNetErrorCode())
                Utils.emitEvent(response.getNetErrorCode(), 6749)
              } catch (error) {
                error = error as BusinessError ;
                console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
              }
              break;
            }
            case "WebNetErrorList_Static_015000": {
              let response = new web_webview.WebSchemeHandlerResponse();
              try {
                response.setNetErrorCode(WebNetErrorList.ERR_MISCONFIGURED_AUTH_ENVIRONMENT)
                console.log("[schemeHandler] getNetErrorCode:" + response.getNetErrorCode())
                Utils.emitEvent(response.getNetErrorCode(), 6750)
              } catch (error) {
                error = error as BusinessError ;
                console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
              }
              break;
            }
            case "WebNetErrorList_Static_015100": {
              let response = new web_webview.WebSchemeHandlerResponse();
              try {
                response.setNetErrorCode(WebNetErrorList.ERR_UNDOCUMENTED_SECURITY_LIBRARY_STATUS)
                console.log("[schemeHandler] getNetErrorCode:" + response.getNetErrorCode())
                Utils.emitEvent(response.getNetErrorCode(), 6751)
              } catch (error) {
                error = error as BusinessError ;
                console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
              }
              break;
            }
            case "WebNetErrorList_Static_015200": {
              let response = new web_webview.WebSchemeHandlerResponse();
              try {
                response.setNetErrorCode(WebNetErrorList.ERR_RESPONSE_BODY_TOO_BIG_TO_DRAIN)
                console.log("[schemeHandler] getNetErrorCode:" + response.getNetErrorCode())
                Utils.emitEvent(response.getNetErrorCode(), 6752)
              } catch (error) {
                error = error as BusinessError ;
                console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
              }
              break;
            }
            case "WebNetErrorList_Static_015300": {
              let response = new web_webview.WebSchemeHandlerResponse();
              try {
                response.setNetErrorCode(WebNetErrorList.ERR_RESPONSE_HEADERS_MULTIPLE_CONTENT_LENGTH)
                console.log("[schemeHandler] getNetErrorCode:" + response.getNetErrorCode())
                Utils.emitEvent(response.getNetErrorCode(), 6753)
              } catch (error) {
                error = error as BusinessError ;
                console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
              }
              break;
            }
            case "WebNetErrorList_Static_015400": {
              let response = new web_webview.WebSchemeHandlerResponse();
              try {
                response.setNetErrorCode(WebNetErrorList.ERR_INCOMPLETE_HTTP2_HEADERS)
                console.log("[schemeHandler] getNetErrorCode:" + response.getNetErrorCode())
                Utils.emitEvent(response.getNetErrorCode(), 6754)
              } catch (error) {
                error = error as BusinessError ;
                console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
              }
              break;
            }
            case "WebNetErrorList_Static_015500": {
              let response = new web_webview.WebSchemeHandlerResponse();
              try {
                response.setNetErrorCode(WebNetErrorList.ERR_PAC_NOT_IN_DHCP)
                console.log("[schemeHandler] getNetErrorCode:" + response.getNetErrorCode())
                Utils.emitEvent(response.getNetErrorCode(), 6755)
              } catch (error) {
                error = error as BusinessError ;
                console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
              }
              break;
            }
            case "WebNetErrorList_Static_015600": {
              let response = new web_webview.WebSchemeHandlerResponse();
              try {
                response.setNetErrorCode(WebNetErrorList.ERR_RESPONSE_HEADERS_MULTIPLE_CONTENT_DISPOSITION)
                console.log("[schemeHandler] getNetErrorCode:" + response.getNetErrorCode())
                Utils.emitEvent(response.getNetErrorCode(), 6756)
              } catch (error) {
                error = error as BusinessError ;
                console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
              }
              break;
            }
            case "WebNetErrorList_Static_015700": {
              let response = new web_webview.WebSchemeHandlerResponse();
              try {
                response.setNetErrorCode(WebNetErrorList.ERR_RESPONSE_HEADERS_MULTIPLE_LOCATION)
                console.log("[schemeHandler] getNetErrorCode:" + response.getNetErrorCode())
                Utils.emitEvent(response.getNetErrorCode(), 6757)
              } catch (error) {
                error = error as BusinessError ;
                console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
              }
              break;
            }
            case "WebNetErrorList_Static_015800": {
              let response = new web_webview.WebSchemeHandlerResponse();
              try {
                response.setNetErrorCode(WebNetErrorList.ERR_HTTP2_SERVER_REFUSED_STREAM)
                console.log("[schemeHandler] getNetErrorCode:" + response.getNetErrorCode())
                Utils.emitEvent(response.getNetErrorCode(), 6758)
              } catch (error) {
                error = error as BusinessError ;
                console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
              }
              break;
            }
            case "WebNetErrorList_Static_015900": {
              let response = new web_webview.WebSchemeHandlerResponse();
              try {
                response.setNetErrorCode(WebNetErrorList.ERR_HTTP2_PING_FAILED)
                console.log("[schemeHandler] getNetErrorCode:" + response.getNetErrorCode())
                Utils.emitEvent(response.getNetErrorCode(), 6759)
              } catch (error) {
                error = error as BusinessError ;
                console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
              }
              break;
            }
            case "WebNetErrorList_Static_016000": {
              let response = new web_webview.WebSchemeHandlerResponse();
              try {
                response.setNetErrorCode(WebNetErrorList.ERR_CONTENT_LENGTH_MISMATCH)
                console.log("[schemeHandler] getNetErrorCode:" + response.getNetErrorCode())
                Utils.emitEvent(response.getNetErrorCode(), 6760)
              } catch (error) {
                error = error as BusinessError ;
                console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
              }
              break;
            }
            case "WebNetErrorList_Static_016100": {
              let response = new web_webview.WebSchemeHandlerResponse();
              try {
                response.setNetErrorCode(WebNetErrorList.ERR_INCOMPLETE_CHUNKED_ENCODING)
                console.log("[schemeHandler] getNetErrorCode:" + response.getNetErrorCode())
                Utils.emitEvent(response.getNetErrorCode(), 6761)
              } catch (error) {
                error = error as BusinessError ;
                console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
              }
              break;
            }
            case "WebNetErrorList_Static_016200": {
              let response = new web_webview.WebSchemeHandlerResponse();
              try {
                response.setNetErrorCode(WebNetErrorList.ERR_QUIC_PROTOCOL_ERROR)
                console.log("[schemeHandler] getNetErrorCode:" + response.getNetErrorCode())
                Utils.emitEvent(response.getNetErrorCode(), 6762)
              } catch (error) {
                error = error as BusinessError ;
                console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
              }
              break;
            }
            case "WebNetErrorList_Static_016300": {
              let response = new web_webview.WebSchemeHandlerResponse();
              try {
                response.setNetErrorCode(WebNetErrorList.ERR_RESPONSE_HEADERS_TRUNCATED)
                console.log("[schemeHandler] getNetErrorCode:" + response.getNetErrorCode())
                Utils.emitEvent(response.getNetErrorCode(), 6763)
              } catch (error) {
                error = error as BusinessError ;
                console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
              }
              break;
            }
            case "WebNetErrorList_Static_016400": {
              let response = new web_webview.WebSchemeHandlerResponse();
              try {
                response.setNetErrorCode(WebNetErrorList.ERR_QUIC_HANDSHAKE_FAILED)
                console.log("[schemeHandler] getNetErrorCode:" + response.getNetErrorCode())
                Utils.emitEvent(response.getNetErrorCode(), 6764)
              } catch (error) {
                error = error as BusinessError ;
                console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
              }
              break;
            }
            case "WebNetErrorList_Static_016500": {
              let response = new web_webview.WebSchemeHandlerResponse();
              try {
                response.setNetErrorCode(WebNetErrorList.ERR_HTTP2_INADEQUATE_TRANSPORT_SECURITY)
                console.log("[schemeHandler] getNetErrorCode:" + response.getNetErrorCode())
                Utils.emitEvent(response.getNetErrorCode(), 6765)
              } catch (error) {
                error = error as BusinessError ;
                console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
              }
              break;
            }
            case "WebNetErrorList_Static_016600": {
              let response = new web_webview.WebSchemeHandlerResponse();
              try {
                response.setNetErrorCode(WebNetErrorList.ERR_HTTP2_FLOW_CONTROL_ERROR)
                console.log("[schemeHandler] getNetErrorCode:" + response.getNetErrorCode())
                Utils.emitEvent(response.getNetErrorCode(), 6766)
              } catch (error) {
                error = error as BusinessError ;
                console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
              }
              break;
            }
            case "WebNetErrorList_Static_016700": {
              let response = new web_webview.WebSchemeHandlerResponse();
              try {
                response.setNetErrorCode(WebNetErrorList.ERR_HTTP2_FRAME_SIZE_ERROR)
                console.log("[schemeHandler] getNetErrorCode:" + response.getNetErrorCode())
                Utils.emitEvent(response.getNetErrorCode(), 6767)
              } catch (error) {
                error = error as BusinessError ;
                console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
              }
              break;
            }
            case "WebNetErrorList_Static_016800": {
              let response = new web_webview.WebSchemeHandlerResponse();
              try {
                response.setNetErrorCode(WebNetErrorList.ERR_HTTP2_COMPRESSION_ERROR)
                console.log("[schemeHandler] getNetErrorCode:" + response.getNetErrorCode())
                Utils.emitEvent(response.getNetErrorCode(), 6768)
              } catch (error) {
                error = error as BusinessError ;
                console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
              }
              break;
            }
            case "WebNetErrorList_Static_016900": {
              let response = new web_webview.WebSchemeHandlerResponse();
              try {
                response.setNetErrorCode(WebNetErrorList.ERR_PROXY_AUTH_REQUESTED_WITH_NO_CONNECTION)
                console.log("[schemeHandler] getNetErrorCode:" + response.getNetErrorCode())
                Utils.emitEvent(response.getNetErrorCode(), 6769)
              } catch (error) {
                error = error as BusinessError ;
                console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
              }
              break;
            }
            case "WebNetErrorList_Static_017000": {
              let response = new web_webview.WebSchemeHandlerResponse();
              try {
                response.setNetErrorCode(WebNetErrorList.ERR_HTTP_1_1_REQUIRED)
                console.log("[schemeHandler] getNetErrorCode:" + response.getNetErrorCode())
                Utils.emitEvent(response.getNetErrorCode(), 6770)
              } catch (error) {
                error = error as BusinessError ;
                console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
              }
              break;
            }
            case "WebNetErrorList_Static_017100": {
              let response = new web_webview.WebSchemeHandlerResponse();
              try {
                response.setNetErrorCode(WebNetErrorList.ERR_PROXY_HTTP_1_1_REQUIRED)
                console.log("[schemeHandler] getNetErrorCode:" + response.getNetErrorCode())
                Utils.emitEvent(response.getNetErrorCode(), 6771)
              } catch (error) {
                error = error as BusinessError ;
                console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
              }
              break;
            }
            case "WebNetErrorList_Static_017200": {
              let response = new web_webview.WebSchemeHandlerResponse();
              try {
                response.setNetErrorCode(WebNetErrorList.ERR_PAC_SCRIPT_TERMINATED)
                console.log("[schemeHandler] getNetErrorCode:" + response.getNetErrorCode())
                Utils.emitEvent(response.getNetErrorCode(), 6772)
              } catch (error) {
                error = error as BusinessError ;
                console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
              }
              break;
            }
            case "WebNetErrorList_Static_017300": {
              let response = new web_webview.WebSchemeHandlerResponse();
              try {
                response.setNetErrorCode(WebNetErrorList.ERR_INVALID_HTTP_RESPONSE)
                console.log("[schemeHandler] getNetErrorCode:" + response.getNetErrorCode())
                Utils.emitEvent(response.getNetErrorCode(), 6773)
              } catch (error) {
                error = error as BusinessError ;
                console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
              }
              break;
            }
            case "WebNetErrorList_Static_017400": {
              let response = new web_webview.WebSchemeHandlerResponse();
              try {
                response.setNetErrorCode(WebNetErrorList.ERR_CONTENT_DECODING_INIT_FAILED)
                console.log("[schemeHandler] getNetErrorCode:" + response.getNetErrorCode())
                Utils.emitEvent(response.getNetErrorCode(), 6774)
              } catch (error) {
                error = error as BusinessError ;
                console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
              }
              break;
            }
            case "WebNetErrorList_Static_017500": {
              let response = new web_webview.WebSchemeHandlerResponse();
              try {
                response.setNetErrorCode(WebNetErrorList.ERR_HTTP2_RST_STREAM_NO_ERROR_RECEIVED)
                console.log("[schemeHandler] getNetErrorCode:" + response.getNetErrorCode())
                Utils.emitEvent(response.getNetErrorCode(), 6775)
              } catch (error) {
                error = error as BusinessError ;
                console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
              }
              break;
            }
            case "WebNetErrorList_Static_017600": {
              let response = new web_webview.WebSchemeHandlerResponse();
              try {
                response.setNetErrorCode(WebNetErrorList.ERR_HTTP2_PUSHED_STREAM_NOT_AVAILABLE)
                console.log("[schemeHandler] getNetErrorCode:" + response.getNetErrorCode())
                Utils.emitEvent(response.getNetErrorCode(), 6776)
              } catch (error) {
                error = error as BusinessError ;
                console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
              }
              break;
            }
            case "WebNetErrorList_Static_017700": {
              let response = new web_webview.WebSchemeHandlerResponse();
              try {
                response.setNetErrorCode(WebNetErrorList.ERR_HTTP2_CLAIMED_PUSHED_STREAM_RESET_BY_SERVER)
                console.log("[schemeHandler] getNetErrorCode:" + response.getNetErrorCode())
                Utils.emitEvent(response.getNetErrorCode(), 6777)
              } catch (error) {
                error = error as BusinessError ;
                console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
              }
              break;
            }
            case "WebNetErrorList_Static_017800": {
              let response = new web_webview.WebSchemeHandlerResponse();
              try {
                response.setNetErrorCode(WebNetErrorList.ERR_TOO_MANY_RETRIES)
                console.log("[schemeHandler] getNetErrorCode:" + response.getNetErrorCode())
                Utils.emitEvent(response.getNetErrorCode(), 6778)
              } catch (error) {
                error = error as BusinessError ;
                console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
              }
              break;
            }
            case "WebNetErrorList_Static_017900": {
              let response = new web_webview.WebSchemeHandlerResponse();
              try {
                response.setNetErrorCode(WebNetErrorList.ERR_HTTP2_STREAM_CLOSED)
                console.log("[schemeHandler] getNetErrorCode:" + response.getNetErrorCode())
                Utils.emitEvent(response.getNetErrorCode(), 6779)
              } catch (error) {
                error = error as BusinessError ;
                console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
              }
              break;
            }
            case "WebNetErrorList_Static_018000": {
              let response = new web_webview.WebSchemeHandlerResponse();
              try {
                response.setNetErrorCode(WebNetErrorList.ERR_HTTP2_CLIENT_REFUSED_STREAM)
                console.log("[schemeHandler] getNetErrorCode:" + response.getNetErrorCode())
                Utils.emitEvent(response.getNetErrorCode(), 6780)
              } catch (error) {
                error = error as BusinessError ;
                console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
              }
              break;
            }
            case "WebNetErrorList_Static_018100": {
              let response = new web_webview.WebSchemeHandlerResponse();
              try {
                response.setNetErrorCode(WebNetErrorList.ERR_HTTP2_PUSHED_RESPONSE_DOES_NOT_MATCH)
                console.log("[schemeHandler] getNetErrorCode:" + response.getNetErrorCode())
                Utils.emitEvent(response.getNetErrorCode(), 6781)
              } catch (error) {
                error = error as BusinessError ;
                console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
              }
              break;
            }
            case "WebNetErrorList_Static_018200": {
              let response = new web_webview.WebSchemeHandlerResponse();
              try {
                response.setNetErrorCode(WebNetErrorList.ERR_HTTP_RESPONSE_CODE_FAILURE)
                console.log("[schemeHandler] getNetErrorCode:" + response.getNetErrorCode())
                Utils.emitEvent(response.getNetErrorCode(), 6782)
              } catch (error) {
                error = error as BusinessError ;
                console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
              }
              break;
            }
            case "WebNetErrorList_Static_018300": {
              let response = new web_webview.WebSchemeHandlerResponse();
              try {
                response.setNetErrorCode(WebNetErrorList.ERR_QUIC_UNKNOWN_CERT_ROOT)
                console.log("[schemeHandler] getNetErrorCode:" + response.getNetErrorCode())
                Utils.emitEvent(response.getNetErrorCode(), 6783)
              } catch (error) {
                error = error as BusinessError ;
                console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
              }
              break;
            }
            case "WebNetErrorList_Static_018400": {
              let response = new web_webview.WebSchemeHandlerResponse();
              try {
                response.setNetErrorCode(WebNetErrorList.ERR_QUIC_GOAWAY_REQUEST_CAN_BE_RETRIED)
                console.log("[schemeHandler] getNetErrorCode:" + response.getNetErrorCode())
                Utils.emitEvent(response.getNetErrorCode(), 6784)
              } catch (error) {
                error = error as BusinessError ;
                console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
              }
              break;
            }
            case "WebNetErrorList_Static_018500": {
              let response = new web_webview.WebSchemeHandlerResponse();
              try {
                response.setNetErrorCode(WebNetErrorList.ERR_TOO_MANY_ACCEPT_CH_RESTARTS)
                console.log("[schemeHandler] getNetErrorCode:" + response.getNetErrorCode())
                Utils.emitEvent(response.getNetErrorCode(), 6785)
              } catch (error) {
                error = error as BusinessError ;
                console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
              }
              break;
            }
            case "WebNetErrorList_Static_018600": {
              let response = new web_webview.WebSchemeHandlerResponse();
              try {
                response.setNetErrorCode(WebNetErrorList.ERR_INCONSISTENT_IP_ADDRESS_SPACE)
                console.log("[schemeHandler] getNetErrorCode:" + response.getNetErrorCode())
                Utils.emitEvent(response.getNetErrorCode(), 6786)
              } catch (error) {
                error = error as BusinessError ;
                console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
              }
              break;
            }
            case "WebNetErrorList_Static_018700": {
              let response = new web_webview.WebSchemeHandlerResponse();
              try {
                response.setNetErrorCode(WebNetErrorList.ERR_CACHED_IP_ADDRESS_SPACE_BLOCKED_BY_LOCAL_NETWORK_ACCESS_POLICY)
                console.log("[schemeHandler] getNetErrorCode:" + response.getNetErrorCode())
                Utils.emitEvent(response.getNetErrorCode(), 6787)
              } catch (error) {
                error = error as BusinessError ;
                console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
              }
              break;
            }
            case "WebNetErrorList_Static_018800": {
              let response = new web_webview.WebSchemeHandlerResponse();
              try {
                response.setNetErrorCode(WebNetErrorList.ERR_CACHE_MISS)
                console.log("[schemeHandler] getNetErrorCode:" + response.getNetErrorCode())
                Utils.emitEvent(response.getNetErrorCode(), 6788)
              } catch (error) {
                error = error as BusinessError ;
                console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
              }
              break;
            }
            case "WebNetErrorList_Static_018900": {
              let response = new web_webview.WebSchemeHandlerResponse();
              try {
                response.setNetErrorCode(WebNetErrorList.ERR_CACHE_READ_FAILURE)
                console.log("[schemeHandler] getNetErrorCode:" + response.getNetErrorCode())
                Utils.emitEvent(response.getNetErrorCode(), 6789)
              } catch (error) {
                error = error as BusinessError ;
                console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
              }
              break;
            }
            case "WebNetErrorList_Static_019000": {
              let response = new web_webview.WebSchemeHandlerResponse();
              try {
                response.setNetErrorCode(WebNetErrorList.ERR_CACHE_WRITE_FAILURE)
                console.log("[schemeHandler] getNetErrorCode:" + response.getNetErrorCode())
                Utils.emitEvent(response.getNetErrorCode(), 6790)
              } catch (error) {
                error = error as BusinessError ;
                console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
              }
              break;
            }
            case "WebNetErrorList_Static_019100": {
              let response = new web_webview.WebSchemeHandlerResponse();
              try {
                response.setNetErrorCode(WebNetErrorList.ERR_CACHE_OPERATION_UNSUPPORTED)
                console.log("[schemeHandler] getNetErrorCode:" + response.getNetErrorCode())
                Utils.emitEvent(response.getNetErrorCode(), 6791)
              } catch (error) {
                error = error as BusinessError ;
                console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
              }
              break;
            }
            case "WebNetErrorList_Static_019200": {
              let response = new web_webview.WebSchemeHandlerResponse();
              try {
                response.setNetErrorCode(WebNetErrorList.ERR_CACHE_OPEN_FAILURE)
                console.log("[schemeHandler] getNetErrorCode:" + response.getNetErrorCode())
                Utils.emitEvent(response.getNetErrorCode(), 6792)
              } catch (error) {
                error = error as BusinessError ;
                console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
              }
              break;
            }
            case "WebNetErrorList_Static_019300": {
              let response = new web_webview.WebSchemeHandlerResponse();
              try {
                response.setNetErrorCode(WebNetErrorList.ERR_CACHE_CREATE_FAILURE)
                console.log("[schemeHandler] getNetErrorCode:" + response.getNetErrorCode())
                Utils.emitEvent(response.getNetErrorCode(), 6793)
              } catch (error) {
                error = error as BusinessError ;
                console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
              }
              break;
            }
            case "WebNetErrorList_Static_019400": {
              let response = new web_webview.WebSchemeHandlerResponse();
              try {
                response.setNetErrorCode(WebNetErrorList.ERR_CACHE_RACE)
                console.log("[schemeHandler] getNetErrorCode:" + response.getNetErrorCode())
                Utils.emitEvent(response.getNetErrorCode(), 6794)
              } catch (error) {
                error = error as BusinessError ;
                console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
              }
              break;
            }
            case "WebNetErrorList_Static_019500": {
              let response = new web_webview.WebSchemeHandlerResponse();
              try {
                response.setNetErrorCode(WebNetErrorList.ERR_CACHE_CHECKSUM_READ_FAILURE)
                console.log("[schemeHandler] getNetErrorCode:" + response.getNetErrorCode())
                Utils.emitEvent(response.getNetErrorCode(), 6795)
              } catch (error) {
                error = error as BusinessError ;
                console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
              }
              break;
            }
            case "WebNetErrorList_Static_019600": {
              let response = new web_webview.WebSchemeHandlerResponse();
              try {
                response.setNetErrorCode(WebNetErrorList.ERR_CACHE_CHECKSUM_MISMATCH)
                console.log("[schemeHandler] getNetErrorCode:" + response.getNetErrorCode())
                Utils.emitEvent(response.getNetErrorCode(), 6796)
              } catch (error) {
                error = error as BusinessError ;
                console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
              }
              break;
            }
            case "WebNetErrorList_Static_019700": {
              let response = new web_webview.WebSchemeHandlerResponse();
              try {
                response.setNetErrorCode(WebNetErrorList.ERR_CACHE_LOCK_TIMEOUT)
                console.log("[schemeHandler] getNetErrorCode:" + response.getNetErrorCode())
                Utils.emitEvent(response.getNetErrorCode(), 6797)
              } catch (error) {
                error = error as BusinessError ;
                console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
              }
              break;
            }
            case "WebNetErrorList_Static_019800": {
              let response = new web_webview.WebSchemeHandlerResponse();
              try {
                response.setNetErrorCode(WebNetErrorList.ERR_CACHE_AUTH_FAILURE_AFTER_READ)
                console.log("[schemeHandler] getNetErrorCode:" + response.getNetErrorCode())
                Utils.emitEvent(response.getNetErrorCode(), 6798)
              } catch (error) {
                error = error as BusinessError ;
                console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
              }
              break;
            }
            case "WebNetErrorList_Static_019900": {
              let response = new web_webview.WebSchemeHandlerResponse();
              try {
                response.setNetErrorCode(WebNetErrorList.ERR_CACHE_ENTRY_NOT_SUITABLE)
                console.log("[schemeHandler] getNetErrorCode:" + response.getNetErrorCode())
                Utils.emitEvent(response.getNetErrorCode(), 6799)
              } catch (error) {
                error = error as BusinessError ;
                console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
              }
              break;
            }
            case "WebNetErrorList_Static_020000": {
              let response = new web_webview.WebSchemeHandlerResponse();
              try {
                response.setNetErrorCode(WebNetErrorList.ERR_CACHE_DOOM_FAILURE)
                console.log("[schemeHandler] getNetErrorCode:" + response.getNetErrorCode())
                Utils.emitEvent(response.getNetErrorCode(), 6800)
              } catch (error) {
                error = error as BusinessError ;
                console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
              }
              break;
            }
            case "WebNetErrorList_Static_020100": {
              let response = new web_webview.WebSchemeHandlerResponse();
              try {
                response.setNetErrorCode(WebNetErrorList.ERR_CACHE_OPEN_OR_CREATE_FAILURE)
                console.log("[schemeHandler] getNetErrorCode:" + response.getNetErrorCode())
                Utils.emitEvent(response.getNetErrorCode(), 6801)
              } catch (error) {
                error = error as BusinessError ;
                console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
              }
              break;
            }
            case "WebNetErrorList_Static_020200": {
              let response = new web_webview.WebSchemeHandlerResponse();
              try {
                response.setNetErrorCode(WebNetErrorList.ERR_INSECURE_RESPONSE)
                console.log("[schemeHandler] getNetErrorCode:" + response.getNetErrorCode())
                Utils.emitEvent(response.getNetErrorCode(), 6802)
              } catch (error) {
                error = error as BusinessError ;
                console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
              }
              break;
            }
            case "WebNetErrorList_Static_020300": {
              let response = new web_webview.WebSchemeHandlerResponse();
              try {
                response.setNetErrorCode(WebNetErrorList.ERR_NO_PRIVATE_KEY_FOR_CERT)
                console.log("[schemeHandler] getNetErrorCode:" + response.getNetErrorCode())
                Utils.emitEvent(response.getNetErrorCode(), 6803)
              } catch (error) {
                error = error as BusinessError ;
                console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
              }
              break;
            }
            case "WebNetErrorList_Static_020400": {
              let response = new web_webview.WebSchemeHandlerResponse();
              try {
                response.setNetErrorCode(WebNetErrorList.ERR_ADD_USER_CERT_FAILED)
                console.log("[schemeHandler] getNetErrorCode:" + response.getNetErrorCode())
                Utils.emitEvent(response.getNetErrorCode(), 6804)
              } catch (error) {
                error = error as BusinessError ;
                console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
              }
              break;
            }
            case "WebNetErrorList_Static_020500": {
              let response = new web_webview.WebSchemeHandlerResponse();
              try {
                response.setNetErrorCode(WebNetErrorList.ERR_INVALID_SIGNED_EXCHANGE)
                console.log("[schemeHandler] getNetErrorCode:" + response.getNetErrorCode())
                Utils.emitEvent(response.getNetErrorCode(), 6805)
              } catch (error) {
                error = error as BusinessError ;
                console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
              }
              break;
            }
            case "WebNetErrorList_Static_020600": {
              let response = new web_webview.WebSchemeHandlerResponse();
              try {
                response.setNetErrorCode(WebNetErrorList.ERR_INVALID_WEB_BUNDLE)
                console.log("[schemeHandler] getNetErrorCode:" + response.getNetErrorCode())
                Utils.emitEvent(response.getNetErrorCode(), 6806)
              } catch (error) {
                error = error as BusinessError ;
                console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
              }
              break;
            }
            case "WebNetErrorList_Static_020700": {
              let response = new web_webview.WebSchemeHandlerResponse();
              try {
                response.setNetErrorCode(WebNetErrorList.ERR_TRUST_TOKEN_OPERATION_FAILED)
                console.log("[schemeHandler] getNetErrorCode:" + response.getNetErrorCode())
                Utils.emitEvent(response.getNetErrorCode(), 6807)
              } catch (error) {
                error = error as BusinessError ;
                console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
              }
              break;
            }
            case "WebNetErrorList_Static_020800": {
              let response = new web_webview.WebSchemeHandlerResponse();
              try {
                response.setNetErrorCode(WebNetErrorList.ERR_TRUST_TOKEN_OPERATION_SUCCESS_WITHOUT_SENDING_REQUEST)
                console.log("[schemeHandler] getNetErrorCode:" + response.getNetErrorCode())
                Utils.emitEvent(response.getNetErrorCode(), 6808)
              } catch (error) {
                error = error as BusinessError ;
                console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
              }
              break;
            }
            case "WebNetErrorList_Static_020900": {
              let response = new web_webview.WebSchemeHandlerResponse();
              try {
                response.setNetErrorCode(WebNetErrorList.ERR_FTP_FAILED)
                console.log("[schemeHandler] getNetErrorCode:" + response.getNetErrorCode())
                Utils.emitEvent(response.getNetErrorCode(), 6809)
              } catch (error) {
                error = error as BusinessError ;
                console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
              }
              break;
            }
            case "WebNetErrorList_Static_021000": {
              let response = new web_webview.WebSchemeHandlerResponse();
              try {
                response.setNetErrorCode(WebNetErrorList.ERR_FTP_SERVICE_UNAVAILABLE)
                console.log("[schemeHandler] getNetErrorCode:" + response.getNetErrorCode())
                Utils.emitEvent(response.getNetErrorCode(), 6810)
              } catch (error) {
                error = error as BusinessError ;
                console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
              }
              break;
            }
            case "WebNetErrorList_Static_021100": {
              let response = new web_webview.WebSchemeHandlerResponse();
              try {
                response.setNetErrorCode(WebNetErrorList.ERR_FTP_TRANSFER_ABORTED)
                console.log("[schemeHandler] getNetErrorCode:" + response.getNetErrorCode())
                Utils.emitEvent(response.getNetErrorCode(), 6811)
              } catch (error) {
                error = error as BusinessError ;
                console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
              }
              break;
            }
            case "WebNetErrorList_Static_021200": {
              let response = new web_webview.WebSchemeHandlerResponse();
              try {
                response.setNetErrorCode(WebNetErrorList.ERR_FTP_FILE_BUSY)
                console.log("[schemeHandler] getNetErrorCode:" + response.getNetErrorCode())
                Utils.emitEvent(response.getNetErrorCode(), 6812)
              } catch (error) {
                error = error as BusinessError ;
                console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
              }
              break;
            }
            case "WebNetErrorList_Static_021300": {
              let response = new web_webview.WebSchemeHandlerResponse();
              try {
                response.setNetErrorCode(WebNetErrorList.ERR_FTP_SYNTAX_ERROR)
                console.log("[schemeHandler] getNetErrorCode:" + response.getNetErrorCode())
                Utils.emitEvent(response.getNetErrorCode(), 6813)
              } catch (error) {
                error = error as BusinessError ;
                console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
              }
              break;
            }
            case "WebNetErrorList_Static_021400": {
              let response = new web_webview.WebSchemeHandlerResponse();
              try {
                response.setNetErrorCode(WebNetErrorList.ERR_FTP_COMMAND_UNSUPPORTED)
                console.log("[schemeHandler] getNetErrorCode:" + response.getNetErrorCode())
                Utils.emitEvent(response.getNetErrorCode(), 6814)
              } catch (error) {
                error = error as BusinessError ;
                console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
              }
              break;
            }
            case "WebNetErrorList_Static_021500": {
              let response = new web_webview.WebSchemeHandlerResponse();
              try {
                response.setNetErrorCode(WebNetErrorList.ERR_FTP_BAD_COMMAND_SEQUENCE)
                console.log("[schemeHandler] getNetErrorCode:" + response.getNetErrorCode())
                Utils.emitEvent(response.getNetErrorCode(), 6815)
              } catch (error) {
                error = error as BusinessError ;
                console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
              }
              break;
            }
            case "WebNetErrorList_Static_021600": {
              let response = new web_webview.WebSchemeHandlerResponse();
              try {
                response.setNetErrorCode(WebNetErrorList.ERR_PKCS12_IMPORT_BAD_PASSWORD)
                console.log("[schemeHandler] getNetErrorCode:" + response.getNetErrorCode())
                Utils.emitEvent(response.getNetErrorCode(), 6816)
              } catch (error) {
                error = error as BusinessError ;
                console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
              }
              break;
            }
            case "WebNetErrorList_Static_021700": {
              let response = new web_webview.WebSchemeHandlerResponse();
              try {
                response.setNetErrorCode(WebNetErrorList.ERR_PKCS12_IMPORT_FAILED)
                console.log("[schemeHandler] getNetErrorCode:" + response.getNetErrorCode())
                Utils.emitEvent(response.getNetErrorCode(), 6817)
              } catch (error) {
                error = error as BusinessError ;
                console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
              }
              break;
            }
            case "WebNetErrorList_Static_021800": {
              let response = new web_webview.WebSchemeHandlerResponse();
              try {
                response.setNetErrorCode(WebNetErrorList.ERR_IMPORT_CA_CERT_NOT_CA)
                console.log("[schemeHandler] getNetErrorCode:" + response.getNetErrorCode())
                Utils.emitEvent(response.getNetErrorCode(), 6818)
              } catch (error) {
                error = error as BusinessError ;
                console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
              }
              break;
            }
            case "WebNetErrorList_Static_021900": {
              let response = new web_webview.WebSchemeHandlerResponse();
              try {
                response.setNetErrorCode(WebNetErrorList.ERR_IMPORT_CERT_ALREADY_EXISTS)
                console.log("[schemeHandler] getNetErrorCode:" + response.getNetErrorCode())
                Utils.emitEvent(response.getNetErrorCode(), 6819)
              } catch (error) {
                error = error as BusinessError ;
                console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
              }
              break;
            }
            case "WebNetErrorList_Static_022000": {
              let response = new web_webview.WebSchemeHandlerResponse();
              try {
                response.setNetErrorCode(WebNetErrorList.ERR_IMPORT_CA_CERT_FAILED)
                console.log("[schemeHandler] getNetErrorCode:" + response.getNetErrorCode())
                Utils.emitEvent(response.getNetErrorCode(), 6820)
              } catch (error) {
                error = error as BusinessError ;
                console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
              }
              break;
            }
            case "WebNetErrorList_Static_022100": {
              let response = new web_webview.WebSchemeHandlerResponse();
              try {
                response.setNetErrorCode(WebNetErrorList.ERR_IMPORT_SERVER_CERT_FAILED)
                console.log("[schemeHandler] getNetErrorCode:" + response.getNetErrorCode())
                Utils.emitEvent(response.getNetErrorCode(), 6821)
              } catch (error) {
                error = error as BusinessError ;
                console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
              }
              break;
            }
            case "WebNetErrorList_Static_022200": {
              let response = new web_webview.WebSchemeHandlerResponse();
              try {
                response.setNetErrorCode(WebNetErrorList.ERR_PKCS12_IMPORT_INVALID_MAC)
                console.log("[schemeHandler] getNetErrorCode:" + response.getNetErrorCode())
                Utils.emitEvent(response.getNetErrorCode(), 6822)
              } catch (error) {
                error = error as BusinessError ;
                console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
              }
              break;
            }
            case "WebNetErrorList_Static_022300": {
              let response = new web_webview.WebSchemeHandlerResponse();
              try {
                response.setNetErrorCode(WebNetErrorList.ERR_PKCS12_IMPORT_INVALID_FILE)
                console.log("[schemeHandler] getNetErrorCode:" + response.getNetErrorCode())
                Utils.emitEvent(response.getNetErrorCode(), 6823)
              } catch (error) {
                error = error as BusinessError ;
                console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
              }
              break;
            }
            case "WebNetErrorList_Static_022400": {
              let response = new web_webview.WebSchemeHandlerResponse();
              try {
                response.setNetErrorCode(WebNetErrorList.ERR_PKCS12_IMPORT_UNSUPPORTED)
                console.log("[schemeHandler] getNetErrorCode:" + response.getNetErrorCode())
                Utils.emitEvent(response.getNetErrorCode(), 6824)
              } catch (error) {
                error = error as BusinessError ;
                console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
              }
              break;
            }
            case "WebNetErrorList_Static_022500": {
              let response = new web_webview.WebSchemeHandlerResponse();
              try {
                response.setNetErrorCode(WebNetErrorList.ERR_KEY_GENERATION_FAILED)
                console.log("[schemeHandler] getNetErrorCode:" + response.getNetErrorCode())
                Utils.emitEvent(response.getNetErrorCode(), 6825)
              } catch (error) {
                error = error as BusinessError ;
                console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
              }
              break;
            }
            case "WebNetErrorList_Static_022600": {
              let response = new web_webview.WebSchemeHandlerResponse();
              try {
                response.setNetErrorCode(WebNetErrorList.ERR_PRIVATE_KEY_EXPORT_FAILED)
                console.log("[schemeHandler] getNetErrorCode:" + response.getNetErrorCode())
                Utils.emitEvent(response.getNetErrorCode(), 6826)
              } catch (error) {
                error = error as BusinessError ;
                console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
              }
              break;
            }
            case "WebNetErrorList_Static_022700": {
              let response = new web_webview.WebSchemeHandlerResponse();
              try {
                response.setNetErrorCode(WebNetErrorList.ERR_SELF_SIGNED_CERT_GENERATION_FAILED)
                console.log("[schemeHandler] getNetErrorCode:" + response.getNetErrorCode())
                Utils.emitEvent(response.getNetErrorCode(), 6827)
              } catch (error) {
                error = error as BusinessError ;
                console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
              }
              break;
            }
            case "WebNetErrorList_Static_022800": {
              let response = new web_webview.WebSchemeHandlerResponse();
              try {
                response.setNetErrorCode(WebNetErrorList.ERR_CERT_DATABASE_CHANGED)
                console.log("[schemeHandler] getNetErrorCode:" + response.getNetErrorCode())
                Utils.emitEvent(response.getNetErrorCode(), 6828)
              } catch (error) {
                error = error as BusinessError ;
                console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
              }
              break;
            }
            case "WebNetErrorList_Static_022900": {
              let response = new web_webview.WebSchemeHandlerResponse();
              try {
                response.setNetErrorCode(WebNetErrorList.ERR_CERT_VERIFIER_CHANGED)
                console.log("[schemeHandler] getNetErrorCode:" + response.getNetErrorCode())
                Utils.emitEvent(response.getNetErrorCode(), 6829)
              } catch (error) {
                error = error as BusinessError ;
                console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
              }
              break;
            }
            case "WebNetErrorList_Static_023000": {
              let response = new web_webview.WebSchemeHandlerResponse();
              try {
                response.setNetErrorCode(WebNetErrorList.ERR_DNS_MALFORMED_RESPONSE)
                console.log("[schemeHandler] getNetErrorCode:" + response.getNetErrorCode())
                Utils.emitEvent(response.getNetErrorCode(), 6830)
              } catch (error) {
                error = error as BusinessError ;
                console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
              }
              break;
            }
            case "WebNetErrorList_Static_023100": {
              let response = new web_webview.WebSchemeHandlerResponse();
              try {
                response.setNetErrorCode(WebNetErrorList.ERR_DNS_SERVER_REQUIRES_TCP)
                console.log("[schemeHandler] getNetErrorCode:" + response.getNetErrorCode())
                Utils.emitEvent(response.getNetErrorCode(), 6831)
              } catch (error) {
                error = error as BusinessError ;
                console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
              }
              break;
            }
            case "WebNetErrorList_Static_023200": {
              let response = new web_webview.WebSchemeHandlerResponse();
              try {
                response.setNetErrorCode(WebNetErrorList.ERR_DNS_SERVER_FAILED)
                console.log("[schemeHandler] getNetErrorCode:" + response.getNetErrorCode())
                Utils.emitEvent(response.getNetErrorCode(), 6832)
              } catch (error) {
                error = error as BusinessError ;
                console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
              }
              break;
            }
            case "WebNetErrorList_Static_023300": {
              let response = new web_webview.WebSchemeHandlerResponse();
              try {
                response.setNetErrorCode(WebNetErrorList.ERR_DNS_TIMED_OUT)
                console.log("[schemeHandler] getNetErrorCode:" + response.getNetErrorCode())
                Utils.emitEvent(response.getNetErrorCode(), 6833)
              } catch (error) {
                error = error as BusinessError ;
                console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
              }
              break;
            }
            case "WebNetErrorList_Static_023400": {
              let response = new web_webview.WebSchemeHandlerResponse();
              try {
                response.setNetErrorCode(WebNetErrorList.ERR_DNS_CACHE_MISS)
                console.log("[schemeHandler] getNetErrorCode:" + response.getNetErrorCode())
                Utils.emitEvent(response.getNetErrorCode(), 6834)
              } catch (error) {
                error = error as BusinessError ;
                console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
              }
              break;
            }
            case "WebNetErrorList_Static_023500": {
              let response = new web_webview.WebSchemeHandlerResponse();
              try {
                response.setNetErrorCode(WebNetErrorList.ERR_DNS_SEARCH_EMPTY)
                console.log("[schemeHandler] getNetErrorCode:" + response.getNetErrorCode())
                Utils.emitEvent(response.getNetErrorCode(), 6835)
              } catch (error) {
                error = error as BusinessError ;
                console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
              }
              break;
            }
            case "WebNetErrorList_Static_023600": {
              let response = new web_webview.WebSchemeHandlerResponse();
              try {
                response.setNetErrorCode(WebNetErrorList.ERR_DNS_SORT_ERROR)
                console.log("[schemeHandler] getNetErrorCode:" + response.getNetErrorCode())
                Utils.emitEvent(response.getNetErrorCode(), 6836)
              } catch (error) {
                error = error as BusinessError ;
                console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
              }
              break;
            }
            case "WebNetErrorList_Static_023700": {
              let response = new web_webview.WebSchemeHandlerResponse();
              try {
                response.setNetErrorCode(WebNetErrorList.ERR_DNS_SECURE_RESOLVER_HOSTNAME_RESOLUTION_FAILED)
                console.log("[schemeHandler] getNetErrorCode:" + response.getNetErrorCode())
                Utils.emitEvent(response.getNetErrorCode(), 6837)
              } catch (error) {
                error = error as BusinessError ;
                console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
              }
              break;
            }
            case "WebNetErrorList_Static_023800": {
              let response = new web_webview.WebSchemeHandlerResponse();
              try {
                response.setNetErrorCode(WebNetErrorList.ERR_DNS_NAME_HTTPS_ONLY)
                console.log("[schemeHandler] getNetErrorCode:" + response.getNetErrorCode())
                Utils.emitEvent(response.getNetErrorCode(), 6838)
              } catch (error) {
                error = error as BusinessError ;
                console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
              }
              break;
            }
            case "WebNetErrorList_Static_023900": {
              let response = new web_webview.WebSchemeHandlerResponse();
              try {
                response.setNetErrorCode(WebNetErrorList.ERR_DNS_REQUEST_CANCELED)
                console.log("[schemeHandler] getNetErrorCode:" + response.getNetErrorCode())
                Utils.emitEvent(response.getNetErrorCode(), 6839)
              } catch (error) {
                error = error as BusinessError ;
                console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
              }
              break;
            }
            case "WebNetErrorList_Static_024000": {
              let response = new web_webview.WebSchemeHandlerResponse();
              try {
                response.setNetErrorCode(WebNetErrorList.ERR_DNS_NO_MATCHING_SUPPORTED_ALPN)
                console.log("[schemeHandler] getNetErrorCode:" + response.getNetErrorCode())
                Utils.emitEvent(response.getNetErrorCode(), 6840)
              } catch (error) {
                error = error as BusinessError ;
                console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
              }
              break;
            }
          }
        })
      }

      Web({ src: "resource://rawfile/index.html", controller: this.controller })
        .javaScriptAccess(true)
        .geolocationAccess(true)
        .databaseAccess(true)
    }
  }
}
