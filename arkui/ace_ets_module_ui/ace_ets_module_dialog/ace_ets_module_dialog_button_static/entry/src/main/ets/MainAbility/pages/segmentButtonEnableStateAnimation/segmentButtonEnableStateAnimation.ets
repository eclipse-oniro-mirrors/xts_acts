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

import { Column, ColumnOptions, Text, Entry, Component, BlurStyle } from '@ohos.arkui.component';
import { AppStorage, State } from '@ohos.arkui.stateManagement';
import {
  ItemRestriction,
  SegmentButton,
  SegmentButtonOptions,
  SegmentButtonTextItem,
} from '@ohos.arkui.advanced.SegmentButton';

@Entry
@Component
struct SegmentButtonEnableStateAnimation {
  @State tabOptions: SegmentButtonOptions = SegmentButtonOptions.tab({
    buttons: [{ text: 'T1' }, { text: 'T2' }] as ItemRestriction<SegmentButtonTextItem>,
    backgroundBlurStyle: BlurStyle.BACKGROUND_THICK,
  });
  @State tabSelectedIndexes: int[] = [0];

  aboutToAppear(): void {
    this.setSegV1Mounted();
  }

  onPageShow(): void {
    this.setSegV1Mounted();
  }

  private setSegV1Mounted(): void {
    AppStorage.setOrCreate<boolean>('segV1_mounted', true);
  }

  build() {
    Column({ space: 8 } as ColumnOptions) {
      Text('@ohos.arkui.advanced.SegmentButton enableStateAnimation')
        .fontSize(11)
        .width('100%')
        .height('10%')
        .id('segV1_title')
        .key('segV1_title');
      Column({ space: 4 } as ColumnOptions) {
        SegmentButton({
          options: this.tabOptions,
          selectedIndexes: this.tabSelectedIndexes,
          enableStateAnimation: true,
        })
          .width('100%')
          .layoutWeight(1);
      }
      .width('100%')
      .height('18%')
      .id('segV1_body')
      .key('segV1_body');
    }
    .width('100%')
    .height('100%')
    .padding({ left: '2%', right: '2%', top: '1%', bottom: '1%' });
  }
}
