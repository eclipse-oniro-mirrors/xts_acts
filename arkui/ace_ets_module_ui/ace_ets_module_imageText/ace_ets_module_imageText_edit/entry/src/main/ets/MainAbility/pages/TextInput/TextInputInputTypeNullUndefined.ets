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
struct TextInputInputTypeNullUndefinedTest {
  build() {
    Row() {
      Column() {
        // ========== InputType tests ==========
        // Test InputType default value (未设置 InputType)
        TextInput({ placeholder: 'TextInput InputType default' })
          .width('100%')
          .height('5%')
          .id('textInput_InputType_default')

        // Test InputType with null parameter
        TextInput({ placeholder: 'TextInput InputType null' })
          .width('100%')
          .height('5%')
          .id('textInput_InputType_null')
          .type(null)

        // Test InputType with undefined parameter
        TextInput({ placeholder: 'TextInput InputType undefined' })
          .width('100%')
          .height('5%')
          .id('textInput_InputType_undefined')
          .type(undefined)

        // Test InputType with NUMBER_PASSWORD (value: 8)
        TextInput({ placeholder: 'TextInput InputType NUMBER_PASSWORD' })
          .width('100%')
          .height('5%')
          .id('textInput_InputType_NUMBER_PASSWORD')
          .type(InputType.NUMBER_PASSWORD)

        // Test InputType with USER_NAME (value: 10)
        TextInput({ placeholder: 'TextInput InputType USER_NAME' })
          .width('100%')
          .height('5%')
          .id('textInput_InputType_USER_NAME')
          .type(InputType.USER_NAME)

        // Test InputType with NEW_PASSWORD (value: 11)
        TextInput({ placeholder: 'TextInput InputType NEW_PASSWORD' })
          .width('100%')
          .height('5%')
          .id('textInput_InputType_NEW_PASSWORD')
          .type(InputType.NEW_PASSWORD)

        // Test InputType with NUMBER_DECIMAL (value: 12)
        TextInput({ placeholder: 'TextInput InputType NUMBER_DECIMAL' })
          .width('100%')
          .height('5%')
          .id('textInput_InputType_NUMBER_DECIMAL')
          .type(InputType.NUMBER_DECIMAL)
      }
      .width('100%')
    }
    .height('100%')
  }
}
