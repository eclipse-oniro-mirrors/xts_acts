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
struct SymbolEffectNullUndefinedTest {
  build() {

    Column() {
      Scroll(){
        Column(){
          // ========== symbolEffect tests ==========
          Text('symbolEffect Property Tests')
            .fontSize(16)
            .fontWeight(FontWeight.Bold)
            .margin({ top: 10, bottom: 5 })

          Row() {
            // Default
            SymbolGlyph($r('sys.symbol.ohos_trash'))
              .id('SymbolGlyph_symbolEffect_default')
              .fontSize(16)

            // Null1
            SymbolGlyph($r('sys.symbol.ohos_trash'))
              .symbolEffect(null,false)
              .id('SymbolGlyph_symbolEffect_null1')
              .fontSize(16)

            // Undefined1
            SymbolGlyph($r('sys.symbol.ohos_trash'))
              .symbolEffect(undefined,false)
              .id('SymbolGlyph_symbolEffect_undefined1')
              .fontSize(16)

            // Null2
            SymbolGlyph($r('sys.symbol.ohos_trash'))
              .symbolEffect(null,null)
              .id('SymbolGlyph_symbolEffect_null2')
              .fontSize(16)

            // Undefined2
            SymbolGlyph($r('sys.symbol.ohos_trash'))
              .symbolEffect(undefined,undefined)
              .id('SymbolGlyph_symbolEffect_undefined2')
              .fontSize(16)
          }
          .width('100%')
        }
      }

    }
    .width('100%')
    .height('100%')
  }
}
