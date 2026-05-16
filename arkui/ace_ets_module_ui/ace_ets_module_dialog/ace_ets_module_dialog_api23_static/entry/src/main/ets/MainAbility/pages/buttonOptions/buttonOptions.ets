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
  Blank,
  Font,
  TextAlign,
  ClickEvent,
  Divider,
  Component,
  Column,
  ColumnOptions,
  StackOptions,
  Button,
  $r,
  Stack,
  Alignment,
  AttributeModifier,
  ButtonAttribute,
  ButtonLabelStyle,
  ButtonStyleMode,
  ButtonRole,
  Entry,
  Row,
  Text,
  FlexAlign
} from '@ohos.arkui.component';
import hilog from '@ohos.hilog';
import { CustomDialogController } from '@ohos.arkui.component';
import { TipsDialog } from '@ohos.arkui.advanced.Dialog';
import { AppStorage } from '@ohos.arkui.stateManagement';

@Entry
@Component
struct ButtonOptions {
  // Dialog 1: NORMAL + NORMAL (primaryButton)
  dialogController1: CustomDialogController = new CustomDialogController({
    builder: TipsDialog({
      imageRes: $r('sys.media.ohos_ic_public_voice'),
      content: 'Test NORMAL + NORMAL',
      primaryButton: {
        value: 'Cancel',
        action: () => {
          AppStorage.setOrCreate<string>('buttonValue', 'Cancel');
          AppStorage.setOrCreate<boolean>('buttonActionCalled', true);
          AppStorage.setOrCreate<number>('buttonStyle', ButtonStyleMode.NORMAL);
          AppStorage.setOrCreate<number>('buttonRole', ButtonRole.NORMAL);
        },
        buttonStyle: ButtonStyleMode.NORMAL,
        role: ButtonRole.NORMAL,
      },
    }),
  })

  // Dialog 2: NORMAL + ERROR (secondaryButton)
  dialogController2: CustomDialogController = new CustomDialogController({
    builder: TipsDialog({
      imageRes: $r('sys.media.ohos_ic_public_voice'),
      content: 'Test NORMAL + ERROR',
      secondaryButton: {
        value: 'Delete',
        action: () => {
          AppStorage.setOrCreate<string>('buttonValue', 'Delete');
          AppStorage.setOrCreate<boolean>('buttonActionCalled', true);
          AppStorage.setOrCreate<number>('buttonStyle', ButtonStyleMode.NORMAL);
          AppStorage.setOrCreate<number>('buttonRole', ButtonRole.ERROR);
        },
        buttonStyle: ButtonStyleMode.NORMAL,
        role: ButtonRole.ERROR,
      },
    }),
  })

  // Dialog 3: EMPHASIZED + NORMAL
  dialogController3: CustomDialogController = new CustomDialogController({
    builder: TipsDialog({
      imageRes: $r('sys.media.ohos_ic_public_voice'),
      content: 'Test EMPHASIZED + NORMAL',
      primaryButton: {
        value: 'Confirm',
        action: () => {
          AppStorage.setOrCreate<string>('buttonValue', 'Confirm');
          AppStorage.setOrCreate<boolean>('buttonActionCalled', true);
          AppStorage.setOrCreate<number>('buttonStyle', ButtonStyleMode.EMPHASIZED);
          AppStorage.setOrCreate<number>('buttonRole', ButtonRole.NORMAL);
        },
        buttonStyle: ButtonStyleMode.EMPHASIZED,
        role: ButtonRole.NORMAL,
      },
    }),
  })

  // Dialog 4: EMPHASIZED + ERROR
  dialogController4: CustomDialogController = new CustomDialogController({
    builder: TipsDialog({
      imageRes: $r('sys.media.ohos_ic_public_voice'),
      content: 'Test EMPHASIZED + ERROR',
      secondaryButton: {
        value: 'Danger',
        action: () => {
          AppStorage.setOrCreate<string>('buttonValue', 'Danger');
          AppStorage.setOrCreate<boolean>('buttonActionCalled', true);
          AppStorage.setOrCreate<number>('buttonStyle', ButtonStyleMode.EMPHASIZED);
          AppStorage.setOrCreate<number>('buttonRole', ButtonRole.ERROR);
        },
        buttonStyle: ButtonStyleMode.EMPHASIZED,
        role: ButtonRole.ERROR,
      },
    }),
  })

