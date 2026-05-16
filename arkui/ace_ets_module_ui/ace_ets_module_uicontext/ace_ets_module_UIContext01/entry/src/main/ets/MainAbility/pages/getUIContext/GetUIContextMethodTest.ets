/*
 * Copyright (C) 2025 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the 'License')
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an 'AS IS' BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
import { UIContext } from '@kit.ArkUI';
import { hilog } from '@kit.PerformanceAnalysisKit';

@Entry
@Component
struct GetCallingScopeIndex {
  build() {
    Column() {
      Button('getCallingScopeUIContext')
        .id('btn_getCallingScopeUIContext')
        .height('10%')
        .fontWeight(FontWeight.Bold)
        .onClick(() => {
          let uiContext = UIContext.getCallingScopeUIContext();
          AppStorage.SetOrCreate('getCallingScopeUIContextTest', uiContext?.isAvailable());
          hilog.info(0x00, 'testTag', 'getCallingScopeUIContextTest : ' + uiContext?.isAvailable());
        })

      Button('getLastFocusedUIContext')
        .id('btn_getLastFocusedUIContext')
        .height('10%')
        .fontWeight(FontWeight.Bold)
        .onClick(() => {
          let uiContext = UIContext.getLastFocusedUIContext();
          AppStorage.SetOrCreate('getLastFocusedUIContextTest', uiContext?.isAvailable());
          hilog.info(0x00, 'testTag', 'getLastFocusedUIContextTest : ' + uiContext?.isAvailable());
        })

      Button('getLastForegroundUIContext')
        .id('btn_getLastForegroundUIContext')
        .height('10%')
        .fontWeight(FontWeight.Bold)
        .onClick(() => {
          let uiContext = UIContext.getLastForegroundUIContext();
          AppStorage.SetOrCreate('getLastForegroundUIContextTest', uiContext?.isAvailable());
          hilog.info(0x00, 'testTag', 'getLastForegroundUIContextTest : ' + uiContext?.isAvailable());
        })

      Button('getAllUIContexts')
        .id('btn_getAllUIContexts')
        .height('10%')
        .fontWeight(FontWeight.Bold)
        .onClick(() => {
          let uiContexts = UIContext.getAllUIContexts();
          AppStorage.SetOrCreate('getAllUIContextsTest', uiContexts.length);
          hilog.info(0x00, 'testTag', `There are ${uiContexts.length} UIContext(s)`);
        })
    }
    .height('100%')
    .width('100%')
  }
}