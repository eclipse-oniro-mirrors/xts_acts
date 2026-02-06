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

const EVENT_ID_SET_EMIT_KEY = 201560;

@Entry
@Component
struct webONHttpErrorReceiveIframe {
  controller: WebController = new WebController();
  @State str: string = "emitOnHttpErrorReceiveByIframeHtmlWebc";
  @State javaScriptAccess: boolean = true;
  @State fileAccess: boolean = true;
  @State domStorageAccess: boolean = false;
  @State imageAccess: boolean = true;
  @State onlineImageAccess: boolean = true;
  @State databaseAccess: boolean = true;
  @State userAgent: string = "Mozilla/5.0 (X11; Linux aarch64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.88 Mobile Safari/537.36";
  @State title: string = "test";
  @State isReceive: number = -1;
  @State isPageEnd: number = -1;

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

  private valueChangeCallBack = (eventData: ESObject) => {
    console.info("webONHttpErrorReceiveIframe page valueChangeCallBack");
    if (eventData != null) {
      console.info("valueChangeCallBack:" + JSON.stringify(eventData));
      if (eventData.data.ACTION != null) {
        this.str = eventData.data.ACTION;
        this.isReceive = 1;
      }
    }
  }

  build() {
    Column() {
      Row() {
        Button("onHttpErrorTest").key('webONHttpErrorReceiveIframe').onClick(async () => {
          await Utils.waitForExist(()=>this.isReceive, 'webONHttpErrorReceiveIframeIsReceive', 1, 1000);
          await Utils.waitForExist(()=>this.isPageEnd, 'webONHttpErrorReceiveIframeIsPageEnd', 1, 1000);
          console.info("key==>" + this.str)
          this.isReceive = -1;
          switch (this.str) {
            case "emitOnHttpErrorReceiveByIframeHtmlWebc": {
              try {
                this.controller.runJavaScript({
                  script: "gettitle()", callback: (result) => {
                    this.title = JSON.parse(result)
                    console.log(`The gettitle() return value is: ${result}`);
                    Utils.emitEvent(this.title, 201580);
                  }
                })
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              break;
            }
          }
        })
      }

      Web({ src: $rawfile('indexSix.html'), controller: this.controller })
        .javaScriptAccess(this.javaScriptAccess)
        .fileAccess(this.fileAccess)
        .imageAccess(this.imageAccess)
        .domStorageAccess(this.domStorageAccess)
        .onlineImageAccess(this.onlineImageAccess)
        .databaseAccess(this.databaseAccess)
        .userAgent(this.userAgent)
        .onHttpErrorReceive((event) => {
          console.log('url:' + event.request.getRequestUrl());
          console.log('isMainFrame:' + event.request.isMainFrame());
          Utils.emitEvent(event.request.isMainFrame(), 201570);
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
        .onPageEnd((event) => {
          console.log('onPageEnd ==>' + event.url);
          this.isPageEnd = 1;
        })
    }
  }
}