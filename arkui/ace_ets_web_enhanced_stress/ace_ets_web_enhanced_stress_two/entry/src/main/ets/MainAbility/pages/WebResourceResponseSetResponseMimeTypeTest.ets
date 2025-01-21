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
struct WebResourceResponseSetResponseMimeTypeTest {
  controller: webView.WebviewController = new webView.WebviewController();
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
  @State setResponseIsReady: boolean = true
  @State setResponseCode: number = 403
  @State ports: webView.WebMessagePort[] = [];
  @State str: string = ""
  @State buttonKey: string = '';
  @State stressTimes: number = 0;
  @State successTimes: number = 0;
  @State callBackId: number = 0;
  @State javaScriptAccess: boolean = true;
  @State databaseAccess: boolean = true;
  @State fileAccess: boolean = true;
  @State domStorageAccess: boolean = false;
  @State imageAccess: boolean = true;
  @State onlineImageAccess: boolean = true;
  @State test: boolean = false

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
              case "testWebResourceResponseSetResponseMimeType001": {
                try {
                  this.test = true
                  this.controller.loadUrl('http://1.1.1.123/index.html');
                } catch (error) {
                  console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                }
                break;
              }
            }
          })

        Web({ src: $rawfile('index.html'), controller: this.controller })
          .javaScriptAccess(this.javaScriptAccess)
          .fileAccess(this.fileAccess)
          .imageAccess(this.imageAccess)
          .domStorageAccess(this.domStorageAccess)
          .onlineImageAccess(this.onlineImageAccess)
          .databaseAccess(this.databaseAccess)
          .onInterceptRequest((event) => {
            if (event) {
              console.log('url:' + event.request.getRequestUrl())
              if (this.test) {
                try {
                  for (let i = 0; i < this.stressTimes; i++) {
                    this.responseWeb.setResponseMimeType('text/html')
                    Utils.stressingLog('WebResourceResponse.setResponseMimeType()', i + 1, this.stressTimes)
                  }
                  Utils.emitEvent(true, this.callBackId)
                } catch (error) {
                  console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                  Utils.emitEvent(false, this.callBackId)
                }
                this.test = false
              }
            }
            return this.responseWeb
          })
      }
      .width('100%')
    }
    .height('100%')
  }
}