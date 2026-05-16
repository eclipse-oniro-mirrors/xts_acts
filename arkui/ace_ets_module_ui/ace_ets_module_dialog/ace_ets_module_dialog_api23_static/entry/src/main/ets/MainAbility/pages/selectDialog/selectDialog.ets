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
import { SelectDialog } from '@ohos.arkui.advanced.Dialog';
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
struct selectDialog {
  @State currentSelectedIndex: number = -1;
  @State customTheme: CustomTheme = new CustomThemeImpl(new CustomThemeColors());

  // Dialog 1: Test title
  dialogController1: CustomDialogController = new CustomDialogController({
    builder: SelectDialog({
      title: 'Test Title',
      radioContent: [
        {
          title: 'Option 1',
          action: () => {}
        },
        {
          title: 'Option 2',
          action: () => {}
        },
        {
          title: 'Option 3',
          action: () => {}
        }
      ],
      confirm: {
        value: 'Confirm',
        action: () => {
          AppStorage.setOrCreate<string>('selectDialogTitle', 'Test Title');
        },
      },
    }),
  })

  // Dialog 2: Test content
  dialogController2: CustomDialogController = new CustomDialogController({
    builder: SelectDialog({
      title: 'Test Title',
      content: 'Test Content',
      radioContent: [
        {
          title: 'Option 1',
          action: () => {}
        },
        {
          title: 'Option 2',
          action: () => {}
        },
        {
          title: 'Option 3',
          action: () => {}
        }
      ],
      confirm: {
        value: 'Confirm',
        action: () => {
          AppStorage.setOrCreate<string>('selectDialogContent', 'Test Content');
        },
      },
    }),
  })

  // Dialog 3: Test selectedIndex, default select first item (0)
  dialogController3: CustomDialogController = new CustomDialogController({
    builder: SelectDialog({
      title: 'Test Title',
      radioContent: [
        {
          title: 'Option 1',
          action: () => {}
        },
        {
          title: 'Option 2',
          action: () => {}
        },
        {
          title: 'Option 3',
          action: () => {}
        }
      ],
      selectedIndex: 0,
      confirm: {
        value: 'Confirm',
        action: () => {
          AppStorage.setOrCreate<number>('selectDialogSelectedIndex', 0);
        },
      },
    }),
  })

  // Dialog 4: Test confirm
  dialogController4: CustomDialogController = new CustomDialogController({
    builder: SelectDialog({
      title: 'Test Title',
      radioContent: [
        {
          title: 'Option 1',
          action: () => {}
        },
        {
          title: 'Option 2',
          action: () => {}
        },
        {
          title: 'Option 3',
          action: () => {}
        }
      ],
      confirm: {
        value: 'Confirm Button',
        action: () => {
          AppStorage.setOrCreate<string>('selectDialogConfirmValue', 'Confirm Button');
          AppStorage.setOrCreate<boolean>('selectDialogConfirmActionCalled', true);
        },
      },
    }),
  })

  // Dialog 5: Test radioContent
  dialogController5: CustomDialogController = new CustomDialogController({
    builder: SelectDialog({
      title: 'Test Title',
      radioContent: [
        {
          title: 'Option A',
          action: () => {}
        },
        {
          title: 'Option B',
          action: () => {}
        },
        {
          title: 'Option C',
          action: () => {}
        }
      ],
      confirm: {
        value: 'Confirm',
        action: () => {
          AppStorage.setOrCreate<string>('selectDialogRadioContent', 'Option A,Option B,Option C');
        },
      },
    }),
  })

  // Dialog 6: Test theme
  dialogController6: CustomDialogController = new CustomDialogController({
    builder: SelectDialog({
      title: 'Test Title',
      radioContent: [
        {
          title: 'Option 1',
          action: () => {}
        },
        {
          title: 'Option 2',
          action: () => {}
        },
        {
          title: 'Option 3',
          action: () => {}
        }
      ],
      theme: this.customTheme,
      confirm: {
        value: 'Confirm',
        action: () => {
          AppStorage.setOrCreate<boolean>('selectDialogThemeSet', true);
        },
      },
    }),
    autoCancel: false,
  })

