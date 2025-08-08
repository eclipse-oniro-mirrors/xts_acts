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


@Entry
@Component
struct WebComponent {
  webviewController: webview.WebviewController = new webview.WebviewController();
  @State emitKey: string = '';

  onPageShow(){
    let valueChangeEvent: events_emitter.InnerEvent = {
      eventId: 10,
      priority: events_emitter.EventPriority.LOW
    }
    events_emitter.on(valueChangeEvent, this.valueChangeCallBack)
  }

  private valueChangeCallBack = (eventData: events_emitter.EventData) => {
    if (eventData != null) {
      console.info('valueChangeCallBack:' + JSON.stringify(eventData));
      if (eventData.data != null && eventData.data.ACTION != null) {
        this.emitKey = eventData.data.ACTION;
      }
    }
  }

  build(){
    Column() {
      Row() {
        Button('web click').key('webviewPressureLevelButton').onClick(async () => {
          console.info('key==>' + this.emitKey)
          await Utils.sleep(2000)
          switch (this.emitKey) {
            case 'emitWebviewPressureLevelModerate': {
              webview.WebviewController.trimMemoryByPressureLevel(
                webview.PressureLevel.MEMORY_PRESSURE_LEVEL_MODERATE)
              await Utils.sleep(4000)
              if (webview.PressureLevel.MEMORY_PRESSURE_LEVEL_MODERATE === 1) {
                console.log('MEMORY_PRESSURE_LEVEL is:' + webview.PressureLevel.MEMORY_PRESSURE_LEVEL_MODERATE);
                Utils.emitEvent('success', 20001)
              }
            }
            case 'emitWebviewPressureLevelCritical': {
              webview.WebviewController.trimMemoryByPressureLevel(
                webview.PressureLevel.MEMORY_PRESSURE_LEVEL_CRITICAL)
              await Utils.sleep(4000)
              if (webview.PressureLevel.MEMORY_PRESSURE_LEVEL_CRITICAL === 2) {
                console.log('MEMORY_PRESSURE_LEVEL is:' + webview.PressureLevel.MEMORY_PRESSURE_LEVEL_CRITICAL);
                Utils.emitEvent('success', 20002)
              }
            }
          }
        })
      }
      Web({ src: '', controller: this.webviewController})
        .optimizeParserBudget(true)
    }
  }
}
