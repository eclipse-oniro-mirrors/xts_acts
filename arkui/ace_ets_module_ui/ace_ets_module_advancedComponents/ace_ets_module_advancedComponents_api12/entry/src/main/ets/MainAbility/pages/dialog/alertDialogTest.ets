/**
 * Copyright (c) 2024-2025 Huawei Device Co., Ltd.
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

import { AlertDialog } from '@ohos.arkui.advanced.Dialog';
import { CustomColors, CustomDarkColors, CustomTheme } from '@ohos.arkui.theme';

class CustomThemeImpl implements CustomTheme {
  public colors?: CustomColors;
  public darkColors?: CustomDarkColors;

  constructor(colors: CustomColors) {
    this.colors = colors;
  }
}

class CustomThemeColors implements CustomColors {
  public fontPrimary = '#ffd0a300';
  public iconSecondary = '#ffd000cd';
}

@Entry
@Component
struct AlertDialogTest {
  @State customTheme: CustomTheme = new CustomThemeImpl(new CustomThemeColors());
  dialogControllerConfirm: CustomDialogController = new CustomDialogController({
    builder: AlertDialog({
      primaryTitle: '弹框一级标题',
      secondaryTitle: '弹框二级标题',
      content: '文本文本文本文本文本',
      primaryButton: {
        value: '取消',
        action: () => {
        },
      },
      secondaryButton: {
        value: '确认',
        role: ButtonRole.ERROR,
        action: () => {
          console.info('Callback when the second button is clicked')
        }
      },
      theme: this.customTheme,
      themeColorMode: ThemeColorMode.LIGHT,
    }),
  })

  build() {
    Column() {
      Button('AlertDialog')
        .width(96)
        .height(40)
        .onClick(() => {
          this.dialogControllerConfirm.open()
        })
    }
    .width('100%')
    .height('100%')
    .justifyContent(FlexAlign.Center)
    .backgroundImageSize({ width: '100%', height: '100%' })
  }
}