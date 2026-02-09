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

const EVENT_ID_SET_EMIT_KEY = 201640;

@Entry
@Component
struct webOnInterceptReqThree {
  controller: WebController = new WebController();
  responseweb: WebResourceResponse = new WebResourceResponse()
  heads: Header[] = new Array()
  @State str: string = "emitOnInterceptRequestThirdWebC";
  @State webdata: string = "<!DOCTYPE html>\n" +
    "<html>\n" +
    "<head>\n" +
    "<title>intercept test</title>\n" +
    "</head>\n" +
    "<body>\n" +
    "<h1>intercept test</h1>\n" +
    "</body>\n" +
    "</html>"
  @State isReceive: number = -1;
  @State isPageEnd: number = -1;
  @State isStart: number = -1;

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
    console.info("webOnInterceptReqThree page valueChangeCallBack");
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
        Button("web click").key('webOnInterceptReqThree').onClick(async () => {
          await Utils.waitForExist(()=>this.isReceive, 'webOnInterceptReqThreeIsReceive', 1, 1000);
          await Utils.waitForExist(()=>this.isPageEnd, 'webOnInterceptReqThreeIsPageEnd', 1, 1000);
          console.info("key==>" + this.str);
          this.isReceive = -1;
          switch (this.str) {
            case "emitOnInterceptRequestThirdWebC": {
              try {
                this.isPageEnd = -1;
                this.isStart = 1;
                this.controller.refresh();
                await Utils.waitForExist(()=>this.isPageEnd, 'refreshIsPageEnd', 1, 1000);
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              break;
            }
          }
        })
      }

      Web({ src: $rawfile('indexCopy.html'), controller: this.controller })
        .onInterceptRequest((event) => {
          console.log('url:' + event.request.getRequestUrl());
          let head1: Header = {
            headerKey: "Connection",
            headerValue: "keep-alive"
          };
          let head2: Header = {
            headerKey: "Cache-Control",
            headerValue: "no-cache"
          };
          let length = this.heads.push(head1);
          length = this.heads.push(head2);
          this.responseweb.setResponseHeader(this.heads);
          this.responseweb.setResponseData(this.webdata);
          this.responseweb.setResponseEncoding('utf-8');
          this.responseweb.setResponseMimeType('text/html');
          this.responseweb.setResponseCode(404);
          this.responseweb.setReasonMessage('OK');
          return this.responseweb;
        })
        .onHttpErrorReceive((event) => {
          console.log('url:' + event.request.getRequestUrl());
          console.log('isMainFrame:' + event.request.isMainFrame());
          console.log('isRedirect:' + event.request.isRedirect());
          console.log('isRequestGesture:' + event.request.isRequestGesture());
          console.log('getResponseData:' + event.response.getResponseData());
          console.log('getResponseEncoding:' + event.response.getResponseEncoding());
          console.log('getResponseMimeType:' + event.response.getResponseMimeType());
          console.log('getResponseCode:' + event.response.getResponseCode());
          if(this.isStart === 1) {
            Utils.emitEvent(event.response.getResponseCode(), 201650);
          }

          console.log('getReasonMessage:' + event.response.getReasonMessage());
          let result = event.request.getRequestHeader();
          console.log('The request header result size is ' + result.length);
          for (let i of result) {
            console.log('The request header key is : ' + i.headerKey + ' , value is : ' + i.headerValue);
          }
          let resph = event.response.getResponseHeader();
          console.log('The response header result size is ' + resph.length);
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