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
  ItemRestriction,
  SegmentButton,
  SegmentButtonIconItem,
  SegmentButtonOptions,
  SegmentButtonTextItem
} from '@kit.ArkUI';

@Entry
@Component
struct SegBtnItem0010 {
  @State tabOptions: SegmentButtonOptions = SegmentButtonOptions.tab({
    buttons: [
      { text: 'tab1', accessibilityLevel: 'auto', accessibilityDescription: 'tab1' },
      { text: 'tab2', accessibilityLevel: 'no', accessibilityDescription: 'tab2' },
      { text: 'tab3', accessibilityLevel: 'yes', accessibilityDescription: 'tab3' },
      { text: 'tab4', accessibilityLevel: 'no-hide-descendants', accessibilityDescription: 'tab4' }
    ] as ItemRestriction<SegmentButtonTextItem>
  })
  @State capOptions: SegmentButtonOptions = SegmentButtonOptions.capsule({
    buttons: [
      {
        icon: $r('sys.media.ohos_ic_public_email'),
        iconAccessibilityText: 'notSelect',
        selectedIcon: $r('sys.media.ohos_ic_public_clock'),
        selectedIconAccessibilityText: 'email1',
        accessibilityLevel: 'auto',
        accessibilityDescription: 'email1'
      },
      {
        icon: $r('sys.media.ohos_ic_public_email'),
        iconAccessibilityText: 'notSelect',
        selectedIcon: $r('sys.media.ohos_ic_public_clock'),
        selectedIconAccessibilityText: 'email2',
        accessibilityLevel: 'no',
        accessibilityDescription: 'email2'
      },
      {
        icon: $r('sys.media.ohos_ic_public_email'),
        iconAccessibilityText: 'notSelect',
        selectedIcon: $r('sys.media.ohos_ic_public_clock'),
        selectedIconAccessibilityText: 'email3',
        accessibilityLevel: 'yes',
        accessibilityDescription: 'email3'
      },
      {
        icon: $r('sys.media.ohos_ic_public_email'),
        iconAccessibilityText: 'notSelect',
        selectedIcon: $r('sys.media.ohos_ic_public_clock'),
        selectedIconAccessibilityText: 'email4',
        accessibilityLevel: 'no-hide-descendants',
        accessibilityDescription: 'email4'
      }
    ] as ItemRestriction<SegmentButtonIconItem>
  })
  @State selectedIndexes: number[] = [0]

  build() {
    Column({ space: 10 }) {
      SegmentButton({
        options: this.tabOptions,
        selectedIndexes: $selectedIndexes
      })
      SegmentButton({
        options: this.capOptions,
        selectedIndexes: $selectedIndexes
      })
    }
  }
}