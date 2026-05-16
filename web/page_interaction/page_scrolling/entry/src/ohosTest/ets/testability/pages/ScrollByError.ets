/**
 * Copyright (c) 2026 Huawei Device Co., Ltd.
 * Licensed under Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with License.
 * You may obtain a copy of the License at
 *
 *   http://www.apache.org/licenses/LICENSE-2.0
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

const EVENT_ID_SET_SUITE_KEY = 179560;

@Entry
@Component
struct scrollByError {
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
        Button("scrollByError").key('scrollByErrorButton').onClick(async () => {
          console.info("key==>" + this.str);
          await Utils.waitForExist(() => this.isReceive, this.str + ' isReceive', 0);
          await Utils.waitForExist(() => this.isPageEnd, this.str + ' isPageEnd', 0);
          this.isReceive = -1;
          switch (this.str) {
            case "testScrollByDeltaXNull": {
              try {
                this.controller.scrollBy(null, 100);
                Utils.emitEvent('no error', 179561);
              } catch (error) {
                let e: BusinessError = error as BusinessError;
                console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                Utils.emitEvent(String(e.code), 179561);
              }
              break;
            }

            case "testScrollByDeltaXUndefined": {
              try {
                this.controller.scrollBy(undefined, 100);
                Utils.emitEvent('no error', 179562);
              } catch (error) {
                let e: BusinessError = error as BusinessError;
                console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                Utils.emitEvent(String(e.code), 179562);
              }
              break;
            }

            case "testScrollByDeltaYNull": {
              try {
                this.controller.scrollBy(100, null);
                Utils.emitEvent('no error', 179563);
              } catch (error) {
                let e: BusinessError = error as BusinessError;
                console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                Utils.emitEvent(String(e.code), 179563);
              }
              break;
            }


            case "testScrollByDeltaYUndefined": {
              try {
                this.controller.scrollBy(100, undefined);
                Utils.emitEvent('no error', 179564);
              } catch (error) {
                let e: BusinessError = error as BusinessError;
                console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                Utils.emitEvent(String(e.code), 179564);
              }
              break;
            }

            case "testScrollByDurationNull": {
              try {
                this.controller.scrollBy(100, 100, null);
                Utils.emitEvent(true, 179565);
              } catch (error) {
                let e: BusinessError = error as BusinessError;
                console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                Utils.emitEvent(String(e.code), 179565);
              }
              break;
            }

            case "testScrollByDurationUndefined": {
              try {
                this.controller.scrollBy(100, 100, undefined);
                Utils.emitEvent(true, 179566);
              } catch (error) {
                let e: BusinessError = error as BusinessError;
                console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                Utils.emitEvent(String(e.code), 179566);
              }
              break;
            }
          }
        })
      }

      Web({ src: "www.example.com", controller: this.controller })
        .onPageEnd(() => {
          this.isPageEnd = 0;
        })
    }
  }
}