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
struct TextInputEnterKeyTypeNullUndefinedTest {
  build() {
    Row() {
      Column() {
        // ========== enterKeyType tests ==========
        // Test enterKeyType default value (未设置 enterKeyType)
        TextInput({ placeholder: 'TextInput enterKeyType default' })
          .width('100%')
          .height('5%')
          .id('textInput_enterKeyType_default')

        // Test enterKeyType with null parameter
        TextInput({ placeholder: 'TextInput enterKeyType null' })
          .width('100%')
          .height('5%')
          .id('textInput_enterKeyType_null')
          .enterKeyType(null)

        // Test enterKeyType with undefined parameter
        TextInput({ placeholder: 'TextInput enterKeyType undefined' })
          .width('100%')
          .height('5%')
          .id('textInput_enterKeyType_undefined')
          .enterKeyType(undefined)

        // Test enterKeyType with valid value for comparison
        TextInput({ placeholder: 'TextInput enterKeyType Go' })
          .width('100%')
          .height('5%')
          .id('textInput_enterKeyType_Go')
          .enterKeyType(EnterKeyType.Go)

        // Test enterKeyType with another valid value for comparison
        TextInput({ placeholder: 'TextInput enterKeyType Search' })
          .width('100%')
          .height('5%')
          .id('textInput_enterKeyType_Search')
          .enterKeyType(EnterKeyType.Search)
      }
      .width('100%')
    }
    .height('100%')
  }
}
