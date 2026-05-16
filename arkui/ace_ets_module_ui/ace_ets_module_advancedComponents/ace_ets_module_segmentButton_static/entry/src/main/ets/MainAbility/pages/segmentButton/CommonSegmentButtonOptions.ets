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

import { Entry, Component, Column, Image, Button, Edges, $r, ClickEvent, LocalizedEdges, ColumnOptions,
  Flex, FlexDirection, ItemAlign, FlexAlign, Text, FontWeight, ColumnOptions, Row, BlurStyle, LengthMetrics,
  LocalizedPadding, Direction,
} from '@ohos.arkui.component'
import { State } from '@ohos.arkui.stateManagement';
import { SegmentButtonOptions, ItemRestriction, SegmentButtonIconTextItem, SegmentButton, SegmentButtonItemOptions,
  CapsuleSegmentButtonConstructionOptions, BorderRadiusMode, SegmentButtonIconItem, CommonSegmentButtonOptions
} from '@ohos.arkui.advanced.SegmentButton'
import { AppStorage } from '@ohos.arkui.stateManagement';

@Entry
@Component
struct CommonSegmentButtonOptions1 {
  @State typeValue: string = '';
  @State singleSelectCapsuleOptions: SegmentButtonOptions = SegmentButtonOptions.capsule({
    buttons:
    [
      { text: 'splice1', icon: $r('sys.media.ohos_ic_public_email'), iconAccessibilityText: 'notSelect',
        selectedIcon: $r('sys.media.ohos_ic_public_clock'), selectedIconAccessibilityText: 'select',
        accessibilityLevel: 'yes', accessibilityDescription: 'CommonSegmentButtonOptions'},
      { text: 'bbb', icon: $r('sys.media.ohos_ic_public_email'), iconAccessibilityText: 'notSelect',
        selectedIcon: $r('sys.media.ohos_ic_public_clock'), selectedIconAccessibilityText: 'select',
        accessibilityLevel: 'yes', accessibilityDescription: 'CommonSegmentButtonOptions'},
      { text: 'ccc', icon: $r('sys.media.ohos_ic_public_email'), iconAccessibilityText: 'notSelect',
        selectedIcon: $r('sys.media.ohos_ic_public_clock'), selectedIconAccessibilityText: 'select',
        accessibilityLevel: 'yes', accessibilityDescription: 'CommonSegmentButtonOptions'},
      { text: 'ddd', icon: $r('sys.media.ohos_ic_public_email'), iconAccessibilityText: 'notSelect',
        selectedIcon: $r('sys.media.ohos_ic_public_clock'), selectedIconAccessibilityText: 'select',
        accessibilityLevel: 'yes', accessibilityDescription: 'CommonSegmentButtonOptions'}
    ] as ItemRestriction<SegmentButtonIconTextItem>,
    direction: Direction.Auto,
    localizedButtonPadding: {
      end: LengthMetrics.vp(10),
      start: LengthMetrics.vp(20)
    } as LocalizedPadding,
    localizedTextPadding: {
      end: LengthMetrics.vp(10),
      start: LengthMetrics.vp(20)
    } as LocalizedPadding,
    borderRadiusMode: BorderRadiusMode.CUSTOM, // 设置自定义的边框圆角半径
    backgroundBorderRadius: LengthMetrics.vp(8),
    itemBorderRadius: LengthMetrics.vp(6),
    backgroundBlurStyle: BlurStyle.BACKGROUND_THICK,
  })
  @State capsuleSelectedIndexes: int[] = [0]

  build() {
    Row() {
      Column() {
        Column({ space: 10 } as ColumnOptions) {
          SegmentButton({ options: this.singleSelectCapsuleOptions,
            selectedIndexes: this.capsuleSelectedIndexes })

          Button('get type')
            .id('CapsuleSegmentButtonOptions_type')
            .onClick(() => {
              this.typeValue = this.singleSelectCapsuleOptions.type
              AppStorage.setOrCreate<string>('CapsuleSegmentButtonOptions_type', this.typeValue);
            })
        }.width('90%')
      }.width('100%')
    }.height('100%')
  }
}