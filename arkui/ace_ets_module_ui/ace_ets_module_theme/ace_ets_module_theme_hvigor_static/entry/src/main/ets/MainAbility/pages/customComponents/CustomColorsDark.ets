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
  Row,
  Text,
  WithTheme
} from '@ohos.arkui.component'
import { PropRef, State } from '@ohos.arkui.stateManagement'

import { postfixDark } from '../themeTokensPages/WithThemeTestPage';
import { Theme } from '@ohos.arkui.theme';
import {
  DataClass,
  setBackgroundData,
  setBaseTokens,
  setCompBackgroundData,
  setCompData,
  setFontData,
  setIconData,
  setInteractiveData
} from '../../../../src/test/Utils.test';

export let customButtonDarkTheme: Theme | undefined;

@Component
export struct CustomColorsDark {
  @State data: Array<DataClass> = new Array<DataClass>();

  onWillApplyTheme(theme: Theme) {
    customButtonDarkTheme = theme;
    setBaseTokens(this.data, theme);
    setFontData(this.data, theme);
    setIconData(this.data, theme);
    setBackgroundData(this.data, theme);
    setCompBackgroundData(this.data, theme);
    setCompData(this.data, theme);
    setInteractiveData(this.data, theme);
  }

  build() {
    Column({ space: '8vp' } as ColumnOptions) {
      ForEach(this.data, (item: DataClass) => {
        Row() {
          Blank()
            .width('15%')
            .height('20vp')
            .backgroundColor(item.token)
            .key(`${item.text}${postfixDark}`)
            .borderColor(Color.Black)
            .borderWidth('1vp')
          Text(`${item.text}${postfixDark}`)
            .padding({ left: '8vp' } as Padding)
        }
        .padding({ left: '8vp', right: '8vp' } as Padding)
      }, (item: DataClass) => String((item.token)) + item.text)
    }.alignItems(HorizontalAlign.Start)
  }
}