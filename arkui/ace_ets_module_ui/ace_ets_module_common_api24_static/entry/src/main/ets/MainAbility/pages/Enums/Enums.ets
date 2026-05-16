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

'use static';

import { Entry, Component, Column, ColumnOptions, Button, Text, FlexAlign, EllipsisMode } from '@ohos.arkui.component';
import { AppStorage } from '@ohos.arkui.stateManagement';

const PFX = 'Enums';

@Entry
@Component
struct EnumsPage {
  build() {
    Column({ space: 6 } as ColumnOptions) {
      Text('模块 enums.d.ets（EllipsisMode）')
        .fontSize(14)
        .width('100%')
      Button('枚举 EllipsisMode.MULTILINE_START')
        .id(`${PFX}_btn_MULTILINE_START`)
        .width('100%')
        .layoutWeight(1)
        .constraintSize({ minHeight: 0, maxHeight: '22%' })
        .onClick(() => {
          AppStorage.setOrCreate<string>(`${PFX}_enum_MULTILINE_START`, EllipsisMode.MULTILINE_START === 3? 'true': 'false');
        })
      Button('枚举 EllipsisMode.MULTILINE_CENTER')
        .id(`${PFX}_btn_MULTILINE_CENTER`)
        .width('100%')
        .layoutWeight(1)
        .constraintSize({ minHeight: 0, maxHeight: '22%' })
        .onClick(() => {
          AppStorage.setOrCreate<string>(`${PFX}_enum_MULTILINE_CENTER`, EllipsisMode.MULTILINE_CENTER === 4? 'true': 'false');
        })
    }
    .width('100%')
    .height('100%')
    .justifyContent(FlexAlign.SpaceEvenly)
  }
}
