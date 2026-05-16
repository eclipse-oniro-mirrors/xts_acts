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

import { Entry, Text, Column, Component, Button, ClickEvent, Row, BlurStyle, $r, RowOptions, ColumnOptions } from '@ohos.arkui.component'
import { State } from '@ohos.arkui.stateManagement'
import hilog from '@ohos.hilog'
import {
  ItemRestriction,
  SegmentButton,
  SegmentButtonItemTuple,
  SegmentButtonOptions,
  SegmentButtonTextItem
} from '@ohos.arkui.advanced.SegmentButton';
@Entry
@Component
struct Index {
  @State tabOptions: SegmentButtonOptions = SegmentButtonOptions.tab({
    buttons: [{ text: '页签按钮1' }, { text: '页签按钮2' }, {
      text: '页签按钮3'
    }] as ItemRestriction<SegmentButtonTextItem>,
    backgroundBlurStyle: BlurStyle.BACKGROUND_THICK
  });
  @State singleSelectCapsuleOptions: SegmentButtonOptions = SegmentButtonOptions.capsule({
    buttons: [{ text: '单选按钮1' }, { text: '单选按钮2' }, { text: '单选按钮3' }] as SegmentButtonItemTuple,
    multiply: false,
    backgroundBlurStyle: BlurStyle.BACKGROUND_THICK
  });
  @State tabSelectedIndexes: int[] = [0];
  @State singleSelectCapsuleSelectedIndexes: int[] = [0];
  @State enableStateAnimation: boolean = false;
  @State enableStateAnimationIndex: number = 0;

  build() {
    Column({ space: 25 } as ColumnOptions) {


        Button('true').key('true')
          .onClick(() => {
            this.enableStateAnimation = true;
          })


      Button('SEGMENTBUTTON_STATIC_V1_0150')
      SegmentButton({
        options: this.tabOptions,
        selectedIndexes: this.tabSelectedIndexes,
        enableStateAnimation: this.enableStateAnimation
      })
      Button('SEGMENTBUTTON_STATIC_V1_0160')
      SegmentButton({
        options: this.singleSelectCapsuleOptions,
        selectedIndexes: this.singleSelectCapsuleSelectedIndexes,
        enableStateAnimation: this.enableStateAnimation
      })
      Text('' + this.enableStateAnimation).key('text')
      Button('push')
        .onClick(() => {
          this.tabSelectedIndexes = [0];
          this.singleSelectCapsuleSelectedIndexes = [0];
        })
      Button('push1')
        .onClick(() => {
          this.tabSelectedIndexes = [1];
          this.singleSelectCapsuleSelectedIndexes = [2];
        })
      Button('push2')
        .onClick(() => {
          this.tabSelectedIndexes = [2];
          this.singleSelectCapsuleSelectedIndexes = [2];
        })
    }.width('100%')
  }
}