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

import { Column, ColumnOptions, Text, Entry, Component } from '@ohos.arkui.component';
import { AppStorage } from '@ohos.arkui.stateManagement';

@Entry
@Component
struct ToolBarItemDebugLine {
  aboutToAppear(): void {
    AppStorage.setOrCreate<boolean>('tbDl_mounted', true);
  }

  build() {
    Column({ space: 8 } as ColumnOptions) {
      Text('toolbar ToolBarItem')
        .fontSize(11)
        .width('100%')
        .height('11%')
        .id('tbDl_title');
      Column({ space: 4 } as ColumnOptions) {
        Text('item').fontSize(9).height('5%');
      }
      .height('8%')
      .width('100%')
      .id('tbDl_row');
    }
    .width('100%')
    .height('100%')
    .padding({ left: '2%', right: '2%', top: '1%', bottom: '1%' });
  }
}
