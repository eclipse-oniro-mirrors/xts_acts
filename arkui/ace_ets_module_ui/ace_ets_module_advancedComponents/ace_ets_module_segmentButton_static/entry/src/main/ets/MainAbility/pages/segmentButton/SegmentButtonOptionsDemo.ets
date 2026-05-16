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
  Column,
  Row,
  $r,
  BlurStyle,
  State,
  Color,
  FontWeight,
  ColumnOptions,
  ItemRestriction,
  SegmentButton,
  Padding,
  AppStorage,
  SegmentButtonOptions,
  SegmentButtonTextItem,
  SegmentButtonIconItem,
  SegmentButtonIconTextItem,
  Text
} from '@kit.ArkUI';

@Entry
@Component
struct Index {
  @State selectedIndexes: int[] = Array.create<int>(5, 0)
  @State tabOptions: SegmentButtonOptions = SegmentButtonOptions.tab({
    buttons: [{ text: '页签按钮1' }, { text: '页签按钮2' },
      { text: '页签按钮3' }] as ItemRestriction<SegmentButtonTextItem>,
    selectedFontColor: Color.Yellow,
    fontSize: 18,
    selectedFontSize: 20,
    fontWeight: FontWeight.Bolder,
    selectedFontWeight: FontWeight.Lighter,
    backgroundColor: Color.Green,
    selectedBackgroundColor: Color.Orange,
    buttonPadding: { top: 4},
    imageSize: { width: 40 },
    fontColor: Color.Black
  });

  @State multiplySelectCapsuleOptions: SegmentButtonOptions = SegmentButtonOptions.capsule({
    buttons: [{ text: '多选按钮1' }, { text: '多选按钮2' },
      { text: '多选按钮3' }] as ItemRestriction<SegmentButtonTextItem>,
    multiply: true
  });
  @State tabSelectedIndexes: int[] = [0];
  @State multiplySelectCapsuleSelectedIndexes: int[] = [0, 1];
  @State ints: int = -1;

  aboutToAppear() {
    AppStorage.setOrCreate<SegmentButtonOptions>('SegmentButtonOptions001', this.tabOptions);
    AppStorage.setOrCreate<SegmentButtonOptions>('SegmentButtonOptions002', this.multiplySelectCapsuleOptions);
  }
  build() {
    Row() {
      Column() {
        Column({ space: 25 } as ColumnOptions) {
          SegmentButton({
            options: this.tabOptions,
            selectedIndexes: this.tabSelectedIndexes,
            onItemClicked: (index: int) => {
              this.ints = index
            }
          })

          SegmentButton({
            options: this.multiplySelectCapsuleOptions,
            selectedIndexes: this.multiplySelectCapsuleSelectedIndexes,
            onItemClicked: undefined
          })
          Text(`${this.ints}` +  '').height('5%').id('onItemClickedIndex')
        }.width('90%')
      }.width('100%')
    }.height('100%')
  }
}