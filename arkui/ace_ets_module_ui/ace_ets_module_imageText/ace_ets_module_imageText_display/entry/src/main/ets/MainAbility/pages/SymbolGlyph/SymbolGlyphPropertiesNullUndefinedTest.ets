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

@Entry
@Component
struct SymbolGlyphPropertiesNullUndefinedTest {
  build() {
    Column() {
      Scroll() {
        Column() {
          // ========== fontSize tests ==========
          Text('fontSize Property Tests')
            .fontSize(16)
            .fontWeight(FontWeight.Bold)
            .margin({ top: 10, bottom: 5 })

          Row() {
            // Default
            SymbolGlyph($r('sys.symbol.ohos_trash'))
              .width('25%')
              .height('5%')
              .id('SymbolGlyph_fontSize_default')

            // Null
            SymbolGlyph($r('sys.symbol.ohos_trash'))
              .width('25%')
              .height('5%')
              .id('SymbolGlyph_fontSize_null')
              .fontSize(null)

            // Undefined
            SymbolGlyph($r('sys.symbol.ohos_trash'))
              .width('25%')
              .height('5%')
              .id('SymbolGlyph_fontSize_undefined')
              .fontSize(undefined)

            // Empty string
            SymbolGlyph($r('sys.symbol.ohos_trash'))
              .width('25%')
              .height('5%')
              .id('SymbolGlyph_fontSize_empty')
              .fontSize('')
          }
          .width('100%')

          // ========== fontColor tests ==========
          Text('fontColor Property Tests')
            .fontSize(16)
            .fontWeight(FontWeight.Bold)
            .margin({ top: 10, bottom: 5 })

          Row() {
            // Default
            SymbolGlyph($r('sys.symbol.ohos_trash'))
              .width('25%')
              .height('5%')
              .id('SymbolGlyph_fontColor_default')

            // Null
            SymbolGlyph($r('sys.symbol.ohos_trash'))
              .width('25%')
              .height('5%')
              .id('SymbolGlyph_fontColor_null')
              .fontColor(null)

            // Undefined
            SymbolGlyph($r('sys.symbol.ohos_trash'))
              .width('25%')
              .height('5%')
              .id('SymbolGlyph_fontColor_undefined')
              .fontColor(undefined)

            // Empty Array
            SymbolGlyph($r('sys.symbol.ohos_trash'))
              .width('25%')
              .height('5%')
              .id('SymbolGlyph_fontColor_empty')
              .fontColor([])
          }
          .width('100%')

          // ========== fontWeight tests ==========
          Text('fontWeight Property Tests')
            .fontSize(16)
            .fontWeight(FontWeight.Bold)
            .margin({ top: 10, bottom: 5 })

          Row() {
            // Default
            SymbolGlyph($r('sys.symbol.ohos_trash'))
              .width('25%')
              .height('5%')
              .id('SymbolGlyph_fontWeight_default')

            // Null
            SymbolGlyph($r('sys.symbol.ohos_trash'))
              .width('25%')
              .height('5%')
              .id('SymbolGlyph_fontWeight_null')
              .fontWeight(null)

            // Undefined
            SymbolGlyph($r('sys.symbol.ohos_trash'))
              .width('25%')
              .height('5%')
              .id('SymbolGlyph_fontWeight_undefined')
              .fontWeight(undefined)

            // Empty string
            SymbolGlyph($r('sys.symbol.ohos_trash'))
              .width('25%')
              .height('5%')
              .id('SymbolGlyph_fontWeight_empty')
              .fontWeight('')
          }
          .width('100%')

          // ========== minFontScale tests ==========
          Text('minFontScale Property Tests')
            .fontSize(16)
            .fontWeight(FontWeight.Bold)
            .margin({ top: 10, bottom: 5 })

          Row() {
            // Default
            SymbolGlyph($r('sys.symbol.ohos_trash'))
              .width('30%')
              .height('5%')
              .id('SymbolGlyph_minFontScale_default')

            // Null
            SymbolGlyph($r('sys.symbol.ohos_trash'))
              .width('30%')
              .height('5%')
              .id('SymbolGlyph_minFontScale_null')
              .minFontScale(null)

            // Undefined
            SymbolGlyph($r('sys.symbol.ohos_trash'))
              .width('30%')
              .height('5%')
              .id('SymbolGlyph_minFontScale_undefined')
              .minFontScale(undefined)
          }
          .width('100%')

          // ========== maxFontScale tests ==========
          Text('maxFontScale Property Tests')
            .fontSize(16)
            .fontWeight(FontWeight.Bold)
            .margin({ top: 10, bottom: 5 })

          Row() {
            // Default
            SymbolGlyph($r('sys.symbol.ohos_trash'))
              .width('30%')
              .height('5%')
              .id('SymbolGlyph_maxFontScale_default')

            // Null
            SymbolGlyph($r('sys.symbol.ohos_trash'))
              .width('30%')
              .height('5%')
              .id('SymbolGlyph_maxFontScale_null')
              .maxFontScale(null)

            // Undefined
            SymbolGlyph($r('sys.symbol.ohos_trash'))
              .width('30%')
              .height('5%')
              .id('SymbolGlyph_maxFontScale_undefined')
              .maxFontScale(undefined)
          }
          .width('100%')

          // ========== symbolShadow tests ==========
          Text('symbolShadow Property Tests')
            .fontSize(16)
            .fontWeight(FontWeight.Bold)
            .margin({ top: 10, bottom: 5 })

          Row() {
            // Default
            SymbolGlyph($r('sys.symbol.ohos_trash'))
              .width('30%')
              .height('5%')
              .id('SymbolGlyph_symbolShadow_default')

            // Null
            SymbolGlyph($r('sys.symbol.ohos_trash'))
              .width('30%')
              .height('5%')
              .id('SymbolGlyph_symbolShadow_null')
              .symbolShadow(null)

            // Undefined
            SymbolGlyph($r('sys.symbol.ohos_trash'))
              .width('30%')
              .height('5%')
              .id('SymbolGlyph_symbolShadow_undefined')
              .symbolShadow(undefined)
          }
          .width('100%')
        }
      }
    }
    .width('100%')
    .height('100%')
  }
}
