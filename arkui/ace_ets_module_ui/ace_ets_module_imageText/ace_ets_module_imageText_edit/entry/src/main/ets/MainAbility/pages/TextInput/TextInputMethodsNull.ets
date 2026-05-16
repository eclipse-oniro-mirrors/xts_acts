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
struct TextInputMethodsNull {
  @Builder
  CustomKeyboardBuilder() {
    Column() {
      Text('Custom Keyboard')
        .fontSize(20)
    }
  }

  build() {
    Column({ space: 2 }) {
      // contentType null test
      TextInput({ placeholder: 'contentType null test' })
        .id('textInput_contentType_null')
        .contentType(null)
        .height('5%')

      // contentType undefined test
      TextInput({ placeholder: 'contentType undefined test' })
        .id('textInput_contentType_undefined')
        .contentType(undefined)
        .height('5%')

      // onTextSelectionChange null test
      TextInput({ placeholder: 'onTextSelectionChange null test' })
        .id('textInput_onTextSelectionChange_null')
        .onTextSelectionChange(null)
        .height('5%')

      // onTextSelectionChange undefined test
      TextInput({ placeholder: 'onTextSelectionChange undefined test' })
        .id('textInput_onTextSelectionChange_undefined')
        .onTextSelectionChange(undefined)
        .height('5%')

      // customKeyboard null test
      TextInput({ placeholder: 'customKeyboard null test' })
        .id('textInput_customKeyboard_null')
        .customKeyboard(null, null)
        .height('5%')

      // customKeyboard undefined test
      TextInput({ placeholder: 'customKeyboard undefined test' })
        .id('textInput_customKeyboard_undefined')
        .customKeyboard(undefined, undefined)
        .height('5%')

      // showCounter null test
      TextInput({ placeholder: 'showCounter null test' })
        .id('textInput_showCounter_null')
        .showCounter(null, null)
        .height('5%')

      // showCounter undefined test
      TextInput({ placeholder: 'showCounter undefined test' })
        .id('textInput_showCounter_undefined')
        .showCounter(undefined, undefined)
        .height('5%')

      // onWillChange null test
      TextInput({ placeholder: 'onWillChange null test' })
        .id('textInput_onWillChange_null')
        .onWillChange(null)
        .height('5%')

      // onWillChange undefined test
      TextInput({ placeholder: 'onWillChange undefined test' })
        .id('textInput_onWillChange_undefined')
        .onWillChange(undefined)
        .height('5%')
    }
    .width('100%')
    .height('100%')
    .backgroundColor('#F5F5F5')
  }
}
