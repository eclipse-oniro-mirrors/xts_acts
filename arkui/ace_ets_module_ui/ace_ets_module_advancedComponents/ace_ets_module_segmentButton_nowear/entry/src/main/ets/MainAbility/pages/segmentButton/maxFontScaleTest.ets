/**
 * Copyright (c) 2024 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the 'License');
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an 'AS IS' BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
/**
 * Copyright (c) 2024 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the 'License');
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an 'AS IS' BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import {
  ItemRestriction,
  SegmentButton,
  SegmentButtonItemTuple,
  SegmentButtonOptions,
  SegmentButtonTextItem,
  SegmentButtonItemOptions
} from '@kit.ArkUI';

@Entry
@Component
struct maxFontScaleTest {
  @State maxFontScale: number = 2
  @State tabOptions: SegmentButtonOptions = SegmentButtonOptions.tab({
    buttons: [{ text: '页签按钮1', accessibilityLevel: 'yes', accessibilityDescription: '页签按钮1 新手提醒' },
      { text: '页签按钮2', accessibilityLevel: 'yes', accessibilityDescription: '页签按钮2 新手提醒' },
      {
        text: '页签按钮3', accessibilityLevel: 'yes', accessibilityDescription: '页签按钮3 新手提醒'
      }] as ItemRestriction<SegmentButtonTextItem>,
    backgroundBlurStyle: BlurStyle.BACKGROUND_THICK
  })
  @State iconCapsuleOptions: SegmentButtonOptions = SegmentButtonOptions.capsule({
    buttons: [
      {
        icon: $r('sys.media.ohos_ic_public_email'),
        iconAccessibilityText: '未选中图标无障碍文本',
        selectedIcon: $r('sys.media.ohos_ic_public_clock'),
        selectedIconAccessibilityText: '选中图标无障碍文本',
        accessibilityLevel: 'yes',
        accessibilityDescription: 'SegmentButtonIconItem 新手提醒'
      },
      {
        icon: $r('sys.media.ohos_ic_public_email'),
        iconAccessibilityText: '未选中图标无障碍文本',
        selectedIcon: $r('sys.media.ohos_ic_public_clock'),
        selectedIconAccessibilityText: '选中图标无障碍文本',
        accessibilityLevel: 'yes',
        accessibilityDescription: 'SegmentButtonIconItem 新手提醒'
      },
      {
        icon: $r('sys.media.ohos_ic_public_email'),
        iconAccessibilityText: '未选中图标无障碍文本',
        selectedIcon: $r('sys.media.ohos_ic_public_clock'),
        selectedIconAccessibilityText: '选中图标无障碍文本',
        accessibilityLevel: 'yes',
        accessibilityDescription: 'SegmentButtonIconItem 新手提醒'
      },
      {
        icon: $r('sys.media.ohos_ic_public_email'),
        iconAccessibilityText: '未选中图标无障碍文本',
        selectedIcon: $r('sys.media.ohos_ic_public_clock'),
        selectedIconAccessibilityText: '选中图标无障碍文本',
        accessibilityLevel: 'yes',
        accessibilityDescription: 'SegmentButtonIconItem 新手提醒'
      }
    ] as SegmentButtonItemTuple,
    multiply: false,
    backgroundBlurStyle: BlurStyle.BACKGROUND_THICK
  })
  @State iconTextCapsuleOptions: SegmentButtonOptions = SegmentButtonOptions.capsule({
    buttons: [
      {
        text: $r('[hsplibrary].string.title'),
        icon: $r('sys.media.ohos_ic_public_email'),
        iconAccessibilityText: $r('[hsplibrary].string.title'),
        selectedIcon: $r('sys.media.ohos_ic_public_clock'),
        selectedIconAccessibilityText: '选中图标无障碍文本',
        accessibilityLevel: 'yes',
        accessibilityDescription: 'SegmentButtonIconTextItem 新手提醒'
      },
      {
        text: '图标1',
        icon: $r('sys.media.ohos_ic_public_email'),
        iconAccessibilityText: '未选中图标无障碍文本',
        selectedIcon: $r('sys.media.ohos_ic_public_clock'),
        selectedIconAccessibilityText: '选中图标无障碍文本',
        accessibilityLevel: 'yes',
        accessibilityDescription: 'SegmentButtonIconTextItem 新手提醒'
      },
      {
        text: '图标1',
        icon: $r('sys.media.ohos_ic_public_email'),
        iconAccessibilityText: '未选中图标无障碍文本',
        selectedIcon: $r('sys.media.ohos_ic_public_clock'),
        selectedIconAccessibilityText: '选中图标无障碍文本',
        accessibilityLevel: 'yes',
        accessibilityDescription: 'SegmentButtonIconTextItem 新手提醒'
      },
      {
        text: '图标1',
        icon: $r('sys.media.ohos_ic_public_email'),
        iconAccessibilityText: '未选中图标无障碍文本',
        selectedIcon: $r('sys.media.ohos_ic_public_clock'),
        selectedIconAccessibilityText: '选中图标无障碍文本',
        accessibilityLevel: 'yes',
        accessibilityDescription: 'SegmentButtonIconTextItem 新手提醒'
      }
    ] as SegmentButtonItemTuple,
    multiply: true
  })
  @State tabSelectedIndexes: number[] = [1]
  @State singleSelectIconCapsuleSelectedIndexes: number[] = [3]
  @State multiplySelectIconTextCapsuleSelectedIndexes: number[] = [1, 2]

  build() {
    Column({ space: 20 }) {
      Column({ space: 25 }) {
        Text('maxFontScale: ' + this.maxFontScale).id('text')
        SegmentButton({
          options: this.tabOptions,
          selectedIndexes: this.tabSelectedIndexes,
          maxFontScale: this.maxFontScale
        }).id('segmentButton')
        SegmentButton({
          options: this.iconCapsuleOptions,
          selectedIndexes: $singleSelectIconCapsuleSelectedIndexes,
          maxFontScale: this.maxFontScale
        })
        SegmentButton({
          options: this.iconTextCapsuleOptions,
          selectedIndexes: $multiplySelectIconTextCapsuleSelectedIndexes,
          maxFontScale: this.maxFontScale
        })
        Button('将按钮2、3替换为splice1、splice2')
          .onClick(() => {
            this.iconTextCapsuleOptions.buttons.splice(1, 2, new SegmentButtonItemOptions({
              text: 'splice1', accessibilityLevel: 'yes', accessibilityDescription: 'SegmentButtonItemOptions 新手提醒'
            }), new SegmentButtonItemOptions({
              text: 'splice2',
              icon: $r('sys.media.ohos_ic_public_email'),
              iconAccessibilityText: '未选中图标无障碍文本',
              selectedIcon: $r('sys.media.ohos_ic_public_clock'),
              selectedIconAccessibilityText: '选中图标无障碍文本',
              accessibilityLevel: 'yes',
              accessibilityDescription: 'SegmentButtonIconTextItem 新手提醒'
            }))
          })
      }.width('90%')
    }
    .height('100%')
    .width('100%')
    .justifyContent(FlexAlign.Center)
  }
}