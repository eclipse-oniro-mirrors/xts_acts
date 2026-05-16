/*
 * Copyright (c) 2024-2025 Huawei Device Co., Ltd.
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
import { waitForExist, waitForAssert } from '../../test/WaitTest.test';


@Entry
@Component
struct onRefreshAccessedHistoryTest {
  controller: webView.WebviewController = new webView.WebviewController();
  @State str: string = '';
  @State isReceive: number = -1;
  @State isPageEnd: number = -1;
  @State isMainFrame: boolean | undefined = undefined;

  onPageShow() {
    let valueChangeEvent: events_emitter.InnerEvent = {
      eventId: 141,
      priority: events_emitter.EventPriority.LOW
    }
    events_emitter.on(valueChangeEvent, this.valueChangeCallBack)
  }

  onPageHide() {
    events_emitter.off(141)
  }

  private valueChangeCallBack = (eventData: events_emitter.EventData) => {
    console.info('web page valueChangeCallBack');
    if (eventData != null) {
      console.info('valueChangeCallBack:' + JSON.stringify(eventData));
      if (eventData.data != null && eventData.data.ACTION != null) {
        this.str = eventData.data.ACTION;
        this.isReceive = 0;
      }
    }
  }

  build() {
    Row() {
      Column() {
        Button('web click')
          .key('OnRefreshAccessedHistoryButton')
          .onClick(async () => {
            await waitForExist(() => this.isPageEnd, this.str, 0, 1000);
            await waitForExist(() => this.isReceive, this.str, 0, 1000);
            this.isReceive = -1;
            console.info('key==>' + this.str);
            switch (this.str) {
              case 'emitOnRefreshAccessedHistoryEnhanced001': {
                try {
                  let check = (v1: boolean | undefined, v2: boolean): boolean => {
                    return v1 === v2 ? true : false;
                  }
                  await waitForAssert(() => this.isMainFrame, check, true, 25112101, this.str);
                } catch (error) {
                  console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                }
                break;
              }
              case 'emitOnRefreshAccessedHistoryEnhanced002': {
                try {
                  this.isMainFrame = undefined;
                  this.controller.runJavaScript('createIframe()');
                  let check = (v1: boolean | undefined, v2: boolean): boolean => {
                    return v1 === v2 ? true : false;
                  }
                  await waitForAssert(() => this.isMainFrame, check, false, 25112102, this.str);
                } catch (error) {
                  console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                }
                break;
              }
              case 'emitOnRefreshAccessedHistoryEnhanced003': {
                try {
                  this.isPageEnd = -1;
                  this.isMainFrame = undefined;
                  this.controller.refresh();
                  await waitForExist(() => this.isPageEnd, this.str, 0, 1000);
                  let check = (v1: boolean | undefined, v2: boolean): boolean => {
                    return v1 === v2 ? true : false;
                  }
                  await waitForAssert(() => this.isMainFrame, check, true, 25112103, this.str);
                } catch (error) {
                  console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                }
                break;
              }
              case 'emitOnRefreshAccessedHistoryEnhanced004': {
                try {
                  this.isPageEnd = -1;
                  this.controller.loadUrl($rawfile('iframeTwo.html'));
                  await waitForExist(() => this.isPageEnd, this.str, 0, 1000);
                  this.isMainFrame = undefined;
                  this.controller.runJavaScript('iframeRefresh()');
                  let check = (v1: boolean | undefined, v2: boolean): boolean => {
                    return v1 === v2 ? true : false;
                  }
                  await waitForAssert(() => this.isMainFrame, check, false, 25112104, this.str);
                } catch (error) {
                  console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                }
                break;
              }
            }
          })

        Web({ src: $rawfile('iframe.html'), controller: this.controller })
          .onRefreshAccessedHistory((event) => {
            console.info('onRefreshAccessedHistory==>')
            if (event) {
              console.info('onRefreshAccessedHistory url==>' + event.url);
              console.info('onRefreshAccessedHistory isMainFrame==>' + event.isMainFrame);
              this.isMainFrame = event.isMainFrame;
            }
          })
          .onPageEnd((event) => {
            console.log('web pageEnd==>' + event.url);
            this.isPageEnd = 0;
          })
      }
      .width('100%')
    }
    .height('100%')
  }
}