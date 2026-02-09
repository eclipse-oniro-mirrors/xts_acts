'use static';
/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License")
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

import {
  $r,
  Blank,
  Button,
  ClickEvent,
  Color,
  Column,
  ColumnOptions,
  Component,
  Entry,
  Flex,
  FlexAlign,
  FlexDirection,
  FontWeight,
  ForEach,
  HorizontalAlign,
  ItemAlign,
  Margin,
  Padding,
  ResourceColor,
  Row,
  Text,
  TextAlign,
  VerticalAlign
} from '@ohos.arkui.component'
import { PropRef, State, StorageLink } from '@ohos.arkui.stateManagement'
import { CustomTheme, Theme, ThemeControl } from '@ohos.arkui.theme';
import { redCustomTheme, systemDefaultTheme } from '../../themes/CustomTheme1';

export const defaultThemeProperty = 'DefaultThemeProperty';

@Entry
@Component
struct SetDefaultThemePage {
  @State message: string = 'Custom Theme Test';

  @StorageLink(defaultThemeProperty) localTheme: CustomTheme | undefined = systemDefaultTheme;

  aboutToAppear() {
    ThemeControl.setDefaultTheme(redCustomTheme);
  }

  onPageHide() {
    ThemeControl.setDefaultTheme(undefined);
  }

  onWillApplyTheme(theme: CustomTheme) {
    this.localTheme = theme;
  }

  build() {
    Row() {
      Text(this.message)
        .textAlign(TextAlign.Center)
        .width('100%')
    }
    .alignItems(VerticalAlign.Center)
    .width('100%')
    .height('100%')
  }
}