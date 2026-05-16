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
struct TextInputPropertiesNullUndefined02Test {
  build() {
    Column() {
      Scroll(){
        Column(){
          // ========== fontWeight tests ==========
          Text('fontWeight Property Tests')
            .fontSize(16)
            .fontWeight(FontWeight.Bold)
            .margin({ top: 10, bottom: 5 })

          Row() {
            // Default
            TextInput({ placeholder: 'fontWeight default', text: 'Hello World' })
              .width('20%')
              .height('5%')
              .id('TextInput_fontWeight_default')

            // Null
            TextInput({ placeholder: 'fontWeight null', text: 'Hello World' })
              .width('20%')
              .height('5%')
              .id('TextInput_fontWeight_null')
              .fontWeight(null)

            // Undefined
            TextInput({ placeholder: 'fontWeight undefined', text: 'Hello World' })
              .width('20%')
              .height('5%')
              .id('TextInput_fontWeight_undefined')
              .fontWeight(undefined)

            // Empty
            TextInput({ placeholder: 'fontWeight empty', text: 'Hello World' })
              .width('20%')
              .height('5%')
              .id('TextInput_fontWeight_empty')
              .fontWeight('')

            // number
            TextInput({ placeholder: 'fontWeight number', text: 'Hello World' })
              .width('20%')
              .height('5%')
              .id('TextInput_fontWeight_number')
              .fontWeight(400)
          }
          .width('100%')

          // ========== showError tests ==========
          Text('showError Property Tests')
            .fontSize(16)
            .fontWeight(FontWeight.Bold)
            .margin({ top: 10, bottom: 5 })

          Row() {
            // Default
            TextInput({ placeholder: 'showError default', text: 'Hello World' })
              .width('25%')
              .height('5%')
              .id('TextInput_showError_default')

            // Null
            TextInput({ placeholder: 'showError null', text: 'Hello World' })
              .width('25%')
              .height('5%')
              .id('TextInput_showError_null')
              .showError(null)

            // Undefined
            TextInput({ placeholder: 'showError undefined', text: 'Hello World' })
              .width('25%')
              .height('5%')
              .id('TextInput_showError_undefined')
              .showError(undefined)

            // Empty
            TextInput({ placeholder: 'showError empty', text: 'Hello World' })
              .width('25%')
              .height('5%')
              .id('TextInput_showError_empty')
              .showError('')
          }
          .width('100%')

          // ========== underlineColor tests ==========
          Text('underlineColor Property Tests')
            .fontSize(16)
            .fontWeight(FontWeight.Bold)
            .margin({ top: 10, bottom: 5 })

          Row() {
            // Default
            TextInput({ placeholder: 'underlineColor default', text: 'Hello World' })
              .width('30%')
              .height('5%')
              .showUnderline(true)
              .id('TextInput_underlineColor_default')

            // Null
            TextInput({ placeholder: 'underlineColor null', text: 'Hello World' })
              .width('30%')
              .height('5%')
              .showUnderline(true)
              .id('TextInput_underlineColor_null')
              .underlineColor(null)

            // Undefined
            TextInput({ placeholder: 'underlineColor undefined', text: 'Hello World' })
              .width('30%')
              .height('5%')
              .showUnderline(true)
              .id('TextInput_underlineColor_undefined')
              .underlineColor(undefined)
          }
          .width('100%')

          // ========== minFontSize tests ==========
          Text('minFontSize Property Tests')
            .fontSize(16)
            .fontWeight(FontWeight.Bold)
            .margin({ top: 10, bottom: 5 })

          Row() {
            // Default
            TextInput({ placeholder: 'minFontSize default', text: 'Hello World' })
              .width('25%')
              .height('5%')
              .id('TextInput_minFontSize_default')
              .style(TextInputStyle.Inline)

            // Null
            TextInput({ placeholder: 'minFontSize null', text: 'Hello World' })
              .width('25%')
              .height('5%')
              .id('TextInput_minFontSize_null')
              .style(TextInputStyle.Inline)
              .minFontSize(null)

            // Undefined
            TextInput({ placeholder: 'minFontSize undefined', text: 'Hello World' })
              .width('25%')
              .height('5%')
              .id('TextInput_minFontSize_undefined')
              .style(TextInputStyle.Inline)
              .minFontSize(undefined)

            // Empty
            TextInput({ placeholder: 'minFontSize empty', text: 'Hello World' })
              .width('25%')
              .height('5%')
              .id('TextInput_minFontSize_empty')
              .style(TextInputStyle.Inline)
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
            TextInput({ placeholder: 'maxFontSize default', text: 'Hello World' })
              .width('25%')
              .height('5%')
              .id('TextInput_maxFontSize_default')
              .style(TextInputStyle.Inline)

            // Null
            TextInput({ placeholder: 'maxFontSize null', text: 'Hello World' })
              .width('25%')
              .height('5%')
              .id('TextInput_maxFontSize_null')
              .style(TextInputStyle.Inline)
              .maxFontSize(null)

            // Undefined
            TextInput({ placeholder: 'maxFontSize undefined', text: 'Hello World' })
              .width('25%')
              .height('5%')
              .id('TextInput_maxFontSize_undefined')
              .style(TextInputStyle.Inline)
              .maxFontSize(undefined)

            // Empty
            TextInput({ placeholder: 'maxFontSize empty', text: 'Hello World' })
              .width('25%')
              .height('5%')
              .id('TextInput_maxFontSize_empty')
              .style(TextInputStyle.Inline)
              .maxFontSize('')
          }
          .width('100%')

          // ========== letterSpacing tests ==========
          Text('letterSpacing Property Tests')
            .fontSize(16)
            .fontWeight(FontWeight.Bold)
            .margin({ top: 10, bottom: 5 })

          Row() {
            // Default
            TextInput({ placeholder: 'letterSpacing default', text: 'Hello World' })
              .width('25%')
              .height('5%')
              .id('TextInput_letterSpacing_default')

            // Null
            TextInput({ placeholder: 'letterSpacing null', text: 'Hello World' })
              .width('25%')
              .height('5%')
              .id('TextInput_letterSpacing_null')
              .letterSpacing(null)

            // Undefined
            TextInput({ placeholder: 'letterSpacing undefined', text: 'Hello World' })
              .width('25%')
              .height('5%')
              .id('TextInput_letterSpacing_undefined')
              .letterSpacing(undefined)

            // Empty
            TextInput({ placeholder: 'letterSpacing empty', text: 'Hello World' })
              .width('25%')
              .height('5%')
              .id('TextInput_letterSpacing_empty')
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
            TextInput({ placeholder: 'lineHeight default', text: 'Hello World' })
              .width('25%')
              .height('5%')
              .id('TextInput_lineHeight_default')

            // Null
            TextInput({ placeholder: 'lineHeight null', text: 'Hello World' })
              .width('25%')
              .height('5%')
              .id('TextInput_lineHeight_null')
              .lineHeight(null)

            // Undefined
            TextInput({ placeholder: 'lineHeight undefined', text: 'Hello World' })
              .width('25%')
              .height('5%')
              .id('TextInput_lineHeight_undefined')
              .lineHeight(undefined)

            // Empty
            TextInput({ placeholder: 'lineHeight empty', text: 'Hello World' })
              .width('25%')
              .height('5%')
              .id('TextInput_lineHeight_empty')
              .lineHeight('')
          }
          .width('100%')

          // ========== passwordRules tests ==========
          Text('passwordRules Property Tests')
            .fontSize(16)
            .fontWeight(FontWeight.Bold)
            .margin({ top: 10, bottom: 5 })

          Row() {
            // Default
            TextInput({ placeholder: 'passwordRules default', text: 'Hello World' })
              .width('25%')
              .height('5%')
              .type(InputType.Password)
              .id('TextInput_passwordRules_default')

            // Null
            TextInput({ placeholder: 'passwordRules null', text: 'Hello World' })
              .width('25%')
              .height('5%')
              .type(InputType.Password)
              .id('TextInput_passwordRules_null')
              .passwordRules(null)

            // Undefined
            TextInput({ placeholder: 'passwordRules undefined', text: 'Hello World' })
              .width('25%')
              .height('5%')
              .type(InputType.Password)
              .id('TextInput_passwordRules_undefined')
              .passwordRules(undefined)

            // Empty
            TextInput({ placeholder: 'passwordRules empty', text: 'Hello World' })
              .width('25%')
              .height('5%')
              .type(InputType.Password)
              .id('TextInput_passwordRules_empty')
              .passwordRules('')
          }
          .width('100%')

          // ========== fontFeature tests ==========
          Text('fontFeature Property Tests')
            .fontSize(16)
            .fontWeight(FontWeight.Bold)
            .margin({ top: 10, bottom: 5 })

          Row() {
            // Default
            TextInput({ placeholder: 'fontFeature default', text: 'Hello World' })
              .width('25%')
              .height('5%')
              .id('TextInput_fontFeature_default')

            // Null
            TextInput({ placeholder: 'fontFeature null', text: 'Hello World' })
              .width('25%')
              .height('5%')
              .id('TextInput_fontFeature_null')
              .fontFeature(null)

            // Undefined
            TextInput({ placeholder: 'fontFeature undefined', text: 'Hello World' })
              .width('25%')
              .height('5%')
              .id('TextInput_fontFeature_undefined')
              .fontFeature(undefined)

            // Empty
            TextInput({ placeholder: 'fontFeature empty', text: 'Hello World' })
              .width('25%')
              .height('5%')
              .id('TextInput_fontFeature_empty')
              .fontFeature('')
          }
          .width('100%')
        }
      }
    }
    .width('100%')
    .height('100%')
  }
}
