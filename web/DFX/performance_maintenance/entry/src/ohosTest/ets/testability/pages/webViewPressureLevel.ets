/**
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
import { BusinessError } from '@ohos.base';
import events_emitter from '@ohos.events.emitter';
import webview from '@ohos.web.webview';
import Utils from '../../test/Utils';
import JSON from '@ohos.util.json';

const EVENT_ID_SET_SUITE_KEY = 126001;
@Entry
@Component
struct WebComponent {
  webviewController: webview.WebviewController = new webview.WebviewController();
  @State emitKey: string = '';
  @State isPageEnd: number = -1;
  @State isReceive: number = -1;

  onPageShow(){
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

  build(){
    Column() {
      Row() {
        Button('web click').key('webviewPressureLevelButton').onClick(async () => {
          await Utils.waitForExist(()=>this.isReceive, this.emitKey, 1, 1000);
          await Utils.waitForExist(()=>this.isPageEnd, this.emitKey, 1, 1000);
          console.info('key==>' + this.emitKey)
          switch (this.emitKey) {
            case 'emitWebviewPressureLevelModerate': {
              webview.WebviewController.trimMemoryByPressureLevel(
                webview.PressureLevel.MEMORY_PRESSURE_LEVEL_MODERATE)
              if (webview.PressureLevel.MEMORY_PRESSURE_LEVEL_MODERATE === 1) {
                console.log('MEMORY_PRESSURE_LEVEL is:' + webview.PressureLevel.MEMORY_PRESSURE_LEVEL_MODERATE);
                Utils.emitEvent('success', 126010)
              }
            }
            case 'emitWebviewPressureLevelCritical': {
              webview.WebviewController.trimMemoryByPressureLevel(
                webview.PressureLevel.MEMORY_PRESSURE_LEVEL_CRITICAL)
              if (webview.PressureLevel.MEMORY_PRESSURE_LEVEL_CRITICAL === 2) {
                console.log('MEMORY_PRESSURE_LEVEL is:' + webview.PressureLevel.MEMORY_PRESSURE_LEVEL_CRITICAL);
                Utils.emitEvent('success', 126020)
              }
            }
          }
        })
      }
      Web({ src: $rawfile('index.html'), controller: this.webviewController})
        .optimizeParserBudget(true)
        .onPageEnd((event) => {
          console.log('onPageEnd url:' + event.url);
          this.isPageEnd = 1;
        })
    }
  }
}
