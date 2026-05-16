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

import { ColorMetrics } from '@kit.ArkUI';

@Entry
@Component
struct SymbolGlyphFontColor {
  blueColor: ColorMetrics[] = [ColorMetrics.resourceColor(Color.Blue)];
  greenColor: ColorMetrics[] = [ColorMetrics.numeric(0x00FF00)];
  blackColor: ColorMetrics[] = [ColorMetrics.rgba(0, 0, 0, 1.0)];

  build() {
    Scroll() {
      Column() {
        SymbolGlyph($r('sys.symbol.ohos_folder_badge_plus'))
          .fontSize(50)
          .id('symbolGlyph_fontColor_default')
          .renderingStrategy(SymbolRenderingStrategy.SINGLE)

        SymbolGlyph($r('sys.symbol.ohos_folder_badge_plus'))
          .fontSize(50)
          .id('symbolGlyph_fontColor_colorEnum')
          .renderingStrategy(SymbolRenderingStrategy.SINGLE)
          .fontColor([Color.Red])

        SymbolGlyph($r('sys.symbol.ohos_folder_badge_plus'))
          .fontSize(50)
          .id('symbolGlyph_fontColor_string')
          .renderingStrategy(SymbolRenderingStrategy.SINGLE)
          .fontColor(['#FFFF0000'])

        SymbolGlyph($r('sys.symbol.ohos_folder_badge_plus'))
          .fontSize(50)
          .id('symbolGlyph_fontColor_emptyString')
          .renderingStrategy(SymbolRenderingStrategy.SINGLE)
          .fontColor([''])

        SymbolGlyph($r('sys.symbol.ohos_folder_badge_plus'))
          .fontSize(50)
          .id('symbolGlyph_fontColor_number')
          .renderingStrategy(SymbolRenderingStrategy.SINGLE)
          .fontColor([0xFF0000])

        SymbolGlyph($r('sys.symbol.ohos_folder_badge_plus'))
          .fontSize(50)
          .id('symbolGlyph_fontColor_colorMetricsResource')
          .renderingStrategy(SymbolRenderingStrategy.SINGLE)
          .fontColor(this.blueColor)

        SymbolGlyph($r('sys.symbol.ohos_folder_badge_plus'))
          .fontSize(50)
          .id('symbolGlyph_fontColor_colorMetricsNumeric')
          .renderingStrategy(SymbolRenderingStrategy.SINGLE)
          .fontColor(this.greenColor)

        SymbolGlyph($r('sys.symbol.ohos_folder_badge_plus'))
          .fontSize(50)
          .id('symbolGlyph_fontColor_colorMetricsRgba')
          .renderingStrategy(SymbolRenderingStrategy.SINGLE)
          .fontColor(this.blackColor)

        SymbolGlyph($r('sys.symbol.ohos_folder_badge_plus'))
          .fontSize(50)
          .id('symbolGlyph_fontColor_null')
          .renderingStrategy(SymbolRenderingStrategy.SINGLE)
          .fontColor(null)

        SymbolGlyph($r('sys.symbol.ohos_folder_badge_plus'))
          .fontSize(50)
          .id('symbolGlyph_fontColor_undefined')
          .renderingStrategy(SymbolRenderingStrategy.SINGLE)
          .fontColor(undefined)
      }
      .width('100%')
      .height('100%')
    }
  }
}