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

import { TipsDialog } from '@ohos.arkui.advanced.Dialog';
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
struct TipsDialogTest {
  @State customTheme: CustomTheme = new CustomThemeImpl(new CustomThemeColors());

  dialogControllerImage: CustomDialogController = new CustomDialogController({
    builder: TipsDialog({
      content: '想要卸载这个APP嘛?',
      theme: this.customTheme,
      themeColorMode: ThemeColorMode.LIGHT,
      primaryButton: {
        value: '取消',
        action: () => {
          console.info('Callback when the first button is clicked')
        },
      },
      secondaryButton: {
        value: '删除',
        role: ButtonRole.ERROR,
        action: () => {
          console.info('Callback when the second button is clicked')
        }
      },
    }),
  })

  dialogControllerTitle: CustomDialogController = new CustomDialogController({
    builder: TipsDialog({
      imageRes: $r('sys.media.ohos_ic_public_voice'),
      imageSize: { width: 10, height: 10 },
      title: 'TipsDialog',
      primaryButton: {
        value: '取消',
        action: () => {
          console.info('Callback when the first button is clicked')
        },
      },
      secondaryButton: {
        value: '删除',
        role: ButtonRole.ERROR,
        action: () => {
          console.info('Callback when the second button is clicked')
        }
      },
    }),
  })

  dialogControllerTips: CustomDialogController = new CustomDialogController({
    builder: TipsDialog({
      checkTips: 'checkTips',
      isChecked: true,
      checkAction: () => {
        console.log('checkAction')
      },
      primaryButton: {
        value: '取消',
        action: () => {
          console.info('Callback when the first button is clicked')
        },
      },
      secondaryButton: {
        value: '删除',
        role: ButtonRole.ERROR,
        action: () => {
          console.info('Callback when the second button is clicked')
        }
      },
      onCheckedChange: () => {
        console.info('Callback when the checkbox is clicked')
      }
    }),
  })

  build() {
    Column() {
      Button('TipsDialog')
        .width(96)
        .onClick(() => {
          this.dialogControllerImage.open()
        })
      Button('TipsDialogTitle')
        .width(96)
        .onClick(() => {
          this.dialogControllerTitle.open()
        })
      Button('TipsDialogTips')
        .width(96)
        .onClick(() => {
          this.dialogControllerTips.open()
        })
    }
    .width('100%')
    .height('100%')
    .justifyContent(FlexAlign.Center)
  }
}