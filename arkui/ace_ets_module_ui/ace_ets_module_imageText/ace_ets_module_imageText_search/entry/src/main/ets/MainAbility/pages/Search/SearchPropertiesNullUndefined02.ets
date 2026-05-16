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
struct SearchPropertiesNullUndefined02Test {
  build() {

    Column() {
      Scroll(){
        Column(){
          // ========== minFontScale tests ==========
          Text('minFontScale Property Tests')
            .fontSize(16)
            .fontWeight(FontWeight.Bold)
            .margin({ top: 10, bottom: 5 })

          Row() {
            // Default
            Search({ placeholder: 'minFontScale default' })
              .width('30%')
              .height('5%')
              .id('Search_minFontScale_default')

            // Null
            Search({ placeholder: 'minFontScale null' })
              .width('30%')
              .height('5%')
              .id('Search_minFontScale_null')
              .minFontScale(null)

            // Undefined
            Search({ placeholder: 'minFontScale undefined' })
              .width('30%')
              .height('5%')
              .id('Search_minFontScale_undefined')
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
            Search({ placeholder: 'maxFontScale default' })
              .width('30%')
              .height('5%')
              .id('Search_maxFontScale_default')

            // Null
            Search({ placeholder: 'maxFontScale null' })
              .width('30%')
              .height('5%')
              .id('Search_maxFontScale_null')
              .maxFontScale(null)

            // Undefined
            Search({ placeholder: 'maxFontScale undefined' })
              .width('30%')
              .height('5%')
              .id('Search_maxFontScale_undefined')
              .maxFontScale(undefined)

          }
          .width('100%')

          // ========== decoration tests ==========
          Text('decoration Property Tests')
            .fontSize(16)
            .fontWeight(FontWeight.Bold)
            .margin({ top: 10, bottom: 5 })

          Row() {
            // Default
            Search({ placeholder: 'decoration default' })
              .width('30%')
              .height('5%')
              .id('Search_decoration_default')

            // Null
            Search({ placeholder: 'decoration null' })
              .width('30%')
              .height('5%')
              .id('Search_decoration_null')
              .decoration(null)

            // Undefined
            Search({ placeholder: 'decoration undefined' })
              .width('30%')
              .height('5%')
              .id('Search_decoration_undefined')
              .decoration(undefined)
          }
          .width('100%')

          // ========== letterSpacing tests ==========
          Text('letterSpacing Property Tests')
            .fontSize(16)
            .fontWeight(FontWeight.Bold)
            .margin({ top: 10, bottom: 5 })

          Row() {
            // Default
            Search({ placeholder: 'letterSpacing default' })
              .width('25%')
              .height('5%')
              .id('Search_letterSpacing_default')

            // Null
            Search({ placeholder: 'letterSpacing null' })
              .width('25%')
              .height('5%')
              .id('Search_letterSpacing_null')
              .letterSpacing(null)

            // Undefined
            Search({ placeholder: 'letterSpacing undefined' })
              .width('25%')
              .height('5%')
              .id('Search_letterSpacing_undefined')
              .letterSpacing(undefined)

            // Empty String
            Search({ placeholder: 'letterSpacing empty' })
              .width('25%')
              .height('5%')
              .id('Search_letterSpacing_empty')
              .letterSpacing('')
          }
          .width('100%')

          // ========== lineHeight tests ==========
          Text('lineHeight Property Tests')
            .fontSize(16)
            .fontWeight(FontWeight.Bold)
            .margin({ top: 10, bottom: 5 })

          Row() {
            // Default
            Search({ placeholder: 'lineHeight default' })
              .width('25%')
              .height('5%')
              .id('Search_lineHeight_default')

            // Null
            Search({ placeholder: 'lineHeight null' })
              .width('25%')
              .height('5%')
              .id('Search_lineHeight_null')
              .lineHeight(null)

            // Undefined
            Search({ placeholder: 'lineHeight undefined' })
              .width('25%')
              .height('5%')
              .id('Search_lineHeight_undefined')
              .lineHeight(undefined)

            // Empty String
            Search({ placeholder: 'lineHeight empty' })
              .width('25%')
              .height('5%')
              .id('Search_lineHeight_empty')
              .lineHeight('')
          }
          .width('100%')

          // ========== editMenuOptions tests ==========
          Text('editMenuOptions Property Tests')
            .fontSize(16)
            .fontWeight(FontWeight.Bold)
            .margin({ top: 10, bottom: 5 })

          Row() {
            // Default
            Search({ placeholder: 'editMenuOptions default' })
              .width('30%')
              .height('5%')
              .id('Search_editMenuOptions_default')

            // Null
            Search({ placeholder: 'editMenuOptions null' })
              .width('30%')
              .height('5%')
              .id('Search_editMenuOptions_null')
              .editMenuOptions(null)

            // Undefined
            Search({ placeholder: 'editMenuOptions undefined' })
              .width('30%')
              .height('5%')
              .id('Search_editMenuOptions_undefined')
              .editMenuOptions(undefined)
          }
          .width('100%')

          // ========== autoCapitalizationMode tests ==========
          Text('autoCapitalizationMode Property Tests')
            .fontSize(16)
            .fontWeight(FontWeight.Bold)
            .margin({ top: 10, bottom: 5 })

          Row() {
            // Default
            Search({ placeholder: 'autoCapitalizationMode default' })
              .width('30%')
              .height('5%')
              .id('Search_autoCapitalizationMode_default')

            // Null
            Search({ placeholder: 'autoCapitalizationMode null' })
              .width('30%')
              .height('5%')
              .id('Search_autoCapitalizationMode_null')
              .autoCapitalizationMode(null)

            // Undefined
            Search({ placeholder: 'autoCapitalizationMode undefined' })
              .width('30%')
              .height('5%')
              .id('Search_autoCapitalizationMode_undefined')
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
            Search({ placeholder: 'stopBackPress default' })
              .width('30%')
              .height('5%')
              .id('Search_stopBackPress_default')

            // Null
            Search({ placeholder: 'stopBackPress null' })
              .width('30%')
              .height('5%')
              .id('Search_stopBackPress_null')
              .stopBackPress(null)

            // Undefined
            Search({ placeholder: 'stopBackPress undefined' })
              .width('30%')
              .height('5%')
              .id('Search_stopBackPress_undefined')
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
            Search({ placeholder: 'keyboardAppearance default' })
              .width('30%')
              .height('5%')
              .id('Search_keyboardAppearance_default')

            // Null
            Search({ placeholder: 'keyboardAppearance null' })
              .width('30%')
              .height('5%')
              .id('Search_keyboardAppearance_null')
              .keyboardAppearance(null)

            // Undefined
            Search({ placeholder: 'keyboardAppearance undefined' })
              .width('30%')
              .height('5%')
              .id('Search_keyboardAppearance_undefined')
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
            Search({ placeholder: 'strokeWidth default' })
              .width('30%')
              .height('5%')
              .id('Search_strokeWidth_default')

            // Null
            Search({ placeholder: 'strokeWidth null' })
              .width('30%')
              .height('5%')
              .id('Search_strokeWidth_null')
              .strokeWidth(null)

            // Undefined
            Search({ placeholder: 'strokeWidth undefined' })
              .width('30%')
              .height('5%')
              .id('Search_strokeWidth_undefined')
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
            Search({ placeholder: 'strokeColor default' })
              .width('25%')
              .height('5%')
              .id('Search_strokeColor_default')

            // Null
            Search({ placeholder: 'strokeColor null' })
              .width('25%')
              .height('5%')
              .id('Search_strokeColor_null')
              .strokeColor(null)

            // Undefined
            Search({ placeholder: 'strokeColor undefined' })
              .width('25%')
              .height('5%')
              .id('Search_strokeColor_undefined')
              .strokeColor(undefined)

            // Empty String
            Search({ placeholder: 'strokeColor empty' })
              .width('25%')
              .height('5%')
              .id('Search_strokeColor_empty')
              .strokeColor('')
          }
          .width('100%')

          // ========== enableAutoSpacing tests ==========
          Text('enableAutoSpacing Property Tests')
            .fontSize(16)
            .fontWeight(FontWeight.Bold)
            .margin({ top: 10, bottom: 5 })

          Row() {
            // Default
            Search({ placeholder: 'enableAutoSpacing default' })
              .width('30%')
              .height('5%')
              .id('Search_enableAutoSpacing_default')

            // Null
            Search({ placeholder: 'enableAutoSpacing null' })
              .width('30%')
              .height('5%')
              .id('Search_enableAutoSpacing_null')
              .enableAutoSpacing(null)

            // Undefined
            Search({ placeholder: 'enableAutoSpacing undefined' })
              .width('30%')
              .height('5%')
              .id('Search_enableAutoSpacing_undefined')
              .enableAutoSpacing(undefined)
          }
          .width('100%')

          // ========== includeFontPadding tests ==========
          Text('includeFontPadding Property Tests')
            .fontSize(16)
            .fontWeight(FontWeight.Bold)
            .margin({ top: 10, bottom: 5 })

          Row() {
            // Default
            Search({ placeholder: 'includeFontPadding default' })
              .width('30%')
              .height('5%')
              .id('Search_includeFontPadding_default')

            // Null
            Search({ placeholder: 'includeFontPadding null' })
              .width('30%')
              .height('5%')
              .id('Search_includeFontPadding_null')
              .includeFontPadding(null)

            // Undefined
            Search({ placeholder: 'includeFontPadding undefined' })
              .width('30%')
              .height('5%')
              .id('Search_includeFontPadding_undefined')
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
            Search({ placeholder: 'fallbackLineSpacing default' })
              .width('30%')
              .height('5%')
              .id('Search_fallbackLineSpacing_default')

            // Null
            Search({ placeholder: 'fallbackLineSpacing null' })
              .width('30%')
              .height('5%')
              .id('Search_fallbackLineSpacing_null')
              .fallbackLineSpacing(null)

            // Undefined
            Search({ placeholder: 'fallbackLineSpacing undefined' })
              .width('30%')
              .height('5%')
              .id('Search_fallbackLineSpacing_undefined')
              .fallbackLineSpacing(undefined)
          }
          .width('100%')

          // ========== compressLeadingPunctuation tests ==========
          Text('compressLeadingPunctuation Property Tests')
            .fontSize(16)
            .fontWeight(FontWeight.Bold)
            .margin({ top: 10, bottom: 5 })

          Row() {
            // Default
            Search({ placeholder: 'compressLeadingPunctuation default' })
              .width('30%')
              .height('5%')
              .id('Search_compressLeadingPunctuation_default')

            // Null
            Search({ placeholder: 'compressLeadingPunctuation null' })
              .width('30%')
              .height('5%')
              .id('Search_compressLeadingPunctuation_null')
              .compressLeadingPunctuation(null)

            // Undefined
            Search({ placeholder: 'compressLeadingPunctuation undefined' })
              .width('30%')
              .height('5%')
              .id('Search_compressLeadingPunctuation_undefined')
              .compressLeadingPunctuation(undefined)
          }
          .width('100%')

          // ========== selectedDragPreviewStyle tests ==========
          Text('selectedDragPreviewStyle Property Tests')
            .fontSize(16)
            .fontWeight(FontWeight.Bold)
            .margin({ top: 10, bottom: 5 })

          Row() {
            // Default
            Search({ placeholder: 'selectedDragPreviewStyle default' })
              .width('30%')
              .height('5%')
              .id('Search_selectedDragPreviewStyle_default')

            // Null
            Search({ placeholder: 'selectedDragPreviewStyle null' })
              .width('30%')
              .height('5%')
              .id('Search_selectedDragPreviewStyle_null')
              .selectedDragPreviewStyle(null)

            // Undefined
            Search({ placeholder: 'selectedDragPreviewStyle undefined' })
              .width('30%')
              .height('5%')
              .id('Search_selectedDragPreviewStyle_undefined')
              .selectedDragPreviewStyle(undefined)
          }
          .width('100%')

          // ========== textDirection tests ==========
          Text('textDirection Property Tests')
            .fontSize(16)
            .fontWeight(FontWeight.Bold)
            .margin({ top: 10, bottom: 5 })

          Row() {
            // Default
            Search({ placeholder: 'textDirection default' })
              .width('30%')
              .height('5%')
              .id('Search_textDirection_default')

            // Null
            Search({ placeholder: 'textDirection null' })
              .width('30%')
              .height('5%')
              .id('Search_textDirection_null')
              .textDirection(null)

            // Undefined
            Search({ placeholder: 'textDirection undefined' })
              .width('30%')
              .height('5%')
              .id('Search_textDirection_undefined')
              .textDirection(undefined)
          }
          .width('100%')

          // ========== selectionMenuHidden tests ==========
          Text('selectionMenuHidden Property Tests')
            .fontSize(16)
            .fontWeight(FontWeight.Bold)
            .margin({ top: 10, bottom: 5 })

          Row() {
            // Default
            Search({ placeholder: 'selectionMenuHidden default' })
              .width('20%')
              .height('5%')
              .id('Search_selectionMenuHidden_default')

            // Null
            Search({ placeholder: 'selectionMenuHidden null' })
              .width('20%')
              .height('5%')
              .id('Search_selectionMenuHidden_null')
              .selectionMenuHidden(null)

            // Undefined
            Search({ placeholder: 'selectionMenuHidden undefined' })
              .width('20%')
              .height('5%')
              .id('Search_selectionMenuHidden_undefined')
              .selectionMenuHidden(undefined)

            // True
            Search({ placeholder: 'selectionMenuHidden true' })
              .width('20%')
              .height('5%')
              .id('Search_selectionMenuHidden_true')
              .selectionMenuHidden(true)

            // False
            Search({ placeholder: 'selectionMenuHidden false' })
              .width('20%')
              .height('5%')
              .id('Search_selectionMenuHidden_false')
              .selectionMenuHidden(false)
          }
          .width('100%')

          // ========== enableHapticFeedback tests ==========
          Text('enableHapticFeedback Property Tests')
            .fontSize(16)
            .fontWeight(FontWeight.Bold)
            .margin({ top: 10, bottom: 5 })

          Row() {
            // Default
            Search({ placeholder: 'enableHapticFeedback default' })
              .width('20%')
              .height('5%')
              .id('Search_enableHapticFeedback_default')

            // Null
            Search({ placeholder: 'enableHapticFeedback null' })
              .width('20%')
              .height('5%')
              .id('Search_enableHapticFeedback_null')
              .enableHapticFeedback(null)

            // Undefined
            Search({ placeholder: 'enableHapticFeedback undefined' })
              .width('20%')
              .height('5%')
              .id('Search_enableHapticFeedback_undefined')
              .enableHapticFeedback(undefined)

            // True
            Search({ placeholder: 'enableHapticFeedback true' })
              .width('20%')
              .height('5%')
              .id('Search_enableHapticFeedback_true')
              .enableHapticFeedback(true)

            // False
            Search({ placeholder: 'enableHapticFeedback false' })
              .width('20%')
              .height('5%')
              .id('Search_enableHapticFeedback_false')
              .enableHapticFeedback(false)
          }
          .width('100%')
        }
      }

    }
    .width('100%')
    .height('100%')
  }
}
