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
import {waitForAssert, waitForExist} from '../../test/WaitTest';

@Entry
@Component
struct WebJavaScriptAccessSpecial {
  controller: webView.WebviewController = new webView.WebviewController();
  @State emitKey: string = '';
  @State message: Array<string> = [];
  @State isReceive: number = -1;
  @State isPageEnd: number = -1;
  @State isJavaScriptAccess: number = -1;

  onPageShow() {
    let valueChangeEvent: events_emitter.InnerEvent = {
      eventId: 151,
      priority: events_emitter.EventPriority.LOW
    }
    events_emitter.on(valueChangeEvent, this.valueChangeCallBack)
  }

  onPageHide() {
    events_emitter.off(151)
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
        Button('jsAccess_null_undefined')
          .key('WebJavaScriptAccessSpecialButton')
          .onClick(async () => {
            await waitForExist(() => this.isReceive, this.emitKey, 0, 1000);
            this.isReceive = -1;
            this.isJavaScriptAccess = -1;
            console.info('key==>' + this.emitKey)
            switch (this.emitKey) {
              case 'emitWebJavaScriptAccessSetNull': {
                try {
                  this.isPageEnd = -1;
                  this.isJavaScriptAccess = 1;
                  await waitForExist(() => this.isPageEnd, this.emitKey, 0, 1000);
                  this.controller.runJavaScript('getResult()', (error, result) => {
                    if (error) {
                      Utils.emitEvent(false, 25112607);
                    }
                    if (result) {
                      console.log(this.emitKey + 'runJavaScript result==>' + result + 'typeof==>' + typeof(result));
                      Utils.emitEvent(result, 25112607);
                    }
                  })
                } catch (error) {
                  console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                }
                break;
              }
              case 'emitWebJavaScriptAccessSetUndefined': {
                try {
                  this.isPageEnd = -1;
                  this.isJavaScriptAccess = 2;
                  await waitForExist(() => this.isPageEnd, this.emitKey, 0, 1000);
                  this.controller.runJavaScript('getResult()', (error, result) => {
                    if (error) {
                      Utils.emitEvent(false, 25112608);
                    }
                    if (result) {
                      console.log(this.emitKey + 'runJavaScript result==>' + result + 'typeof==>' + typeof(result));
                      Utils.emitEvent(result, 25112608);
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
      if (this.isJavaScriptAccess == 1) {
        Web({ src: $rawfile('runJavaScriptOnDocumentEnd.html'), controller: this.controller })
          .javaScriptAccess(null)
          .domStorageAccess(true)
          .onPageEnd((event) => {
            if (event) {
              this.isPageEnd = 0;
              console.log('javaScriptAccess onPageEnd url:' + event.url);
            }
          })
      }
      if (this.isJavaScriptAccess == 2) {
        Web({ src: $rawfile('runJavaScriptOnDocumentEnd.html'), controller: this.controller })
          .javaScriptAccess(undefined)
          .domStorageAccess(true)
          .onPageEnd((event) => {
            if (event) {
              this.isPageEnd = 0;
              console.log('javaScriptAccess onPageEnd url:' + event.url);
            }
          })
      }

    }
  }
}
