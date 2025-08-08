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
struct BounceSymbolEffectTest {

  build() {
    Column() {
      Row() {
        Column() {
          Text("可变颜色动效").height('5%')

          Row() {
            SymbolGlyph($r('sys.symbol.repeat_1'))
              .fontSize(20)
              .id('SymbolGlyph_1')
              .symbolEffect(new BounceSymbolEffect(EffectScope.LAYER, EffectDirection.DOWN))

            SymbolGlyph($r('sys.symbol.repeat_1'))
              .fontSize(20)
              .id('SymbolGlyph_2')
              .symbolEffect(new BounceSymbolEffect(EffectScope.WHOLE, EffectDirection.UP))
          }.height('10%')

          Row() {
            SymbolGlyph($r('sys.symbol.repeat_1'))
              .fontSize(20)
              .id('SymbolGlyph_3')
              .symbolEffect(new BounceSymbolEffect(undefined, undefined))

            SymbolGlyph($r('sys.symbol.repeat_1'))
              .fontSize(20)
              .id('SymbolGlyph_4')
              .symbolEffect(new BounceSymbolEffect(undefined))

            SymbolGlyph($r('sys.symbol.repeat_1'))
              .fontSize(20)
              .id('SymbolGlyph_5')
              .symbolEffect(new BounceSymbolEffect())
          }.height('10%')
        }.margin({right:10})
      }
    }.margin({ left: 1, top: 1 })
  }
}