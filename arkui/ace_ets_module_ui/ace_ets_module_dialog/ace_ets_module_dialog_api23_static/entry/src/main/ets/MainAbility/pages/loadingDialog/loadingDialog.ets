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
import { LoadingDialog } from '@ohos.arkui.advanced.Dialog';
import { CustomTheme, CustomColors } from '@ohos.arkui.theme';
import { AppStorage } from '@ohos.arkui.stateManagement';
import { Router } from '@ohos.arkui.UIContext';

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
struct loadingDialog {
  customTheme: CustomTheme = new CustomThemeImpl(new CustomThemeColors());

  aboutToAppear() {
    try {
      let router = this.getUIContext().getRouter();
      AppStorage.setOrCreate<Router>('router', router);
      // Store all dialogControllers in AppStorage for test to close
      AppStorage.setOrCreate<CustomDialogController>('loadingDialogController1', this.dialogController1);
      AppStorage.setOrCreate<CustomDialogController>('loadingDialogController2', this.dialogController2);
      AppStorage.setOrCreate<CustomDialogController>('loadingDialogController3', this.dialogController3);
      AppStorage.setOrCreate<CustomDialogController>('loadingDialogController4', this.dialogController4);
      AppStorage.setOrCreate<CustomDialogController>('loadingDialogController5', this.dialogController5);
    } catch (error) {
      console.log('error ' + error);
    }
  }

  // Dialog 1: Test content
  dialogController1: CustomDialogController = new CustomDialogController({
    builder: LoadingDialog({
      content: 'Loading...',
    }),
    autoCancel: false,
  })

  // Dialog 2: Test theme
  dialogController2: CustomDialogController = new CustomDialogController({
    builder: LoadingDialog({
      content: 'Test custom theme',
      theme: this.customTheme,
    }),
    autoCancel: false,
  })

  // Dialog 3: Test themeColorMode(SYSTEM)
  dialogController3: CustomDialogController = new CustomDialogController({
    builder: LoadingDialog({
      content: '测试 SYSTEM 模式',
      themeColorMode: ThemeColorMode.SYSTEM,
    }),
    autoCancel: false,
  })

  // Dialog 4: Test themeColorMode(LIGHT)
  dialogController4: CustomDialogController = new CustomDialogController({
    builder: LoadingDialog({
      content: 'Test LIGHT mode',
      themeColorMode: ThemeColorMode.LIGHT,
    }),
    autoCancel: false,
  })

  // Dialog 5: Test themeColorMode(DARK)
  dialogController5: CustomDialogController = new CustomDialogController({
    builder: LoadingDialog({
      content: 'Test DARK mode',
      themeColorMode: ThemeColorMode.DARK,
    }),
    autoCancel: false,
  })

  build() {
    Column({ space: 3 } as ColumnOptions) {
      Button('内容')
        .id('btnLoadingDialog1')
        .width('100%')
        .layoutWeight(1)
        .constraintSize({ minHeight: 0, maxHeight: '16%' })
        .fontSize(11)
        .onClick(() => {
          AppStorage.setOrCreate<string>('loadingDialogContent', 'Loading...');
          this.dialogController1.open()
        })
      Button('主题')
        .id('btnLoadingDialog2')
        .width('100%')
        .layoutWeight(1)
        .constraintSize({ minHeight: 0, maxHeight: '16%' })
        .fontSize(11)
        .onClick(() => {
          AppStorage.setOrCreate<boolean>('loadingDialogThemeSet', true);
          this.dialogController2.open()
        })
      Button('主题·系统')
        .id('btnLoadingDialog3')
        .width('100%')
        .layoutWeight(1)
        .constraintSize({ minHeight: 0, maxHeight: '16%' })
        .fontSize(11)
        .onClick(() => {
          AppStorage.setOrCreate<number>('loadingDialogThemeColorMode', ThemeColorMode.SYSTEM);
          this.dialogController3.open()
        })
      Button('主题·浅色')
        .id('btnLoadingDialog4')
        .width('100%')
        .layoutWeight(1)
        .constraintSize({ minHeight: 0, maxHeight: '16%' })
        .fontSize(11)
        .onClick(() => {
          AppStorage.setOrCreate<number>('loadingDialogThemeColorMode', ThemeColorMode.LIGHT);
          this.dialogController4.open()
        })
      Button('主题·深色')
        .id('btnLoadingDialog5')
        .width('100%')
        .layoutWeight(1)
        .constraintSize({ minHeight: 0, maxHeight: '16%' })
        .fontSize(11)
        .onClick(() => {
          AppStorage.setOrCreate<number>('loadingDialogThemeColorMode', ThemeColorMode.DARK);
          this.dialogController5.open()
        })
    }
    .width('100%')
    .height('100%')
    .padding({ left: '3%', right: '3%', top: '2%', bottom: '2%' })
    .justifyContent(FlexAlign.SpaceEvenly)
  }
}
