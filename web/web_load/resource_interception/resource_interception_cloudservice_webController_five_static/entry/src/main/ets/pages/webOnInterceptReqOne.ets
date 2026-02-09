/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the 'License');
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an 'AS IS' BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import webview from '@ohos.web.webview'
import { State } from '@ohos.arkui.stateManagement'
import { Button, ClickEvent, Column, Component, Entry, Row, Text, Web, Header,WebResourceResponse} from '@ohos.arkui.component'
import events_emitter from '@ohos.events.emitter'
import { BusinessError, Callback, RecordData } from '@ohos.base'
import { Hypium } from '../../../hypium';
import Utils from '../../src/test/Utils.test';

class StringFields {
  public str: string = '';
}

@Entry
@Component
struct webOnInterceptReqOne {
  stringObj: StringFields = new StringFields();
  controller: webview.WebviewController = new webview.WebviewController(undefined);
  responseweb: WebResourceResponse = new WebResourceResponse()
  @State str: string = ""
  @State title: string = 'test';
  @State isComplete: number = -1;
  @State isOnInterceptRequestWebC: boolean = false;
  @State cookie: string = ''

  aboutToAppear() {
    let valueChangeEvent: events_emitter.InnerEvent = {
      eventId: 10,
      priority: events_emitter.EventPriority.LOW
    }
    events_emitter.on(valueChangeEvent, this.valueChangeCallBack)
  }

  private valueChangeCallBack: Callback<events_emitter.EventData> = (eventData: events_emitter.EventData): void => {
    if (eventData != null) {
      console.info('valueChangeCallBack:' + JSON.stringify(eventData));
      const data = eventData.data as Record<string, RecordData>;
      if (data != null && data['ACTION'] != null) {
        let strValue: string = String(data['ACTION']);
        this.stringObj.str = strValue;
        console.info('this.stringObj.str has been updated to: ' + this.stringObj.str);
      }
    }
  }

  build() {
    Column() {
      Row() {
          Button("web click").key('webOnInterceptReqOne').onClick((e: ClickEvent) => {
          console.info("key==>" + this.stringObj.str)
          switch (this.stringObj.str) {
            case 'emitOnInterceptRequestWebC': {
              try {
                this.isOnInterceptRequestWebC = true
                this.controller.loadUrl( 'resource://rawfile/index.html' );
              } catch (error: BusinessError) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }
                  if ((this.controller.getTitle()).includes('index')) {
                    this.title = 'success'
                  }
                  Utils.emitEvent(this.title, 406);
              break;
            }
          }
        })
      }

      Web({ src: 'resource://rawfile/index.html', controller: this.controller })
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
          let heads: Header[] = [];
          let length = heads.push(head1);
          length = heads.push(head2);
          this.responseweb.setResponseHeader(heads);
          this.responseweb.setResponseEncoding('utf-8');
          this.responseweb.setResponseMimeType('text/html');
          this.responseweb.setResponseCode(200);
          this.responseweb.setReasonMessage('OK');
          return this.responseweb;
        })
        .onTitleReceive((event) => {
          console.log('title:' + event.title);
          this.title = event.title;
          // Utils.emitEvent(this.title, 492);
        })
        .onPageBegin((event) => {
          console.log('onPageBegin ==>' + event.url);
        })
        .onPageEnd((event) => {
          console.log('onPageEnd ==>' + event.url);
          if(this.isOnInterceptRequestWebC) {
            this.isComplete = 0
          }
        })
        .onIntelligentTrackingPreventionResult((event) => {
          if (event) {
            this.cookie = 'host:' + event.host + ',url:' + event.trackerHost
          }
        })
    }
  }
}
