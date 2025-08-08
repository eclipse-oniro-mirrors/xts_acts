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

import events_emitter from '@ohos.events.emitter';
import Utils from '../../test/Utils';
import web_webview from '@ohos.web.webview';
import business_error from '@ohos.base';
import buffer from '@ohos.buffer'
import { WebNetErrorList } from '@ohos.web.netErrorList'
import { BusinessError } from '@ohos.base';


@Entry
@Component
struct WebNetError {
  @State str: string = ""
  controller: web_webview.WebviewController = new web_webview.WebviewController()
  schemeHandler: web_webview.WebSchemeHandler = new web_webview.WebSchemeHandler()

  onPageShow() {
    let valueChangeEvent: events_emitter.InnerEvent = {
      eventId: 10,
      priority: events_emitter.EventPriority.LOW
    }
    events_emitter.on(valueChangeEvent, this.valueChangeCallBack)
  }

  onPageHide() {
    events_emitter.off(10)
  }

  private valueChangeCallBack = (eventData: events_emitter.EventData) => {
    console.info("web page valueChangeCallBack");
    if (eventData != null) {
      console.info("valueChangeCallBack:" + JSON.stringify(eventData));
      if (eventData.data != null && eventData.data.ACTION != null) {
        this.str = eventData.data.ACTION;
      }
    }
  }

  build() {
    Column() {
      Row() {
        Button("WebNetErrorList").id('WebSchemeHandlerResponse').onClick(async () => {
          console.info("key==>" + this.str)
          switch (this.str) {
            case "WebNetErrorList_06000": {
              let response = new web_webview.WebSchemeHandlerResponse();
              try {
                response.setNetErrorCode(WebNetErrorList.ERR_MANDATORY_PROXY_CONFIGURATION_FAILED)
                console.log("[schemeHandler] getNetErrorCode:" + response.getNetErrorCode())
                Utils.emitEvent(response.getNetErrorCode(), 6659)
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
                Utils.emitEvent(response.getNetErrorCode(), 6676)
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
                Utils.emitEvent(response.getNetErrorCode(), 6736)
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
                Utils.emitEvent(response.getNetErrorCode(), 6746)
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
                Utils.emitEvent(response.getNetErrorCode(), 6808)
              } catch (error) {
                console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
              }
              break;
            }
          }
        })
      }

      Web({ src: 'https://www.example.com', controller: this.controller })
        .javaScriptAccess(true)
        .domStorageAccess(true)
    }
  }
}