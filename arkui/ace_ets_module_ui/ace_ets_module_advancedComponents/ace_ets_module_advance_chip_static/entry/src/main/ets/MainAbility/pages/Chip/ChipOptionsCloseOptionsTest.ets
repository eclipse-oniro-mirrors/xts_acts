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
  ChipSymbolGlyphOptions,
  ChipSuffixSymbolGlyphOptions,
  AccessibilityOptions,
  CloseOptions} from '@ohos.arkui.advanced.Chip';
import { SymbolGlyphModifier } from '@ohos.arkui.modifier';

@Entry
@Component
struct ChipOptionsCloseOptionsExample {

  build() {
    Column({ space: 20 } as ColumnOptions) {
      // closeOptions undefined
      Chip({
        prefixIcon: {
          src: $r('sys.media.ohos_app_icon'),
          fillColor: Color.Blue
        } as PrefixIconOptions,
        label: { text: 'Chip1' } as LabelOptions,
        closeOptions:undefined
      } as ChipOptions)
      // closeOptions NORMAL
      Chip({
        prefixIcon: {
          src: $r('sys.media.ohos_app_icon'),
          fillColor: Color.Blue
        } as PrefixIconOptions,
        label: { text: 'Chip2' } as LabelOptions,
        closeOptions:{fontSize:16,
          accessibilityText:'accessibilityText1',
          accessibilityDescription:'accessibilityDescription1',
          accessibilityLevel:'tes'
        } as CloseOptions
      } as ChipOptions)
    }
    .id('ChipOptionsCloseOptionsExample')
    .width('100%')
    .padding(16)
  }
}