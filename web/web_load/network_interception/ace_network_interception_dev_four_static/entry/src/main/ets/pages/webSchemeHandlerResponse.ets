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

import {
  Entry,
  Component,
  Column,
  Row,
  Button,
  ClickEvent,
  Web,
} from '@ohos.arkui.component'
import webview from '@ohos.web.webview'
import events_emitter from '@ohos.events.emitter'
import Utils from '../../src/test/Utils.test';
import { BusinessError ,Callback, RecordData } from '@ohos.base'
import { Hypium } from '../../../hypium/index';
import { State } from '@ohos.arkui.stateManagement' // should be insert by ui-plugins
import { UIContext, Router } from '@ohos.arkui.UIContext'
import { WebNetErrorList } from '@ohos.web.netErrorList';
class StringFields {
  public str: string = '';
}


@Entry
@Component
struct WebSchemeHandlerResponse {
  stringObj: StringFields  = new StringFields ();
  @State str: string = ""
  controller: webview.WebviewController = new webview.WebviewController(undefined)
  schemeHandler: webview.WebSchemeHandler = new webview.WebSchemeHandler()

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
          Button("WebSchemeHandlerResponse").key('WebSchemeHandlerResponse').onClick((e: ClickEvent) => {
            let response = new webview.WebSchemeHandlerResponse();
            response.setUrl("http://www.example.com")
            response.setStatus(200)
            response.setStatusText("OK")
            response.setMimeType("text/html")
            response.setEncoding("utf-8")
            response.setHeaderByName("header1", "value1", false)
            response.setNetErrorCode(WebNetErrorList.NET_OK)
          console.info("key==>" +  this.stringObj.str)
            switch ( this.stringObj.str) {
            case "WebSchemeHandlerResponse_getUrl": {
              try {
                  console.log("[schemeHandler] getUrl:" + response.getUrl())
                  Utils.emitEvent(response.getUrl(), 8806)
              } catch (error) {
                error = error as BusinessError;
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              break;
            }

              case "WebSchemeHandlerResponse_getStatus": {
                try {
                  console.log("[schemeHandler] getStatus:" + response.getStatus())
                  Utils.emitEvent(response.getStatus(), 8808)
                } catch (error) {
                  error = error as BusinessError;
                  console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                }
                break;
              }

              case "WebSchemeHandlerResponse_getStatusText": {
                try {
                  console.log("[schemeHandler] getStatusText:" + response.getStatusText())
                  Utils.emitEvent(response.getStatusText(), 8810)
                } catch (error) {
                  error = error as BusinessError;
                  console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                }
                break;
              }

              case "WebSchemeHandlerResponse_getMimeType": {
                try {
                  console.log("[schemeHandler] getMimeType:" + response.getMimeType())
                  Utils.emitEvent(response.getMimeType(), 8812)
                } catch (error) {
                  error = error as BusinessError;
                  console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                }
                break;
              }

              case "WebSchemeHandlerResponse_getEncoding": {
                try {
                  console.log("[schemeHandler] getEncoding:" + response.getEncoding())
                  Utils.emitEvent(response.getEncoding(), 8814)
                } catch (error) {
                  error = error as BusinessError;
                  console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                }
                break;
              }

              case "WebSchemeHandlerResponse_getHeaderByName": {
                try {
                  console.log("[schemeHandler] getHeaderByValue:" + response.getHeaderByName("header1"))
                  Utils.emitEvent(response.getHeaderByName("header1"), 8816)
                } catch (error) {
                  error = error as BusinessError;
                  console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                }
                break;
              }

              case "WebSchemeHandlerResponse_getNetErrorCode": {
                try {
                  console.log("[schemeHandler] getNetErrorCode:" + response.getNetErrorCode())
                  Utils.emitEvent(response.getNetErrorCode(), 8818)
                } catch (error) {
                  error = error as BusinessError;
                  console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                }
                break;
              }

              case 'emitonSwitchNextPage': {
                let uiContext: UIContext = this.getUIContext();
                let router: Router = uiContext.getRouter();
                router.pushUrl({ url: 'pages/webHttpBodyStream' })
                console.log('push URL success')
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