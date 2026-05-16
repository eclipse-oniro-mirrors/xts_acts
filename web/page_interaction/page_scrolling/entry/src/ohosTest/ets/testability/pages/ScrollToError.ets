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

const EVENT_ID_SET_SUITE_KEY = 179550;

@Entry
@Component
struct scrollToError {
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
        Button("scrollToError").key('scrollToErrorButton').onClick(async () => {
          console.info("key==>" + this.str);
          await Utils.waitForExist(() => this.isReceive, this.str + ' isReceive', 0);
          await Utils.waitForExist(() => this.isPageEnd, this.str + ' isPageEnd', 0);
          this.isReceive = -1;
          switch (this.str) {
            case "testScrollToXNull": {
              try {
                this.controller.scrollTo(null, 100);
                Utils.emitEvent('no error', 179551);
              } catch (error) {
                let e: BusinessError = error as BusinessError;
                console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                Utils.emitEvent(String(e.code), 179551);
              }
              break;
            }

            case "testScrollToXUndefined": {
              try {
                this.controller.scrollTo(undefined, 100);
                Utils.emitEvent('no error', 179552);
              } catch (error) {
                let e: BusinessError = error as BusinessError;
                console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                Utils.emitEvent(String(e.code), 179552);
              }
              break;
            }

            case "testScrollToYNull": {
              try {
                this.controller.scrollTo(100, null);
                Utils.emitEvent('no error', 179553);
              } catch (error) {
                let e: BusinessError = error as BusinessError;
                console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                Utils.emitEvent(String(e.code), 179553);
              }
              break;
            }

            case "testScrollToYUndefined": {
              try {
                this.controller.scrollTo(100, undefined);
                Utils.emitEvent('no error', 179554);
              } catch (error) {
                let e: BusinessError = error as BusinessError;
                console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                Utils.emitEvent(String(e.code), 179554);
              }
              break;
            }

            case "testScrollToDurationNull": {
              try {
                this.controller.scrollTo(100, 100, null);
                Utils.emitEvent(true, 179555);
              } catch (error) {
                let e: BusinessError = error as BusinessError;
                console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                Utils.emitEvent(String(e.code), 179555);
              }
              break;
            }

            case "testScrollToDurationUndefined": {
              try {
                this.controller.scrollTo(100, 100, undefined);
                Utils.emitEvent(true, 179556);
              } catch (error) {
                let e: BusinessError = error as BusinessError;
                console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                Utils.emitEvent(String(e.code), 179556);
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
