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
  SizeOptions,
  ResourceStr,
  ThemeColorMode,
  FlexAlign
} from '@ohos.arkui.component';
import hilog from '@ohos.hilog';
import { CustomDialogController } from '@ohos.arkui.component';
import { TipsDialog } from '@ohos.arkui.advanced.Dialog';
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
struct tipsDialog {
  @State isChecked1: boolean = false;
  @State isChecked2: boolean = true;
  @State isChecked3: boolean = false;
  @State isChecked4: boolean = false;
  @State isChecked5: boolean = false;
  @State isChecked6: boolean = false;
  @State customTheme: CustomTheme = new CustomThemeImpl(new CustomThemeColors());

  // Dialog 1: Test imageRes, imageSize, title, content
  dialogController1: CustomDialogController = new CustomDialogController({
    builder: TipsDialog({
      imageRes: $r('sys.media.ohos_ic_public_voice'),
      imageSize: { width: 100, height: 100 },
      title: 'Test Title',
      content: 'Test Content',
      primaryButton: {
        value: 'Confirm',
        action: () => {
          AppStorage.setOrCreate<string>('tipsDialogImageRes', 'sys.media.ohos_ic_public_voice');
          AppStorage.setOrCreate<number>('tipsDialogImageSizeWidth', 100);
          AppStorage.setOrCreate<number>('tipsDialogImageSizeHeight', 100);
          AppStorage.setOrCreate<string>('tipsDialogTitle', 'Test Title');
          AppStorage.setOrCreate<string>('tipsDialogContent', 'Test Content');
        },
      },
    }),
  })

  // Dialog 2: Test checkTips, isChecked (true), checkAction, onCheckedChange
  dialogController2: CustomDialogController = new CustomDialogController({
    builder: TipsDialog({
      imageRes: $r('sys.media.ohos_ic_public_voice'),
      checkTips: '禁止后不再提示',
      isChecked: this.isChecked2,
      checkAction: (isChecked: boolean) => {
        AppStorage.setOrCreate<string>('tipsDialogCheckTips', '禁止后不再提示');
        AppStorage.setOrCreate<boolean>('tipsDialogIsChecked', isChecked);
        AppStorage.setOrCreate<boolean>('tipsDialogCheckActionCalled', true);
        this.isChecked2 = isChecked;
      },
      primaryButton: {
        value: 'Confirm',
        action: () => {
          // Store initial state when dialog opens
          AppStorage.setOrCreate<string>('tipsDialogCheckTips', '禁止后不再提示');
          AppStorage.setOrCreate<boolean>('tipsDialogInitialIsChecked', this.isChecked2);
        },
      },
      onCheckedChange: (isChecked: boolean) => {
        AppStorage.setOrCreate<boolean>('tipsDialogOnCheckedChangeCalled', true);
        AppStorage.setOrCreate<boolean>('tipsDialogOnCheckedChangeValue', isChecked);
        this.isChecked2 = isChecked;
      }
    }),
    autoCancel: false,
  })

  // Dialog 3: Test isChecked (false)
  dialogController3: CustomDialogController = new CustomDialogController({
    builder: TipsDialog({
      imageRes: $r('sys.media.ohos_ic_public_voice'),
      checkTips: 'Test Checkbox',
      isChecked: this.isChecked3,
      checkAction: (isChecked: boolean) => {
        AppStorage.setOrCreate<boolean>('tipsDialogIsChecked', isChecked);
        this.isChecked3 = isChecked;
      },
      primaryButton: {
        value: 'Confirm',
        action: () => {
          // Store initial state when dialog opens
          AppStorage.setOrCreate<boolean>('tipsDialogInitialIsChecked', this.isChecked3);
        },
      },
    }),
    autoCancel: false,
  })

  // Dialog 4: Test themeColorMode - SYSTEM
  dialogController4: CustomDialogController = new CustomDialogController({
    builder: TipsDialog({
      imageRes: $r('sys.media.ohos_ic_public_voice'),
      content: 'Test SYSTEM mode',
      themeColorMode: ThemeColorMode.SYSTEM,
      primaryButton: {
        value: 'Confirm',
        action: () => {
          AppStorage.setOrCreate<number>('tipsDialogThemeColorMode', ThemeColorMode.SYSTEM);
          console.info('TipsDialog: themeColorMode SYSTEM stored: ' + ThemeColorMode.SYSTEM);
        },
      },
    }),
    autoCancel: false,
  })

  // Dialog 5: Test themeColorMode - LIGHT
  dialogController5: CustomDialogController = new CustomDialogController({
    builder: TipsDialog({
      imageRes: $r('sys.media.ohos_ic_public_voice'),
      content: 'Test LIGHT mode',
      themeColorMode: ThemeColorMode.LIGHT,
      primaryButton: {
        value: 'Confirm',
        action: () => {
          AppStorage.setOrCreate<number>('tipsDialogThemeColorMode', ThemeColorMode.LIGHT);
          console.info('TipsDialog: themeColorMode LIGHT stored: ' + ThemeColorMode.LIGHT);
        },
      },
    }),
    autoCancel: false,
  })

