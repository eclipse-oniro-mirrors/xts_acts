/**
 * Copyright (c) 2026 Huawei Device Co., Ltd.
 * Licensed under Apache License, Version 2.0 (the "License");
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
import { BusinessError } from '@ohos.base';

const EVENT_ID_SET_SUITE_KEY = 179567;

@Entry
@Component
struct ScrollByWithResultError {
  @State str: string = "";
  @State isReceive: number = -1;
  @State isPageEnd: number = -1;
  controller: webView.WebviewController = new webView.WebviewController();

  onPageShow() {
    let valueChangeEvent: events_emitter.InnerEvent = {
      eventId: EVENT_ID_SET_SUITE_KEY,
      priority: events_emitter.EventPriority.LOW
    }
    events_emitter.on(valueChangeEvent, this.valueChangeCallBack)
  }

  onPageHide() {
    events_emitter.off(EVENT_ID_SET_SUITE_KEY)
  }

  private valueChangeCallBack = (eventData: events_emitter.EventData) => {
    console.info("web page valueChangeCallBack");
    if (eventData != null) {
      console.info("valueChangeCallBack:" + JSON.stringify(eventData));
      if (eventData.data != null && eventData.data.ACTION != null) {
        this.str = eventData.data.ACTION;
        this.isReceive = 0;
      }
    }
  }

  build() {
    Column() {
      Row() {
        Button("scrollByWithResultError").key('scrollByWithResultErrorButton').onClick(async () => {
          console.info("key==>" + this.str);
          await Utils.waitForExist(() => this.isReceive, this.str + ' isReceive', 0);
          await Utils.waitForExist(() => this.isPageEnd, this.str + ' isPagePageEnd', 0);
          this.isReceive = -1;
          switch (this.str) {
            case "testScrollByWithResultDeltaXNull": {
              try {
                this.controller.scrollByWithResult(null, 100);
                Utils.emitEvent('no error', 179568);
              } catch (error) {
                let e: BusinessError = error as BusinessError;
                console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                Utils.emitEvent(String(e.code), 179568);
              }
              break;
            }

            case "testScrollByWithResultDeltaXUndefined": {
              try {
                this.controller.scrollByWithResult(undefined, 100);
                Utils.emitEvent('no error', 179569);
              } catch (error) {
                let e: BusinessError = error as BusinessError;
                console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                Utils.emitEvent(String(e.code), 179569);
              }
              break;
            }

            case "testScrollByWithResultDeltaYNull": {
              try {
                this.controller.scrollByWithResult(100, null);
                Utils.emitEvent('no error', 179570);
              } catch (error) {
                let e: BusinessError = error as BusinessError;
                console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                Utils.emitEvent(String(e.code), 179570);
              }
              break;
            }

            case "testScrollByWithResultDeltaYUndefined": {
              try {
                this.controller.scrollByWithResult(100, undefined);
                Utils.emitEvent('no error', 179571);
              } catch (error) {
                let e: BusinessError = error as BusinessError;
                console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                Utils.emitEvent(String(e.code), 179571);
              }
              break;
            }
          }
        })
      }

      Web({ src: "www.example.com", controller: this.controller })
        .javaScriptAccess(true)
        .fileAccess(true)
        .domStorageAccess(true)
        .onPageEnd(() => {
          this.isPageEnd = 0;
        })
    }
  }
}
