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

import { SelectDialog } from '@ohos.arkui.advanced.Dialog';
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
struct SelectDialogTest {
  @State customTheme: CustomTheme = new CustomThemeImpl(new CustomThemeColors());
  radioIndex = 0;
  dialogControllerList: CustomDialogController = new CustomDialogController({
    builder: SelectDialog({
      title: '文本标题',
      content: '内容内容',
      selectedIndex: this.radioIndex,
      confirm: {
        value: '取消',
        action: () => {},
      },
      radioContent: [
        {
          title: '文本1',
          action: () => {
            this.radioIndex = 0
          }
        }
      ],
      theme: this.customTheme,
      themeColorMode: ThemeColorMode.LIGHT,
    }),
  })

  build() {

    Column() {
      Button('SelectDialog')
        .width(96)
        .height(40)
        .onClick(() => {
          this.dialogControllerList.open()
        })
    }
    .width('100%')
    .height('100%')
    .justifyContent(FlexAlign.Center)
    .backgroundImageSize({ width: '100%', height: '100%' })
  }
}