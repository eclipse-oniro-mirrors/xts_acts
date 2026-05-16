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
struct TextInputPropertiesNullUndefinedTest {
  build() {

    Column() {
      Scroll(){
        Column(){
          // ========== enableSelectedDataDetector tests ==========
          Text('enableSelectedDataDetector Property Tests')
            .fontSize(16)
            .fontWeight(FontWeight.Bold)
            .margin({ top: 10, bottom: 5 })

          Row() {
            // Default
            TextInput({ placeholder: 'enableSelectedDataDetector default', text: 'Hello World' })
              .width('30%')
              .height('5%')
              .id('TextInput_enableSelectedDataDetector_default')

            // Null
            TextInput({ placeholder: 'enableSelectedDataDetector null', text: 'Hello World' })
              .width('30%')
              .height('5%')
              .id('TextInput_enableSelectedDataDetector_null')
              .enableSelectedDataDetector(null)

            // Undefined
            TextInput({ placeholder: 'enableSelectedDataDetector undefined', text: 'Hello World' })
              .width('30%')
              .height('5%')
              .id('TextInput_enableSelectedDataDetector_undefined')
              .enableSelectedDataDetector(undefined)
          }
          .width('100%')

          // ========== placeholderColor tests ==========
          Text('placeholderColor Property Tests')
            .fontSize(16)
            .fontWeight(FontWeight.Bold)
            .margin({ top: 10, bottom: 5 })

          Row() {
            // Default
            TextInput({ placeholder: 'placeholderColor default' })
              .width('30%')
              .height('5%')
              .id('TextInput_placeholderColor_default')

            // Null
            TextInput({ placeholder: 'placeholderColor null' })
              .width('30%')
              .height('5%')
              .id('TextInput_placeholderColor_null')
              .placeholderColor(null)

            // Undefined
            TextInput({ placeholder: 'placeholderColor undefined' })
              .width('30%')
              .height('5%')
              .id('TextInput_placeholderColor_undefined')
              .placeholderColor(undefined)
          }
          .width('100%')

          // ========== textOverflow tests ==========
          Text('textOverflow Property Tests')
            .fontSize(16)
            .fontWeight(FontWeight.Bold)
            .margin({ top: 10, bottom: 5 })

          Row() {
            // Default (inline style)
            TextInput({ placeholder: 'textOverflow default' })
              .width('30%')
              .height('5%')
              .id('TextInput_textOverflow_default')
              .style(TextInputStyle.Inline)

            // Null
            TextInput({ placeholder: 'textOverflow null' })
              .width('30%')
              .height('5%')
              .id('TextInput_textOverflow_null')
              .style(TextInputStyle.Inline)
              .textOverflow(null)

            // Undefined
            TextInput({ placeholder: 'textOverflow undefined' })
              .width('30%')
              .height('5%')
              .id('TextInput_textOverflow_undefined')
              .style(TextInputStyle.Inline)
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
            TextInput({ placeholder: 'textIndent default', text: 'Hello World' })
              .width('30%')
              .height('5%')
              .id('TextInput_textIndent_default')

            // Null
            TextInput({ placeholder: 'textIndent null', text: 'Hello World' })
              .width('30%')
              .height('5%')
              .id('TextInput_textIndent_null')
              .textIndent(null)

            // Undefined
            TextInput({ placeholder: 'textIndent undefined', text: 'Hello World' })
              .width('30%')
              .height('5%')
              .id('TextInput_textIndent_undefined')
              .textIndent(undefined)
          }
          .width('100%')

          // ========== placeholderFont tests ==========
          Text('placeholderFont Property Tests')
            .fontSize(16)
            .fontWeight(FontWeight.Bold)
            .margin({ top: 10, bottom: 5 })

          Row() {
            // Default
            TextInput({ placeholder: 'placeholderFont default' })
              .width('30%')
              .height('5%')
              .id('TextInput_placeholderFont_default')

            // Null
            TextInput({ placeholder: 'placeholderFont null' })
              .width('30%')
              .height('5%')
              .id('TextInput_placeholderFont_null')
              .placeholderFont(null)

            // Undefined
            TextInput({ placeholder: 'placeholderFont undefined' })
              .width('30%')
              .height('5%')
              .id('TextInput_placeholderFont_undefined')
              .placeholderFont(undefined)
          }
          .width('100%')

          // ========== caretColor tests ==========
          Text('caretColor Property Tests')
            .fontSize(16)
            .fontWeight(FontWeight.Bold)
            .margin({ top: 10, bottom: 5 })

          Row() {
            // Default
            TextInput({ placeholder: 'caretColor default' })
              .width('30%')
              .height('5%')
              .id('TextInput_caretColor_default')

            // Null
            TextInput({ placeholder: 'caretColor null' })
              .width('30%')
              .height('5%')
              .id('TextInput_caretColor_null')
              .caretColor(null)

            // Undefined
            TextInput({ placeholder: 'caretColor undefined' })
              .width('30%')
              .height('5%')
              .id('TextInput_caretColor_undefined')
              .caretColor(undefined)
          }
          .width('100%')

          // ========== maxLength tests ==========
          Text('maxLength Property Tests')
            .fontSize(16)
            .fontWeight(FontWeight.Bold)
            .margin({ top: 10, bottom: 5 })

          Row() {
            // Default
            TextInput({ placeholder: 'maxLength default', text: 'Hello World' })
              .width('30%')
              .height('5%')
              .id('TextInput_maxLength_default')

            // Null
            TextInput({ placeholder: 'maxLength null', text: 'Hello World' })
              .width('30%')
              .height('5%')
              .id('TextInput_maxLength_null')
              .maxLength(null)

            // Undefined
            TextInput({ placeholder: 'maxLength undefined', text: 'Hello World' })
              .width('30%')
              .height('5%')
              .id('TextInput_maxLength_undefined')
              .maxLength(undefined)
          }
          .width('100%')

          // ========== fontColor tests ==========
          Text('fontColor Property Tests')
            .fontSize(16)
            .fontWeight(FontWeight.Bold)
            .margin({ top: 10, bottom: 5 })

          Row() {
            // Default
            TextInput({ placeholder: 'fontColor default', text: 'Hello World' })
              .width('30%')
              .height('5%')
              .id('TextInput_fontColor_default')

            // Null
            TextInput({ placeholder: 'fontColor null', text: 'Hello World' })
              .width('30%')
              .height('5%')
              .id('TextInput_fontColor_null')
              .fontColor(null)

            // Undefined
            TextInput({ placeholder: 'fontColor undefined', text: 'Hello World' })
              .width('30%')
              .height('5%')
              .id('TextInput_fontColor_undefined')
              .fontColor(undefined)
          }
          .width('100%')

          // ========== fontSize tests ==========
          Text('fontSize Property Tests')
            .fontSize(16)
            .fontWeight(FontWeight.Bold)
            .margin({ top: 10, bottom: 5 })

          Row() {
            // Default
            TextInput({ placeholder: 'fontSize default', text: 'Hello World' })
              .width('30%')
              .height('5%')
              .id('TextInput_fontSize_default')

            // Null
            TextInput({ placeholder: 'fontSize null', text: 'Hello World' })
              .width('30%')
              .height('5%')
              .id('TextInput_fontSize_null')
              .fontSize(null)

            // Undefined
            TextInput({ placeholder: 'fontSize undefined', text: 'Hello World' })
              .width('30%')
              .height('5%')
              .id('TextInput_fontSize_undefined')
              .fontSize(undefined)
          }
          .width('100%')

          // ========== fontStyle tests ==========
          Text('fontStyle Property Tests')
            .fontSize(16)
            .fontWeight(FontWeight.Bold)
            .margin({ top: 10, bottom: 5 })

          Row() {
            // Default
            TextInput({ placeholder: 'fontStyle default', text: 'Hello World' })
              .width('30%')
              .height('5%')
              .id('TextInput_fontStyle_default')

            // Null
            TextInput({ placeholder: 'fontStyle null', text: 'Hello World' })
              .width('30%')
              .height('5%')
              .id('TextInput_fontStyle_null')
              .fontStyle(null)

            // Undefined
            TextInput({ placeholder: 'fontStyle undefined', text: 'Hello World' })
              .width('30%')
              .height('5%')
              .id('TextInput_fontStyle_undefined')
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
            TextInput({ placeholder: 'fontFamily default', text: 'Hello World' })
              .width('30%')
              .height('5%')
              .id('TextInput_fontFamily_default')

            // Null
            TextInput({ placeholder: 'fontFamily null', text: 'Hello World' })
              .width('30%')
              .height('5%')
              .id('TextInput_fontFamily_null')
              .fontFamily(null)

            // Undefined
            TextInput({ placeholder: 'fontFamily undefined', text: 'Hello World' })
              .width('30%')
              .height('5%')
              .id('TextInput_fontFamily_undefined')
              .fontFamily(undefined)
          }
          .width('100%')

          // ========== inputFilter tests ==========
          Text('inputFilter Property Tests')
            .fontSize(16)
            .fontWeight(FontWeight.Bold)
            .margin({ top: 10, bottom: 5 })

          Row() {
            // Default
            TextInput({ placeholder: 'inputFilter default', text: 'Hello World' })
              .width('30%')
              .height('5%')
              .id('TextInput_inputFilter_default')

            // Null
            TextInput({ placeholder: 'inputFilter null', text: 'Hello World' })
              .width('30%')
              .height('5%')
              .id('TextInput_inputFilter_null')
              .inputFilter(null)

            // Undefined
            TextInput({ placeholder: 'inputFilter undefined', text: 'Hello World' })
              .width('30%')
              .height('5%')
              .id('TextInput_inputFilter_undefined')
              .inputFilter(undefined)
          }
          .width('100%')

          // ========== copyOption tests ==========
          Text('copyOption Property Tests')
            .fontSize(16)
            .fontWeight(FontWeight.Bold)
            .margin({ top: 10, bottom: 5 })

          Row() {
            // Default
            TextInput({ placeholder: 'copyOption default', text: 'Hello World' })
              .width('30%')
              .height('5%')
              .id('TextInput_copyOption_default')

            // Null
            TextInput({ placeholder: 'copyOption null', text: 'Hello World' })
              .width('30%')
              .height('5%')
              .id('TextInput_copyOption_null')
              .copyOption(null)

            // Undefined
            TextInput({ placeholder: 'copyOption undefined', text: 'Hello World' })
              .width('30%')
              .height('5%')
              .id('TextInput_copyOption_undefined')
              .copyOption(undefined)
          }
          .width('100%')

          // ========== textAlign tests ==========
          Text('textAlign Property Tests')
            .fontSize(16)
            .fontWeight(FontWeight.Bold)
            .margin({ top: 10, bottom: 5 })

          Row() {
            // Default
            TextInput({ placeholder: 'textAlign default', text: 'Hello World' })
              .width('30%')
              .height('5%')
              .id('TextInput_textAlign_default')

            // Null
            TextInput({ placeholder: 'textAlign null', text: 'Hello World' })
              .width('30%')
              .height('5%')
              .id('TextInput_textAlign_null')
              .textAlign(null)

            // Undefined
            TextInput({ placeholder: 'textAlign undefined', text: 'Hello World' })
              .width('30%')
              .height('5%')
              .id('TextInput_textAlign_undefined')
              .textAlign(undefined)
          }
          .width('100%')

          // ========== style tests ==========
          Text('style Property Tests')
            .fontSize(16)
            .fontWeight(FontWeight.Bold)
            .margin({ top: 10, bottom: 5 })

          Row() {
            // Default
            TextInput({ placeholder: 'style default', text: 'Hello World' })
              .width('30%')
              .height('5%')
              .id('TextInput_style_default')

            // Null
            TextInput({ placeholder: 'style null', text: 'Hello World' })
              .width('30%')
              .height('5%')
              .id('TextInput_style_null')
              .style(null)

            // Undefined
            TextInput({ placeholder: 'style undefined', text: 'Hello World' })
              .width('30%')
              .height('5%')
              .id('TextInput_style_undefined')
              .style(undefined)
          }
          .width('100%')

          // ========== caretStyle tests ==========
          Text('caretStyle Property Tests')
            .fontSize(16)
            .fontWeight(FontWeight.Bold)
            .margin({ top: 10, bottom: 5 })

          Row() {
            // Default
            TextInput({ placeholder: 'caretStyle default', text: 'Hello World' })
              .width('30%')
              .height('5%')
              .id('TextInput_caretStyle_default')

            // Null
            TextInput({ placeholder: 'caretStyle null', text: 'Hello World' })
              .width('30%')
              .height('5%')
              .id('TextInput_caretStyle_null')
              .caretStyle(null)

            // Undefined
            TextInput({ placeholder: 'caretStyle undefined', text: 'Hello World' })
              .width('30%')
              .height('5%')
              .id('TextInput_caretStyle_undefined')
              .caretStyle(undefined)
          }
          .width('100%')

          // ========== passwordIcon tests ==========
          Text('passwordIcon Property Tests')
            .fontSize(16)
            .fontWeight(FontWeight.Bold)
            .margin({ top: 10, bottom: 5 })

          Row() {
            // Default
            TextInput({ placeholder: 'passwordIcon default', text: 'Hello World' })
              .width('30%')
              .height('5%')
              .type(InputType.Password)
              .id('TextInput_passwordIcon_default')

            // Null
            TextInput({ placeholder: 'passwordIcon null', text: 'Hello World' })
              .width('30%')
              .height('5%')
              .type(InputType.Password)
              .id('TextInput_passwordIcon_null')
              .passwordIcon(null)

            // Undefined
            TextInput({ placeholder: 'passwordIcon undefined', text: 'Hello World' })
              .width('30%')
              .height('5%')
              .type(InputType.Password)
              .id('TextInput_passwordIcon_undefined')
              .passwordIcon(undefined)
          }
          .width('100%')

          // ========== showUnit tests ==========
          Text('showUnit Property Tests')
            .fontSize(16)
            .fontWeight(FontWeight.Bold)
            .margin({ top: 10, bottom: 5 })

          Row() {
            // Default
            TextInput({ placeholder: 'showUnit default', text: 'Hello World' })
              .width('30%')
              .height('5%')
              .id('TextInput_showUnit_default')

            // Null
            TextInput({ placeholder: 'showUnit null', text: 'Hello World' })
              .width('30%')
              .height('5%')
              .id('TextInput_showUnit_null')
              .showUnit(null)

            // Undefined
            TextInput({ placeholder: 'showUnit undefined', text: 'Hello World' })
              .width('30%')
              .height('5%')
              .id('TextInput_showUnit_undefined')
              .showUnit(undefined)
          }
          .width('100%')

          // ========== lineBreakStrategy tests ==========
          Text('lineBreakStrategy Property Tests')
            .fontSize(16)
            .fontWeight(FontWeight.Bold)
            .margin({ top: 10, bottom: 5 })

          Row() {
            // Default (inline style)
            TextInput({ placeholder: 'lineBreakStrategy default', text: 'Hello World' })
              .width('30%')
              .height('5%')
              .id('TextInput_lineBreakStrategy_default')
              .style(TextInputStyle.Inline)

            // Null
            TextInput({ placeholder: 'lineBreakStrategy null', text: 'Hello World' })
              .width('30%')
              .height('5%')
              .id('TextInput_lineBreakStrategy_null')
              .style(TextInputStyle.Inline)
              .lineBreakStrategy(null)

            // Undefined
            TextInput({ placeholder: 'lineBreakStrategy undefined', text: 'Hello World' })
              .width('30%')
              .height('5%')
              .id('TextInput_lineBreakStrategy_undefined')
              .style(TextInputStyle.Inline)
              .lineBreakStrategy(undefined)
          }
          .width('100%')

          // ========== cancelButton tests ==========
          Text('cancelButton Property Tests')
            .fontSize(16)
            .fontWeight(FontWeight.Bold)
            .margin({ top: 10, bottom: 5 })

          Row() {
            // Default
            TextInput({ placeholder: 'cancelButton default', text: 'Hello World' })
              .width('30%')
              .height('5%')
              .id('TextInput_cancelButton_default')

            // Null
            TextInput({ placeholder: 'cancelButton null', text: 'Hello World' })
              .width('30%')
              .height('5%')
              .id('TextInput_cancelButton_null')
              .cancelButton(null )

            // Undefined
            TextInput({ placeholder: 'cancelButton undefined', text: 'Hello World' })
              .width('30%')
              .height('5%')
              .id('TextInput_cancelButton_undefined')
              .cancelButton(undefined)
          }
          .width('100%')

          // ========== minFontScale tests ==========
          Text('minFontScale Property Tests')
            .fontSize(16)
            .fontWeight(FontWeight.Bold)
            .margin({ top: 10, bottom: 5 })

          Row() {
            // Default (inline style)
            TextInput({ placeholder: 'minFontScale default', text: 'Hello World' })
              .width('30%')
              .height('5%')
              .id('TextInput_minFontScale_default')
              .style(TextInputStyle.Inline)

            // Null
            TextInput({ placeholder: 'minFontScale null', text: 'Hello World' })
              .width('30%')
              .height('5%')
              .id('TextInput_minFontScale_null')
              .style(TextInputStyle.Inline)
              .minFontScale(null)

            // Undefined
            TextInput({ placeholder: 'minFontScale undefined', text: 'Hello World' })
              .width('30%')
              .height('5%')
              .id('TextInput_minFontScale_undefined')
              .style(TextInputStyle.Inline)
              .minFontScale(undefined)
          }
          .width('100%')

          // ========== maxFontScale tests ==========
          Text('maxFontScale Property Tests')
            .fontSize(16)
            .fontWeight(FontWeight.Bold)
            .margin({ top: 10, bottom: 5 })

          Row() {
            // Default (inline style)
            TextInput({ placeholder: 'maxFontScale default', text: 'Hello World' })
              .width('30%')
              .height('5%')
              .id('TextInput_maxFontScale_default')
              .style(TextInputStyle.Inline)

            // Null
            TextInput({ placeholder: 'maxFontScale null', text: 'Hello World' })
              .width('30%')
              .height('5%')
              .id('TextInput_maxFontScale_null')
              .style(TextInputStyle.Inline)
              .maxFontScale(null)

            // Undefined
            TextInput({ placeholder: 'maxFontScale undefined', text: 'Hello World' })
              .width('30%')
              .height('5%')
              .id('TextInput_maxFontScale_undefined')
              .style(TextInputStyle.Inline)
              .maxFontScale(undefined)
          }
          .width('100%')

          // ========== heightAdaptivePolicy tests ==========
          Text('heightAdaptivePolicy Property Tests')
            .fontSize(16)
            .fontWeight(FontWeight.Bold)
            .margin({ top: 10, bottom: 5 })

          Row() {
            // Default (inline style)
            TextInput({ placeholder: 'heightAdaptivePolicy default', text: 'Hello World' })
              .width('30%')
              .height('5%')
              .id('TextInput_heightAdaptivePolicy_default')
              .style(TextInputStyle.Inline)

            // Null
            TextInput({ placeholder: 'heightAdaptivePolicy null', text: 'Hello World' })
              .width('30%')
              .height('5%')
              .id('TextInput_heightAdaptivePolicy_null')
              .style(TextInputStyle.Inline)
              .heightAdaptivePolicy(null)

            // Undefined
            TextInput({ placeholder: 'heightAdaptivePolicy undefined', text: 'Hello World' })
              .width('30%')
              .height('5%')
              .id('TextInput_heightAdaptivePolicy_undefined')
              .style(TextInputStyle.Inline)
              .heightAdaptivePolicy(undefined)
          }
          .width('100%')

          // ========== decoration tests ==========
          Text('decoration Property Tests')
            .fontSize(16)
            .fontWeight(FontWeight.Bold)
            .margin({ top: 10, bottom: 5 })

          Row() {
            // Default
            TextInput({ placeholder: 'decoration default', text: 'Hello World' })
              .width('30%')
              .height('5%')
              .id('TextInput_decoration_default')

            // Null
            TextInput({ placeholder: 'decoration null', text: 'Hello World' })
              .width('30%')
              .height('5%')
              .id('TextInput_decoration_null')
              .decoration(null)

            // Undefined
            TextInput({ placeholder: 'decoration undefined', text: 'Hello World' })
              .width('30%')
              .height('5%')
              .id('TextInput_decoration_undefined')
              .decoration(undefined)
          }
          .width('100%')

          // ========== editMenuOptions tests ==========
          Text('editMenuOptions Property Tests')
            .fontSize(16)
            .fontWeight(FontWeight.Bold)
            .margin({ top: 10, bottom: 5 })

          Row() {
            // Default
            TextInput({ placeholder: 'editMenuOptions default', text: 'Hello World' })
              .width('30%')
              .height('5%')
              .id('TextInput_editMenuOptions_default')

            // Null
            TextInput({ placeholder: 'editMenuOptions null', text: 'Hello World' })
              .width('30%')
              .height('5%')
              .id('TextInput_editMenuOptions_null')
              .editMenuOptions(null)

            // Undefined
            TextInput({ placeholder: 'editMenuOptions undefined', text: 'Hello World' })
              .width('30%')
              .height('5%')
              .id('TextInput_editMenuOptions_undefined')
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
            TextInput({ placeholder: 'autoCapitalizationMode default', text: 'Hello World' })
              .width('30%')
              .height('5%')
              .id('TextInput_autoCapitalizationMode_default')

            // Null
            TextInput({ placeholder: 'autoCapitalizationMode null', text: 'Hello World' })
              .width('30%')
              .height('5%')
              .id('TextInput_autoCapitalizationMode_null')
              .autoCapitalizationMode(null)

            // Undefined
            TextInput({ placeholder: 'autoCapitalizationMode undefined', text: 'Hello World' })
              .width('30%')
              .height('5%')
              .id('TextInput_autoCapitalizationMode_undefined')
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
            TextInput({ placeholder: 'stopBackPress default', text: 'Hello World' })
              .width('30%')
              .height('5%')
              .id('TextInput_stopBackPress_default')

            // Null
            TextInput({ placeholder: 'stopBackPress null', text: 'Hello World' })
              .width('30%')
              .height('5%')
              .id('TextInput_stopBackPress_null')
              .stopBackPress(null)

            // Undefined
            TextInput({ placeholder: 'stopBackPress undefined', text: 'Hello World' })
              .width('30%')
              .height('5%')
              .id('TextInput_stopBackPress_undefined')
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
            TextInput({ placeholder: 'keyboardAppearance default', text: 'Hello World' })
              .width('30%')
              .height('5%')
              .id('TextInput_keyboardAppearance_default')

            // Null
            TextInput({ placeholder: 'keyboardAppearance null', text: 'Hello World' })
              .width('30%')
              .height('5%')
              .id('TextInput_keyboardAppearance_null')
              .keyboardAppearance(null)

            // Undefined
            TextInput({ placeholder: 'keyboardAppearance undefined', text: 'Hello World' })
              .width('30%')
              .height('5%')
              .id('TextInput_keyboardAppearance_undefined')
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
            TextInput({ placeholder: 'strokeWidth default', text: 'Hello World' })
              .width('30%')
              .height('5%')
              .id('TextInput_strokeWidth_default')

            // Null
            TextInput({ placeholder: 'strokeWidth null', text: 'Hello World' })
              .width('30%')
              .height('5%')
              .id('TextInput_strokeWidth_null')
              .strokeWidth(null)

            // Undefined
            TextInput({ placeholder: 'strokeWidth undefined', text: 'Hello World' })
              .width('30%')
              .height('5%')
              .id('TextInput_strokeWidth_undefined')
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
            TextInput({ placeholder: 'strokeColor default', text: 'Hello World' })
              .width('30%')
              .height('5%')
              .id('TextInput_strokeColor_default')

            // Null
            TextInput({ placeholder: 'strokeColor null', text: 'Hello World' })
              .width('30%')
              .height('5%')
              .id('TextInput_strokeColor_null')
              .strokeColor(null)

            // Undefined
            TextInput({ placeholder: 'strokeColor undefined', text: 'Hello World' })
              .width('30%')
              .height('5%')
              .id('TextInput_strokeColor_undefined')
              .strokeColor(undefined)
          }
          .width('100%')

          // ========== enableAutoFillAnimation tests ==========
          Text('enableAutoFillAnimation Property Tests')
            .fontSize(16)
            .fontWeight(FontWeight.Bold)
            .margin({ top: 10, bottom: 5 })

          Row() {
            // Default
            TextInput({ placeholder: 'enableAutoFillAnimation default', text: 'Hello World' })
              .width('30%')
              .height('5%')
              .id('TextInput_enableAutoFillAnimation_default')

            // Null
            TextInput({ placeholder: 'enableAutoFillAnimation null', text: 'Hello World' })
              .width('30%')
              .height('5%')
              .id('TextInput_enableAutoFillAnimation_null')
              .enableAutoFillAnimation(null)

            // Undefined
            TextInput({ placeholder: 'enableAutoFillAnimation undefined', text: 'Hello World' })
              .width('30%')
              .height('5%')
              .id('TextInput_enableAutoFillAnimation_undefined')
              .enableAutoFillAnimation(undefined)
          }
          .width('100%')

          // ========== enableAutoSpacing tests ==========
          Text('enableAutoSpacing Property Tests')
            .fontSize(16)
            .fontWeight(FontWeight.Bold)
            .margin({ top: 10, bottom: 5 })

          Row() {
            // Default
            TextInput({ placeholder: 'enableAutoSpacing default', text: 'Hello World' })
              .width('30%')
              .height('5%')
              .id('TextInput_enableAutoSpacing_default')

            // Null
            TextInput({ placeholder: 'enableAutoSpacing null', text: 'Hello World' })
              .width('30%')
              .height('5%')
              .id('TextInput_enableAutoSpacing_null')
              .enableAutoSpacing(null)

            // Undefined
            TextInput({ placeholder: 'enableAutoSpacing undefined', text: 'Hello World' })
              .width('30%')
              .height('5%')
              .id('TextInput_enableAutoSpacing_undefined')
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
            TextInput({ placeholder: 'includeFontPadding default', text: 'Hello World' })
              .width('30%')
              .height('5%')
              .id('TextInput_includeFontPadding_default')

            // Null
            TextInput({ placeholder: 'includeFontPadding null', text: 'Hello World' })
              .width('30%')
              .height('5%')
              .id('TextInput_includeFontPadding_null')
              .includeFontPadding(null)

            // Undefined
            TextInput({ placeholder: 'includeFontPadding undefined', text: 'Hello World' })
              .width('30%')
              .height('5%')
              .id('TextInput_includeFontPadding_undefined')
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
            TextInput({ placeholder: 'fallbackLineSpacing default', text: 'Hello World' })
              .width('30%')
              .height('5%')
              .id('TextInput_fallbackLineSpacing_default')

            // Null
            TextInput({ placeholder: 'fallbackLineSpacing null', text: 'Hello World' })
              .width('30%')
              .height('5%')
              .id('TextInput_fallbackLineSpacing_null')
              .fallbackLineSpacing(null)

            // Undefined
            TextInput({ placeholder: 'fallbackLineSpacing undefined', text: 'Hello World' })
              .width('30%')
              .height('5%')
              .id('TextInput_fallbackLineSpacing_undefined')
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
            TextInput({ placeholder: 'compressLeadingPunctuation default', text: 'Hello World' })
              .width('30%')
              .height('5%')
              .id('TextInput_compressLeadingPunctuation_default')

            // Null
            TextInput({ placeholder: 'compressLeadingPunctuation null', text: 'Hello World' })
              .width('30%')
              .height('5%')
              .id('TextInput_compressLeadingPunctuation_null')
              .compressLeadingPunctuation(null)

            // Undefined
            TextInput({ placeholder: 'compressLeadingPunctuation undefined', text: 'Hello World' })
              .width('30%')
              .height('5%')
              .id('TextInput_compressLeadingPunctuation_undefined')
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
            TextInput({ placeholder: 'selectedDragPreviewStyle default', text: 'Hello World' })
              .width('30%')
              .height('5%')
              .id('TextInput_selectedDragPreviewStyle_default')

            // Null
            TextInput({ placeholder: 'selectedDragPreviewStyle null', text: 'Hello World' })
              .width('30%')
              .height('5%')
              .id('TextInput_selectedDragPreviewStyle_null')
              .selectedDragPreviewStyle(null)

            // Undefined
            TextInput({ placeholder: 'selectedDragPreviewStyle undefined', text: 'Hello World' })
              .width('30%')
              .height('5%')
              .id('TextInput_selectedDragPreviewStyle_undefined')
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
            TextInput({ placeholder: 'textDirection default', text: 'Hello World' })
              .width('30%')
              .height('5%')
              .id('TextInput_textDirection_default')

            // Null
            TextInput({ placeholder: 'textDirection null', text: 'Hello World' })
              .width('30%')
              .height('5%')
              .id('TextInput_textDirection_null')
              .textDirection(null)

            // Undefined
            TextInput({ placeholder: 'textDirection undefined', text: 'Hello World' })
              .width('30%')
              .height('5%')
              .id('TextInput_textDirection_undefined')
              .textDirection(undefined)
          }
          .width('100%')

          // ========== caretPosition tests ==========
          Text('caretPosition Property Tests')
            .fontSize(16)
            .fontWeight(FontWeight.Bold)
            .margin({ top: 10, bottom: 5 })

          Row() {
            // Default
            TextInput({ placeholder: 'caretPosition default', text: 'Hello World' })
              .width('30%')
              .height('5%')
              .id('TextInput_caretPosition_default')

            // Null
            TextInput({ placeholder: 'caretPosition null', text: 'Hello World' })
              .width('30%')
              .height('5%')
              .id('TextInput_caretPosition_null')
              .caretPosition(null)

            // Undefined
            TextInput({ placeholder: 'caretPosition undefined', text: 'Hello World' })
              .width('30%')
              .height('5%')
              .id('TextInput_caretPosition_undefined')
              .caretPosition(undefined)
          }
          .width('100%')
        }
      }

      }
      .width('100%')
      .height('100%')
  }
}
