'use static';
/**
 * Copyright (c) 2026 Huawei Device Co., Ltd.
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

import { Entry, Component, Scroll, Column, ColumnOptions, Text, Row, FontWeight, LocalizedPadding, ShadowStyle, BlurStyle, FlexAlign,
  ClickEvent,
  $r,
  Color,
  LengthMetrics
} from '@ohos.arkui.component';
import { State } from '@ohos.arkui.stateManagement';
import { Chip,
  ChipOptions,
  ChipSize,
  PrefixIconOptions,
  CloseOptions,
  AccessibilitySelectedType,
  LabelOptions,
  LabelMarginOptions,
  LocalizedLabelMarginOptions,
  SuffixIconOptions } from '@ohos.arkui.advanced.Chip'
@Entry
@Component
struct ChipOptionsSuffixIconExample {

  build() {
    Column({ space: 20 } as ColumnOptions) {
      // empty text Test
      Chip({
        prefixIcon: {
          src: $r('sys.media.ohos_app_icon'),
          fillColor: Color.Blue
        } as PrefixIconOptions,
        label: { text: '' } as LabelOptions,
      } as ChipOptions)
      // NORMAL Test
      Chip({
        prefixIcon: {
          src: $r('sys.media.ohos_app_icon'),
          fillColor: Color.Blue
        } as PrefixIconOptions,
        label: {
          text: 'Chip1',
          fontSize:undefined,
          fontColor:undefined,
          activatedFontColor:undefined,
          fontFamily:undefined,
          labelMargin:undefined,
          localizedLabelMargin:undefined } as LabelOptions,
        suffixIcon: {
          src: $r('app.media.icon'),
          size: { width: 16, height: 16 },
          fillColor: Color.Red,
          action:() => {},
          accessibilityText:'accessibilityText',
          accessibilityDescription:'accessibilityDescription',
          accessibilityLevel:'yes'
        } as SuffixIconOptions,
      } as ChipOptions)
      Chip({
        prefixIcon: {
          src: $r('sys.media.ohos_app_icon'),
          fillColor: Color.Blue
        } as PrefixIconOptions,
        label: {
          text: 'Chip1',
          fontSize:undefined,
          fontColor:undefined,
          activatedFontColor:undefined,
          fontFamily:undefined,
          labelMargin:undefined,
          localizedLabelMargin:undefined } as LabelOptions,
        suffixIcon: undefined,
      } as ChipOptions)
    }
    .id('ChipOptionsSuffixIconExample')
    .width('100%')
    .padding(16)
  }
}