  // Dialog 5: TEXTUAL + NORMAL
  dialogController5: CustomDialogController = new CustomDialogController({
    builder: TipsDialog({
      imageRes: $r('sys.media.ohos_ic_public_voice'),
      content: 'Test TEXTUAL + NORMAL',
      primaryButton: {
        value: 'Text Button',
        action: () => {
          AppStorage.setOrCreate<string>('buttonValue', 'Text Button');
          AppStorage.setOrCreate<boolean>('buttonActionCalled', true);
          AppStorage.setOrCreate<number>('buttonStyle', ButtonStyleMode.TEXTUAL);
          AppStorage.setOrCreate<number>('buttonRole', ButtonRole.NORMAL);
        },
        buttonStyle: ButtonStyleMode.TEXTUAL,
        role: ButtonRole.NORMAL,
      },
    }),
  })

  // Dialog 6: TEXTUAL + ERROR
  dialogController6: CustomDialogController = new CustomDialogController({
    builder: TipsDialog({
      imageRes: $r('sys.media.ohos_ic_public_voice'),
      content: 'Test TEXTUAL + ERROR',
      secondaryButton: {
        value: 'Text Error',
        action: () => {
          AppStorage.setOrCreate<string>('buttonValue', 'Text Error');
          AppStorage.setOrCreate<boolean>('buttonActionCalled', true);
          AppStorage.setOrCreate<number>('buttonStyle', ButtonStyleMode.TEXTUAL);
          AppStorage.setOrCreate<number>('buttonRole', ButtonRole.ERROR);
        },
        buttonStyle: ButtonStyleMode.TEXTUAL,
        role: ButtonRole.ERROR,
      },
    }),
  })

  build() {
    Column({ space: 2 } as ColumnOptions) {
      Button('N+N')
        .id('btnButtonOptions1')
        .width('100%')
        .layoutWeight(1)
        .constraintSize({ minHeight: 0, maxHeight: '14%' })
        .fontSize(11)
        .onClick(() => {
          this.dialogController1.open()
        })
      Button('N+E')
        .id('btnButtonOptions2')
        .width('100%')
        .layoutWeight(1)
        .constraintSize({ minHeight: 0, maxHeight: '14%' })
        .fontSize(11)
        .onClick(() => {
          this.dialogController2.open()
        })
      Button('E+N')
        .id('btnButtonOptions3')
        .width('100%')
        .layoutWeight(1)
        .constraintSize({ minHeight: 0, maxHeight: '14%' })
        .fontSize(11)
        .onClick(() => {
          this.dialogController3.open()
        })
      Button('E+E')
        .id('btnButtonOptions4')
        .width('100%')
        .layoutWeight(1)
        .constraintSize({ minHeight: 0, maxHeight: '14%' })
        .fontSize(11)
        .onClick(() => {
          this.dialogController4.open()
        })
      Button('T+N')
        .id('btnButtonOptions5')
        .width('100%')
        .layoutWeight(1)
        .constraintSize({ minHeight: 0, maxHeight: '14%' })
        .fontSize(11)
        .onClick(() => {
          this.dialogController5.open()
        })
      Button('T+E')
        .id('btnButtonOptions6')
        .width('100%')
        .layoutWeight(1)
        .constraintSize({ minHeight: 0, maxHeight: '14%' })
        .fontSize(11)
        .onClick(() => {
          this.dialogController6.open()
        })
    }
    .width('100%')
    .height('100%')
    .padding({ left: '3%', right: '3%', top: '2%', bottom: '2%' })
    .justifyContent(FlexAlign.SpaceEvenly)
  }
}