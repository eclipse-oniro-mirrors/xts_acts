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
import events_emitter from '@ohos.events.emitter';
import Utils from '../../test/Utils';
import { BusinessError } from '@ohos.base';
import webView from '@ohos.web.webview';
import { waitForExist } from '../../test/WaitTest.test';

@Entry
@Component
struct webMessagePortPostMessageEventExtErrorCode {
  controller: webView.WebviewController = new webView.WebviewController();
  ports: webView.WebMessagePort[] = [];
  @State str: string = '';
  @State isReceive: number = -1;
  @State isPageEnd: number = -1;

  onPageShow() {
    let valueChangeEvent: events_emitter.InnerEvent = {
      eventId: 172300,
      priority: events_emitter.EventPriority.LOW
    };
    events_emitter.on(valueChangeEvent, this.valueChangeCallBack);
  }
  onPageHide() {
    events_emitter.off(172300)
  }
  private valueChangeCallBack = (eventData: events_emitter.EventData) => {
    console.info('web page valueChangeCallBack');
    if (eventData != null) {
      console.info('valueChangeCallBack:' + JSON.stringify(eventData));
      if (eventData.data?.ACTION != null) {
        this.str = eventData.data.ACTION;
        this.isReceive = 0;
      }
    }
  }

  build() {
    Column() {
      Row() {
        Button('webMessagePortPostMessageEventExtErrorCode').key('webMessagePortPostMessageEventExtErrorCodeButton').onClick(async () => {
          await waitForExist(()=>this.isReceive, this.str, 0);
          await waitForExist(()=>this.isPageEnd, this.str, 0);

          console.info('key==>' + this.str);
          this.isReceive = -1;
          switch (this.str) {
            case 'emitPostMessageEventExtErrorCodeNull001': {
              try {
                console.info('test postMessageEventExt with null');
                if (this.ports.length > 0) {
                  this.ports[0].postMessageEventExt(null);
                  Utils.emitEvent('success', 172310);
                } else {
                  Utils.emitEvent('length = 0', 172310);
                }
              } catch (error) {
                let e: BusinessError = error as BusinessError;
                console.error(this.str + `ErrorCode: ${e.code},  Message: ${e.message}`);
                Utils.emitEvent(String(e.code), 172310);
              }
              break;
            }
            case 'emitPostMessageEventExtErrorCodeUndefined001': {
              try {
                console.info('test postMessageEventExt with undefined');
                if (this.ports.length > 0) {
                  this.ports[0].postMessageEventExt(undefined);
                  Utils.emitEvent('success', 172320);
                } else {
                  Utils.emitEvent('length = 0', 172310);
                }
              } catch (error) {
                let e: BusinessError = error as BusinessError;
                console.error(this.str + `ErrorCode: ${e.code},  Message: ${e.message}`);
                Utils.emitEvent(String(e.code), 172320);
              }
              break;
            }
            default:
              console.info('can not match case');
          }
        })
      }

      Web({ src: $rawfile('index.html'), controller: this.controller })
        .databaseAccess(true)
        .onPageEnd((event) => {
          console.log('onPageEnd ==>' + event.url);
          try {
            this.ports = this.controller.createWebMessagePorts();
            console.info('createWebMessagePorts success size: ' + this.ports.length);
          } catch (error) {
            let e: BusinessError = error as BusinessError;
            console.error('createWebMessagePorts error: ' + e.code + ', message: ' + e.message);
          }
          this.isPageEnd = 0;
        })
    }
    .width('100%')
    .height('100%')
  }
}
