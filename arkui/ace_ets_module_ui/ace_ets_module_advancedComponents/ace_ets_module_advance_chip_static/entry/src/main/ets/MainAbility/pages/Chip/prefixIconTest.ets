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
import { Entry, Column, Row, Component, Color, $r, ColumnOptions, Direction, Button } from '@ohos.arkui.component';
import { State } from '@ohos.arkui.stateManagement';
import { SymbolGlyphModifier } from '@ohos.arkui.modifier';
import { Chip, ChipSize, PrefixIconOptions, SuffixIconOptions, ChipOptions, ChipSymbolGlyphOptions, LabelOptions } from '@ohos.arkui.advanced.Chip';

@Entry
@Component
struct prefixIconChipTest {
  @State isActivated: boolean = false;
  build() {
    Column({ space: 5 } as ColumnOptions) {
      Chip({
        prefixSymbol: {
          normal: new SymbolGlyphModifier($r('sys.symbol.ohos_star')).fontSize(16).fontColor([Color.Green]),
          activated: new SymbolGlyphModifier($r('sys.symbol.ohos_star')).fontSize(16).fontColor([Color.Red]),
        } as ChipSymbolGlyphOptions,
        label: {
          text: '操作块1',
          fontSize: 12,
          fontColor: Color.Blue,
        } as LabelOptions,
        activated: this.isActivated,
      } as ChipOptions)

      Chip({
        prefixIcon: {
          src: $r('sys.media.ohos_ic_public_cut'),
          size: { width: 16, height: 16 },
          fillColor: Color.Pink,
          activatedFillColor: Color.Red
        } as PrefixIconOptions,
        label: {
          text: '操作块2',
          fontSize: 12,
          fontColor: Color.Blue,
        } as LabelOptions,
        activated: this.isActivated,
      } as ChipOptions)

      Chip({
        prefixIcon: {
          src: $r('sys.media.ohos_ic_public_cut'),
          size: { width: "16vp", height: "16vp" },
          fillColor: "#FFFFC0CB",
          activatedFillColor: "#FFFF0000",
        } as PrefixIconOptions,
        label: {
          text: '操作块3',
          fontSize: 12,
          fontColor: Color.Blue,
        } as LabelOptions,
        activated: this.isActivated,
      } as ChipOptions)

      Chip({
        prefixIcon: {
          src: $r('sys.media.ohos_ic_public_cut'),
          size: { width: 16, height: 16 },
          fillColor: 0xFFC0CB,
          activatedFillColor: 0xFF0000
        } as PrefixIconOptions,
        label: {
          text: '操作块4',
          fontSize: 12,
          fontColor: Color.Blue,
        } as LabelOptions,
        activated: this.isActivated,
      } as ChipOptions)

      Chip({
        prefixIcon: {
          src: $r('sys.media.ohos_ic_public_cut'),
          size: { width: $r('app.float.icon_size'), height: $r('app.float.icon_size') },
          fillColor: $r('sys.color.chip_usually_icon_color'),
          activatedFillColor: $r('sys.color.chip_active_icon_color')
        } as PrefixIconOptions,
        label: {
          text: '操作块5',
          fontSize: 12,
          fontColor: Color.Blue,
        } as LabelOptions,
        activated: this.isActivated,
      } as ChipOptions)

      Chip({
        prefixIcon: {
          src:  $r('sys.media.ohos_ic_public_cut'),
          size: undefined,
          fillColor: undefined,
          activatedFillColor: undefined
        } as PrefixIconOptions,
        label: {
          text: '操作块6',
          fontSize: 12,
          fontColor: Color.Blue,
        } as LabelOptions,
        activated: this.isActivated,
      } as ChipOptions)

      Chip({
        prefixIcon: {
          src:  '',
        } as PrefixIconOptions,
        label: {
          text: '操作块7',
          fontSize: 12,
          fontColor: Color.Blue,
        } as LabelOptions,
        activated: this.isActivated,
      } as ChipOptions)

      Row(){
        Button('activated: true').id('prefixIcon_isActivated_true')
          .onClick(() => {
            this.isActivated = true;
          })
        Button('activated: false').id('prefixIcon_isActivated_false')
          .onClick(() => {
            this.isActivated = false;
          })
      }

    }
  }
}