  // Dialog 7: Test themeColorMode(SYSTEM)
  dialogController7: CustomDialogController = new CustomDialogController({
    builder: SelectDialog({
      title: 'Test Title',
      radioContent: [
        {
          title: 'Option 1',
          action: () => {}
        },
        {
          title: 'Option 2',
          action: () => {}
        },
        {
          title: 'Option 3',
          action: () => {}
        }
      ],
      themeColorMode: ThemeColorMode.SYSTEM,
      confirm: {
        value: 'Confirm',
        action: () => {
          AppStorage.setOrCreate<number>('selectDialogThemeColorMode', ThemeColorMode.SYSTEM);
        },
      },
    }),
    autoCancel: false,
  })

  // Dialog 8: Test themeColorMode(LIGHT)
  dialogController8: CustomDialogController = new CustomDialogController({
    builder: SelectDialog({
      title: 'Test Title',
      radioContent: [
        {
          title: 'Option 1',
          action: () => {}
        },
        {
          title: 'Option 2',
          action: () => {}
        },
        {
          title: 'Option 3',
          action: () => {}
        }
      ],
      themeColorMode: ThemeColorMode.LIGHT,
      confirm: {
        value: 'Confirm',
        action: () => {
          AppStorage.setOrCreate<number>('selectDialogThemeColorMode', ThemeColorMode.LIGHT);
        },
      },
    }),
    autoCancel: false,
  })

  // Dialog 9: Test themeColorMode(DARK)
  dialogController9: CustomDialogController = new CustomDialogController({
    builder: SelectDialog({
      title: 'Test Title',
      radioContent: [
        {
          title: 'Option 1',
          action: () => {}
        },
        {
          title: 'Option 2',
          action: () => {}
        },
        {
          title: 'Option 3',
          action: () => {}
        }
      ],
      themeColorMode: ThemeColorMode.DARK,
      confirm: {
        value: 'Confirm',
        action: () => {
          AppStorage.setOrCreate<number>('selectDialogThemeColorMode', ThemeColorMode.DARK);
        },
      },
    }),
    autoCancel: false,
  })

  build() {
    Column({ space: 1 } as ColumnOptions) {
      Button('标题')
        .id('btnSelectDialog1')
        .width('100%').layoutWeight(1).constraintSize({ minHeight: 0, maxHeight: '9.5%' }).fontSize(9)
        .onClick(() => { this.dialogController1.open() })
      Button('内容')
        .id('btnSelectDialog2')
        .width('100%').layoutWeight(1).constraintSize({ minHeight: 0, maxHeight: '9.5%' }).fontSize(9)
        .onClick(() => { this.dialogController2.open() })
      Button('选中项')
        .id('btnSelectDialog3')
        .width('100%').layoutWeight(1).constraintSize({ minHeight: 0, maxHeight: '9.5%' }).fontSize(9)
        .onClick(() => { this.dialogController3.open() })
      Button('确认')
        .id('btnSelectDialog4')
        .width('100%').layoutWeight(1).constraintSize({ minHeight: 0, maxHeight: '9.5%' }).fontSize(9)
        .onClick(() => { this.dialogController4.open() })
      Button('单选项')
        .id('btnSelectDialog5')
        .width('100%').layoutWeight(1).constraintSize({ minHeight: 0, maxHeight: '9.5%' }).fontSize(9)
        .onClick(() => { this.dialogController5.open() })
      Button('主题')
        .id('btnSelectDialog6')
        .width('100%').layoutWeight(1).constraintSize({ minHeight: 0, maxHeight: '9.5%' }).fontSize(9)
        .onClick(() => { this.dialogController6.open() })
      Button('·系统')
        .id('btnSelectDialog7')
        .width('100%').layoutWeight(1).constraintSize({ minHeight: 0, maxHeight: '9.5%' }).fontSize(9)
        .onClick(() => { this.dialogController7.open() })
      Button('·浅色')
        .id('btnSelectDialog8')
        .width('100%').layoutWeight(1).constraintSize({ minHeight: 0, maxHeight: '9.5%' }).fontSize(9)
        .onClick(() => { this.dialogController8.open() })
      Button('·深色')
        .id('btnSelectDialog9')
        .width('100%').layoutWeight(1).constraintSize({ minHeight: 0, maxHeight: '9.5%' }).fontSize(9)
        .onClick(() => { this.dialogController9.open() })
    }
    .width('100%')
    .height('100%')
    .padding({ left: '3%', right: '3%', top: '1%', bottom: '1%' })
    .justifyContent(FlexAlign.SpaceEvenly)
  }
}
