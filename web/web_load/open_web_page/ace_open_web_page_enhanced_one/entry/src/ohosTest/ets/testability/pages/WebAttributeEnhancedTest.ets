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

import webView from '@ohos.web.webview';
import Utils from '../../test/Utils';
import events_emitter from '@ohos.events.emitter';
import { URL, URL_INVALID } from '../../test/Config.test';

const EVENT_ID_SET_EMIT_KEY = 200570;

@Entry
@Component
struct WebAttributeEnhancedTest {
  controller: webView.WebviewController = new webView.WebviewController();
  @State str: string = '';
  @State isReceive: number = -1;
  @State isPageEnd: number = -1;
  @State title: string = '';
  @State isRealTitle: number = -1;

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
    console.info('web page valueChangeCallBack');
    if (eventData != null) {
      console.info('valueChangeCallBack:' + JSON.stringify(eventData));
      if (eventData.data != null && eventData.data.ACTION != null) {
        this.str = eventData.data.ACTION;
        this.isReceive = 1;
      }
    }
  }

  build() {
    Row() {
      Column() {
        Button('web click')
          .key('OnTitleReceiveIsRealTitleButton')
          .onClick(async () => {
            await Utils.waitForExist(()=>this.isReceive, 'OnTitleReceiveIsRealTitleButtonIsReceive', 1, 1000);
            await Utils.waitForExist(()=>this.isPageEnd, 'OnTitleReceiveIsRealTitleButtonIsPageEnd', 1, 1000);
            console.info('key==>' + this.str);
            this.isReceive = -1;
            switch (this.str) {
              case 'emitOnTitleReceiveIsRealTitle001': {
                try {
                  console.log(this.str + ' isRealTitle==>' + this.isRealTitle);
                  Utils.emitEvent(this.isRealTitle, 200580);
                } catch (error) {
                  console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                }
                break;
              }
              case 'emitOnTitleReceiveIsRealTitle002': {
                try {
                  this.isRealTitle = -1;
                  this.isPageEnd = -1;
                  this.controller.loadUrl($rawfile('indexWithNoTitle.html'));
                  await Utils.waitForExist(()=>this.isPageEnd, 'loadUrlIsPageEnd', 1, 1000);
                  console.log(this.str + ' isRealTitle==>' + this.isRealTitle);
                  Utils.emitEvent(this.isRealTitle, 200590);
                } catch (error) {
                  console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                }
                break;
              }
              case 'emitOnTitleReceiveIsRealTitle003': {
                try {
                  this.isRealTitle = -1;
                  this.isPageEnd = -1;
                  this.controller.loadUrl(URL);
                  await Utils.waitForExist(()=>this.isPageEnd, 'loadUrlIsPageEnd', 1, 1000);
                  console.log(this.str + ' isRealTitle==>' + this.isRealTitle);
                  Utils.emitEvent(this.isRealTitle, 200600);
                } catch (error) {
                  console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                }
                break;
              }
              case 'emitOnTitleReceiveIsRealTitle004': {
                try {
                  this.isRealTitle = -1;
                  this.isPageEnd = -1;
                  this.controller.loadUrl(URL_INVALID);
                  await Utils.waitForExist(()=>this.isPageEnd, 'loadUrlIsPageEnd', 1, 1000);
                  console.log(this.str + ' isRealTitle==>' + this.isRealTitle);
                  Utils.emitEvent(this.isRealTitle, 200610);
                } catch (error) {
                  console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                }
                break;
              }
              case 'emitOnTitleReceiveIsRealTitle005': {
                try {
                  this.isRealTitle = -1;
                  this.isPageEnd = -1;
                  this.controller.loadUrl($rawfile('titleEmptyTag.html'));
                  await Utils.waitForExist(()=>this.isPageEnd, 'loadUrlIsPageEnd', 1, 1000);
                  console.log(this.str + ' isRealTitle==>' + this.isRealTitle);
                  Utils.emitEvent(this.isRealTitle, 200611);
                } catch (error) {
                  console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                }
                break;
              }
              case 'emitOnTitleReceiveIsRealTitle006': {
                try {
                  this.isRealTitle = -1;
                  this.isPageEnd = -1;
                  this.controller.loadUrl($rawfile('titleEmptyString.html'));
                  await Utils.waitForExist(()=>this.isPageEnd, 'loadUrlIsPageEnd', 1, 1000);
                  console.log(this.str + ' isRealTitle==>' + this.isRealTitle);
                  Utils.emitEvent(this.isRealTitle, 200612);
                } catch (error) {
                  console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                }
                break;
              }
            }
          })

        Web({ src: $rawfile('index.html'), controller: this.controller })
          .key('webView')
          .onPageEnd((event) => {
            if (event) {
              this.isPageEnd = 1;
              console.log('onPageEnd==> event.url:' + event.url);
            }
          })
          .onTitleReceive((event) => {
            if (event) {
              console.log('onTitleReceive title:' + event.title);
              console.log('onTitleReceive isRealTitle:' + event.isRealTitle);
              if (event.isRealTitle === true) {
                this.isRealTitle = 1
              } else {
                this.isRealTitle = 0
              }
            }
          })
          .onSslErrorEvent((event: SslErrorEvent) => {
            console.info('onSslErrorEvent url: ' + event.url);
            console.info('onSslErrorEvent error: ' + event.error);
            console.info('onSslErrorEvent originalUrl: ' + event.originalUrl);
            console.info('onSslErrorEvent referrer: ' + event.referrer);
            console.info('onSslErrorEvent isFatalError: ' + event.isFatalError);
            console.info('onSslErrorEvent isMainFrame: ' + event.isMainFrame);
            event.handler.handleConfirm();
          })
      }
      .width('100%')
    }
    .height('100%')
  }
}