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
struct SymbolSpanPropertiesNullUndefinedTest {
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
            Text() {
              SymbolSpan($r('sys.symbol.ohos_trash'))
                .id('SymbolSpan_fontSize_default')
            }
              .width('25%')
              .height('5%')


            // Null
            Text() {
              SymbolSpan($r('sys.symbol.ohos_trash'))
                .fontSize(null)
                .id('SymbolSpan_fontSize_null')
            }
              .width('25%')
              .height('5%')


            // Undefined
            Text() {
              SymbolSpan($r('sys.symbol.ohos_trash'))
                .fontSize(undefined)
                .id('SymbolSpan_fontSize_undefined')
            }
              .width('25%')
              .height('5%')


            // Empty string
            Text() {
              SymbolSpan($r('sys.symbol.ohos_trash'))
                .fontSize('')
                .id('SymbolSpan_fontSize_empty')
            }
              .width('25%')
              .height('5%')

          }
          .width('100%')

          // ========== fontColor tests ==========
          Text('fontColor Property Tests')
            .fontSize(16)
            .fontWeight(FontWeight.Bold)
            .margin({ top: 10, bottom: 5 })

          Row() {
            // Default
            Text() {
              SymbolSpan($r('sys.symbol.ohos_trash'))
                .id('SymbolSpan_fontColor_default')
            }
              .width('25%')
              .height('5%')


            // Null
            Text() {
              SymbolSpan($r('sys.symbol.ohos_trash'))
                .fontColor(null)
                .id('SymbolSpan_fontColor_null')
            }
              .width('25%')
              .height('5%')


            // Undefined
            Text() {
              SymbolSpan($r('sys.symbol.ohos_trash'))
                .fontColor(undefined)
                .id('SymbolSpan_fontColor_undefined')
            }
              .width('25%')
              .height('5%')


            // Empty Array
            Text() {
              SymbolSpan($r('sys.symbol.ohos_trash'))
                .fontColor([])
                .id('SymbolSpan_fontColor_empty')
            }
              .width('25%')
              .height('5%')

          }
          .width('100%')

          // ========== fontWeight tests ==========
          Text('fontWeight Property Tests')
            .fontSize(16)
            .fontWeight(FontWeight.Bold)
            .margin({ top: 10, bottom: 5 })

          Row() {
            // Default
            Text() {
              SymbolSpan($r('sys.symbol.ohos_trash'))
                .id('SymbolSpan_fontWeight_default')
            }
              .width('20%')
              .height('5%')


            // Null
            Text() {
              SymbolSpan($r('sys.symbol.ohos_trash'))
                .fontWeight(null)
                .id('SymbolSpan_fontWeight_null')
            }
              .width('20%')
              .height('5%')


            // Undefined
            Text() {
              SymbolSpan($r('sys.symbol.ohos_trash'))
                .fontWeight(undefined)
                .id('SymbolSpan_fontWeight_undefined')
            }
              .width('20%')
              .height('5%')


            // Empty string
            Text() {
              SymbolSpan($r('sys.symbol.ohos_trash'))
                .fontWeight('')
                .id('SymbolSpan_fontWeight_empty')
            }
              .width('20%')
              .height('5%')

            // Number
            Text() {
              SymbolSpan($r('sys.symbol.ohos_trash'))
                .fontWeight(700)
                .id('SymbolSpan_fontWeight_number')
            }
              .width('20%')
              .height('5%')

          }
          .width('100%')

          // ========== effectStrategy tests ==========
          Text('effectStrategy Property Tests')
            .fontSize(16)
            .fontWeight(FontWeight.Bold)
            .margin({ top: 10, bottom: 5 })

          Row() {
            // Default
            Text() {
              SymbolSpan($r('sys.symbol.ohos_trash'))
                .id('SymbolSpan_effectStrategy_default')
            }
              .width('30%')
              .height('5%')


            // Null
            Text() {
              SymbolSpan($r('sys.symbol.ohos_trash'))
                .effectStrategy(null)
                .id('SymbolSpan_effectStrategy_null')
            }
              .width('30%')
              .height('5%')


            // Undefined
            Text() {
              SymbolSpan($r('sys.symbol.ohos_trash'))
                .effectStrategy(undefined)
                .id('SymbolSpan_effectStrategy_undefined')
            }
              .width('30%')
              .height('5%')

          }
          .width('100%')

          // ========== renderingStrategy tests ==========
          Text('renderingStrategy Property Tests')
            .fontSize(16)
            .fontWeight(FontWeight.Bold)
            .margin({ top: 10, bottom: 5 })

          Row() {
            // Default
            Text() {
              SymbolSpan($r('sys.symbol.ohos_trash'))
                .id('SymbolSpan_renderingStrategy_default')
            }
              .width('30%')
              .height('5%')


            // Null
            Text() {
              SymbolSpan($r('sys.symbol.ohos_trash'))
                .renderingStrategy(null)
                .id('SymbolSpan_renderingStrategy_null')
            }
              .width('30%')
              .height('5%')


            // Undefined
            Text() {
              SymbolSpan($r('sys.symbol.ohos_trash'))
                .renderingStrategy(undefined)
                .id('SymbolSpan_renderingStrategy_undefined')
            }
              .width('30%')
              .height('5%')

          }
          .width('100%')

          // ========== attributeModifier tests ==========
          Text('attributeModifier Property Tests')
            .fontSize(16)
            .fontWeight(FontWeight.Bold)
            .margin({ top: 10, bottom: 5 })

          Row() {
            // Default
            Text() {
              SymbolSpan($r('sys.symbol.ohos_trash'))
                .id('SymbolSpan_attributeModifier_default')
            }
              .width('30%')
              .height('5%')


            // Null
            Text() {
              SymbolSpan($r('sys.symbol.ohos_trash'))
                .attributeModifier(null)
                .id('SymbolSpan_attributeModifier_null')
            }
              .width('30%')
              .height('5%')


            // Undefined
            Text() {
              SymbolSpan($r('sys.symbol.ohos_trash'))
                .attributeModifier(undefined)
                .id('SymbolSpan_attributeModifier_undefined')
            }
              .width('30%')
              .height('5%')

          }
          .width('100%')
        }
      }
    }
    .width('100%')
    .height('100%')
  }
}
