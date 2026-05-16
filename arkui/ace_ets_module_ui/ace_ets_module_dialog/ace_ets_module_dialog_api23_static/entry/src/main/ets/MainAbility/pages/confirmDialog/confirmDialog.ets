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
  ThemeColorMode,
  FlexAlign,
  Entry,
  Component
} from '@ohos.arkui.component';
import { CustomDialogController } from '@ohos.arkui.component';
import { ConfirmDialog } from '@ohos.arkui.advanced.Dialog';
import { CustomTheme, CustomColors } from '@ohos.arkui.theme';
import { State } from '@ohos.arkui.stateManagement';
import { AppStorage } from '@ohos.arkui.stateManagement';

// Custom theme color implementation
class CustomThemeImpl implements CustomTheme {
  public colors?: CustomColors;

  constructor(colors: CustomColors) {
    this.colors = colors;
  }
}

// Custom content text and icon theme colors
class CustomThemeColors implements CustomColors {
  public fontPrimary?: string = '#ffd0a300';
  public iconSecondary?: string = '#ffd000cd';
}

@Entry
@Component
struct confirmDialog {
  @State isChecked1: boolean = true;
  @State isChecked2: boolean = false;
  @State customTheme: CustomTheme = new CustomThemeImpl(new CustomThemeColors());

  // Dialog 1: Test title
  dialogController1: CustomDialogController = new CustomDialogController({
    builder: ConfirmDialog({
      title: 'Test Title',
      content: 'Test Content',
      primaryButton: {
        value: 'Confirm',
        action: () => {
          AppStorage.setOrCreate<string>('confirmDialogTitle', 'Test Title');
        },
      },
    }),
  })

  // Dialog 2: Test content
  dialogController2: CustomDialogController = new CustomDialogController({
    builder: ConfirmDialog({
      content: 'Test Content',
      primaryButton: {
        value: 'Confirm',
        action: () => {
          AppStorage.setOrCreate<string>('confirmDialogContent', 'Test Content');
        },
      },
    }),
  })

  // Dialog 3: Test checkTips
  dialogController3: CustomDialogController = new CustomDialogController({
    builder: ConfirmDialog({
      checkTips: 'Do not show again',
      content: 'Test checkTips',
      primaryButton: {
        value: 'Confirm',
        action: () => {
          AppStorage.setOrCreate<string>('confirmDialogCheckTips', 'Do not show again');
        },
      },
    }),
  })

  // Dialog 4: Test isChecked(true)
  dialogController4: CustomDialogController = new CustomDialogController({
    builder: ConfirmDialog({
      checkTips: 'Test Checkbox',
      isChecked: this.isChecked1,
      content: 'Test isChecked(true)',
      primaryButton: {
        value: 'Confirm',
        action: () => {
          AppStorage.setOrCreate<boolean>('confirmDialogInitialIsChecked', this.isChecked1);
        },
      },
    }),
    autoCancel: false,
  })

  // Dialog 5: Test isChecked(false)
  dialogController5: CustomDialogController = new CustomDialogController({
    builder: ConfirmDialog({
      checkTips: 'Test Checkbox',
      isChecked: this.isChecked2,
      content: 'Test isChecked(false)',
      primaryButton: {
        value: 'Confirm',
        action: () => {
          AppStorage.setOrCreate<boolean>('confirmDialogInitialIsChecked', this.isChecked2);
        },
      },
    }),
    autoCancel: false,
  })

  // Dialog 6: Test primaryButton
  dialogController6: CustomDialogController = new CustomDialogController({
    builder: ConfirmDialog({
      content: 'Test primaryButton',
      primaryButton: {
        value: 'Primary Button',
        action: () => {
          AppStorage.setOrCreate<string>('confirmDialogPrimaryButtonValue', 'Primary Button');
          AppStorage.setOrCreate<boolean>('confirmDialogPrimaryButtonActionCalled', true);
        },
      },
    }),
  })

  // Dialog 7: Test secondaryButton
  dialogController7: CustomDialogController = new CustomDialogController({
    builder: ConfirmDialog({
      content: 'Test secondaryButton',
      secondaryButton: {
        value: 'Secondary Button',
        action: () => {
          AppStorage.setOrCreate<string>('confirmDialogSecondaryButtonValue', 'Secondary Button');
          AppStorage.setOrCreate<boolean>('confirmDialogSecondaryButtonActionCalled', true);
        },
      },
    }),
  })

  // Dialog 8: Test theme
  dialogController8: CustomDialogController = new CustomDialogController({
    builder: ConfirmDialog({
      content: 'Test custom theme',
      theme: this.customTheme,
      primaryButton: {
        value: 'Confirm',
        action: () => {
          AppStorage.setOrCreate<boolean>('confirmDialogThemeSet', true);
        },
      },
    }),
    autoCancel: false,
  })

  // Dialog 9: Test themeColorMode(SYSTEM)
  dialogController9: CustomDialogController = new CustomDialogController({
    builder: ConfirmDialog({
      content: 'Test SYSTEM mode',
      themeColorMode: ThemeColorMode.SYSTEM,
      primaryButton: {
        value: 'Confirm',
        action: () => {
          AppStorage.setOrCreate<number>('confirmDialogThemeColorMode', ThemeColorMode.SYSTEM);
        },
      },
    }),
    autoCancel: false,
  })

