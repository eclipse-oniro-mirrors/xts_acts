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
import { URL_BAIDU } from '../../test/Config.test';

const EVENT_ID_SET_EMIT_KEY = 201330;

@Entry
@Component
struct WebViewControllerPart3 {
  controller: webView.WebviewController = new webView.WebviewController();
  @State str: string = ''
  @State isPageEnd: number = -1;
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
    console.info('web page valueChangeCallBack');
    if (eventData != null) {
      console.info('valueChangeCallBack:' + JSON.stringify(eventData));
      if (eventData.data != null && eventData.data.ACTION != null) {
        this.isReceive = 1;
        this.str = eventData.data.ACTION;
      }
    }
  }

  build() {
    Column() {
      Row() {
        Button('WebViewController click').key('WebViewControllerTestButton').onClick(async () => {
          await Utils.waitForExist(()=>this.isPageEnd, 'WebViewControllerTestButtonIsPageEnd', 1, 1000);
          await Utils.waitForExist(()=>this.isReceive, 'WebViewControllerTestButtonIsReceive', 1, 1000);
          console.info('key==>' + this.str);
          switch (this.str) {
            case 'testPrefetchPage001': {
              this.isPageEnd = -1
              try {
                this.controller.removeCache(true);
                this.controller.prefetchPage(URL_BAIDU);
                console.log('======prefetchPage url')
                this.controller.loadUrl(URL_BAIDU)
                await Utils.waitForExist(()=>this.isPageEnd, 'testPrefetchPage001', 1, 1000);
                Utils.emitEvent(true, 201340);
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                Utils.emitEvent(error.message, 201340);
              }
              break;
            }

          }
        })
      }

      Web({ src: $rawfile('index.html'), controller: this.controller })
        .onFirstContentfulPaint(event => {
          if (event) {
            console.log('onFirstContentfulPaint:' + '[navigationStartTick]:' +
            event.navigationStartTick + ', [firstContentfulPaintMs]:' +
            event.firstContentfulPaintMs)
          }
        })
        .onPageEnd((event) => {
            console.log('onPageEnd url:' + event.url)
            this.isPageEnd = 1;
        })
    }
  }
}