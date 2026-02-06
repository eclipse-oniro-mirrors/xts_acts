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
import Utils from '../../test/Utils.test';
import web_webview from '@ohos.web.webview';
import { WebNetErrorList } from '@ohos.web.netErrorList'
import { BusinessError } from '@ohos.base';

const EVENT_ID_SET_EMIT_KEY = 202920;

@Entry
@Component
struct WebSchemeHandlerResponse {
  @State str: string = ""
  @State isReceive: number = -1;
  @State isPageEnd: number = -1;
  controller: web_webview.WebviewController = new web_webview.WebviewController()
  schemeHandler: web_webview.WebSchemeHandler = new web_webview.WebSchemeHandler()

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

  private valueChangeCallBack = (eventData: events_emitter.EventData) => {
    console.info("web page valueChangeCallBack");
    if (eventData != null) {
      console.info("valueChangeCallBack:" + JSON.stringify(eventData));
      if (eventData.data != null && eventData.data.ACTION != null) {
        this.str = eventData.data.ACTION;
        this.isReceive = 1;
      }
    }
  }

  build() {
    Column() {
      Row() {
        Button("WebSchemeHandlerResponse").id('WebSchemeHandlerResponse').onClick(async () => {
          await Utils.waitForExist(()=>this.isReceive, 'WebSchemeHandlerResponseIsReceive', 1, 1000);
          await Utils.waitForExist(()=>this.isPageEnd, 'WebSchemeHandlerResponseIsPageEnd', 1, 1000);
          console.info("key==>" + this.str);
          this.isReceive = -1;
          switch (this.str) {
            case "WebSchemeHandlerResponse0100": {
              let response = new web_webview.WebSchemeHandlerResponse();
              try {
                response.setUrl("http://www.example.com")
                response.setStatus(200)
                response.setStatusText("OK")
                response.setMimeType("text/html")
                response.setEncoding("utf-8")
                response.setHeaderByName("header1", "value1", false)
                response.setNetErrorCode(WebNetErrorList.NET_OK)
                console.log("[schemeHandler] getUrl:" + response.getUrl())
                Utils.emitEvent(response.getUrl() + '|' + String(response.getStatus()) + '|' + response.getStatusText() +
                  '|' + response.getMimeType() + '|' + response.getEncoding() + '|' + response.getHeaderByName("header1") +
                  '|' + String(response.getNetErrorCode()), 202930);
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
        .onPageEnd((event) => {
          if (event) {
            this.isPageEnd = 1;
            console.log("onPageEnd==>")
          }
        })
    }
  }
}