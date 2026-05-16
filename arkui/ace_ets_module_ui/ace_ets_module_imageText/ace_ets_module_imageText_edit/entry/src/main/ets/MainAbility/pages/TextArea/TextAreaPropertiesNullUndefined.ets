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
struct TextAreaPropertiesNullUndefinedTest {
  build() {

    Column() {
      Scroll(){
        Column(){
          // ========== placeholderColor tests ==========
          Text('placeholderColor Property Tests')
            .fontSize(16)
            .fontWeight(FontWeight.Bold)
            .margin({ top: 10, bottom: 5 })

          Row() {
            // Default
            TextArea({ placeholder: 'placeholderColor default' })
              .width('30%')
              .height('5%')
              .id('TextArea_placeholderColor_default')

            // Null
            TextArea({ placeholder: 'placeholderColor null' })
              .width('30%')
              .height('5%')
              .id('TextArea_placeholderColor_null')
              .placeholderColor(null)

            // Undefined
            TextArea({ placeholder: 'placeholderColor undefined' })
              .width('30%')
              .height('5%')
              .id('TextArea_placeholderColor_undefined')
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
            TextArea({ placeholder: 'placeholderFont default' })
              .width('30%')
              .height('5%')
              .id('TextArea_placeholderFont_default')

            // Null
            TextArea({ placeholder: 'placeholderFont null' })
              .width('30%')
              .height('5%')
              .id('TextArea_placeholderFont_null')
              .placeholderFont(null)

            // Undefined
            TextArea({ placeholder: 'placeholderFont undefined' })
              .width('30%')
              .height('5%')
              .id('TextArea_placeholderFont_undefined')
              .placeholderFont(undefined)
          }
          .width('100%')

          // ========== enterKeyType tests ==========
          Text('enterKeyType Property Tests')
            .fontSize(16)
            .fontWeight(FontWeight.Bold)
            .margin({ top: 10, bottom: 5 })

          Row() {
            // Default
            TextArea({ placeholder: 'enterKeyType default', text: 'Hello World' })
              .width('30%')
              .height('5%')
              .id('TextArea_enterKeyType_default')

            // Null
            TextArea({ placeholder: 'enterKeyType null', text: 'Hello World' })
              .width('30%')
              .height('5%')
              .id('TextArea_enterKeyType_null')
              .enterKeyType(null)

            // Undefined
            TextArea({ placeholder: 'enterKeyType undefined', text: 'Hello World' })
              .width('30%')
              .height('5%')
              .id('TextArea_enterKeyType_undefined')
              .enterKeyType(undefined)
          }
          .width('100%')

          // ========== textAlign tests ==========
          Text('textAlign Property Tests')
            .fontSize(16)
            .fontWeight(FontWeight.Bold)
            .margin({ top: 10, bottom: 5 })

          Row() {
            // Default
            TextArea({ placeholder: 'textAlign default', text: 'Hello World' })
              .width('30%')
              .height('5%')
              .id('TextArea_textAlign_default')

            // Null
            TextArea({ placeholder: 'textAlign null', text: 'Hello World' })
              .width('30%')
              .height('5%')
              .id('TextArea_textAlign_null')
              .textAlign(null)

            // Undefined
            TextArea({ placeholder: 'textAlign undefined', text: 'Hello World' })
              .width('30%')
              .height('5%')
              .id('TextArea_textAlign_undefined')
              .textAlign(undefined)
          }
          .width('100%')

          // ========== caretColor tests ==========
          Text('caretColor Property Tests')
            .fontSize(16)
            .fontWeight(FontWeight.Bold)
            .margin({ top: 10, bottom: 5 })

          Row() {
            // Default
            TextArea({ placeholder: 'caretColor default' })
              .width('30%')
              .height('5%')
              .id('TextArea_caretColor_default')

            // Null
            TextArea({ placeholder: 'caretColor null' })
              .width('30%')
              .height('5%')
              .id('TextArea_caretColor_null')
              .caretColor(null)

            // Undefined
            TextArea({ placeholder: 'caretColor undefined' })
              .width('30%')
              .height('5%')
              .id('TextArea_caretColor_undefined')
              .caretColor(undefined)
          }
          .width('100%')

          // ========== fontStyle tests ==========
          Text('fontStyle Property Tests')
            .fontSize(16)
            .fontWeight(FontWeight.Bold)
            .margin({ top: 10, bottom: 5 })

          Row() {
            // Default
            TextArea({ placeholder: 'fontStyle default', text: 'Hello World' })
              .width('30%')
              .height('5%')
              .id('TextArea_fontStyle_default')

            // Null
            TextArea({ placeholder: 'fontStyle null', text: 'Hello World' })
              .width('30%')
              .height('5%')
              .id('TextArea_fontStyle_null')
              .fontStyle(null)

            // Undefined
            TextArea({ placeholder: 'fontStyle undefined', text: 'Hello World' })
              .width('30%')
              .height('5%')
              .id('TextArea_fontStyle_undefined')
              .fontStyle(undefined)
          }
          .width('100%')

          // ========== fontFamily tests ==========
          Text('fontFamily Property Tests')
            .fontSize(16)
            .fontWeight(FontWeight.Bold)
            .margin({ top: 10, bottom: 5 })

          Row() {
            // Default
            TextArea({ placeholder: 'fontFamily default', text: 'Hello World' })
              .width('30%')
              .height('5%')
              .id('TextArea_fontFamily_default')

            // Null
            TextArea({ placeholder: 'fontFamily null', text: 'Hello World' })
              .width('30%')
              .height('5%')
              .id('TextArea_fontFamily_null')
              .fontFamily(null)

            // Undefined
            TextArea({ placeholder: 'fontFamily undefined', text: 'Hello World' })
              .width('30%')
              .height('5%')
              .id('TextArea_fontFamily_undefined')
              .fontFamily(undefined)
          }
          .width('100%')

          // ========== textOverflow tests ==========
          Text('textOverflow Property Tests')
            .fontSize(16)
            .fontWeight(FontWeight.Bold)
            .margin({ top: 10, bottom: 5 })

          Row() {
            // Default
            TextArea({ placeholder: 'textOverflow default', text: 'Hello World' })
              .width('30%')
              .height('5%')
              .id('TextArea_textOverflow_default')

            // Null
            TextArea({ placeholder: 'textOverflow null', text: 'Hello World' })
              .width('30%')
              .height('5%')
              .id('TextArea_textOverflow_null')
              .textOverflow(null)

            // Undefined
            TextArea({ placeholder: 'textOverflow undefined', text: 'Hello World' })
              .width('30%')
              .height('5%')
              .id('TextArea_textOverflow_undefined')
              .textOverflow(undefined)
          }
          .width('100%')

          // ========== textIndent tests ==========
          Text('textIndent Property Tests')
            .fontSize(16)
            .fontWeight(FontWeight.Bold)
            .margin({ top: 10, bottom: 5 })

          Row() {
            // Default
            TextArea({ placeholder: 'textIndent default', text: 'Hello World' })
              .width('30%')
              .height('5%')
              .id('TextArea_textIndent_default')

            // Null
            TextArea({ placeholder: 'textIndent null', text: 'Hello World' })
              .width('30%')
              .height('5%')
              .id('TextArea_textIndent_null')
              .textIndent(null)

            // Undefined
            TextArea({ placeholder: 'textIndent undefined', text: 'Hello World' })
              .width('30%')
              .height('5%')
              .id('TextArea_textIndent_undefined')
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
            TextArea({ placeholder: 'inputFilter default', text: 'Hello World' })
              .width('30%')
              .height('5%')
              .id('TextArea_inputFilter_default')

            // Null
            TextArea({ placeholder: 'inputFilter null', text: 'Hello World' })
              .width('30%')
              .height('5%')
              .id('TextArea_inputFilter_null')
              .inputFilter(null)

            // Undefined
            TextArea({ placeholder: 'inputFilter undefined', text: 'Hello World' })
              .width('30%')
              .height('5%')
              .id('TextArea_inputFilter_undefined')
              .inputFilter(undefined)
          }
          .width('100%')

          // ========== caretStyle tests ==========
          Text('caretStyle Property Tests')
            .fontSize(16)
            .fontWeight(FontWeight.Bold)
            .margin({ top: 10, bottom: 5 })

          Row() {
            // Default
            TextArea({ placeholder: 'caretStyle default', text: 'Hello World' })
              .width('30%')
              .height('5%')
              .id('TextArea_caretStyle_default')

            // Null
            TextArea({ placeholder: 'caretStyle null', text: 'Hello World' })
              .width('30%')
              .height('5%')
              .id('TextArea_caretStyle_null')
              .caretStyle(null)

            // Undefined
            TextArea({ placeholder: 'caretStyle undefined', text: 'Hello World' })
              .width('30%')
              .height('5%')
              .id('TextArea_caretStyle_undefined')
              .caretStyle(undefined)
          }
          .width('100%')

          // ========== selectedBackgroundColor tests ==========
          Text('selectedBackgroundColor Property Tests')
            .fontSize(16)
            .fontWeight(FontWeight.Bold)
            .margin({ top: 10, bottom: 5 })

          Row() {
            // Default
            TextArea({ placeholder: 'selectedBackgroundColor default', text: 'Hello World' })
              .width('30%')
              .height('5%')
              .id('TextArea_selectedBackgroundColor_default')

            // Null
            TextArea({ placeholder: 'selectedBackgroundColor null', text: 'Hello World' })
              .width('30%')
              .height('5%')
              .id('TextArea_selectedBackgroundColor_null')
              .selectedBackgroundColor(null)

            // Undefined
            TextArea({ placeholder: 'selectedBackgroundColor undefined', text: 'Hello World' })
              .width('30%')
              .height('5%')
              .id('TextArea_selectedBackgroundColor_undefined')
              .selectedBackgroundColor(undefined)
          }
          .width('100%')

          // ========== copyOption tests ==========
          Text('copyOption Property Tests')
            .fontSize(16)
            .fontWeight(FontWeight.Bold)
            .margin({ top: 10, bottom: 5 })

          Row() {
            // Default
            TextArea({ placeholder: 'copyOption default', text: 'Hello World' })
              .width('30%')
              .height('5%')
              .id('TextArea_copyOption_default')

            // Null
            TextArea({ placeholder: 'copyOption null', text: 'Hello World' })
              .width('30%')
              .height('5%')
              .id('TextArea_copyOption_null')
              .copyOption(null)

            // Undefined
            TextArea({ placeholder: 'copyOption undefined', text: 'Hello World' })
              .width('30%')
              .height('5%')
              .id('TextArea_copyOption_undefined')
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
            TextArea({ placeholder: 'maxLength default', text: 'Hello World' })
              .width('30%')
              .height('5%')
              .id('TextArea_maxLength_default')

            // Null
            TextArea({ placeholder: 'maxLength null', text: 'Hello World' })
              .width('30%')
              .height('5%')
              .id('TextArea_maxLength_null')
              .maxLength(null)

            // Undefined
            TextArea({ placeholder: 'maxLength undefined', text: 'Hello World' })
              .width('30%')
              .height('5%')
              .id('TextArea_maxLength_undefined')
              .maxLength(undefined)
          }
          .width('100%')

          // ========== minFontScale tests ==========
          Text('minFontScale Property Tests')
            .fontSize(16)
            .fontWeight(FontWeight.Bold)
            .margin({ top: 10, bottom: 5 })

          Row() {
            // Default
            TextArea({ placeholder: 'minFontScale default', text: 'Hello World' })
              .width('30%')
              .height('5%')
              .id('TextArea_minFontScale_default')

            // Null
            TextArea({ placeholder: 'minFontScale null', text: 'Hello World' })
              .width('30%')
              .height('5%')
              .id('TextArea_minFontScale_null')
              .minFontScale(null)

            // Undefined
            TextArea({ placeholder: 'minFontScale undefined', text: 'Hello World' })
              .width('30%')
              .height('5%')
              .id('TextArea_minFontScale_undefined')
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
            TextArea({ placeholder: 'maxFontScale default', text: 'Hello World' })
              .width('30%')
              .height('5%')
              .id('TextArea_maxFontScale_default')

            // Null
            TextArea({ placeholder: 'maxFontScale null', text: 'Hello World' })
              .width('30%')
              .height('5%')
              .id('TextArea_maxFontScale_null')
              .maxFontScale(null)

            // Undefined
            TextArea({ placeholder: 'maxFontScale undefined', text: 'Hello World' })
              .width('30%')
              .height('5%')
              .id('TextArea_maxFontScale_undefined')
              .maxFontScale(undefined)
          }
          .width('100%')

          // ========== heightAdaptivePolicy tests ==========
          Text('heightAdaptivePolicy Property Tests')
            .fontSize(16)
            .fontWeight(FontWeight.Bold)
            .margin({ top: 10, bottom: 5 })

          Row() {
            // Default
            TextArea({ placeholder: 'heightAdaptivePolicy default', text: 'Hello World' })
              .width('30%')
              .height('5%')
              .id('TextArea_heightAdaptivePolicy_default')

            // Null
            TextArea({ placeholder: 'heightAdaptivePolicy null', text: 'Hello World' })
              .width('30%')
              .height('5%')
              .id('TextArea_heightAdaptivePolicy_null')
              .heightAdaptivePolicy(null)

            // Undefined
            TextArea({ placeholder: 'heightAdaptivePolicy undefined', text: 'Hello World' })
              .width('30%')
              .height('5%')
              .id('TextArea_heightAdaptivePolicy_undefined')
              .heightAdaptivePolicy(undefined)
          }
          .width('100%')
        }
      }

      }
      .width('100%')
      .height('100%')
  }
}