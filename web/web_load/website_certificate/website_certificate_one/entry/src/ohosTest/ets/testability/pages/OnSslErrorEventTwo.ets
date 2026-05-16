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

import Utils from '../../test/Utils';
import webView from '@ohos.web.webview';
import events_emitter from '@ohos.events.emitter';
import {waitForAssert, waitForExist} from '../../test/WaitTest.test';
import { URL,URL2 } from '../../test/Config.test';

@Entry
@Component
struct webErrorPageTest {
  controller: webView.WebviewController = new webView.WebviewController();
  controllerTwo: webView.WebviewController = new webView.WebviewController();
  @State emitKey: string = '';
  @State isReceive: number = -1;
  @State isPageEnd: number = -1;
  @State url: string = '';

  onPageShow() {
    let valueChangeEvent: events_emitter.InnerEvent = {
      eventId: 22,
      priority: events_emitter.EventPriority.LOW
    }
    events_emitter.on(valueChangeEvent, this.valueChangeCallBack)
  }

  onPageHide() {
    events_emitter.off(22)
  }

  private valueChangeCallBack = (eventData: events_emitter.EventData) => {
    console.info('web page valueChangeCallBack');
    if (eventData != null) {
      console.info('valueChangeCallBack:' + JSON.stringify(eventData));
      if (eventData.data != null && eventData.data.ACTION != null) {
        this.emitKey = eventData.data.ACTION;
        this.isReceive = 0;
      }
    }
  }

  build() {
    Column() {
      Row() {
        Button('onSslErrorEvent click')
          .key('OnSslErrorEventTwoButton')
          .onClick(async () => {
            await waitForExist(()=>this.isReceive, this.emitKey, 0);
            console.info('key==>' + this.emitKey);
            this.isReceive = -1;
            switch (this.emitKey) {
              case 'emitOnSslErrorEventAbortLoadingFalse': {
                try {
                  await waitForExist(()=>this.isPageEnd, this.emitKey, 0);
                  console.log('url==>' + this.url);
                  if (this.url.includes(URL2)) {
                    Utils.emitEvent(true, 2025081413);
                  } else {
                    Utils.emitEvent(false, 2025081413);
                  }
                } catch (error) {
                  console.error(this.emitKey + ' ErrorCode：' + error.code + ' Message：' + error.message);
                  Utils.emitEvent(error.message, 2025081413);
                }
                this.isPageEnd = -1;
                break;
              }
              case 'emitOnSslErrorEventAbortLoadingTrue': {
                try {
                  let result = await waitForExist(()=>this.isPageEnd, this.emitKey, 0, 1000);
                  console.log('result==>' + result);
                  Utils.emitEvent(result, 2025082601);
                } catch (error) {
                  console.error(this.emitKey + ' ErrorCode：' + error.code + ' Message：' + error.message);
                  Utils.emitEvent(error.message, 2025082601);
                }
                break;
              }
            }
         })
      }
      if (this.emitKey == 'emitOnSslErrorEventAbortLoadingFalse') {
        Web({ src: URL, controller: this.controller })
          .onPageBegin((event) => {
            console.log('onPageBegin url：' + event.url);
          })
          .onPageEnd((event) => {
            console.log('onPageEnd url：' + event.url);
            this.isPageEnd = 0;
            this.url = event.url;
          })
          .onSslErrorEvent((event: SslErrorEvent) => {
            if (event) {
              console.log('onSslErrorEvent url: ' + event.url);
              console.log('onSslErrorEvent error: ' + event.error);
              console.log('onSslErrorEvent originalUrl: ' + event.originalUrl);
              console.log('onSslErrorEvent referrer: ' + event.referrer);
              console.log('onSslErrorEvent isFatalError: ' + event.isFatalError);
              console.log('onSslErrorEvent isMainFrame: ' + event.isMainFrame);
              event.handler.handleCancel(false);
            }
          })
          .width('100%')
          .height('100%')
      } else if (this.emitKey == 'emitOnSslErrorEventAbortLoadingTrue') {
        Web({ src: URL, controller: this.controller })
          .onPageBegin((event) => {
            console.log('onPageBegin url：' + event.url);
          })
          .onPageEnd((event) => {
            console.log('onPageEnd url：' + event.url);
            this.isPageEnd = 0;
            this.url = event.url;
          })
          .onSslErrorEvent((event: SslErrorEvent) => {
            if (event) {
              console.log('onSslErrorEvent url: ' + event.url);
              console.log('onSslErrorEvent error: ' + event.error);
              console.log('onSslErrorEvent originalUrl: ' + event.originalUrl);
              console.log('onSslErrorEvent referrer: ' + event.referrer);
              console.log('onSslErrorEvent isFatalError: ' + event.isFatalError);
              console.log('onSslErrorEvent isMainFrame: ' + event.isMainFrame);
              event.handler.handleCancel(true);
            }
          })
          .width('100%')
          .height('100%')
      }
    }
  }
}
