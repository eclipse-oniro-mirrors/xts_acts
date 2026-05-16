/**
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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
  SegmentButton,
  SegmentButtonOptions,
  SegmentButtonItemTuple,
  SegmentButtonItemOptions
} from '@kit.ArkUI';

@Entry
@Component
struct SegmentButtonOptionsReturnValue {
  @State singleSelectCapsuleOptions: SegmentButtonOptions = SegmentButtonOptions.capsule({
    buttons: [{ text: '1' }, { text: '2' }] as SegmentButtonItemTuple,
    multiply: false,
    backgroundBlurStyle: BlurStyle.BACKGROUND_THICK
  });
  @State capsuleSelectedIndexes: number[] = [0];

  build() {
    Row() {
      Column() {
        Column({ space: 10 }) {
          SegmentButton({
            options: this.singleSelectCapsuleOptions,
            selectedIndexes: $capsuleSelectedIndexes
          })
          Button('删除第一个按钮')
            .height('5%')
            .id('SBOShift')
            .onClick(() => {
              AppStorage.setOrCreate<undefined | SegmentButtonItemOptions >('SBOShift',this.singleSelectCapsuleOptions.buttons.shift());
            })
          Button('删除最后一个按钮')
            .id('SBOPop')
            .height('5%')
            .onClick(() => {
              AppStorage.setOrCreate<undefined | SegmentButtonItemOptions >('SBOShift',this.singleSelectCapsuleOptions.buttons.pop());
            })
          Button('将按钮2、3替换为splice1、splice2')
            .id('SBOSplice')
            .height('5%')
            .onClick(() => {
              AppStorage.setOrCreate<SegmentButtonItemOptions[] >('SBOSplice',this.singleSelectCapsuleOptions.buttons.splice(1, 1, new SegmentButtonItemOptions({
                text: 'splice1'
              })));
              AppStorage.setOrCreate<SegmentButtonItemOptions[] >('SBOSpliceEmpty',this.singleSelectCapsuleOptions.buttons.splice(1, 0, new SegmentButtonItemOptions({
                text: 'splice2'
              })));
            })
        }.width('90%')
      }.width('100%')
    }.height('90%')
  }
}