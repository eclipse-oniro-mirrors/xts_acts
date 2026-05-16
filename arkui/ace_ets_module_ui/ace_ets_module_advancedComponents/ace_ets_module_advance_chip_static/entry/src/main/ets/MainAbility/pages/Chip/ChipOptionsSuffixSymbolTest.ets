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
  AccessibilityOptions} from '@ohos.arkui.advanced.Chip';
import { SymbolGlyphModifier } from '@ohos.arkui.modifier';

@Entry
@Component
struct ChipOptionsSuffixSymbolExample {

  build() {
    Column({ space: 20 } as ColumnOptions) {
      // empty text Test
      Chip({
        prefixIcon: {
          src: $r('sys.media.ohos_app_icon'),
          fillColor: Color.Blue
        } as PrefixIconOptions,
        label: { text: '' } as LabelOptions,
        suffixSymbol:undefined,
        suffixSymbolOptions:undefined,
      } as ChipOptions)
      // NORMAL Test
      Chip({
        prefixIcon: {
          src: $r('sys.media.ohos_app_icon'),
          fillColor: Color.Blue
        } as PrefixIconOptions,
        label: {
          text: 'Chip1',
        } as LabelOptions,
        suffixSymbol: {
          normal:new SymbolGlyphModifier($r('sys.symbol.trash')).fontColor([Color.Red]).fontSize(16),
          activated:new SymbolGlyphModifier($r('sys.symbol.media_sound'))
        } as ChipSymbolGlyphOptions,
        suffixSymbolOptions: {
          normalAccessibility: {
            accessibilityText: 'accessibilityText',
            accessibilityDescription: 'accessibilityDescription',
            accessibilityLevel:'auto'
          } as AccessibilityOptions,
          activatedAccessibility: {
            accessibilityText: undefined,
            accessibilityDescription: undefined,
            accessibilityLevel:undefined
          } as AccessibilityOptions,
          action:undefined
        } as ChipSuffixSymbolGlyphOptions,
      } as ChipOptions)

      Chip({
        prefixIcon: {
          src: $r('sys.media.ohos_app_icon'),
          fillColor: Color.Blue
        } as PrefixIconOptions,
        label: {
          text: 'Chip3',
        } as LabelOptions,
        suffixSymbol: {
          normal:undefined,
          activated:undefined
        } as ChipSymbolGlyphOptions,
        suffixSymbolOptions: {
          normalAccessibility: {
            accessibilityText: 'accessibilityText',
            accessibilityDescription: 'accessibilityDescription',
            accessibilityLevel:'yes'
          } as AccessibilityOptions,
          activatedAccessibility: {
            accessibilityText: '',
            accessibilityDescription: '',
            accessibilityLevel:'no'
          } as AccessibilityOptions,
          action:()=>{
            console.info('[ChipSuffixSymbolGlyphOptions] action ');
          }
        } as ChipSuffixSymbolGlyphOptions,
      } as ChipOptions)
      Chip({
        prefixIcon: {
          src: $r('sys.media.ohos_app_icon'),
          fillColor: Color.Blue
        } as PrefixIconOptions,
        label: {
          text: 'Chip4',
        } as LabelOptions,
        suffixSymbol: {
          normal:undefined,
          activated:undefined
        } as ChipSymbolGlyphOptions,
        suffixSymbolOptions: {
          normalAccessibility: {
            accessibilityText: 'accessibilityText',
            accessibilityDescription: 'accessibilityDescription',
            accessibilityLevel:'no-hide-descendants'
          } as AccessibilityOptions,
          activatedAccessibility: {
            accessibilityText: '',
            accessibilityDescription: '',
            accessibilityLevel:''
          } as AccessibilityOptions,
          action:()=>{
            console.info('[ChipSuffixSymbolGlyphOptions] action ');
          }
        } as ChipSuffixSymbolGlyphOptions,
      } as ChipOptions)
    }
    .id('ChipOptionsSuffixSymbolExample')
    .width('100%')
    .padding(16)
  }
}