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
  Button,
  ClickEvent,
  Column,
  Component,
  Entry,
  Flex,
  FlexAlign,
  FlexDirection,
  FontWeight,
  ItemAlign,
  Margin,
  Row,
  Text,
  ThemeColorMode,
  VerticalAlign,
  WithTheme
} from '@ohos.arkui.component'
import { State, StorageLink } from '@ohos.arkui.stateManagement'
import { brownCustomTheme, greenCustomTheme } from '../../themes/CustomTheme1';
import { CustomButton } from '../customComponents/CustomButton';
import { CustomColorsDark } from '../customComponents/CustomColorsDark';
import { CustomColorsLight } from '../customComponents/CustomColorsLight';
import { CustomButtonNested } from '../customComponents/CustomButtonNested';
import { CustomButtonSystem } from '../customComponents/CustomButtonSystem';
import { SystemColorsFromResources } from './SystemColorsForCheck';
import { CustomTheme } from '@ohos.arkui.theme';

export const withThemeProperty = 'ChangedTheme';

export const postfixLight = 'Light';

export const postfixDark = 'Dark';

@Entry
@Component
struct WithThemeTestPage {
  @State message: string = 'Custom Component Theme Test';
  @StorageLink(withThemeProperty) localTheme: CustomTheme | undefined = greenCustomTheme;

  build() {
    WithTheme({ theme: this.localTheme }) {
      Row() {
        CustomButton({
          btnText: this.message
        })
        WithTheme({ theme: brownCustomTheme }) {
          CustomButtonNested({
            btnText: this.message
          })
        }

        WithTheme({ colorMode: ThemeColorMode.SYSTEM }) {
          CustomButtonSystem({ btnText: 'System Tokens' })
        }

        WithTheme({ colorMode: ThemeColorMode.DARK }) {
          Column() {
            CustomColorsDark()
            SystemColorsFromResources({ postfix: postfixDark })
          }
        }

        WithTheme({ colorMode: ThemeColorMode.LIGHT }) {
          Column() {
            CustomColorsLight()
            SystemColorsFromResources({ postfix: postfixLight })
          }
        }
      }.alignItems(VerticalAlign.Center)
      .width('100%')
      .height('100%')
    }
  }
}