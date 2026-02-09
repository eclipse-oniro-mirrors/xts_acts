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

import webView from '@ohos.web.webview';
import Utils from '../../test/Utils';
import events_emitter from '@ohos.events.emitter';
import { waitForExist } from '../../test/WaitTest.test';

@Entry
@Component
struct WebOnHttpErrorReceive {
  controller: webView.WebviewController = new webView.WebviewController();
  @State str: string = ""
  @State httpErrorReceive: number = 0
  @State responseCode: number = 200
  heads: Header[] = new Array()
  responseWeb: WebResourceResponse = new WebResourceResponse()
  webData: string = "<!DOCTYPE html>\n" +
    "<html>\n" +
    "<head>\n" +
    "<title>intercept test</title>\n" +
    "</head>\n" +
    "<body>\n" +
    "<h1>intercept test</h1>\n" +
    "</body>\n" +
    "</html>"
  @State title: string = "test";
  @State isReceive:number = -1

  onPageShow() {
    let valueChangeEvent: events_emitter.InnerEvent = {
      eventId: 141701,
      priority: events_emitter.EventPriority.LOW
    }
    events_emitter.on(valueChangeEvent, this.valueChangeCallBack)
  }

  onPageHide() {
    events_emitter.off(141701)
  }

  private valueChangeCallBack = (eventData: events_emitter.EventData) => {
    console.info("web page valueChangeCallBack");
    if (eventData != null) {
      console.info("valueChangeCallBack:" + JSON.stringify(eventData));
      if (eventData.data != null && eventData.data.ACTION != null) {
        this.str = eventData.data.ACTION;
        this.isReceive = 0
      }
    }
  }

  build() {
    Row() {
      Column() {
        Button("WebOnHttpErrorReceiveTestButton")
          .key('WebOnHttpErrorReceiveTestButton')
          .onClick(async () => {
            await waitForExist(()=>this.isReceive, this.str, 0);
            this.isReceive = -1
            console.info("key==>" + this.str)
            switch (this.str) {
              case "testOnHttpErrorReceive002": {
                try {
                  this.responseCode = 204
                  this.controller.loadUrl("resource://rawfile/index.html")
                  await waitForExist(()=>this.httpErrorReceive, this.str, 0);
                  Utils.emitEvent(this.httpErrorReceive, 141710);
                } catch (error) {
                  console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                }
                break;
              }
              case "testOnHttpErrorReceive003": {
                try {
                  this.responseCode = 301
                  this.controller.loadUrl("resource://rawfile/index.html")
                  await waitForExist(()=>this.httpErrorReceive, this.str, 0);
                  Utils.emitEvent(this.httpErrorReceive, 141720);
                } catch (error) {
                  console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                }
                break;
              }
              case "testOnHttpErrorReceive004": {
                try {
                  this.responseCode = 500
                  this.controller.loadUrl("resource://rawfile/index.html")
                  await waitForExist(()=>this.httpErrorReceive, this.str, 500);
                  Utils.emitEvent(this.httpErrorReceive, 141730);
                } catch (error) {
                  console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
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
          .onInterceptRequest((event) => {
            if (event) {
              console.log('url:' + event.request.getRequestUrl())
            }

            let head1: Header = {
              headerKey: "Connection",
              headerValue: "keep-alive"
            }
            let head2: Header = {
              headerKey: "Cache-Control",
              headerValue: "no-cache"
            }
            this.heads.push(head1)
            this.heads.push(head2)
            this.responseWeb.setResponseHeader(this.heads)
            this.responseWeb.setResponseData(this.webData)
            this.responseWeb.setResponseEncoding('utf-8')
            this.responseWeb.setResponseMimeType('text/html')
            this.responseWeb.setResponseCode(this.responseCode)
            this.responseWeb.setReasonMessage('OK')

            return this.responseWeb
          })
          .onTitleReceive((event) => {
            if (event) {
              console.log('title:' + event.title);
              this.title = event.title
            }
          })
          .onHttpErrorReceive((event) => {
            console.info("isHttpErrorReceive==>")
            if (event) {
              this.httpErrorReceive = event.response.getResponseCode()
            }
          })
      }
      .width('100%')
    }

    .height('100%')
  }
}