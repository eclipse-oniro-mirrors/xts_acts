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
// import { AccessibilitySelectedType, Chip, ChipSize } from '@kit.ArkUI';
import { Entry, Component, Scroll, Column, ColumnOptions, Text, Row, FontWeight, LocalizedPadding, ShadowStyle, BlurStyle, FlexAlign,
  ClickEvent,
  $r,
  Color
} from '@ohos.arkui.component';
import { State } from '@ohos.arkui.stateManagement';
import { Chip,ChipOptions, ChipSize, PrefixIconOptions, CloseOptions,AccessibilitySelectedType, LabelOptions } from '@ohos.arkui.advanced.Chip'
@Entry
@Component
struct ChipAccessibilityExample {
  @State clickedChipActivated: boolean = false;
  @State checkedChipActivated: boolean = false;
  @State selectedChipActivated: boolean = false;

  build() {
    Column({ space: 20 } as ColumnOptions) {
      Text('Chip组件无障碍属性示例').fontSize(20).fontWeight(FontWeight.Bold)

      // 点击型Chip - CLICKED类型
      Chip({
        label: { text: '点击型Chip' } as LabelOptions,
        prefixIcon: {
          src: $r('sys.media.ohos_app_icon'),
          fillColor: Color.Blue
        } as PrefixIconOptions,
        size: ChipSize.NORMAL,
        accessibilitySelectedType: AccessibilitySelectedType.CLICKED, // 点击型
        accessibilityDescription: '这是一个点击型Chip', // 整体无障碍描述
        accessibilityLevel: 'yes', // 确保可被无障碍服务识别
        closeOptions: {
          accessibilityDescription: '删除此Chip，此操作无法撤销' // 为删除按钮提供详细说明
        } as CloseOptions,
        activated: this.clickedChipActivated,
        onClicked: () => {
          this.clickedChipActivated = !this.clickedChipActivated;
          this.getUIContext().getPromptAction().showToast({ message: '点击型Chip被点击' });
        },
        onClose: () => {
          this.getUIContext().getPromptAction().showToast({ message: '点击型Chip的关闭按钮被点击' });
        }
      } as ChipOptions)

      // 复选型Chip - CHECKED类型
      Chip({
        label: { text: '复选型Chip' } as LabelOptions,
        prefixIcon: {
          src: $r('sys.media.ohos_app_icon'),
          fillColor: Color.Green
        } as PrefixIconOptions,
        size: ChipSize.NORMAL,
        accessibilitySelectedType: AccessibilitySelectedType.CHECKED, // 复选型
        accessibilityDescription: '这是一个复选型Chip', // 整体无障碍描述
        activated: this.checkedChipActivated,
        onClicked: () => {
          this.checkedChipActivated = !this.checkedChipActivated;
          this.getUIContext().getPromptAction().showToast({
            message: this.checkedChipActivated ? '复选型Chip被选中' : '复选型Chip被取消选中'
          });
        }
      } as ChipOptions)

      // 单选型Chip - SELECTED类型
      Chip({
        label: { text: '单选型Chip' } as LabelOptions,
        prefixIcon: {
          src: $r('sys.media.ohos_app_icon'),
          fillColor: Color.Red
        } as PrefixIconOptions,
        size: ChipSize.NORMAL,
        accessibilitySelectedType: AccessibilitySelectedType.SELECTED, // 单选型
        accessibilityDescription: '这是一个单选型Chip', // 整体无障碍描述
        activated: this.selectedChipActivated,
        onClicked: () => {
          this.selectedChipActivated = !this.selectedChipActivated;
          this.getUIContext().getPromptAction().showToast({
            message: this.selectedChipActivated ? '单选型Chip被选中' : '单选型Chip被取消选中'
          });
        }
      } as ChipOptions)

      // 无障碍级别设置示例
      Chip({
        label: { text: '无障碍级别为no' } as LabelOptions,
        size: ChipSize.NORMAL,
        accessibilityLevel: 'no', // 此Chip不能被无障碍服务识别
        closeOptions: {
          accessibilityLevel: 'no'
        } as CloseOptions,
        backgroundColor: '#CCCCCC',
        onClicked: () => {
          this.getUIContext().getPromptAction().showToast({ message: '此Chip无法被无障碍服务识别' });
        }
      } as ChipOptions)
    }
    .width('100%')
    .padding(16)
  }
}