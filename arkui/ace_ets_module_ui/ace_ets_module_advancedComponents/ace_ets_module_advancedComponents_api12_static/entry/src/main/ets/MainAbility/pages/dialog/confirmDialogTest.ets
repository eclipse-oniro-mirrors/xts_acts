'use static';
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

import { ConfirmDialog } from '@ohos.arkui.advanced.Dialog';
import { CustomColors, CustomTheme, CustomDarkColors } from '@ohos.arkui.theme';
import {
  Button,
  Column,
  Component,
  CustomDialogController,
  Entry,
  FlexAlign,
  SizeOptions,
  ThemeColorMode,
  ResourceColor,
  ClickEvent,
  CustomDialogControllerOptions
} from '@ohos.arkui.component';
import { State } from '@ohos.arkui.stateManagement';

class CustomThemeImpl implements CustomTheme {
  public colors?: CustomColors;
  public darkColors?: CustomDarkColors;

  constructor(colors: CustomColors) {
    this.colors = colors;
  }
}

class CustomThemeColors implements CustomColors {
  public brand?: ResourceColor = '#FF8B6B8A';
  public warning?: ResourceColor = '#FF8B6B5E';
  public alert?: ResourceColor = '#FF8B6B5F';
  public confirm?: ResourceColor = '#FF8B6B60';
  public fontSecondary?: ResourceColor = '#FF8B6B62';
  public fontTertiary?: ResourceColor = '#FF8B6B63';
  public fontFourth?: ResourceColor = '#FF8B6B64';
  public fontEmphasize?: ResourceColor = '#FF8B6B65';
  public fontOnPrimary?: ResourceColor = '#FF8B6B66';
  public fontOnSecondary?: ResourceColor = '#FF8B6B67';
  public fontOnTertiary?: ResourceColor = '#FF8B6B68';
  public fontOnFourth?: ResourceColor = '#FF8B6B69';
  public iconPrimary?: ResourceColor = '#FF8B6B6A';
  public iconTertiary?: ResourceColor = '#FF8B6B6C';
  public iconFourth?: ResourceColor = '#FF8B6B6D';
  public iconEmphasize?: ResourceColor = '#FF8B6B6E';
  public iconSubEmphasize?: ResourceColor = '#FF8B6B6F';
  public iconOnPrimary?: ResourceColor = '#FF8B6B70';
  public iconOnSecondary?: ResourceColor = '#FF8B6B71';
  public iconOnTertiary?: ResourceColor = '#FF8B6B72';
  public iconOnFourth?: ResourceColor = '#FF8B6B73';
  public backgroundPrimary?: ResourceColor = '#FF8B6B74';
  public backgroundSecondary?: ResourceColor = '#FF8B6B75';
  public backgroundTertiary?: ResourceColor = '#FF8B6B76';
  public backgroundFourth?: ResourceColor = '#FF8B6B77';
  public backgroundEmphasize?: ResourceColor = '#FF8B6B78';
  public compForegroundPrimary?: ResourceColor = '#FF8B6B8B';
  public compBackgroundPrimary?: ResourceColor = '#FF8B6B79';
  public compBackgroundPrimaryTran?: ResourceColor = '#FF8B6B8C';
  public compBackgroundPrimaryContrary?: ResourceColor = '#FF8B6B7A';
  public compBackgroundGray?: ResourceColor = '#FF8B6B7B';
  public compBackgroundSecondary?: ResourceColor = '#FF8B6B7C';
  public compBackgroundTertiary?: ResourceColor = '#FF8B6B7D';
  public compBackgroundEmphasize?: ResourceColor = '#FF8B6B7E';
  public compBackgroundNeutral?: ResourceColor = '#FF8B6B7F';
  public compEmphasizeSecondary?: ResourceColor = '#FF8B6B80';
  public compEmphasizeTertiary?: ResourceColor = '#FF8B6B81';
  public compDivider?: ResourceColor = '#FF8B6B82';
  public compCommonContrary?: ResourceColor = '#FF8B6B83';
  public compBackgroundFocus?: ResourceColor = '#FF8B6B8D';
  public compFocusedPrimary?: ResourceColor = '#FF8B6B8E';
  public compFocusedSecondary?: ResourceColor = '#FF8B6B8F';
  public compFocusedTertiary?: ResourceColor = '#FF8B6B90';
  public interactiveHover?: ResourceColor = '#FF8B6B84';
  public interactivePressed?: ResourceColor = '#FF8B6B85';
  public interactiveFocus?: ResourceColor = '#FF8B6B86';
  public interactiveActive?: ResourceColor = '#FF8B6B87';
  public interactiveSelect?: ResourceColor = '#FF8B6B88';
  public interactiveClick?: ResourceColor = '#FF8B6B89';
  public fontPrimary?: ResourceColor = '#ffd0a300';
  public iconSecondary?: ResourceColor = '#ffd000cd';
}

@Entry
@Component
struct ConfirmDialogTest {
  @State customTheme: CustomTheme = new CustomThemeImpl(new CustomThemeColors());
  isChecked :boolean = false;
  dialogControllerCheckBox: CustomDialogController = new CustomDialogController({
    builder: ConfirmDialog({
      title: '文本标题',
      content: '这里是内容区',
      isChecked: this.isChecked,
      checkTips: '禁止后不再提示',
      primaryButton: {
        value: '禁止',
        action: () => {
        },
      },
      secondaryButton: {
        value: '允许',
        action: () => {
          this.isChecked = false
          console.info('Callback when the second button is clicked')
        }
      },
      onCheckedChange: () => {
        console.info('Callback when the checkbox is clicked')
      },
      theme: this.customTheme,
      themeColorMode: ThemeColorMode.LIGHT,
    }),
    autoCancel: true,
  } as CustomDialogControllerOptions)

  build() {
    Column() {
      Button('ConfirmDialog')
        .width(96)
        .height(40)
        .onClick((e:ClickEvent) => {
          this.dialogControllerCheckBox.open()
        })
    }
    .width('100%')
    .height('100%')
    .justifyContent(FlexAlign.Center)
    .backgroundImageSize({ width: '100%', height: '100%' } as SizeOptions)
  }
}