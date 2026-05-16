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
struct TextInputEnableKeyboardOnFocusNullUndefinedTest {
  build() {
    Row() {
      Column() {
        // ========== enableKeyboardOnFocus tests ==========
        // Test enableKeyboardOnFocus default value (未设置 enableKeyboardOnFocus)
        TextInput({ placeholder: 'TextInput enableKeyboardOnFocus default' })
          .width('100%')
          .height('5%')
          .id('textInput_enableKeyboardOnFocus_default')

        // Test enableKeyboardOnFocus with null parameter
        TextInput({ placeholder: 'TextInput enableKeyboardOnFocus null' })
          .width('100%')
          .height('5%')
          .id('textInput_enableKeyboardOnFocus_null')
          .enableKeyboardOnFocus(null)

        // Test enableKeyboardOnFocus with undefined parameter
        TextInput({ placeholder: 'TextInput enableKeyboardOnFocus undefined' })
          .width('100%')
          .height('5%')
          .id('textInput_enableKeyboardOnFocus_undefined')
          .enableKeyboardOnFocus(undefined)

        // Test enableKeyboardOnFocus with true
        TextInput({ placeholder: 'TextInput enableKeyboardOnFocus true' })
          .width('100%')
          .height('5%')
          .id('textInput_enableKeyboardOnFocus_true')
          .enableKeyboardOnFocus(true)

        // Test enableKeyboardOnFocus with false
        TextInput({ placeholder: 'TextInput enableKeyboardOnFocus false' })
          .width('100%')
          .height('5%')
          .id('textInput_enableKeyboardOnFocus_false')
          .enableKeyboardOnFocus(false)
      }
      .width('100%')
    }
    .height('100%')
  }
}
