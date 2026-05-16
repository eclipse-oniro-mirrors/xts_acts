/**
 * Copyright (c) 2026 Huawei Device Co., Ltd.
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

import web_webview from '@ohos.web.webview';
import { waitForExist } from '../../test/WaitTest.test';
import events_emitter from '@ohos.events.emitter';
import { Driver } from '@kit.TestKit';
import Utils from '../../test/Utils';

const EVENT_ID_SET_SUITE_KEY = 153956;
const EVENT_ID_RESULT = 153951;
let driver: Driver = Driver.create();

@Entry
@Component
struct AvoidVisibleViewportBottomUndefined {
  controller: web_webview.WebviewController = new web_webview.WebviewController();
  @State emitKey: string = "";
  @State isReceive: number = -1;
  @State isComplete: number = -1;

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
    if (eventData != null) {
      console.info('valueChangeCallBack:' + JSON.stringify(eventData));
      if (eventData.data != null && eventData.data.ACTION != null) {
        this.emitKey = eventData.data.ACTION;
        this.isReceive = 1;
      }
    }
  }

  build() {
    Column() {
      Row() {
        Button("web click").key('avoidVisibleViewportBottomUndefinedClick').onClick(async () => {
          console.info("key==>" + this.emitKey)
          await waitForExist(() => this.isReceive, this.emitKey + ' isReceive', 1, 1000);
          await waitForExist(() => this.isComplete, this.emitKey + ' isComplete', 1, 1000);
          switch (this.emitKey) {
            case "testAvoidVisibleViewportBottomUndefined001": {
              try {
                this.controller.avoidVisibleViewportBottom(undefined);
                Utils.emitEvent("undefined", EVENT_ID_RESULT);
              } catch (error) {
                console.error("avoidVisibleViewportBottom with undefined error: " + JSON.stringify(error));
                Utils.emitEvent("error", EVENT_ID_RESULT);
              }
              break;
            }
          }
        })
      }

      Web({ src: 'resource://rawfile/index.html', controller: this.controller })
        .onPageEnd((event) => {
          console.log('onPageEnd url:' + event.url);
          this.isComplete = 1;
        })
        .javaScriptAccess(true)
        .domStorageAccess(true)
    }
  }
}