  // Dialog 10: Test themeColorMode(LIGHT)
  dialogController10: CustomDialogController = new CustomDialogController({
    builder: ConfirmDialog({
      content: 'Test LIGHT mode',
      themeColorMode: ThemeColorMode.LIGHT,
      primaryButton: {
        value: 'Confirm',
        action: () => {
          AppStorage.setOrCreate<number>('confirmDialogThemeColorMode', ThemeColorMode.LIGHT);
        },
      },
    }),
    autoCancel: false,
  })

  // Dialog 11: Test themeColorMode(DARK)
  dialogController11: CustomDialogController = new CustomDialogController({
    builder: ConfirmDialog({
      content: 'Test DARK mode',
      themeColorMode: ThemeColorMode.DARK,
      primaryButton: {
        value: 'Confirm',
        action: () => {
          AppStorage.setOrCreate<number>('confirmDialogThemeColorMode', ThemeColorMode.DARK);
        },
      },
    }),
    autoCancel: false,
  })

  // Dialog 12: Test onCheckedChange
  dialogController12: CustomDialogController = new CustomDialogController({
    builder: ConfirmDialog({
      checkTips: 'Do not show again',
      isChecked: this.isChecked1,
      onCheckedChange: (isChecked: boolean) => {
        AppStorage.setOrCreate<boolean>('confirmDialogOnCheckedChangeCalled', true);
        AppStorage.setOrCreate<boolean>('confirmDialogOnCheckedChangeValue', isChecked);
        this.isChecked1 = isChecked;
      },
      content: 'Test onCheckedChange',
      primaryButton: {
        value: 'Confirm',
      },
    }),
    autoCancel: false,
  })

  build() {
    Column({ space: 1 } as ColumnOptions) {
      Button('标题')
        .id('btnConfirmDialog1')
        .width('100%').layoutWeight(1).constraintSize({ minHeight: 0, maxHeight: '7.5%' }).fontSize(9)
        .onClick(() => { this.dialogController1.open() })
      Button('内容')
        .id('btnConfirmDialog2')
        .width('100%').layoutWeight(1).constraintSize({ minHeight: 0, maxHeight: '7.5%' }).fontSize(9)
        .onClick(() => { this.dialogController2.open() })
      Button('提示')
        .id('btnConfirmDialog3')
        .width('100%').layoutWeight(1).constraintSize({ minHeight: 0, maxHeight: '7.5%' }).fontSize(9)
        .onClick(() => { this.dialogController3.open() })
      Button('勾选T')
        .id('btnConfirmDialog4')
        .width('100%').layoutWeight(1).constraintSize({ minHeight: 0, maxHeight: '7.5%' }).fontSize(9)
        .onClick(() => { this.dialogController4.open() })
      Button('勾选F')
        .id('btnConfirmDialog5')
        .width('100%').layoutWeight(1).constraintSize({ minHeight: 0, maxHeight: '7.5%' }).fontSize(9)
        .onClick(() => { this.dialogController5.open() })
      Button('主键')
        .id('btnConfirmDialog6')
        .width('100%').layoutWeight(1).constraintSize({ minHeight: 0, maxHeight: '7.5%' }).fontSize(9)
        .onClick(() => { this.dialogController6.open() })
      Button('次键')
        .id('btnConfirmDialog7')
        .width('100%').layoutWeight(1).constraintSize({ minHeight: 0, maxHeight: '7.5%' }).fontSize(9)
        .onClick(() => { this.dialogController7.open() })
      Button('主题')
        .id('btnConfirmDialog8')
        .width('100%').layoutWeight(1).constraintSize({ minHeight: 0, maxHeight: '7.5%' }).fontSize(9)
        .onClick(() => { this.dialogController8.open() })
      Button('·系统')
        .id('btnConfirmDialog9')
        .width('100%').layoutWeight(1).constraintSize({ minHeight: 0, maxHeight: '7.5%' }).fontSize(9)
        .onClick(() => { this.dialogController9.open() })
      Button('·浅色')
        .id('btnConfirmDialog10')
        .width('100%').layoutWeight(1).constraintSize({ minHeight: 0, maxHeight: '7.5%' }).fontSize(9)
        .onClick(() => { this.dialogController10.open() })
      Button('·深色')
        .id('btnConfirmDialog11')
        .width('100%').layoutWeight(1).constraintSize({ minHeight: 0, maxHeight: '7.5%' }).fontSize(9)
        .onClick(() => { this.dialogController11.open() })
      Button('勾选变更')
        .id('btnConfirmDialog12')
        .width('100%').layoutWeight(1).constraintSize({ minHeight: 0, maxHeight: '7.5%' }).fontSize(9)
        .onClick(() => { this.dialogController12.open() })
    }
    .width('100%')
    .height('100%')
    .padding({ left: '3%', right: '3%', top: '1%', bottom: '1%' })
    .justifyContent(FlexAlign.SpaceEvenly)
  }
}
