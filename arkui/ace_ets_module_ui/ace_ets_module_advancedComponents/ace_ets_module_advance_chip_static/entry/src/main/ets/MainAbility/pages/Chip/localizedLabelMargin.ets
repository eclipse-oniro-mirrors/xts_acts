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
import { Entry, Column, Row, Component, Color, $r, ColumnOptions, Direction, Button, Text, LengthMetrics, FlexAlign } from '@ohos.arkui.component';
import { State } from '@ohos.arkui.stateManagement';
import { Chip, ChipSize, PrefixIconOptions, SuffixIconOptions, ChipOptions, ChipSymbolGlyphOptions, LabelOptions, LocalizedLabelMarginOptions } from '@ohos.arkui.advanced.Chip';

@Entry
@Component
struct localizedLabelMarginChipPage {
  @State text: string = ''

  build() {
    Column() {
      Chip({
        prefixIcon: {
          src: $r('sys.media.ohos_app_icon'),
          size: { width: 16, height: 16 },
          fillColor: Color.Red,
        } as PrefixIconOptions,
        label: {
          text: 'label1',
          fontSize: 12,
          fontColor: Color.Blue,
          fontFamily: 'HarmonyOS Sans',
          activatedFontColor: '#FFFF0000',
          localizedLabelMargin: { start: LengthMetrics.vp(20), end: LengthMetrics.vp(30) },
        } as LabelOptions,
        suffixIcon: {
          src: $r('sys.media.ohos_app_icon'),
          size: { width: 16, height: 16 },
          fillColor: Color.Red,
          action:() => {
            this.text = 'action'
            console.info('chip on action');
          }
        } as SuffixIconOptions,
        size: ChipSize.NORMAL,
        allowClose: true,
        enabled: true,
        activated: true,
        onClose: () => {
          console.info('chip on close');
        },
        onClicked: () => {
          console.info('chip on clicked');
        }
      })
      Chip({
        prefixIcon: {
          src: $r('sys.media.ohos_app_icon'),
          size: { width: 16, height: 16 },
          fillColor: Color.Red,
        } as PrefixIconOptions,
        label: {
          text: 'label2',
          fontSize: '12',
          fontColor: Color.Blue,
          fontFamily: 'HarmonyOS Sans',
          activatedFontColor: $r('sys.color.ohos_id_color_text_primary_contrary'),
          localizedLabelMargin: {
            start: LengthMetrics.resource($r('sys.float.chip_normal_text_margin')),
            end: LengthMetrics.resource($r('sys.float.chip_normal_text_margin'))
          },
        } as LabelOptions,
        suffixIcon: {
          src: $r('sys.media.ohos_app_icon'),
          size: { width: 16, height: 16 },
          fillColor: Color.Red,
          action:() => {
            this.text = 'action'
            console.info('chip on action');
          }
        } as SuffixIconOptions,
        size: ChipSize.NORMAL,
        allowClose: true,
        enabled: true,
        activated: true,
        onClose: () => {
          console.info('chip on close');
        },
        onClicked: () => {
          console.info('chip on clicked');
        }
      })
      Chip({
        prefixIcon: {
          src: $r('sys.media.ohos_app_icon'),
          size: { width: 16, height: 16 },
          fillColor: Color.Red,
        } as PrefixIconOptions,
        label: {
          text: 'label3',
          fontSize: '12',
          fontColor: Color.Blue,
          fontFamily: 'HarmonyOS Sans',
          activatedFontColor: undefined,
          localizedLabelMargin: undefined,
        } as LabelOptions,
        suffixIcon: {
          src: $r('sys.media.ohos_app_icon'),
          size: { width: 16, height: 16 },
          fillColor: Color.Red,
          action:() => {
            this.text = 'action'
            console.info('chip on action');
          }
        } as SuffixIconOptions,
        size: ChipSize.NORMAL,
        allowClose: true,
        enabled: true,
        activated: true,
        onClose: () => {
          console.info('chip on close');
        },
        onClicked: () => {
          console.info('chip on clicked');
        }
      })
    }.justifyContent(FlexAlign.Center)
    .width('100%')
    .height('100%')
  }
}