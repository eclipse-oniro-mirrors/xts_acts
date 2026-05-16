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
import { AlertDialog } from '@ohos.arkui.advanced.Dialog';
import { AppStorage } from '@ohos.arkui.stateManagement';

@Entry
@Component
struct DialogButtonOptionsTextAlign {
  dialogTextAlign: CustomDialogController = new CustomDialogController({
    builder: AlertDialog({
      primaryTitle: 'Align',
      content: 'ButtonOptions.textAlign',
      primaryButton: {
        value: 'OK',
        textAlign: TextAlign.Center,
        action: () => {
          AppStorage.setOrCreate<string>('dlgBtnOpt_textAlign', 'center');
        },
      },
    }),
  });

  build() {
    Column({ space: 8 } as ColumnOptions) {
      Text('@ohos.arkui.advanced.Dialog ButtonOptions.textAlign')
        .fontSize(11)
        .width('100%')
        .height('10%')
        .id('dlgBtnOpt_title');
      Button('Open AlertDialog')
        .id('dlgBtnOpt_open')
        .width('100%')
        .height('8%')
        .onClick(() => {
          this.dialogTextAlign.open();
        });
    }
    .width('100%')
    .height('100%')
    .padding({ left: '2%', right: '2%', top: '1%', bottom: '1%' });
  }
}
