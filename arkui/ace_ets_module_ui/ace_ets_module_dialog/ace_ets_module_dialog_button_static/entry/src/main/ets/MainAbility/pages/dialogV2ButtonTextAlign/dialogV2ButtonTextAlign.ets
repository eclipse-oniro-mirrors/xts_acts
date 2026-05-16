/**
 * Copyright (c) 2026 Shenzhen Kaihong Digital Industry Development Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

'use static';

import { Column, ColumnOptions, Button, Text, TextAlign, Entry, Component } from '@ohos.arkui.component';
import { CustomDialogController } from '@ohos.arkui.component';
import { AlertDialogV2, AdvancedDialogV2Button } from '@ohos.arkui.advanced.DialogV2';
import { AppStorage } from '@ohos.arkui.stateManagement';

function dlgV2OnPrimaryEndAction(): void {
  AppStorage.setOrCreate<string>('dlgV2_textAlign', 'end');
}

/** 静态 ArkTS 下 CustomDialogController 的 builder 须为 @Builder 函数 */
@Builder
function dialogV2TextAlignBuilder(): void {
  AlertDialogV2({
    primaryTitle: 'V2',
    content: 'AdvancedDialogV2Button.textAlign',
    primaryButton: new AdvancedDialogV2Button({
      content: 'OK',
      textAlign: TextAlign.End,
      action: dlgV2OnPrimaryEndAction,
    }),
  });
}

@Entry
@Component
struct DialogV2ButtonTextAlign {
  dialogV2TextAlign: CustomDialogController = new CustomDialogController({
    builder: dialogV2TextAlignBuilder,
  });

  build() {
    Column({ space: 8 } as ColumnOptions) {
      Text('@ohos.arkui.advanced.DialogV2 AdvancedDialogV2Button.textAlign')
        .fontSize(11)
        .width('100%')
        .height('10%')
        .id('dlgV2_title')
        .key('dlgV2_title');
      Button('Open AlertDialogV2')
        .id('dlgV2_open')
        .key('dlgV2_open')
        .width('100%')
        .height('8%')
        .onClick((): void => {
          this.dialogV2TextAlign.open();
        });
      /** 自动化：与弹窗主按钮同一回调；勿在 0200 中先 open 弹窗（模态会遮挡本按钮） */
      Button('dlgV2_invoke')
        .fontSize(9)
        .id('dlgV2_invoke_primary_action')
        .key('dlgV2_invoke_primary_action')
        .width('100%')
        .height('6%')
        .onClick((): void => {
          dlgV2OnPrimaryEndAction();
        });
    }
    .width('100%')
    .height('100%')
    .padding({ left: '2%', right: '2%', top: '1%', bottom: '1%' });
  }
}
