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
  State,
  Component,
  $r,
  BlurStyle,
  Button,
  Column,
  ColumnOptions,
  ItemRestriction,
  SegmentButton,
  SegmentButtonOptions,
  SegmentButtonItemOptionsArray,
  SegmentButtonItemTuple,
  SegmentButtonItemOptions
} from '@kit.ArkUI';
import { AppStorage } from '@ohos.arkui.stateManagement';

@Entry
@Component
struct SegmentButtonItemOptionsArray1 {
  @State singleSelectCapsuleOptions: SegmentButtonOptions = SegmentButtonOptions.capsule({
    buttons: [{ text: '1' }, { text: '2' }, { text: '3' },
      { text: '4' }, { text: '5' }] as SegmentButtonItemTuple,
    multiply: false,
    backgroundBlurStyle: BlurStyle.BACKGROUND_THICK
  })
  @State capsuleSelectedIndexes: Int[] = [0]

  build() {
    Column() {
      SegmentButton({ options: this.singleSelectCapsuleOptions,
        selectedIndexes: this.capsuleSelectedIndexes })

      Button('更改所有按钮文字')
        .id('SegmentButtonItemOptionsArray_push')
        .onClick(() => {
          let myArray:SegmentButtonItemOptionsArray = this.singleSelectCapsuleOptions.buttons
          myArray.push({ text: 'a' })
          AppStorage.setOrCreate<string>('SegmentButtonItemOptionsArray_push', 'push succ');
        })
    }
    .width('90%')
  }
}