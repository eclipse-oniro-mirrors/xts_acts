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
struct SearchPropertiesNullUndefinedTest {
  build() {

    Column() {
      Scroll(){
        Column(){
          // ========== fontColor tests ==========
          Text('fontColor Property Tests')
            .fontSize(16)
            .fontWeight(FontWeight.Bold)
            .margin({ top: 10, bottom: 5 })

          Row() {
            // Default
            Search({ placeholder: 'fontColor default' })
              .width('30%')
              .height('5%')
              .id('Search_fontColor_default')

            // Null
            Search({ placeholder: 'fontColor null' })
              .width('30%')
              .height('5%')
              .id('Search_fontColor_null')
              .fontColor(null)

            // Undefined
            Search({ placeholder: 'fontColor undefined' })
              .width('30%')
              .height('5%')
              .id('Search_fontColor_undefined')
              .fontColor(undefined)

            // Empty String
            Search({ placeholder: 'fontColor empty' })
              .width('30%')
              .height('5%')
              .id('Search_fontColor_empty')
              .fontColor('')
          }
          .width('100%')

          // ========== searchIcon tests ==========
          Text('searchIcon Property Tests')
            .fontSize(16)
            .fontWeight(FontWeight.Bold)
            .margin({ top: 10, bottom: 5 })

          Row() {
            // Default
            Search({ placeholder: 'searchIcon default' })
              .width('30%')
              .height('5%')
              .id('Search_searchIcon_default')

            // Null
            Search({ placeholder: 'searchIcon null' })
              .width('30%')
              .height('5%')
              .id('Search_searchIcon_null')
              .searchIcon(null)

            // Undefined
            Search({ placeholder: 'searchIcon undefined' })
              .width('30%')
              .height('5%')
              .id('Search_searchIcon_undefined')
              .searchIcon(undefined)
          }
          .width('100%')

          // ========== cancelButton tests ==========
          Text('cancelButton Property Tests')
            .fontSize(16)
            .fontWeight(FontWeight.Bold)
            .margin({ top: 10, bottom: 5 })

          Row() {
            // Default
            Search({ placeholder: 'cancelButton default' })
              .width('30%')
              .height('5%')
              .id('Search_cancelButton_default')

            // Null
            Search({ placeholder: 'cancelButton null' })
              .width('30%')
              .height('5%')
              .id('Search_cancelButton_null')
              .cancelButton(null)

            // Undefined
            Search({ placeholder: 'cancelButton undefined' })
              .width('30%')
              .height('5%')
              .id('Search_cancelButton_undefined')
              .cancelButton(undefined)
          }
          .width('100%')

          // ========== enableSelectedDataDetector tests ==========
          Text('enableSelectedDataDetector Property Tests')
            .fontSize(16)
            .fontWeight(FontWeight.Bold)
            .margin({ top: 10, bottom: 5 })

          Row() {
            // Default
            Search({ placeholder: 'enableSelectedDataDetector default' })
              .width('30%')
              .height('5%')
              .id('Search_enableSelectedDataDetector_default')

            // Null
            Search({ placeholder: 'enableSelectedDataDetector null' })
              .width('30%')
              .height('5%')
              .id('Search_enableSelectedDataDetector_null')
              .enableSelectedDataDetector(null)

            // Undefined
            Search({ placeholder: 'enableSelectedDataDetector undefined' })
              .width('30%')
              .height('5%')
              .id('Search_enableSelectedDataDetector_undefined')
              .enableSelectedDataDetector(undefined)
          }
          .width('100%')

          // ========== textIndent tests ==========
          Text('textIndent Property Tests')
            .fontSize(16)
            .fontWeight(FontWeight.Bold)
            .margin({ top: 10, bottom: 5 })

          Row() {
            // Default
            Search({ placeholder: 'textIndent default' })
              .width('30%')
              .height('5%')
              .id('Search_textIndent_default')

            // Null
            Search({ placeholder: 'textIndent null' })
              .width('30%')
              .height('5%')
              .id('Search_textIndent_null')
              .textIndent(null)

            // Undefined
            Search({ placeholder: 'textIndent undefined' })
              .width('30%')
              .height('5%')
              .id('Search_textIndent_undefined')
              .textIndent(undefined)
          }
          .width('100%')

          // ========== inputFilter tests ==========
          Text('inputFilter Property Tests')
            .fontSize(16)
            .fontWeight(FontWeight.Bold)
            .margin({ top: 10, bottom: 5 })

          Row() {
            // Default
            Search({ placeholder: 'inputFilter default' })
              .width('30%')
              .height('5%')
              .id('Search_inputFilter_default')

            // Null
            Search({ placeholder: 'inputFilter null' })
              .width('30%')
              .height('5%')
              .id('Search_inputFilter_null')
              .inputFilter(null)

            // Undefined
            Search({ placeholder: 'inputFilter undefined' })
              .width('30%')
              .height('5%')
              .id('Search_inputFilter_undefined')
              .inputFilter(undefined)
          }
          .width('100%')

          // ========== selectedBackgroundColor tests ==========
          Text('selectedBackgroundColor Property Tests')
            .fontSize(16)
            .fontWeight(FontWeight.Bold)
            .margin({ top: 10, bottom: 5 })

          Row() {
            // Default
            Search({ placeholder: 'selectedBackgroundColor default' })
              .width('30%')
              .height('5%')
              .id('Search_selectedBackgroundColor_default')

            // Null
            Search({ placeholder: 'selectedBackgroundColor null' })
              .width('30%')
              .height('5%')
              .id('Search_selectedBackgroundColor_null')
              .selectedBackgroundColor(null)

            // Undefined
            Search({ placeholder: 'selectedBackgroundColor undefined' })
              .width('30%')
              .height('5%')
              .id('Search_selectedBackgroundColor_undefined')
              .selectedBackgroundColor(undefined)
          }
          .width('100%')

          // ========== caretStyle tests ==========
          Text('caretStyle Property Tests')
            .fontSize(16)
            .fontWeight(FontWeight.Bold)
            .margin({ top: 10, bottom: 5 })

          Row() {
            // Default
            Search({ placeholder: 'caretStyle default' })
              .width('30%')
              .height('5%')
              .id('Search_caretStyle_default')

            // Null
            Search({ placeholder: 'caretStyle null' })
              .width('30%')
              .height('5%')
              .id('Search_caretStyle_null')
              .caretStyle(null)

            // Undefined
            Search({ placeholder: 'caretStyle undefined' })
              .width('30%')
              .height('5%')
              .id('Search_caretStyle_undefined')
              .caretStyle(undefined)
          }
          .width('100%')

          // ========== placeholderColor tests ==========
          Text('placeholderColor Property Tests')
            .fontSize(16)
            .fontWeight(FontWeight.Bold)
            .margin({ top: 10, bottom: 5 })

          Row() {
            // Default
            Search({ placeholder: 'placeholderColor default' })
              .width('30%')
              .height('5%')
              .id('Search_placeholderColor_default')

            // Null
            Search({ placeholder: 'placeholderColor null' })
              .width('30%')
              .height('5%')
              .id('Search_placeholderColor_null')
              .placeholderColor(null)

            // Undefined
            Search({ placeholder: 'placeholderColor undefined' })
              .width('30%')
              .height('5%')
              .id('Search_placeholderColor_undefined')
              .placeholderColor(undefined)
          }
          .width('100%')

          // ========== placeholderFont tests ==========
          Text('placeholderFont Property Tests')
            .fontSize(16)
            .fontWeight(FontWeight.Bold)
            .margin({ top: 10, bottom: 5 })

          Row() {
            // Default
            Search({ placeholder: 'placeholderFont default' })
              .width('30%')
              .height('5%')
              .id('Search_placeholderFont_default')

            // Null
            Search({ placeholder: 'placeholderFont null' })
              .width('30%')
              .height('5%')
              .id('Search_placeholderFont_null')
              .placeholderFont(null)

            // Undefined
            Search({ placeholder: 'placeholderFont undefined' })
              .width('30%')
              .height('5%')
              .id('Search_placeholderFont_undefined')
              .placeholderFont(undefined)
          }
          .width('100%')

          // ========== textFont tests ==========
          Text('textFont Property Tests')
            .fontSize(16)
            .fontWeight(FontWeight.Bold)
            .margin({ top: 10, bottom: 5 })

          Row() {
            // Default
            Search({ placeholder: 'textFont default' })
              .width('30%')
              .height('5%')
              .id('Search_textFont_default')

            // Null
            Search({ placeholder: 'textFont null' })
              .width('30%')
              .height('5%')
              .id('Search_textFont_null')
              .textFont(null)

            // Undefined
            Search({ placeholder: 'textFont undefined' })
              .width('30%')
              .height('5%')
              .id('Search_textFont_undefined')
              .textFont(undefined)
          }
          .width('100%')

          // ========== enterKeyType tests ==========
          Text('enterKeyType Property Tests')
            .fontSize(16)
            .fontWeight(FontWeight.Bold)
            .margin({ top: 10, bottom: 5 })

          Row() {
            // Default
            Search({ placeholder: 'enterKeyType default' })
              .width('30%')
              .height('5%')
              .id('Search_enterKeyType_default')

            // Null
            Search({ placeholder: 'enterKeyType null' })
              .width('30%')
              .height('5%')
              .id('Search_enterKeyType_null')
              .enterKeyType(null)

            // Undefined
            Search({ placeholder: 'enterKeyType undefined' })
              .width('30%')
              .height('5%')
              .id('Search_enterKeyType_undefined')
              .enterKeyType(undefined)
          }
          .width('100%')

          // ========== copyOption tests ==========
          Text('copyOption Property Tests')
            .fontSize(16)
            .fontWeight(FontWeight.Bold)
            .margin({ top: 10, bottom: 5 })

          Row() {
            // Default
            Search({ placeholder: 'copyOption default' })
              .width('30%')
              .height('5%')
              .id('Search_copyOption_default')

            // Null
            Search({ placeholder: 'copyOption null' })
              .width('30%')
              .height('5%')
              .id('Search_copyOption_null')
              .copyOption(null)

            // Undefined
            Search({ placeholder: 'copyOption undefined' })
              .width('30%')
              .height('5%')
              .id('Search_copyOption_undefined')
              .copyOption(undefined)
          }
          .width('100%')

          // ========== maxLength tests ==========
          Text('maxLength Property Tests')
            .fontSize(16)
            .fontWeight(FontWeight.Bold)
            .margin({ top: 10, bottom: 5 })

          Row() {
            // Default
            Search({ placeholder: 'maxLength default' })
              .width('30%')
              .height('5%')
              .id('Search_maxLength_default')

            // Null
            Search({ placeholder: 'maxLength null' })
              .width('30%')
              .height('5%')
              .id('Search_maxLength_null')
              .maxLength(null)

            // Undefined
            Search({ placeholder: 'maxLength undefined' })
              .width('30%')
              .height('5%')
              .id('Search_maxLength_undefined')
              .maxLength(undefined)
          }
          .width('100%')

          // ========== textAlign tests ==========
          Text('textAlign Property Tests')
            .fontSize(16)
            .fontWeight(FontWeight.Bold)
            .margin({ top: 10, bottom: 5 })

          Row() {
            // Default
            Search({ placeholder: 'textAlign default' })
              .width('30%')
              .height('5%')
              .id('Search_textAlign_default')

            // Null
            Search({ placeholder: 'textAlign null' })
              .width('30%')
              .height('5%')
              .id('Search_textAlign_null')
              .textAlign(null)

            // Undefined
            Search({ placeholder: 'textAlign undefined' })
              .width('30%')
              .height('5%')
              .id('Search_textAlign_undefined')
              .textAlign(undefined)
          }
          .width('100%')

          // ========== minFontSize tests ==========
          Text('minFontSize Property Tests')
            .fontSize(16)
            .fontWeight(FontWeight.Bold)
            .margin({ top: 10, bottom: 5 })

          Row() {
            // Default
            Search({ placeholder: 'minFontSize default' })
              .width('30%')
              .height('5%')
              .id('Search_minFontSize_default')

            // Null
            Search({ placeholder: 'minFontSize null' })
              .width('30%')
              .height('5%')
              .id('Search_minFontSize_null')
              .minFontSize(null)

            // Undefined
            Search({ placeholder: 'minFontSize undefined' })
              .width('30%')
              .height('5%')
              .id('Search_minFontSize_undefined')
              .minFontSize(undefined)

            // Empty String
            Search({ placeholder: 'minFontSize empty' })
              .width('30%')
              .height('5%')
              .id('Search_minFontSize_empty')
              .minFontSize('')
          }
          .width('100%')

          // ========== maxFontSize tests ==========
          Text('maxFontSize Property Tests')
            .fontSize(16)
            .fontWeight(FontWeight.Bold)
            .margin({ top: 10, bottom: 5 })

          Row() {
            // Default
            Search({ placeholder: 'maxFontSize default' })
              .width('30%')
              .height('5%')
              .id('Search_maxFontSize_default')

            // Null
            Search({ placeholder: 'maxFontSize null' })
              .width('30%')
              .height('5%')
              .id('Search_maxFontSize_null')
              .maxFontSize(null)

            // Undefined
            Search({ placeholder: 'maxFontSize undefined' })
              .width('30%')
              .height('5%')
              .id('Search_maxFontSize_undefined')
              .maxFontSize(undefined)

            // Empty String
            Search({ placeholder: 'maxFontSize empty' })
              .width('30%')
              .height('5%')
              .id('Search_maxFontSize_empty')
              .maxFontSize('')
          }
          .width('100%')
        }
      }

      }
      .width('100%')
      .height('100%')
  }
}
