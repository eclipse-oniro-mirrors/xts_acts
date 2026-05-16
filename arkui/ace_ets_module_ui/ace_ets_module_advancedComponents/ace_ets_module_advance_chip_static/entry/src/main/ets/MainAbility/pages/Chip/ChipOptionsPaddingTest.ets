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
  LengthMetrics,
  Button
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
struct ChipOptionsPaddingExample {

  build() {
    Column({ space: 20 } as ColumnOptions) {
      Chip({
        prefixIcon: {
          src: $r('sys.media.ohos_app_icon'),
          fillColor: Color.Blue
        } as PrefixIconOptions,
        label: { text: 'Chip0' } as LabelOptions,
        padding: undefined
      } as ChipOptions)
      Chip({
        prefixIcon: {
          src: $r('sys.media.ohos_app_icon'),
          fillColor: Color.Blue
        } as PrefixIconOptions,
        label: {
          text: 'Chip1',
        } as LabelOptions,
        padding: {
          top:  LengthMetrics.vp(20),
          bottom:LengthMetrics.vp(20),
          start: LengthMetrics.vp(20),
          end: LengthMetrics.vp(20)
        } as LocalizedPadding
      } as ChipOptions)

      Chip({
        prefixIcon: {
          src: $r('sys.media.ohos_app_icon'),
          fillColor: Color.Blue
        } as PrefixIconOptions,
        label: {
          text: 'Chip3',
        } as LabelOptions,
        padding: {
          top:  undefined,
          bottom:undefined,
          start: undefined,
          end: undefined
        } as LocalizedPadding
      } as ChipOptions)

      Chip({
        prefixIcon: {
          src: $r('sys.media.ohos_app_icon'),
          fillColor: Color.Blue
        } as PrefixIconOptions,
        label: {
          text: 'Chip4',
        } as LabelOptions,
        padding: {
          top:  LengthMetrics.vp(4),
          bottom:LengthMetrics.vp(4),
          start: LengthMetrics.resource($r('sys.float.chip_normal_text_padding')),
          end: LengthMetrics.resource($r('sys.float.chip_normal_text_padding'))
        } as LocalizedPadding
      } as ChipOptions)

    }
    .id('ChipOptionsPaddingExample')
    .width('100%')
    .padding(16)
  }
}