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
struct TextAreaPropertiesNullUndefined02Test {
  build() {

    Column() {
      Scroll(){
        Column(){
          // ========== minLines tests ==========
          Text('minLines Property Tests')
            .fontSize(16)
            .fontWeight(FontWeight.Bold)
            .margin({ top: 10, bottom: 5 })

          Row() {
            // Default
            TextArea({ placeholder: 'minLines default', text: 'Hello World' })
              .width('30%')
              .height('5%')
              .id('TextArea_minLines_default')

            // Null
            TextArea({ placeholder: 'minLines null', text: 'Hello World' })
              .width('30%')
              .height('5%')
              .id('TextArea_minLines_null')
              .minLines(null)

            // Undefined
            TextArea({ placeholder: 'minLines undefined', text: 'Hello World' })
              .width('30%')
              .height('5%')
              .id('TextArea_minLines_undefined')
              .minLines(undefined)
          }
          .width('100%')

          // ========== wordBreak tests ==========
          Text('wordBreak Property Tests')
            .fontSize(16)
            .fontWeight(FontWeight.Bold)
            .margin({ top: 10, bottom: 5 })

          Row() {
            // Default
            TextArea({ placeholder: 'wordBreak default', text: 'Hello World' })
              .width('30%')
              .height('5%')
              .id('TextArea_wordBreak_default')

            // Null
            TextArea({ placeholder: 'wordBreak null', text: 'Hello World' })
              .width('30%')
              .height('5%')
              .id('TextArea_wordBreak_null')
              .wordBreak(null)

            // Undefined
            TextArea({ placeholder: 'wordBreak undefined', text: 'Hello World' })
              .width('30%')
              .height('5%')
              .id('TextArea_wordBreak_undefined')
              .wordBreak(undefined)
          }
          .width('100%')

          // ========== lineBreakStrategy tests ==========
          Text('lineBreakStrategy Property Tests')
            .fontSize(16)
            .fontWeight(FontWeight.Bold)
            .margin({ top: 10, bottom: 5 })

          Row() {
            // Default
            TextArea({ placeholder: 'lineBreakStrategy default', text: 'Hello World' })
              .width('30%')
              .height('5%')
              .id('TextArea_lineBreakStrategy_default')

            // Null
            TextArea({ placeholder: 'lineBreakStrategy null', text: 'Hello World' })
              .width('30%')
              .height('5%')
              .id('TextArea_lineBreakStrategy_null')
              .lineBreakStrategy(null)

            // Undefined
            TextArea({ placeholder: 'lineBreakStrategy undefined', text: 'Hello World' })
              .width('30%')
              .height('5%')
              .id('TextArea_lineBreakStrategy_undefined')
              .lineBreakStrategy(undefined)
          }
          .width('100%')

          // ========== decoration tests ==========
          Text('decoration Property Tests')
            .fontSize(16)
            .fontWeight(FontWeight.Bold)
            .margin({ top: 10, bottom: 5 })

          Row() {
            // Default
            TextArea({ placeholder: 'decoration default', text: 'Hello World' })
              .width('30%')
              .height('5%')
              .id('TextArea_decoration_default')

            // Null
            TextArea({ placeholder: 'decoration null', text: 'Hello World' })
              .width('30%')
              .height('5%')
              .id('TextArea_decoration_null')
              .decoration(null)

            // Undefined
            TextArea({ placeholder: 'decoration undefined', text: 'Hello World' })
              .width('30%')
              .height('5%')
              .id('TextArea_decoration_undefined')
              .decoration(undefined)
          }
          .width('100%')

          // ========== lineSpacing tests ==========
          Text('lineSpacing Property Tests')
            .fontSize(16)
            .fontWeight(FontWeight.Bold)
            .margin({ top: 10, bottom: 5 })

          Row() {
            // Default
            TextArea({ placeholder: 'lineSpacing default', text: 'Hello World' })
              .width('30%')
              .height('5%')
              .id('TextArea_lineSpacing_default')

            // Null
            TextArea({ placeholder: 'lineSpacing null', text: 'Hello World' })
              .width('30%')
              .height('5%')
              .id('TextArea_lineSpacing_null')
              .lineSpacing(null,null)

            // Undefined
            TextArea({ placeholder: 'lineSpacing undefined', text: 'Hello World' })
              .width('30%')
              .height('5%')
              .id('TextArea_lineSpacing_undefined')
              .lineSpacing(undefined,undefined)
          }
          .width('100%')

          // ========== contentType tests ==========
          Text('contentType Property Tests')
            .fontSize(16)
            .fontWeight(FontWeight.Bold)
            .margin({ top: 10, bottom: 5 })

          Row() {
            // Default
            TextArea({ placeholder: 'contentType default', text: 'Hello World' })
              .width('30%')
              .height('5%')
              .id('TextArea_contentType_default')

            // Null
            TextArea({ placeholder: 'contentType null', text: 'Hello World' })
              .width('30%')
              .height('5%')
              .id('TextArea_contentType_null')
              .contentType(null)

            // Undefined
            TextArea({ placeholder: 'contentType undefined', text: 'Hello World' })
              .width('30%')
              .height('5%')
              .id('TextArea_contentType_undefined')
              .contentType(undefined)
          }
          .width('100%')

          // ========== enableSelectedDataDetector tests ==========
          Text('enableSelectedDataDetector Property Tests')
            .fontSize(16)
            .fontWeight(FontWeight.Bold)
            .margin({ top: 10, bottom: 5 })

          Row() {
            // Default
            TextArea({ placeholder: 'enableSelectedDataDetector default', text: 'Hello World' })
              .width('30%')
              .height('5%')
              .id('TextArea_enableSelectedDataDetector_default')

            // Null
            TextArea({ placeholder: 'enableSelectedDataDetector null', text: 'Hello World' })
              .width('30%')
              .height('5%')
              .id('TextArea_enableSelectedDataDetector_null')
              .enableSelectedDataDetector(null)

            // Undefined
            TextArea({ placeholder: 'enableSelectedDataDetector undefined', text: 'Hello World' })
              .width('30%')
              .height('5%')
              .id('TextArea_enableSelectedDataDetector_undefined')
              .enableSelectedDataDetector(undefined)
          }
          .width('100%')

          // ========== autoCapitalizationMode tests ==========
          Text('autoCapitalizationMode Property Tests')
            .fontSize(16)
            .fontWeight(FontWeight.Bold)
            .margin({ top: 10, bottom: 5 })

          Row() {
            // Default
            TextArea({ placeholder: 'autoCapitalizationMode default', text: 'Hello World' })
              .width('30%')
              .height('5%')
              .id('TextArea_autoCapitalizationMode_default')

            // Null
            TextArea({ placeholder: 'autoCapitalizationMode null', text: 'Hello World' })
              .width('30%')
              .height('5%')
              .id('TextArea_autoCapitalizationMode_null')
              .autoCapitalizationMode(null)

            // Undefined
            TextArea({ placeholder: 'autoCapitalizationMode undefined', text: 'Hello World' })
              .width('30%')
              .height('5%')
              .id('TextArea_autoCapitalizationMode_undefined')
              .autoCapitalizationMode(undefined)
          }
          .width('100%')

          // ========== stopBackPress tests ==========
          Text('stopBackPress Property Tests')
            .fontSize(16)
            .fontWeight(FontWeight.Bold)
            .margin({ top: 10, bottom: 5 })

          Row() {
            // Default
            TextArea({ placeholder: 'stopBackPress default', text: 'Hello World' })
              .width('30%')
              .height('5%')
              .id('TextArea_stopBackPress_default')

            // Null
            TextArea({ placeholder: 'stopBackPress null', text: 'Hello World' })
              .width('30%')
              .height('5%')
              .id('TextArea_stopBackPress_null')
              .stopBackPress(null)

            // Undefined
            TextArea({ placeholder: 'stopBackPress undefined', text: 'Hello World' })
              .width('30%')
              .height('5%')
              .id('TextArea_stopBackPress_undefined')
              .stopBackPress(undefined)
          }
          .width('100%')

          // ========== keyboardAppearance tests ==========
          Text('keyboardAppearance Property Tests')
            .fontSize(16)
            .fontWeight(FontWeight.Bold)
            .margin({ top: 10, bottom: 5 })

          Row() {
            // Default
            TextArea({ placeholder: 'keyboardAppearance default', text: 'Hello World' })
              .width('30%')
              .height('5%')
              .id('TextArea_keyboardAppearance_default')

            // Null
            TextArea({ placeholder: 'keyboardAppearance null', text: 'Hello World' })
              .width('30%')
              .height('5%')
              .id('TextArea_keyboardAppearance_null')
              .keyboardAppearance(null)

            // Undefined
            TextArea({ placeholder: 'keyboardAppearance undefined', text: 'Hello World' })
              .width('30%')
              .height('5%')
              .id('TextArea_keyboardAppearance_undefined')
              .keyboardAppearance(undefined)
          }
          .width('100%')

          // ========== strokeWidth tests ==========
          Text('strokeWidth Property Tests')
            .fontSize(16)
            .fontWeight(FontWeight.Bold)
            .margin({ top: 10, bottom: 5 })

          Row() {
            // Default
            TextArea({ placeholder: 'strokeWidth default', text: 'Hello World' })
              .width('30%')
              .height('5%')
              .id('TextArea_strokeWidth_default')

            // Null
            TextArea({ placeholder: 'strokeWidth null', text: 'Hello World' })
              .width('30%')
              .height('5%')
              .id('TextArea_strokeWidth_null')
              .strokeWidth(null)

            // Undefined
            TextArea({ placeholder: 'strokeWidth undefined', text: 'Hello World' })
              .width('30%')
              .height('5%')
              .id('TextArea_strokeWidth_undefined')
              .strokeWidth(undefined)
          }
          .width('100%')

          // ========== strokeColor tests ==========
          Text('strokeColor Property Tests')
            .fontSize(16)
            .fontWeight(FontWeight.Bold)
            .margin({ top: 10, bottom: 5 })

          Row() {
            // Default
            TextArea({ placeholder: 'strokeColor default', text: 'Hello World' })
              .width('30%')
              .height('5%')
              .id('TextArea_strokeColor_default')

            // Null
            TextArea({ placeholder: 'strokeColor null', text: 'Hello World' })
              .width('30%')
              .height('5%')
              .id('TextArea_strokeColor_null')
              .strokeColor(null)

            // Undefined
            TextArea({ placeholder: 'strokeColor undefined', text: 'Hello World' })
              .width('30%')
              .height('5%')
              .id('TextArea_strokeColor_undefined')
              .strokeColor(undefined)
          }
          .width('100%')

          // ========== enableAutoSpacing tests ==========
          Text('enableAutoSpacing Property Tests')
            .fontSize(16)
            .fontWeight(FontWeight.Bold)
            .margin({ top: 10, bottom: 5 })

          Row() {
            // Default
            TextArea({ placeholder: 'enableAutoSpacing default', text: 'Hello World' })
              .width('30%')
              .height('5%')
              .id('TextArea_enableAutoSpacing_default')

            // Null
            TextArea({ placeholder: 'enableAutoSpacing null', text: 'Hello World' })
              .width('30%')
              .height('5%')
              .id('TextArea_enableAutoSpacing_null')
              .enableAutoSpacing(null)

            // Undefined
            TextArea({ placeholder: 'enableAutoSpacing undefined', text: 'Hello World' })
              .width('30%')
              .height('5%')
              .id('TextArea_enableAutoSpacing_undefined')
              .enableAutoSpacing(undefined)
          }
          .width('100%')

          // ========== compressLeadingPunctuation tests ==========
          Text('compressLeadingPunctuation Property Tests')
            .fontSize(16)
            .fontWeight(FontWeight.Bold)
            .margin({ top: 10, bottom: 5 })

          Row() {
            // Default
            TextArea({ placeholder: 'compressLeadingPunctuation default', text: 'Hello World' })
              .width('30%')
              .height('5%')
              .id('TextArea_compressLeadingPunctuation_default')

            // Null
            TextArea({ placeholder: 'compressLeadingPunctuation null', text: 'Hello World' })
              .width('30%')
              .height('5%')
              .id('TextArea_compressLeadingPunctuation_null')
              .compressLeadingPunctuation(null)

            // Undefined
            TextArea({ placeholder: 'compressLeadingPunctuation undefined', text: 'Hello World' })
              .width('30%')
              .height('5%')
              .id('TextArea_compressLeadingPunctuation_undefined')
              .compressLeadingPunctuation(undefined)
          }
          .width('100%')

          // ========== includeFontPadding tests ==========
          Text('includeFontPadding Property Tests')
            .fontSize(16)
            .fontWeight(FontWeight.Bold)
            .margin({ top: 10, bottom: 5 })

          Row() {
            // Default
            TextArea({ placeholder: 'includeFontPadding default', text: 'Hello World' })
              .width('30%')
              .height('5%')
              .id('TextArea_includeFontPadding_default')

            // Null
            TextArea({ placeholder: 'includeFontPadding null', text: 'Hello World' })
              .width('30%')
              .height('5%')
              .id('TextArea_includeFontPadding_null')
              .includeFontPadding(null)

            // Undefined
            TextArea({ placeholder: 'includeFontPadding undefined', text: 'Hello World' })
              .width('30%')
              .height('5%')
              .id('TextArea_includeFontPadding_undefined')
              .includeFontPadding(undefined)
          }
          .width('100%')

          // ========== fallbackLineSpacing tests ==========
          Text('fallbackLineSpacing Property Tests')
            .fontSize(16)
            .fontWeight(FontWeight.Bold)
            .margin({ top: 10, bottom: 5 })

          Row() {
            // Default
            TextArea({ placeholder: 'fallbackLineSpacing default', text: 'Hello World' })
              .width('30%')
              .height('5%')
              .id('TextArea_fallbackLineSpacing_default')

            // Null
            TextArea({ placeholder: 'fallbackLineSpacing null', text: 'Hello World' })
              .width('30%')
              .height('5%')
              .id('TextArea_fallbackLineSpacing_null')
              .fallbackLineSpacing(null)

            // Undefined
            TextArea({ placeholder: 'fallbackLineSpacing undefined', text: 'Hello World' })
              .width('30%')
              .height('5%')
              .id('TextArea_fallbackLineSpacing_undefined')
              .fallbackLineSpacing(undefined)
          }
          .width('100%')

          // ========== textDirection tests ==========
          Text('textDirection Property Tests')
            .fontSize(16)
            .fontWeight(FontWeight.Bold)
            .margin({ top: 10, bottom: 5 })

          Row() {
            // Default
            TextArea({ placeholder: 'textDirection default', text: 'Hello World' })
              .width('30%')
              .height('5%')
              .id('TextArea_textDirection_default')

            // Null
            TextArea({ placeholder: 'textDirection null', text: 'Hello World' })
              .width('30%')
              .height('5%')
              .id('TextArea_textDirection_null')
              .textDirection(null)

            // Undefined
            TextArea({ placeholder: 'textDirection undefined', text: 'Hello World' })
              .width('30%')
              .height('5%')
              .id('TextArea_textDirection_undefined')
              .textDirection(undefined)
          }
          .width('100%')
        }
      }

      }
      .width('100%')
      .height('100%')
  }
}
