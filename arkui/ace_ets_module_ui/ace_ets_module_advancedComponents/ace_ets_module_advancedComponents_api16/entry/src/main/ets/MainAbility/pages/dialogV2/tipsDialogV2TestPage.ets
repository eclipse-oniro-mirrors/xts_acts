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

import { TipsDialogV2, AdvancedDialogV2Button } from '@ohos.arkui.advanced.DialogV2';
import promptAction from '@ohos.promptAction';
import { LengthUnit, ColorMetrics } from '@ohos.arkui.node';

@Entry
@ComponentV2
struct Index {
  @Local checked: boolean = false;
  @Local borderImageChecked: boolean = false;

  @Builder
  dialogBuilder(): void {
    TipsDialogV2({
      imageRes: $r('sys.media.ohos_ic_public_voice'),
      content: '想要卸载这个APP嘛?',
      title: 'TipsDialogV2',
      checkTips: '不再提示',
      checked: this.checked,
      primaryButton: new AdvancedDialogV2Button({
        content: '取消',
        action: () => {
          console.info('Callback when the first button is clicked');
        },
      }),
      secondaryButton: new AdvancedDialogV2Button({
        content: '删除',
        role: ButtonRole.ERROR,
        action: () => {
          console.info('Callback when the second button is clicked');
        }
      }),
      onCheckedChange: (checked: boolean) => {
        console.info('Callback when the checkbox is clicked');
        this.checked = checked;
      }
    })
  }

  @Builder
  borderImageDialogBuilder(): void {
    TipsDialogV2({
      imageRes: $r('sys.media.ohos_ic_public_voice'),
      imageSize: { width: 64, height: 64 },
      imageBorderColor: ColorMetrics.resourceColor(Color.Black),
      imageBorderWidth: { value: 1, unit: LengthUnit.VP },
      content: '带边框图片TipsDialog',
      title: 'TipsDialogV2',
      checkTips: '不再提示',
      checked: this.borderImageChecked,
      primaryButton: new AdvancedDialogV2Button({
        content: '取消',
        action: () => {
          console.info('Callback when the first button is clicked');
        },
      }),
      secondaryButton: new AdvancedDialogV2Button({
        content: '删除',
        role: ButtonRole.ERROR,
        action: () => {
          console.info('Callback when the second button is clicked');
        }
      }),
      onCheckedChange: (checked: boolean) => {
        console.info('Callback when the checkbox is clicked');
        this.checked = checked;
      }
    })
  }

  build() {
    Row() {
      Stack() {
        Column() {
          Button('TipsDialogV2')
            .width(96)
            .height(40)
            .onClick(() => {
              promptAction.openCustomDialog({
                builder: () => {
                  this.dialogBuilder();
                },
              });
            })
          Button('SecTipsDialogV2')
            .width(96)
            .height(40)
            .onClick(() => {
              promptAction.openCustomDialog({
                builder: () => {
                  this.borderImageDialogBuilder();
                },
              });
            })
        }.margin({ bottom: 300 })
      }.align(Alignment.Bottom)
      .width('100%').height('100%')
    }
    .backgroundImageSize({ width: '100%', height: '100%' })
    .height('100%')
  }
}