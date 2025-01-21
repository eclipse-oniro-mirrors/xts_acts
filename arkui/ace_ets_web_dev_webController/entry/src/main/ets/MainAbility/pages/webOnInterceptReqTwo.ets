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

@Entry
@Component
struct webOnInterceptReqTwo {
  controller: WebController = new WebController();
  responseweb: WebResourceResponse = new WebResourceResponse()
  heads: Header[] = new Array()
  @State str: string = "emitOnInterceptRequestSecondWebC";
  @State webdata: string = "<!DOCTYPE html>\n" +
    "<html>\n" +
    "<head>\n" +
    "<title>intercept test</title>\n" +
    "</head>\n" +
    "<body>\n" +
    "<h1>intercept test</h1>\n" +
    "</body>\n" +
    "</html>"
  @State title: string = "test";

  onPageShow() {
    let valueChangeEvent: events_emitter.InnerEvent = {
      eventId: 10,
      priority: events_emitter.EventPriority.LOW
    }
    events_emitter.on(valueChangeEvent, this.valueChangeCallBack)
  }

  private valueChangeCallBack = (eventData: ESObject) => {
    console.info("webOnInterceptReqTwo page valueChangeCallBack");
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
        Button("web click").key('webOnInterceptReqTwo').onClick(async () => {
          console.info("key==>" + this.str)
          switch (this.str) {
            case "emitOnInterceptRequestSecondWebC": {
              try {
                this.controller.runJavaScript({
                  script: "test()", callback: (res) => {
                    Utils.emitEvent(this.title, 408);
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
          this.responseweb.setResponseCode(200);
          this.responseweb.setReasonMessage('OK');
          return this.responseweb;
        })
        .onTitleReceive((event) => {
          console.log('title:' + event.title);
          this.title = event.title;
          Utils.emitEvent(this.title, 408);
        })
    }
  }
}