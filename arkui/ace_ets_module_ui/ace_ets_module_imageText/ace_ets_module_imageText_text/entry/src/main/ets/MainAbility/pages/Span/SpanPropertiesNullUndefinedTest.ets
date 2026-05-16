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
struct SpanPropertiesNullUndefinedTest {
  build() {
    Column() {
      Scroll() {
        Column() {
          // ========== fontColor tests ==========
          Text('fontColor Property Tests')
            .fontSize(16)
            .fontWeight(FontWeight.Bold)
            .margin({ top: 10, bottom: 5 })

          Row() {
            // Default
            Text() {
              Span('Test')
                .id('Span_fontColor_default')
            }
            .fontSize(20)


            // Null
            Text() {
              Span('Test')
                .fontColor(null)
                .id('Span_fontColor_null')
            }
            .fontSize(20)


            // Undefined
            Text() {
              Span('Test')
                .fontColor(undefined)
                .id('Span_fontColor_undefined')
            }
            .fontSize(20)


            // Empty string
            Text() {
              Span('Test')
                .fontColor('')
                .id('Span_fontColor_empty')
            }
            .fontSize(20)

          }
          .width('100%')

          // ========== fontSize tests ==========
          Text('fontSize Property Tests')
            .fontSize(16)
            .fontWeight(FontWeight.Bold)
            .margin({ top: 10, bottom: 5 })

          Row() {
            // Default
            Text() {
              Span('Test')
                .id('Span_fontSize_default')
            }
            .fontSize(20)


            // Null
            Text() {
              Span('Test')
                .fontSize(null)
                .id('Span_fontSize_null')
            }
            .fontSize(20)


            // Undefined
            Text() {
              Span('Test')
                .fontSize(undefined)
                .id('Span_fontSize_undefined')
            }
            .fontSize(20)


            // Empty string
            Text() {
              Span('Test')
                .fontSize('')
                .id('Span_fontSize_empty')
            }
            .fontSize(20)

          }
          .width('100%')

          // ========== fontStyle tests ==========
          Text('fontStyle Property Tests')
            .fontSize(16)
            .fontWeight(FontWeight.Bold)
            .margin({ top: 10, bottom: 5 })

          Row() {
            // Default
            Text() {
              Span('Test')
                .id('Span_fontStyle_default')
            }
            .fontSize(20)


            // Null
            Text() {
              Span('Test')
                .fontStyle(null)
                .id('Span_fontStyle_null')
            }
            .fontSize(20)


            // Undefined
            Text() {
              Span('Test')
                .fontStyle(undefined)
                .id('Span_fontStyle_undefined')
            }
            .fontSize(20)

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
              Span('Test')
                .id('Span_fontWeight_default')
            }
            .fontSize(20)


            // Null
            Text() {
              Span('Test')
                .fontWeight(null)
                .id('Span_fontWeight_null')
            }
            .fontSize(20)


            // Undefined
            Text() {
              Span('Test')
                .fontWeight(undefined)
                .id('Span_fontWeight_undefined')
            }
            .fontSize(20)


            // Empty string
            Text() {
              Span('Test')
                .fontWeight('')
                .id('Span_fontWeight_empty')
            }
            .fontSize(20)

          }
          .width('100%')

          // ========== fontFamily tests ==========
          Text('fontFamily Property Tests')
            .fontSize(16)
            .fontWeight(FontWeight.Bold)
            .margin({ top: 10, bottom: 5 })

          Row() {
            // Default
            Text() {
              Span('Test')
                .id('Span_fontFamily_default')
            }
            .fontSize(20)


            // Null
            Text() {
              Span('Test')
                .fontFamily(null)
                .id('Span_fontFamily_null')
            }
            .fontSize(20)


            // Undefined
            Text() {
              Span('Test')
                .fontFamily(undefined)
                .id('Span_fontFamily_undefined')
            }
            .fontSize(20)


            // Empty string
            Text() {
              Span('Test')
                .fontFamily('')
                .id('Span_fontFamily_empty')
            }
            .fontSize(20)

          }
          .width('100%')

          // ========== textCase tests ==========
          Text('textCase Property Tests')
            .fontSize(16)
            .fontWeight(FontWeight.Bold)
            .margin({ top: 10, bottom: 5 })

          Row() {
            // Default
            Text() {
              Span('Test')
                .id('Span_textCase_default')
            }
            .fontSize(20)


            // Null
            Text() {
              Span('Test')
                .textCase(null)
                .id('Span_textCase_null')
            }
            .fontSize(20)


            // Undefined
            Text() {
              Span('Test')
                .textCase(undefined)
                .id('Span_textCase_undefined')
            }
            .fontSize(20)

          }
          .width('100%')

          // ========== letterSpacing tests ==========
          Text('letterSpacing Property Tests')
            .fontSize(16)
            .fontWeight(FontWeight.Bold)
            .margin({ top: 10, bottom: 5 })

          Row() {
            // Default
            Text() {
              Span('Test')
                .id('Span_letterSpacing_default')
            }
            .fontSize(20)


            // Null
            Text() {
              Span('Test')
                .letterSpacing(null)
                .id('Span_letterSpacing_null')
            }
            .fontSize(20)


            // Undefined
            Text() {
              Span('Test')
                .letterSpacing(undefined)
                .id('Span_letterSpacing_undefined')
            }
            .fontSize(20)


            // Empty string
            Text() {
              Span('Test')
                .letterSpacing('')
                .id('Span_letterSpacing_empty')
            }
            .fontSize(20)

          }
          .width('100%')

          // ========== decoration tests ==========
          Text('decoration Property Tests')
            .fontSize(16)
            .fontWeight(FontWeight.Bold)
            .margin({ top: 10, bottom: 5 })

          Row() {
            // Default
            Text() {
              Span('Test')
                .id('Span_decoration_default')
            }
            .fontSize(20)


            // Null
            Text() {
              Span('Test')
                .decoration(null)
                .id('Span_decoration_null')
            }
            .fontSize(20)


            // Undefined
            Text() {
              Span('Test')
                .decoration(undefined)
                .id('Span_decoration_undefined')
            }
            .fontSize(20)

          }
          .width('100%')

          // ========== lineHeight tests ==========
          Text('lineHeight Property Tests')
            .fontSize(16)
            .fontWeight(FontWeight.Bold)
            .margin({ top: 10, bottom: 5 })

          Row() {
            // Default
            Text() {
              Span('Test')
                .id('Span_lineHeight_default')
            }
            .fontSize(20)


            // Null
            Text() {
              Span('Test')
                .lineHeight(null)
                .id('Span_lineHeight_null')
            }
            .fontSize(20)


            // Undefined
            Text() {
              Span('Test')
                .lineHeight(undefined)
                .id('Span_lineHeight_undefined')
            }
            .fontSize(20)


            // Empty string
            Text() {
              Span('Test')
                .lineHeight('')
                .id('Span_lineHeight_empty')
            }
            .fontSize(20)

          }
          .width('100%')

          // ========== font tests ==========
          Text('font Property Tests')
            .fontSize(16)
            .fontWeight(FontWeight.Bold)
            .margin({ top: 10, bottom: 5 })

          Row() {
            // Default
            Text() {
              Span('Test')
                .id('Span_font_default')
            }
            .fontSize(20)


            // Null
            Text() {
              Span('Test')
                .font(null)
                .id('Span_font_null')
            }
            .fontSize(20)


            // Undefined
            Text() {
              Span('Test')
                .font(undefined)
                .id('Span_font_undefined')
            }
            .fontSize(20)

          }
          .width('100%')

          // ========== textBackgroundStyle tests ==========
          Text('textBackgroundStyle Property Tests')
            .fontSize(16)
            .fontWeight(FontWeight.Bold)
            .margin({ top: 10, bottom: 5 })

          Row() {
            // Default
            Text() {
              Span('Test')
                .id('Span_textBackgroundStyle_default')
            }
            .fontSize(20)


            // Null
            Text() {
              Span('Test')
                .textBackgroundStyle(null)
                .id('Span_textBackgroundStyle_null')
            }
            .fontSize(20)


            // Undefined
            Text() {
              Span('Test')
                .textBackgroundStyle(undefined)
                .id('Span_textBackgroundStyle_undefined')
            }
            .fontSize(20)

          }
          .width('100%')

          // ========== baselineOffset tests ==========
          Text('baselineOffset Property Tests')
            .fontSize(16)
            .fontWeight(FontWeight.Bold)
            .margin({ top: 10, bottom: 5 })

          Row() {
            // Default
            Text() {
              Span('Test')
                .id('Span_baselineOffset_default')
            }
            .fontSize(20)


            // Null
            Text() {
              Span('Test')
                .baselineOffset(null)
                .id('Span_baselineOffset_null')
            }
            .fontSize(20)


            // Undefined
            Text() {
              Span('Test')
                .baselineOffset(undefined)
                .id('Span_baselineOffset_undefined')
            }
            .fontSize(20)

          }
          .width('100%')

          // ========== textShadow tests ==========
          Text('textShadow Property Tests')
            .fontSize(16)
            .fontWeight(FontWeight.Bold)
            .margin({ top: 10, bottom: 5 })

          Row() {
            // Default
            Text() {
              Span('Test')
                .id('Span_textShadow_default')
            }
            .fontSize(20)


            // Null
            Text() {
              Span('Test')
                .textShadow(null)
                .id('Span_textShadow_null')
            }
            .fontSize(20)


            // Undefined
            Text() {
              Span('Test')
                .textShadow(undefined)
                .id('Span_textShadow_undefined')
            }
            .fontSize(20)

          }
          .width('100%')
        }
      }
    }
    .width('100%')
    .height('100%')
  }
}
