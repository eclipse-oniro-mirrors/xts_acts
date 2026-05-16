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

'use static'

import {
  Column,
  ColumnOptions,
  Button,
  Text,
  FlexAlign,
  Padding,
  Entry,
  Component
} from '@ohos.arkui.component';
import { CustomDialogController } from '@ohos.arkui.component';
import { CustomContentDialog } from '@ohos.arkui.advanced.Dialog';
import { AppStorage } from '@ohos.arkui.stateManagement';

@Entry
@Component
struct customContentDialog {
  // Dialog 1: Test primaryTitle
  dialogController1: CustomDialogController = new CustomDialogController({
    builder: CustomContentDialog({
      primaryTitle: 'Primary Title',
      contentBuilder: () => {
        Text('Test Content')
      },
      buttons: [
        {
          value: 'Confirm',
          action: () => {
            AppStorage.setOrCreate<string>('customContentDialogPrimaryTitle', 'Primary Title');
          },
        },
      ],
    }),
  })

  // Dialog 2: Test secondaryTitle
  dialogController2: CustomDialogController = new CustomDialogController({
    builder: CustomContentDialog({
      secondaryTitle: 'Secondary Title',
      contentBuilder: () => {
        Text('Test Content')
      },
      buttons: [
        {
          value: 'Confirm',
          action: () => {
            AppStorage.setOrCreate<string>('customContentDialogSecondaryTitle', 'Secondary Title');
          },
        },
      ],
    }),
  })

  // Dialog 3: Test contentBuilder
  dialogController3: CustomDialogController = new CustomDialogController({
    builder: CustomContentDialog({
      contentBuilder: () => {
        Column() {
          Text('Custom content area')
            .fontSize(16)
          Text('Content built via contentBuilder')
            .fontSize(14)
            .margin({ top: 10 })
        }
        .padding(20)
      },
      buttons: [
        {
          value: 'Confirm',
          action: () => {
            AppStorage.setOrCreate<boolean>('customContentDialogContentBuilderCalled', true);
          },
        },
      ],
    }),
  })

  // Dialog 4: Test contentAreaPadding
  dialogController4: CustomDialogController = new CustomDialogController({
    builder: CustomContentDialog({
      contentBuilder: () => {
        Text('Test contentAreaPadding')
      },
      contentAreaPadding: { top: 20, right: 30, bottom: 20, left: 30 },
      buttons: [
        {
          value: 'Confirm',
          action: () => {
            AppStorage.setOrCreate<number>('customContentDialogContentAreaPaddingTop', 20);
            AppStorage.setOrCreate<number>('customContentDialogContentAreaPaddingRight', 30);
            AppStorage.setOrCreate<number>('customContentDialogContentAreaPaddingBottom', 20);
            AppStorage.setOrCreate<number>('customContentDialogContentAreaPaddingLeft', 30);
          },
        },
      ],
    }),
  })

  // Dialog 5: Test buttons
  dialogController5: CustomDialogController = new CustomDialogController({
    builder: CustomContentDialog({
      contentBuilder: () => {
        Text('Test buttons')
      },
      buttons: [
        {
value: 'Primary Button',
            action: () => {
            AppStorage.setOrCreate<string>('customContentDialogPrimaryButtonValue', 'Primary Button');
            AppStorage.setOrCreate<boolean>('customContentDialogPrimaryButtonActionCalled', true);
          },
        },
        {
value: 'Secondary Button',
            action: () => {
            AppStorage.setOrCreate<string>('customContentDialogSecondaryButtonValue', 'Secondary Button');
            AppStorage.setOrCreate<boolean>('customContentDialogSecondaryButtonActionCalled', true);
          },
        },
      ],
    }),
  })

  build() {
    Column({ space: 4 } as ColumnOptions) {
      Button('主标题')
        .id('btnCustomContentDialog1')
        .width('100%').layoutWeight(1).constraintSize({ minHeight: 0, maxHeight: '16%' }).fontSize(11)
        .onClick(() => { this.dialogController1.open() })
      Button('副标题')
        .id('btnCustomContentDialog2')
        .width('100%').layoutWeight(1).constraintSize({ minHeight: 0, maxHeight: '16%' }).fontSize(11)
        .onClick(() => { this.dialogController2.open() })
      Button('构建区')
        .id('btnCustomContentDialog3')
        .width('100%').layoutWeight(1).constraintSize({ minHeight: 0, maxHeight: '16%' }).fontSize(11)
        .onClick(() => { this.dialogController3.open() })
      Button('内边距')
        .id('btnCustomContentDialog4')
        .width('100%').layoutWeight(1).constraintSize({ minHeight: 0, maxHeight: '16%' }).fontSize(11)
        .onClick(() => { this.dialogController4.open() })
      Button('按钮组')
        .id('btnCustomContentDialog5')
        .width('100%').layoutWeight(1).constraintSize({ minHeight: 0, maxHeight: '16%' }).fontSize(11)
        .onClick(() => { this.dialogController5.open() })
    }
    .width('100%')
    .height('100%')
    .padding({ left: '3%', right: '3%', top: '2%', bottom: '2%' })
    .justifyContent(FlexAlign.SpaceEvenly)
  }
}
