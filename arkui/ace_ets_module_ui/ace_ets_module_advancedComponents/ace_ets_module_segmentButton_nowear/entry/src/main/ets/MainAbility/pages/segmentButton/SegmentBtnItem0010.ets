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

import { ImageModifier, TextModifier, SymbolGlyphModifier } from '@ohos.arkui.modifier'
import {
  ItemRestriction,
  SegmentButton,
  SegmentButtonItemTuple,
  SegmentButtonOptions,
  SegmentButtonTextItem
} from '@kit.ArkUI';
@Entry
@Component
export struct SegBtnItem0010 {
  @State clickedIndexes: number[] = [];
  @State tabOptions: SegmentButtonOptions = SegmentButtonOptions.tab({
    buttons: [{ text: 'a'},
      { text: 'd' }, { text: 'e' }]as ItemRestriction<SegmentButtonTextItem>,
    backgroundColor: 'rgb(213,213,213)',
    selectedBackgroundColor: '#330A59F7',
    textPadding: {
      top: 10,
      right: 10,
      bottom: 10,
      left: 10
    },
  });
  @State capsuleOptions: SegmentButtonOptions = SegmentButtonOptions.capsule({
    buttons: [{ text: 'b' }, { text: 'f' }, { text: 'g' }],
    fontColor: 'rgb(0,74,175)',
    selectedFontColor: 'rgb(247,247,247)',
    backgroundBlurStyle: BlurStyle.BACKGROUND_THICK
  })
  @State multiplyCapsuleOptions: SegmentButtonOptions = SegmentButtonOptions.capsule({
    buttons: [{ text: 'c' }, { text: 'h' }, { text: 'j' }],
    multiply: true,
    fontSize: 18,
    selectedFontSize: 18,
    fontWeight: FontWeight.Bolder,
    selectedFontWeight: FontWeight.Lighter,
  })
  @State iconCapsuleOptions: SegmentButtonOptions = SegmentButtonOptions.capsule({
    buttons: [
      { icon: $r('sys.media.ohos_ic_public_email'), selectedIcon: $r('sys.media.ohos_ic_public_clock') },
      { icon: $r('sys.media.ohos_ic_public_email'), selectedIcon: $r('sys.media.ohos_ic_public_clock') },
      { icon: $r('sys.media.ohos_ic_public_email'), selectedIcon: $r('sys.media.ohos_ic_public_clock') },
      { icon: $r('sys.media.ohos_ic_public_email'), selectedIcon: $r('sys.media.ohos_ic_public_clock') }
    ] as SegmentButtonItemTuple,
    multiply: false,
    imageSize: { width: 40, height: 40 },
    buttonPadding: {
      top: 6,
      right: 10,
      bottom: 6,
      left: 10
    },
    backgroundBlurStyle: BlurStyle.BACKGROUND_THICK
  })
  @State tabSelectedIndexes: number[] = [0];
  @State capsuleSelectedIndexes: number[] = [0];
  @State multiplyCapsuleSelectedIndexes: number[] = [0];
  @State iconCapsuleOptionsIndexes: number[] = [0];
  build() {

    NavDestination() {
      Column({ space: 12 }) {
        SegmentButton({
          options: this.tabOptions,
          selectedIndexes: $tabSelectedIndexes,
          onItemClicked: (index: number) => {
            this.clickedIndexes.push(index);
          }
        })

        SegmentButton({
          options: this.capsuleOptions,
          selectedIndexes: $capsuleSelectedIndexes,
          onItemClicked: (index: number) => {
            this.clickedIndexes.push(index);
          }
        })

        SegmentButton({
          options: this.multiplyCapsuleOptions,
          selectedIndexes: $multiplyCapsuleSelectedIndexes,
          onItemClicked: (index: number) => {
            this.clickedIndexes.push(index);
          }
        })
        SegmentButton({
          options: this.iconCapsuleOptions,
          selectedIndexes: $iconCapsuleOptionsIndexes,
          onItemClicked: (index: number) => {
            this.clickedIndexes.push(index);
          }
        })

        Text(`${JSON.stringify(this.clickedIndexes)}`)
      }

    }
    .title('SegmentButton')
  }
}