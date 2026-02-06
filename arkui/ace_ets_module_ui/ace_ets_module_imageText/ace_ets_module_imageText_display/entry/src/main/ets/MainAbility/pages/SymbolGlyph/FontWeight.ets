/**
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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
struct SymbolGlyphFontWeight {
  @State isActive: boolean = true;

  build() {
    Column() {
      Row() {
        Column() {
          Text('SymbolGlyph: fontWeight').height('5%')
        
          Row() {
            SymbolGlyph($r('sys.symbol.ohos_wifi'))
            .height('10%')
            .id('SymbolGlyph_FontWeight_default')

            SymbolGlyph($r('sys.symbol.repeat_1'))
              .fontWeight(undefined)
              .id('SymbolGlyph_FontWeight_undefined')              

            SymbolGlyph($r('sys.symbol.repeat_1'))
              .fontWeight(500)
              .id('SymbolGlyph_FontWeight_500')
          }.height('10%')

          Row() {
            SymbolGlyph($r('sys.symbol.repeat_1'))
              .fontWeight(FontWeight.Lighter)
              .id('SymbolGlyph_FontWeight_Lighter')

            SymbolGlyph($r('sys.symbol.repeat_1'))
              .fontWeight(FontWeight.Normal)
              .id('SymbolGlyph_FontWeight_Normal')

            SymbolGlyph($r('sys.symbol.repeat_1'))
              .fontWeight(FontWeight.Regular)
              .id('SymbolGlyph_FontWeight_Regular')
          }.height('10%')

          Row() {
            SymbolGlyph($r('sys.symbol.repeat_1'))
              .fontWeight(FontWeight.Medium)
              .id('SymbolGlyph_FontWeight_Medium')

            SymbolGlyph($r('sys.symbol.repeat_1'))
              .fontWeight(FontWeight.Bold)
              .id('SymbolGlyph_FontWeight_Bold')

            SymbolGlyph($r('sys.symbol.repeat_1'))
              .fontWeight(FontWeight.Bolder)
              .id('SymbolGlyph_FontWeight_Bolder')
          }.height('10%')

          SymbolGlyph($r('sys.symbol.repeat_1'))
            .fontWeight('900')
            .id('SymbolGlyph_FontWeight_30')
            .height('10%')
        }
      }
    }.margin({ left: 5, top: 5 })
  }
}