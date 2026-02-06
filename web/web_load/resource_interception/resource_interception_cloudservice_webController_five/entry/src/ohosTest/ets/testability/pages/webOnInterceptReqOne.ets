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

const EVENT_ID_SET_EMIT_KEY = 201620;

@Entry
@Component
struct webOnInterceptReqOne {
  controller: WebController = new WebController();
  responseweb: WebResourceResponse = new WebResourceResponse()
  heads: Header[] = new Array()
  @State str: string = 'emitOnInterceptRequestWebC';
  @State webdata: string = '<!DOCTYPE html>\n' +
    '<html>\n' +
    '<head>\n' +
    '<title>intercept test</title>\n' +
    '</head>\n' +
    '<body>\n' +
    '<h1>intercept test</h1>\n' +
    '</body>\n' +
    '</html>'
  @State title: string = 'test';
  @State isComplete: number = -1;
  @State isOnInterceptRequestWebC: boolean = false;
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
    console.info('webOnInterceptReqOne page valueChangeCallBack');
    if (eventData != null) {
      console.info('valueChangeCallBack:' + JSON.stringify(eventData));
      if (eventData.data.ACTION != null) {
        this.str = eventData.data.ACTION;
        this.isReceive = 1;
      }
    }
  }

  build() {
    Column() {
      Row() {
        Button('web click').key('webOnInterceptReqOne').onClick(async () => {
          await Utils.waitForExist(()=>this.isReceive, 'webOnInterceptReqOneIsReceive', 1, 1000);
          await Utils.waitForExist(()=>this.isPageEnd, 'webOnInterceptReqOneIsPageEnd', 1, 1000);
          console.info('key==>' + this.str)
          this.isReceive = -1;
          switch (this.str) {
            case 'emitOnInterceptRequestWebC': {
              try {
                this.isComplete = -1;
                this.isOnInterceptRequestWebC = true;
                this.controller.loadUrl({ url: 'resource://rawfile/indexCopy.html' });
                await Utils.waitForExist(()=>this.isComplete, 'loadUrlIsPageEnd', 1, 1000);
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              this.controller.runJavaScript({
                script: 'test()', callback: (res) => {
                  if ((this.title).includes('indexCopy')) {
                    this.title = 'success'
                  }
                  Utils.emitEvent(this.title, 201630);
                }
              })
              break;
            }
          }
        })
      }

      Web({ src: $rawfile('indexCopy.html'), controller: this.controller })
        .onInterceptRequest((event) => {
          console.log('url:' + event.request.getRequestUrl());
          let head1: Header = {
            headerKey: 'Connection',
            headerValue: 'keep-alive'
          };
          let head2: Header = {
            headerKey: 'Cache-Control',
            headerValue: 'no-cache'
          };
          let length = this.heads.push(head1);
          length = this.heads.push(head2);
          this.responseweb.setResponseHeader(this.heads);
          this.responseweb.setResponseEncoding('utf-8');
          this.responseweb.setResponseMimeType('text/html');
          this.responseweb.setResponseCode(200);
          this.responseweb.setReasonMessage('OK');
          return this.responseweb;
        })
        .onTitleReceive((event) => {
          console.log('title:' + event.title);
          this.title = event.title;
        })
        .onPageBegin((event) => {
            console.log('onPageBegin ==>' + event.url);
        })
        .onPageEnd((event) => {
            console.log('onPageEnd ==>' + event.url);
            this.isPageEnd = 1;
            if(this.isOnInterceptRequestWebC) {
              this.isComplete = 1
            }
        })
    }
  }
}