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
struct WebSchemeHandlerResponse {
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
        Button("WebSchemeHandlerResponse").id('WebSchemeHandlerResponse').onClick(async () => {
          console.info("key==>" + this.str)
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
                Utils.emitEvent(response.getUrl(), 8806)
                console.log("[schemeHandler] getStatus:" + response.getStatus())
                Utils.emitEvent(response.getStatus(), 8808)
                console.log("[schemeHandler] getStatusText:" + response.getStatusText())
                Utils.emitEvent(response.getStatusText(), 8810)
                console.log("[schemeHandler] getMimeType:" + response.getMimeType())
                Utils.emitEvent(response.getMimeType(), 8812)
                console.log("[schemeHandler] getEncoding:" + response.getEncoding())
                Utils.emitEvent(response.getEncoding(), 8814)
                console.log("[schemeHandler] getHeaderByValue:" + response.getHeaderByName("header1"))
                Utils.emitEvent(response.getHeaderByName("header1"), 8816)
                console.log("[schemeHandler] getNetErrorCode:" + response.getNetErrorCode())
                Utils.emitEvent(response.getNetErrorCode(), 8818)
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