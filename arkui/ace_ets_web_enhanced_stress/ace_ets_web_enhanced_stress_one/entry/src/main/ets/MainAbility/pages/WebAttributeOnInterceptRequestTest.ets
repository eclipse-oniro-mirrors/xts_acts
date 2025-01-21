/*
 * Copyright (c) 2023 Huawei Device Co., Ltd.
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

@Entry
@Component
struct WebAttributeOnInterceptRequestTest {
  controller: webView.WebviewController = new webView.WebviewController();
  @State str: string = "";
  @State callBackId: number = 0;
  @State stressTimes: number = 0;
  @State successTimes: number = 0;
  @State buttonKey: string = '';
  responseWeb: WebResourceResponse = new WebResourceResponse()
  heads: Header[] = new Array()
  webData: string = "<!DOCTYPE html>\n" +
  "<html>\n" +
  "<head>\n" +
  "<title>intercept test</title>\n" +
  "</head>\n" +
  "<body>\n" +
  "<h1>intercept test</h1>\n" +
  "<script>" +
  "function getTitle(){ return document.write(document.title); }" +
  "gettitle()" +
  "</script>" +
  "</body>\n" +
  "</html>"
  @State responseCode: number = 200

  onPageShow() {
    Utils.registerEventPage((eventData: events_emitter.EventData) => {
      if (eventData.data) {
        this.str = eventData.data.CASE_NAME;
        this.callBackId = eventData.data.CALL_BACK_ID;
        this.stressTimes = eventData.data.STRESS_TIMES;
        this.buttonKey = eventData.data.BUTTON_KEY
      }
    })
  }

  onPageHide() {
    Utils.unRegisterEventPage()
  }

  build() {
    Row() {
      Column() {
        Button(this.buttonKey)
          .key(this.buttonKey)
          .onClick(async () => {
            console.info("key==>" + this.str)
            switch (this.str) {
              case 'testWebAttributeOnInterceptRequest001': {
                try {
                  this.controller.loadUrl($rawfile('second.html'));
                } catch (error) {
                  console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                }
                break;
              }
              case "testWebAttributeOnInterceptRequest002": {
                try {
                  this.responseCode = 404
                  this.controller.loadUrl($rawfile('second.html'))
                } catch (error) {
                  console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                }
                break;
              }
            }
          })

        Web({ src: '', controller: this.controller })
          .javaScriptAccess(true)
          .geolocationAccess(true)
          .databaseAccess(true)
          .onInterceptRequest(() => {
            setTimeout(() => {
              this.successTimes++
              Utils.stressingLog('WebAttribute.onInterceptRequest()', this.successTimes, this.stressTimes)
              if (this.successTimes < this.stressTimes) {
                try {
                  this.controller.loadUrl($rawfile('second.html'));
                } catch (error) {
                  console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                  Utils.emitEvent(false, this.callBackId)
                }
              } else {
                Utils.emitEvent(true, this.callBackId)
              }
            }, 50)

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
      }
      .width('100%')
    }
    .height('100%')
  }
}