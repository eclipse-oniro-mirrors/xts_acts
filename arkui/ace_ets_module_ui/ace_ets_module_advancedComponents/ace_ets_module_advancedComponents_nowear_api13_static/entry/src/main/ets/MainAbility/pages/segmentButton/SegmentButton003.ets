'use static';
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


import { Entry, Component, Column, Image, Button, Edges, $r, ClickEvent, LocalizedEdges,
  Flex, FlexDirection, ItemAlign, FlexAlign, Text, FontWeight, ColumnOptions, Row,BlurStyle
} from '@ohos.arkui.component'
import { State } from '@ohos.arkui.stateManagement';
import { SegmentButtonOptions, ItemRestriction,SegmentButtonIconItem, SegmentButton } from '@ohos.arkui.advanced.SegmentButton'
@Entry
@Component
struct SegmentButton003 {
  @State iconCapsuleOptions: SegmentButtonOptions = SegmentButtonOptions.capsule({
    buttons: [
      { icon: $r('sys.media.ohos_ic_public_email'), iconAccessibilityText: 'notSelect',
        selectedIcon: $r('sys.media.ohos_ic_public_clock'), selectedIconAccessibilityText: 'select',
        accessibilityLevel: 'yes', accessibilityDescription: 'Description'},
      { icon: $r('sys.media.ohos_ic_public_email'), iconAccessibilityText: 'notSelect',
        selectedIcon: $r('sys.media.ohos_ic_public_clock'), selectedIconAccessibilityText: 'select',
        accessibilityLevel: 'yes', accessibilityDescription: 'Description'},
      { icon: $r('sys.media.ohos_ic_public_email'), iconAccessibilityText: 'notSelect',
        selectedIcon: $r('sys.media.ohos_ic_public_clock'), selectedIconAccessibilityText: 'select',
        accessibilityLevel: 'yes', accessibilityDescription: 'Description'},
      { icon: $r('sys.media.ohos_ic_public_email'), iconAccessibilityText: 'notSelect',
        selectedIcon: $r('sys.media.ohos_ic_public_clock'), selectedIconAccessibilityText: 'select',
        accessibilityLevel: 'yes', accessibilityDescription: 'Description'}
    ]  as ItemRestriction<SegmentButtonIconItem>,
    multiply: false,
    backgroundBlurStyle: BlurStyle.BACKGROUND_THICK
  })
  @State singleSelectIconCapsuleSelectedIndexes: int[] = [3]

  build() {
    Row() {
      Column() {
        Column({ space: 25 } as ColumnOptions) {
          SegmentButton({ options: this.iconCapsuleOptions,
            selectedIndexes: this.singleSelectIconCapsuleSelectedIndexes })
        }.width('90%')
      }.width('100%')
    }.height('100%')
  }
}