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
} from '@ohos.arkui.advanced.Chip';


@Entry
@Component
struct ChipOptionsFontScaleExample {

  build() {
    Column({ space: 20 } as ColumnOptions) {
      Chip({
        prefixIcon: {
          src: $r('sys.media.ohos_app_icon'),
          fillColor: Color.Blue
        } as PrefixIconOptions,
        label: { text: 'Chip0' } as LabelOptions,
        maxFontScale:undefined,
        minFontScale:undefined
      } as ChipOptions)
      Chip({
        prefixIcon: {
          src: $r('sys.media.ohos_app_icon'),
          fillColor: Color.Blue
        } as PrefixIconOptions,
        label: {
          text: 'Chip1',
        } as LabelOptions,
        maxFontScale:1 as Double,
        minFontScale:1 as Double
      } as ChipOptions)

      Chip({
        prefixIcon: {
          src: $r('sys.media.ohos_app_icon'),
          fillColor: Color.Blue
        } as PrefixIconOptions,
        label: {
          text: 'Chip3',
        } as LabelOptions,
        maxFontScale:2 as Double,
        minFontScale:0.5 as Double
      } as ChipOptions)
      Chip({
        prefixIcon: {
          src: $r('sys.media.ohos_app_icon'),
          fillColor: Color.Blue
        } as PrefixIconOptions,
        label: {
          text: 'Chip4',
        } as LabelOptions,
        maxFontScale:0 as Double,
        minFontScale:0 as Double
      } as ChipOptions)
      Chip({
        prefixIcon: {
          src: $r('sys.media.ohos_app_icon'),
          fillColor: Color.Blue
        } as PrefixIconOptions,
        label: {
          text: 'Chip5',
        } as LabelOptions,
        maxFontScale:0 as Double,
        minFontScale:-1 as Double
      } as ChipOptions)
      Chip({
        prefixIcon: {
          src: $r('sys.media.ohos_app_icon'),
          fillColor: Color.Blue
        } as PrefixIconOptions,
        label: {
          text: 'Chip6',
        } as LabelOptions,
        maxFontScale:$r('app.float.float_1'),
        minFontScale:$r('app.float.float_2')
      } as ChipOptions)
    }
    .id('ChipOptionsFontScaleExample')
    .width('100%')
    .padding(16)
  }
}