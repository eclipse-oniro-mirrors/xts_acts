'use static'
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

import {
  Entry, Text, Column, Row, Component, $r, Color, ColorMetrics, ColorSpace, ResourceColor, Button,
  SymbolGlyph, SymbolRenderingStrategy, RowOptions, SymbolGlyphModifier, Scroll, ColumnOptions,
  State
} from '@kit.ArkUI'

@Entry
@Component
struct SymbolGlyphSymbolColor {
  blueColor: ColorMetrics[] = [ColorMetrics.resourceColor(Color.Blue)];
  greenColor: ColorMetrics[] = [ColorMetrics.numeric(0x00FF00)];
  blackColor: ColorMetrics[] = [ColorMetrics.rgba(0, 0, 0, 1.0)];

  @State rGBRed: ColorMetrics = ColorMetrics.colorWithSpace(ColorSpace.SRGB, 1, 0, 0, 1);
  @State rGBGreen: ColorMetrics = ColorMetrics.colorWithSpace(ColorSpace.SRGB, 0, 1, 0, 1);
  @State rGBBlue: ColorMetrics = ColorMetrics.colorWithSpace(ColorSpace.SRGB, 0, 0, 1, 1);

  @State p3Red: ColorMetrics = ColorMetrics.colorWithSpace(ColorSpace.DISPLAY_P3, 1, 0, 0, 1);
  @State p3Green: ColorMetrics = ColorMetrics.colorWithSpace(ColorSpace.DISPLAY_P3, 0, 1, 0, 1);
  @State p3Blue: ColorMetrics = ColorMetrics.colorWithSpace(ColorSpace.DISPLAY_P3, 0, 0, 1, 1);

  rGBColor: ColorMetrics[] = [this.rGBRed,this.rGBGreen,this.rGBBlue];
  p3Color: ColorMetrics[] = [this.p3Red,this.p3Green,this.p3Blue];

  build() {
    Scroll() {
      Column() {
        SymbolGlyph($r('sys.symbol.ohos_folder_badge_plus'))
          .fontSize(50)
          .id('symbolGlyph_symbolColor_default')
          .renderingStrategy(SymbolRenderingStrategy.SINGLE)

        SymbolGlyph($r('sys.symbol.ohos_folder_badge_plus'))
          .fontSize(50)
          .id('symbolGlyph_symbolColor_colorEnum')
          .renderingStrategy(SymbolRenderingStrategy.SINGLE)
          .symbolColor([Color.Red])

        SymbolGlyph($r('sys.symbol.ohos_folder_badge_plus'))
          .fontSize(50)
          .id('symbolGlyph_symbolColor_string')
          .renderingStrategy(SymbolRenderingStrategy.SINGLE)
          .symbolColor(['#FFFF0000'])

        SymbolGlyph($r('sys.symbol.ohos_folder_badge_plus'))
          .fontSize(50)
          .id('symbolGlyph_symbolColor_emptyString')
          .renderingStrategy(SymbolRenderingStrategy.SINGLE)
          .symbolColor([''])

        SymbolGlyph($r('sys.symbol.ohos_folder_badge_plus'))
          .fontSize(50)
          .id('symbolGlyph_symbolColor_number')
          .renderingStrategy(SymbolRenderingStrategy.SINGLE)
          .symbolColor([0xFF0000])

        SymbolGlyph($r('sys.symbol.ohos_folder_badge_plus'))
          .fontSize(50)
          .id('symbolGlyph_symbolColor_colorMetricsResource')
          .renderingStrategy(SymbolRenderingStrategy.SINGLE)
          .symbolColor(this.blueColor)

        SymbolGlyph($r('sys.symbol.ohos_folder_badge_plus'))
          .fontSize(50)
          .id('symbolGlyph_symbolColor_colorMetricsNumeric')
          .renderingStrategy(SymbolRenderingStrategy.SINGLE)
          .symbolColor(this.greenColor)

        SymbolGlyph($r('sys.symbol.ohos_folder_badge_plus'))
          .fontSize(50)
          .id('symbolGlyph_symbolColor_colorMetricsRgba')
          .renderingStrategy(SymbolRenderingStrategy.SINGLE)
          .symbolColor(this.blackColor)

        SymbolGlyph($r('sys.symbol.ohos_folder_badge_plus'))
          .fontSize(50)
          .id('symbolGlyph_symbolColor_undefined')
          .renderingStrategy(SymbolRenderingStrategy.SINGLE)
          .symbolColor(undefined)

        SymbolGlyph($r('sys.symbol.ohos_folder_badge_plus'))
          .fontSize(50)
          .id('symbolGlyph_symbolColor_rgbColor')
          .renderingStrategy(SymbolRenderingStrategy.MULTIPLE_COLOR)
          .symbolColor(this.rGBColor)
        SymbolGlyph($r('sys.symbol.ohos_folder_badge_plus'))
          .fontSize(50)
          .id('symbolGlyph_symbolColor_p3Color')
          .renderingStrategy(SymbolRenderingStrategy.MULTIPLE_COLOR)
          .symbolColor(this.p3Color)
      }
      .width('100%')
      .height('100%')
    }
  }
}