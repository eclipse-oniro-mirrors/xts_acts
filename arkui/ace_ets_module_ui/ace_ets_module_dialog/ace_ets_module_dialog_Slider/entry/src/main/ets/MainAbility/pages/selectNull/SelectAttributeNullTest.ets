/*
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
struct SelectAttributeNullTest {
  private selectOptions: SelectOption[] = [
    { value: 'aaa' },
    { value: 'bbb' },
    { value: 'ccc' }
  ]

  build() {
    Flex(){
      Column({ space: 10 }){
        Select(this.selectOptions).font(null).id('select_font_null')
        Select(this.selectOptions).font(undefined).id('select_font_undefined')
        Select(this.selectOptions).fontColor(null).id('select_fontColor_null')
        Select(this.selectOptions).fontColor(undefined).id('select_fontColor_undefined')
        Select(this.selectOptions).selectedOptionBgColor(null).id('select_selectedOptionBgColor_null')
        Select(this.selectOptions).selectedOptionBgColor(undefined).id('select_selectedOptionBgColor_undefined')
        Select(this.selectOptions).optionHeight(null).id('select_optionHeight_null')
        Select(this.selectOptions).optionHeight(undefined).id('select_optionHeight_undefined')
      }
      Column({ space: 10 }) {
        Select(this.selectOptions).menuBackgroundColor(null).id('select_menuBackgroundColor_null')
        Select(this.selectOptions).menuBackgroundColor(undefined).id('select_menuBackgroundColor_undefined')
        Select(this.selectOptions).menuBackgroundBlurStyle(null).id('select_menuBackgroundBlurStyle_null')
        Select(this.selectOptions).menuBackgroundBlurStyle(undefined).id('select_menuBackgroundBlurStyle_undefined')
        Select(this.selectOptions).controlSize(null).id('select_controlSize_null')
        Select(this.selectOptions).controlSize(undefined).id('select_controlSize_undefined')
        Select(this.selectOptions).showDefaultSelectedIcon(null).id('select_showDefaultSelectedIcon_null')
        Select(this.selectOptions).showDefaultSelectedIcon(undefined).id('select_showDefaultSelectedIcon_undefined')

      }
      Column(){
        Select(this.selectOptions).selectedOptionFont(null).id('select_selectedOptionFont_null')
        Select(this.selectOptions).selectedOptionFont(undefined).id('select_selectedOptionFont_undefined')
        Select(this.selectOptions).selectedOptionFontColor(null).id('select_selectedOptionFontColor_null')
        Select(this.selectOptions).selectedOptionFontColor(undefined).id('select_selectedOptionFontColor_undefined')
        Select(this.selectOptions).optionBgColor(null).id('select_optionBgColor_null')
        Select(this.selectOptions).optionBgColor(undefined).id('select_optionBgColor_undefined')
        Select(this.selectOptions).optionFont(null).id('select_optionFont_null')
        Select(this.selectOptions).optionFont(undefined).id('select_optionFont_undefined')
        Select(this.selectOptions).optionFontColor(null).id('select_optionFontColor_null')
        Select(this.selectOptions).optionFontColor(undefined).id('select_optionFontColor_undefined')
      }
      Column(){
        Select(this.selectOptions).keyboardAvoidMode(null).id('select_keyboardAvoidMode_null')
        Select(this.selectOptions).keyboardAvoidMode(undefined).id('select_keyboardAvoidMode_undefined')
        Select(this.selectOptions).minKeyboardAvoidDistance(null).id('select_minKeyboardAvoidDistance_null')
        Select(this.selectOptions).minKeyboardAvoidDistance(undefined).id('select_minKeyboardAvoidDistance_undefined')
        Select(this.selectOptions).dividerStyle(null).id('select_dividerStyle_null')
        Select(this.selectOptions).dividerStyle(undefined).id('select_dividerStyle_undefined')
        Select(this.selectOptions).avoidance(null).id('select_avoidance_null')
        Select(this.selectOptions).avoidance(undefined).id('select_avoidance_undefined')
      }
      Column(){
        Select(this.selectOptions).space(null).id('select_space_null')
        Select(this.selectOptions).space(undefined).id('select_space_undefined')
        Select(this.selectOptions).arrowPosition(ArrowPosition.START).id('select_arrowPosition_start')
        Select(this.selectOptions).arrowPosition(null).id('select_arrowPosition_null')
        Select(this.selectOptions).arrowPosition(undefined).id('select_arrowPosition_undefined')
        Select(this.selectOptions).menuAlign(MenuAlignType.START, null).id('select_menuAlign_null')
        Select(this.selectOptions).menuAlign(MenuAlignType.START, undefined).id('select_menuAlign_undefined')
        Select(this.selectOptions).optionWidth(null).id('select_optionWidth_null')
        Select(this.selectOptions).optionWidth(undefined).id('select_optionWidth_undefined')
      }
    }
    .width('100%')
    .height('100%')
    .padding(20)
  }
}