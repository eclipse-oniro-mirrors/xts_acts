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

import Utils from '../../test/Utils.test';
import webView from '@ohos.web.webview';
import events_emitter from '@ohos.events.emitter';
import {waitForAssert, waitForExist} from '../../test/WaitTest.test';

@Entry
@Component
struct webSetAppCustomUserAgent {
  controller: webView.WebviewController = new webView.WebviewController();
  @State emitKey: string = '';
  @State message: Array<string> = [];
  @State isJumpUserAgentTwo: number = -1;
  @State isReceive: number = -1;
  @State isPageEnd: number = -1;

  onPageShow() {
    let valueChangeEvent: events_emitter.InnerEvent = {
      eventId: 174010,
      priority: events_emitter.EventPriority.LOW
    }
    events_emitter.on(valueChangeEvent, this.valueChangeCallBack)
  }

  onPageHide() {
    events_emitter.off(174010)
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
        Button('setAppCustomUserAgent click')
          .key('WebSetAppCustomUserAgentButton')
          .onClick(async () => {
            await waitForExist(()=>this.isReceive, this.emitKey, 0);
            await waitForExist(()=>this.isPageEnd, this.emitKey, 0);
            console.info('key==>' + this.emitKey);
            this.isReceive = -1;
            switch (this.emitKey) {
              case 'emitSetAppCustomUserAgent': {
                try {
                  let userAgent = webView.WebviewController.getDefaultUserAgent();
                  console.log('userAgent===>' + userAgent);
                  let customUserAgent = userAgent + ' setAppCustomUserAgent';
                  webView.WebviewController.setAppCustomUserAgent(customUserAgent);
                  this.isPageEnd = -1;
                  this.controller.loadUrl($rawfile('userAgentTwo.html'))
                  await waitForExist(()=>this.isPageEnd, this.emitKey, 0);
                  this.controller.runJavaScript('getUserAgent()', (error, result) => {
                    if (error) {
                      console.error(`runJavaScript ErrorCode: ${error.code},  Message: ${error.message}`);
                    }
                    if (result) {
                      console.info(`runJavaScript The test() return value is: ${result}`);
                      let isGetResult = result.includes('setAppCustomUserAgent');
                      Utils.emitEvent(isGetResult, 174020)
                    }
                  })
                } catch (error) {
                  console.error(`catch ErrorCode: ${error.code},  Message: ${error.message}`);
                  if (error.code == 801) {
                    Utils.emitEvent(true, 174020)
                  }
                }
                this.isReceive = -1;
                break;
              }
              case 'emitSetAppCustomUserAgentNull': {
                try {
                  webView.WebviewController.setAppCustomUserAgent(null);
                } catch (error) {
                  console.error(`catch ErrorCode: ${error.code},  Message: ${error.message}`);
                  if (error.code == 801) {
                    Utils.emitEvent('401', 174030);
                  } else {
                    Utils.emitEvent(String(error.code), 174030);
                  }
                }
                this.isReceive = -1;
                break;
              }
              case 'emitSetAppCustomUserAgentUndefined': {
                try {
                  webView.WebviewController.setAppCustomUserAgent(undefined);
                } catch (error) {
                  console.error(`catch ErrorCode: ${error.code},  Message: ${error.message}`);
                  if (error.code == 801) {
                    Utils.emitEvent('401', 174040);
                  } else {
                    Utils.emitEvent(String(error.code), 174040);
                  }
                }
                break;
              }
            }
         })
      }
      Web({ src: $rawfile('userAgent.html'), controller: this.controller })
        .key('setAppCustomUserAgentWComponent')
        .javaScriptAccess(true)
        .domStorageAccess(true)
        .onPageEnd((event) => {
          if (event) {
            this.isPageEnd = 0;
            console.log('setAppCustomUserAgent onPageEnd url:' + event.url);
           }
        })
        .width('100%')
        .height('100%')
    }
  }
}
