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
struct TextInputTypeParamTest {
  build() {
    Row() {
      Column() {
        // ========== InputType type property tests ==========

        // Row 1: default, null, undefined, Normal
        Row() {
          // Test InputType default value (未设置 type 属性)
          TextInput({ placeholder: 'TextInput type default' })
            .width('25%')
            .height('5%')
            .id('TextInput_type_default')

          // Test InputType with null parameter
          TextInput({ placeholder: 'TextInput type null' })
            .width('25%')
            .height('5%')
            .id('TextInput_type_null')
            .type(null)

          // Test InputType with undefined parameter
          TextInput({ placeholder: 'TextInput type undefined' })
            .width('25%')
            .height('5%')
            .id('TextInput_type_undefined')
            .type(undefined)

          // Test InputType.Normal (value: 0)
          TextInput({ placeholder: 'TextInput type Normal' })
            .width('25%')
            .height('5%')
            .id('TextInput_type_Normal')
            .type(InputType.Normal)
        }

        // Row 2: Number, PhoneNumber, Email, Password
        Row() {
          // Test InputType.Number (value: 2)
          TextInput({ placeholder: 'TextInput type Number' })
            .width('25%')
            .height('5%')
            .id('TextInput_type_Number')
            .type(InputType.Number)

          // Test InputType.PhoneNumber (value: 3)
          TextInput({ placeholder: 'TextInput type PhoneNumber' })
            .width('25%')
            .height('5%')
            .id('TextInput_type_PhoneNumber')
            .type(InputType.PhoneNumber)

          // Test InputType.Email (value: 5)
          TextInput({ placeholder: 'TextInput type Email' })
            .width('25%')
            .height('5%')
            .id('TextInput_type_Email')
            .type(InputType.Email)

          // Test InputType.Password (value: 7)
          TextInput({ placeholder: 'TextInput type Password' })
            .width('25%')
            .height('5%')
            .id('TextInput_type_Password')
            .type(InputType.Password)
        }

        // Row 3: NUMBER_PASSWORD, USER_NAME, NEW_PASSWORD, NUMBER_DECIMAL
        Row() {
          // Test InputType.NUMBER_PASSWORD (value: 8)
          TextInput({ placeholder: 'TextInput type NUMBER_PASSWORD' })
            .width('25%')
            .height('5%')
            .id('TextInput_type_NUMBER_PASSWORD')
            .type(InputType.NUMBER_PASSWORD)

          // Test InputType.USER_NAME (value: 10)
          TextInput({ placeholder: 'TextInput type USER_NAME' })
            .width('25%')
            .height('5%')
            .id('TextInput_type_USER_NAME')
            .type(InputType.USER_NAME)

          // Test InputType.NEW_PASSWORD (value: 11)
          TextInput({ placeholder: 'TextInput type NEW_PASSWORD' })
            .width('25%')
            .height('5%')
            .id('TextInput_type_NEW_PASSWORD')
            .type(InputType.NEW_PASSWORD)

          // Test InputType.NUMBER_DECIMAL (value: 12)
          TextInput({ placeholder: 'TextInput type NUMBER_DECIMAL' })
            .width('25%')
            .height('5%')
            .id('TextInput_type_NUMBER_DECIMAL')
            .type(InputType.NUMBER_DECIMAL)
        }

        // Row 4: URL, ONE_TIME_CODE
        Row() {
          // Test InputType.URL (value: 13)
          TextInput({ placeholder: 'TextInput type URL' })
            .width('25%')
            .height('5%')
            .id('TextInput_type_URL')
            .type(InputType.URL)

          // Test InputType.ONE_TIME_CODE (value: 14)
          TextInput({ placeholder: 'TextInput type ONE_TIME_CODE' })
            .width('25%')
            .height('5%')
            .id('TextInput_type_ONE_TIME_CODE')
            .type(InputType.ONE_TIME_CODE)
        }
      }
      .width('100%')
    }
    .height('100%')
  }
}
