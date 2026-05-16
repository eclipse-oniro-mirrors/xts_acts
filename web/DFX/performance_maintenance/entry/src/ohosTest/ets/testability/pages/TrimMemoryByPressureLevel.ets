/**
 * Copyright (c) 2024-2025 Huawei Device Co., Ltd.
 * Licensed under * Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with * License.
 * You may obtain a copy of * License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under * License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import { BusinessError } from '@ohos.base';
import events_emitter from '@ohos.events.emitter';
import webview from '@ohos.web.webview';
import Utils from '../../test/Utils';

const EVENT_ID_SET_SUITE_KEY = 126127;

@Entry
@Component
struct TrimMemoryByPressureLevel {
  webviewController: webview.WebviewController = new webview.WebviewController();
  @State emitKey: string = '';
  @State isPageEnd: number = -1;
  @State isReceive: number = -1;

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
        Button('trimMemoryByPressureLevel').key('trimMemoryByPressureLevelButton').onClick(async () => {
          await Utils.waitForExist(() => this.isReceive, this.emitKey, 1, 1000);
          await Utils.waitForExist(() => this.isPageEnd, this.emitKey, 1, 1000);
          console.info('key==>' + this.emitKey);
          this.isReceive = -1;
          switch (this.emitKey) {
            case 'testTrimMemoryPressLevelModerate': {
              try {
                webview.WebviewController.trimMemoryByPressureLevel(
                  webview.PressureLevel.MEMORY_PRESSURE_LEVEL_MODERATE)
                console.log('MEMORY_PRESSURE_LEVEL is:' + webview.PressureLevel.MEMORY_PRESSURE_LEVEL_MODERATE);
                Utils.emitEvent('success', 126130)
              } catch (error) {
                console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
                Utils.emitEvent((error as BusinessError).code, 126130)
              }
              break;
            }
          }
        })
      }

      Web({ src: $rawfile('index.html'), controller: this.webviewController })
        .javaScriptAccess(true)
        .fileAccess(true)
        .domStorageAccess(true)
        .onPageEnd((event) => {
          console.log('onPageEnd url:' + event.url);
          this.isPageEnd = 1;
        })
    }
  }
}
