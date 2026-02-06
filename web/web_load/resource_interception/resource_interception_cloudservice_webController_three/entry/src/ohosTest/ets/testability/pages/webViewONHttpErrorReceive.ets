/**
 * Copyright (c) 2023 iSoftStone Information Technology (Group) Co.,Ltd.
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

const EVENT_ID_SET_EMIT_KEY = 202070;

@Entry
@Component
struct webViewONHttpErrorReceive {
  controller: web_webview.WebviewController = new web_webview.WebviewController();
  @State str: string = "emitOnHttpErrorReceiveFixedUserAgent";
  @State javaScriptAccess: boolean = true;
  @State fileAccess: boolean = true;
  @State domStorageAccess: boolean = false;
  @State imageAccess: boolean = true;
  @State onlineImageAccess: boolean = true;
  @State databaseAccess: boolean = true;
  @State userAgent: string = "Mozilla/5.0 (X11; Linux aarch64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.88 Mobile Safari/537.36";
  @State title: string = "test";
  @State requestKey: string = "";
  @State requestValue: string = "";
  @State responseKey: string = "";
  @State responseValue: string = "";
  @State isReceive: number = -1;

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
    console.info("webViewONHttpErrorReceive page valueChangeCallBack");
    if (eventData != null) {
      console.info("valueChangeCallBack:" + JSON.stringify(eventData));
      if (eventData.data?.ACTION != null) {
        this.str = eventData.data?.ACTION;
        this.isReceive = 1;
      }
    }
  }

  build() {
    Column() {
      Row() {
        Button("onHttpErrorTest").key('webViewONHttpErrorReceive').onClick(async () => {
          await Utils.waitForExist(()=>this.isReceive, 'webViewONHttpErrorReceiveIsReceive', 1, 1000);
          console.info("key==>" + this.str);
          this.isReceive = -1;
          switch (this.str) {
            case "emitOnHttpErrorReceiveFixedUserAgent": {
              try {
                this.controller.loadUrl("http://1.1.1.123/index.html");
                this.title = this.controller.getTitle();
                console.log("title of this page: " + this.title);
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              this.controller.runJavaScript("test()", (res) => {
                Utils.emitEvent(this.title, 202220)
              })
              break;
            }
          }
        })
      }

      Web({ src: 'http://1.1.1.123/index.html', controller: this.controller })
        .javaScriptAccess(this.javaScriptAccess)
        .fileAccess(this.fileAccess)
        .imageAccess(this.imageAccess)
        .domStorageAccess(this.domStorageAccess)
        .onlineImageAccess(this.onlineImageAccess)
        .databaseAccess(this.databaseAccess)
        .userAgent(this.userAgent)
        .onHttpErrorReceive((event) => {
          console.log('url:' + event.request.getRequestUrl());
          Utils.emitEvent(event.request.getRequestUrl(), 202080);
          console.log('isMainFrame:' + event.request.isMainFrame());
          Utils.emitEvent(event.request.isMainFrame(), 202090);
          console.log('isRedirect:' + event.request.isRedirect());
          Utils.emitEvent(event.request.isRedirect(), 202100);
          console.log('isRequestGesture:' + event.request.isRequestGesture());
          Utils.emitEvent(event.request.isRequestGesture(), 202110);
          console.log('getRequestMethod:' + event.request.getRequestMethod());
          Utils.emitEvent(event.request.getRequestMethod(), 202120);
          console.log('getResponseData:' + JSON.stringify(event.response.getResponseData()));
          Utils.emitEvent(JSON.stringify(event.response.getResponseData()), 202130);
          console.log('getResponseEncoding:' + event.response.getResponseEncoding());
          Utils.emitEvent(event.response.getResponseEncoding(), 202140);
          console.log('getResponseMimeType:' + event.response.getResponseMimeType());
          Utils.emitEvent(event.response.getResponseMimeType(), 202150);
          console.log('getResponseCode:' + event.response.getResponseCode());
          Utils.emitEvent(event.response.getResponseCode(), 202160);
          console.log('getReasonMessage:' + event.response.getReasonMessage());
          Utils.emitEvent(event.response.getReasonMessage(), 202170);
          let result = event.request.getRequestHeader()
          console.log('The request header result size is ' + result.length)
          for (let i of result) {
            console.log('The request header key is : ' + i.headerKey + ' , value is : ' + i.headerValue);
            this.requestKey = i.headerKey;
            this.requestValue = i.headerValue;
          }
          console.log('The request header last result is ' + this.requestKey + this.requestValue);
          Utils.emitEvent(this.requestKey, 202180);
          Utils.emitEvent(this.requestValue, 202190);
          let resph = event.response.getResponseHeader()
          console.log('The response header result size is ' + resph.length)
          for (let i of resph) {
            console.log('The response header key is : ' + i.headerKey + ' , value is : ' + i.headerValue);
            this.responseKey = i.headerKey;
            this.responseValue = i.headerValue;
          }
          console.log('The response header last result is ' + this.responseKey + this.responseValue);
          Utils.emitEvent(this.responseKey, 202200);
          Utils.emitEvent(this.responseValue, 202210);
        })
    }
  }
}