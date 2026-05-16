/**
 * Copyright (c) 2026 Shenzhen Kaihong Digital Industry Development Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

'use static'

import { Column, DataPanel, DataPanelType, Color, Entry, Component, ResourceColor, LinearGradient } from '@ohos.arkui.component';
import { AppStorage } from '@ohos.arkui.stateManagement';
import { Router } from '@ohos.arkui.UIContext';

@Entry
@Component
struct DataPanelPage {
  // 测试valueColors的color属性 - 使用ResourceColor
  private colorArray1: Array<ResourceColor | LinearGradient> = [Color.Red, Color.Green] as Array<ResourceColor | LinearGradient>;

  // 测试valueColors的LinearGradient属性 - 使用LinearGradient with offset
  private colorArray2: Array<ResourceColor | LinearGradient> = [
    new LinearGradient([{ color: Color.Blue, offset: 0 }, { color: Color.Yellow, offset: 20 }])
  ] as Array<ResourceColor | LinearGradient>;

  aboutToAppear(): void {
    const routerInstance = this.getUIContext().getRouter();
    AppStorage.setOrCreate<Router>('router', routerInstance);
    const snapshot = `colorStopColor=${Color.Red};colorStopOffset=20`;
    AppStorage.setOrCreate<string>('DataPanelPageState', snapshot);
  }

  build() {
    Column() {
      // 测试valueColors的color属性的DataPanel
      DataPanel({
        values: [50],
        max: 100,
        type: DataPanelType.Circle
      })
        .width('80%')
        .height('40%')
        .valueColors(this.colorArray1)
        .id('colorStopColorCase')
        .key('colorStopColorCase')

      // 测试valueColors的offset属性的DataPanel  
      DataPanel({
        values: [30],
        max: 100,
        type: DataPanelType.Circle
      })
        .width('80%')
        .height('40%')
        .valueColors(this.colorArray2)
        .id('colorStopOffsetCase')
        .key('colorStopOffsetCase')

    }.width('100%').height('100%').padding(20)
  }
}