  // Dialog 6: 测试 themeColorMode - DARK
  dialogController6: CustomDialogController = new CustomDialogController({
    builder: TipsDialog({
      imageRes: $r('sys.media.ohos_ic_public_voice'),
      content: 'Test DARK mode',
      themeColorMode: ThemeColorMode.DARK,
      primaryButton: {
        value: 'Confirm',
        action: () => {
          AppStorage.setOrCreate<number>('tipsDialogThemeColorMode', ThemeColorMode.DARK);
          console.info('TipsDialog: themeColorMode DARK stored: ' + ThemeColorMode.DARK);
        },
      },
    }),
    autoCancel: false,
  })

  // Dialog 7: Test theme (CustomTheme)
  dialogController7: CustomDialogController = new CustomDialogController({
    builder: TipsDialog({
      imageRes: $r('sys.media.ohos_ic_public_voice'),
      content: 'Test custom theme',
      theme: this.customTheme,
      primaryButton: {
        value: 'Confirm',
        action: () => {
          AppStorage.setOrCreate<boolean>('tipsDialogThemeSet', true);
          console.info('TipsDialog: theme CustomTheme stored');
        },
      },
    }),
    autoCancel: false,
  })

  // Dialog 8: Test primaryButton and secondaryButton
  dialogController8: CustomDialogController = new CustomDialogController({
    builder: TipsDialog({
      imageRes: $r('sys.media.ohos_ic_public_voice'),
      content: 'Test buttons',
      primaryButton: {
        value: '主按钮',
        action: () => {
          AppStorage.setOrCreate<string>('tipsDialogPrimaryButtonValue', '主按钮');
          AppStorage.setOrCreate<boolean>('tipsDialogPrimaryButtonActionCalled', true);
        },
      },
      secondaryButton: {
        value: 'Secondary Button',
        action: () => {
          AppStorage.setOrCreate<string>('tipsDialogSecondaryButtonValue', 'Secondary Button');
          AppStorage.setOrCreate<boolean>('tipsDialogSecondaryButtonActionCalled', true);
        },
      },
    }),
  })

  build() {
    Column({ space: 2 } as ColumnOptions) {
      Button('图/标题/内容')
        .id('btnTipsDialog1')
        .width('100%')
        .layoutWeight(1)
        .constraintSize({ minHeight: 0, maxHeight: '9.5%' })
        .fontSize(10)
        .onClick(() => {
          this.dialogController1.open()
        })
      Button('勾选·true')
        .id('btnTipsDialog2')
        .width('100%')
        .layoutWeight(1)
        .constraintSize({ minHeight: 0, maxHeight: '9.5%' })
        .fontSize(10)
        .onClick(() => {
          this.dialogController2.open()
        })
      Button('勾选·false')
        .id('btnTipsDialog3')
        .width('100%')
        .layoutWeight(1)
        .constraintSize({ minHeight: 0, maxHeight: '9.5%' })
        .fontSize(10)
        .onClick(() => {
          this.dialogController3.open()
        })
      Button('主题·系统')
        .id('btnTipsDialog4')
        .width('100%')
        .layoutWeight(1)
        .constraintSize({ minHeight: 0, maxHeight: '9.5%' })
        .fontSize(10)
        .onClick(() => {
          this.dialogController4.open();
        })
      Button('主题·浅色')
        .id('btnTipsDialog5')
        .width('100%')
        .layoutWeight(1)
        .constraintSize({ minHeight: 0, maxHeight: '9.5%' })
        .fontSize(10)
        .onClick(() => {
          this.dialogController5.open();
        })
      Button('主题·深色')
        .id('btnTipsDialog6')
        .width('100%')
        .layoutWeight(1)
        .constraintSize({ minHeight: 0, maxHeight: '9.5%' })
        .fontSize(10)
        .onClick(() => {
          this.dialogController6.open();
        })
      Button('自定义主题')
        .id('btnTipsDialog7')
        .width('100%')
        .layoutWeight(1)
        .constraintSize({ minHeight: 0, maxHeight: '9.5%' })
        .fontSize(10)
        .onClick(() => {
          this.dialogController7.open()
        })
      Button('主/次键')
        .id('btnTipsDialog8')
        .width('100%')
        .layoutWeight(1)
        .constraintSize({ minHeight: 0, maxHeight: '9.5%' })
        .fontSize(10)
        .onClick(() => {
          this.dialogController8.open()
        })
    }
    .width('100%')
    .height('100%')
    .padding({ left: '3%', right: '3%', top: '1%', bottom: '1%' })
    .justifyContent(FlexAlign.SpaceEvenly)
  }
}