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
struct SegmentButtonV2EnableStateAnimation {
  aboutToAppear(): void {
    this.setSegV2Mounted();
  }

  onPageShow(): void {
    this.setSegV2Mounted();
  }

  private setSegV2Mounted(): void {
    AppStorage.setOrCreate<boolean>('segV2_mounted', true);
  }

  build() {
    Column({ space: 8 } as ColumnOptions) {
      Text('@ohos.arkui.advanced.SegmentButtonV2 Tab/Capsule enableStateAnimation')
        .fontSize(11)
        .width('100%')
        .height('11%')
        .id('segV2_title')
        .key('segV2_title');
      Column({ space: 4 } as ColumnOptions) {
        Text('A').fontSize(12);
        Text('B').fontSize(12);
      }
      .width('100%')
      .height('10%')
      .id('segV2_tab')
      .key('segV2_tab');
      Column({ space: 4 } as ColumnOptions) {
        Text('C1').fontSize(12);
        Text('C2').fontSize(12);
      }
      .width('100%')
      .height('10%')
      .id('segV2_cap')
      .key('segV2_cap');
    }
    .width('100%')
    .height('100%')
    .padding({ left: '2%', right: '2%', top: '1%', bottom: '1%' });
  }
}
