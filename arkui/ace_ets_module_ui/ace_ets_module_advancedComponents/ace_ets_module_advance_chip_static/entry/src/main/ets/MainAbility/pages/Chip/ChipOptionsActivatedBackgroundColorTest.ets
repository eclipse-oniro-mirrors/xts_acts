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
  LabelMarginOptions,
  LocalizedLabelMarginOptions,
  ChipSymbolGlyphOptions,
  ChipSuffixSymbolGlyphOptions,
  AccessibilityOptions} from '@ohos.arkui.advanced.Chip';
import inspector from '@ohos.arkui.inspector';
import { AppStorage } from '@ohos.arkui.stateManagement';
import { UIContext, Router } from '@ohos.arkui.UIContext';

@Entry
@Component
struct ChipOptionsActivatedBackgroundColorExample {

  build() {
    Column({ space: 20 } as ColumnOptions) {
      Chip({
        prefixIcon: {
          src: $r('sys.media.ohos_app_icon'),
          fillColor: Color.Blue
        } as PrefixIconOptions,
        label: { text: 'Chip0' } as LabelOptions,
        activated:undefined,
        activatedBackgroundColor:'',
        backgroundColor:''
      } as ChipOptions)
      Chip({
        prefixIcon: {
          src: $r('sys.media.ohos_app_icon'),
          fillColor: Color.Blue
        } as PrefixIconOptions,
        label: { text: 'Chip1' } as LabelOptions,
        activated:undefined,
        activatedBackgroundColor:undefined,
        backgroundColor:undefined
      } as ChipOptions)
      Chip({
        prefixIcon: {
          src: $r('sys.media.ohos_app_icon'),
          fillColor: Color.Blue
        } as PrefixIconOptions,
        label: { text: 'Chip2' } as LabelOptions,
        activated:true,
        activatedBackgroundColor:Color.Red,
        backgroundColor:'#FF00FF'
      } as ChipOptions)
      Chip({
        prefixIcon: {
          src: $r('sys.media.ohos_app_icon'),
          fillColor: Color.Blue
        } as PrefixIconOptions,
        label: { text: 'Chip3' } as LabelOptions,
        activated:false,
        activatedBackgroundColor:'#FF00FF',
        backgroundColor:Color.Red
      } as ChipOptions)
    }
    .id('ChipOptionsActivatedBackgroundColorExample')
    .width('100%')
    .padding(16)
  }
}