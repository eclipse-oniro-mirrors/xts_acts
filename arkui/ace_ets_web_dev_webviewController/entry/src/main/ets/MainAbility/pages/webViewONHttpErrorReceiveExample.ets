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
import AbilityDelegatorRegistry from '@ohos.application.abilityDelegatorRegistry';
import { Hypium } from '@ohos/hypium';
import testsuite from '../../test/List.test';
import Utils from '../../test/Utils';
import UIAbility from '@ohos.app.ability.UIAbility';
import web_webview from '@ohos.web.webview';

@Entry
@Component
struct webViewONHttpErrorReceiveExample {
  controller: web_webview.WebviewController = new web_webview.WebviewController();
  responseweb: WebResourceResponse = new WebResourceResponse()
  heads: Header[] = new Array()
  @State webdata: string = "<!DOCTYPE html>\n" +
    "<html>\n" +
    "<head>\n" +
    "<title>intercept test</title>\n" +
    "</head>\n" +
    "<body>\n" +
    "<h1>intercept test</h1>\n" +
    "</body>\n" +
    "</html>"
  @State str: string = "emitOnHttpErrorReceiveByExample";
  @State javaScriptAccess: boolean = true;
  @State fileAccess: boolean = true;
  @State domStorageAccess: boolean = false;
  @State imageAccess: boolean = true;
  @State onlineImageAccess: boolean = true;
  @State databaseAccess: boolean = true;
  @State userAgent: string = "Mozilla/5.0 (X11; Linux aarch64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.88 Mobile Safari/537.36";
  @State title: string = "test";

  onPageShow() {
    let valueChangeEvent: events_emitter.InnerEvent = {
      eventId: 10,
      priority: events_emitter.EventPriority.LOW
    }
    events_emitter.on(valueChangeEvent, this.valueChangeCallBack)
  }

  private valueChangeCallBack = (eventData: events_emitter.EventData) => {
    console.info("webViewONHttpErrorReceiveExample page valueChangeCallBack");
    if (eventData != null) {
      console.info("valueChangeCallBack:" + JSON.stringify(eventData));
      if (eventData.data.ACTION != null) {
        this.str = eventData.data.ACTION;
      }
    }
  }

  build() {
    Column() {
      Row() {
        Button("onHttpErrorTest").key('webViewONHttpErrorReceiveExample').onClick(() => {
          console.info("key==>" + this.str)
          switch (this.str) {
            case "emitOnHttpErrorReceiveByExample": {
              try {
                this.title = this.controller.getTitle();
                console.log("title of this page: " + this.title);
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              this.controller.runJavaScript("test()", (res) => {
                Utils.emitEvent(this.title, 392)
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
        .onInterceptRequest((event) => {
          console.log('url:' + event.request.getRequestUrl())
          let head1: Header = {
            headerKey: "Connection",
            headerValue: "keep-alive"
          }
          let head2: Header = {
            headerKey: "Cache-Control",
            headerValue: "no-cache"
          }
          let length = this.heads.push(head1)
          length = this.heads.push(head2)
          this.responseweb.setResponseHeader(this.heads)
          this.responseweb.setResponseData(this.webdata)
          this.responseweb.setResponseEncoding('utf-8')
          this.responseweb.setResponseMimeType('text/html')
          this.responseweb.setResponseCode(200)
          this.responseweb.setReasonMessage('OK')
          this.responseweb.setResponseIsReady(true)
          return this.responseweb
        })
        .onHttpErrorReceive((event) => {
          console.log('url:' + event.request.getRequestUrl());
          console.log('isMainFrame:' + event.request.isMainFrame());
          console.log('isRedirect:' + event.request.isRedirect());
          console.log('isRequestGesture:' + event.request.isRequestGesture());
          console.log('getRequestMethod:' + event.request.getRequestMethod());
          console.log('getResponseData:' + JSON.stringify(event.response.getResponseData()));
          console.log('getResponseEncoding:' + event.response.getResponseEncoding());
          console.log('getResponseMimeType:' + event.response.getResponseMimeType());
          console.log('getResponseCode:' + event.response.getResponseCode());
          console.log('getReasonMessage:' + event.response.getReasonMessage());
          let result = event.request.getRequestHeader()
          console.log('The request header result size is ' + result.length)
          for (let i of result) {
            console.log('The request header key is : ' + i.headerKey + ' , value is : ' + i.headerValue);
          }
          let resph = event.response.getResponseHeader()
          console.log('The response header result size is ' + resph.length)
          for (let i of resph) {
            console.log('The response header key is : ' + i.headerKey + ' , value is : ' + i.headerValue);
          }
        })
    }
  }
}