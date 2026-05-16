'use static'
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
import {
  Entry,
  Component,
  State,
  Direction,
  Color,
  Row,
  Column,
  Button,
  ColumnOptions,
} from '@kit.ArkUI';

import { SegmentButton, SegmentButtonOptions } from '@ohos.arkui.advanced.SegmentButton';
import { LengthMetrics, } from '@ohos.arkui.node';
@Entry
@Component
struct Index {
  @State tabOptions: SegmentButtonOptions = SegmentButtonOptions.tab({
    buttons: [{ text: '页签按钮1' }, { text: '页签按钮2' }, {
      text: '页签按钮3'
    }],
    direction: Direction.Auto,
    backgroundColor: Color.Green,
    selectedBackgroundColor: Color.Orange,
    localizedTextPadding: {
      end: LengthMetrics.vp(30),
      start: LengthMetrics.vp(20)
    },
  })
  @State tabSelectedIndexes: int[] = [1]
  @State mText: string = 'start_init'
  @State mText2: string = 'end_init'
  build() {
    Row() {
      Column() {
        Column({ space: 20 } as ColumnOptions) {
          Button(this.mText)
            .id('localizedTextPadding_start')
            .onClick(() => {
              this.mText = 'start:' + JSON.stringify(this.tabOptions.localizedTextPadding?.start)
            })
          Button(this.mText2)
            .id('localizedTextPadding_end')
            .onClick(() => {
              this.mText2 = 'end:' + JSON.stringify(this.tabOptions.localizedTextPadding?.end)
            }).margin(20)
          SegmentButton({ options: this.tabOptions, selectedIndexes: this.tabSelectedIndexes })
        }.width('90%')
      }.width('100%')
    }.height('100%')
  }
}

