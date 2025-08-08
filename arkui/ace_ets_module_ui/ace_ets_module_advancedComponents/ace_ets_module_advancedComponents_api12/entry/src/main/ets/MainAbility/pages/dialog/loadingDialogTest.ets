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

import { LoadingDialog } from '@ohos.arkui.advanced.Dialog';
import { CustomColors, CustomTheme } from '@ohos.arkui.theme';

class CustomThemeImpl implements CustomTheme {
  public colors?: CustomColors;

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
struct Index {
  @State customTheme: CustomTheme = new CustomThemeImpl(new CustomThemeColors());
  dialogController: CustomDialogController = new CustomDialogController({
    builder: LoadingDialog({
      content: 'text',
      theme: this.customTheme,
      themeColorMode: ThemeColorMode.LIGHT,
    })
  });

  build() {
    Row() {
        Column() {
          Button('LoadingDialog')
            .width(96)
            .height(40)
            .onClick(() => {
              this.dialogController.open();
            })
        }
      .width('100%')
      .height('100%')
      .justifyContent(FlexAlign.Center)
    }
    .backgroundImageSize({ width: '100%', height: '100%' })
    .height('100%')
  }
}