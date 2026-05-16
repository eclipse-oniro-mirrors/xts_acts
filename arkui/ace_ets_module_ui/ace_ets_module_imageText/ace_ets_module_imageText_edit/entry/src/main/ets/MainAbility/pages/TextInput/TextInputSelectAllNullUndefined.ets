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
struct TextInputSelectAllNullUndefinedTest {
  build() {
    Row() {
      Column() {
        // ========== selectAll tests ==========
        // Test selectAll default value (未设置 selectAll)
        TextInput({ placeholder: 'TextInput selectAll default' })
          .width('100%')
          .height('5%')
          .id('textInput_selectAll_default')

        // Test selectAll with null parameter
        TextInput({ placeholder: 'TextInput selectAll null' })
          .width('100%')
          .height('5%')
          .id('textInput_selectAll_null')
          .selectAll(null)

        // Test selectAll with undefined parameter
        TextInput({ placeholder: 'TextInput selectAll undefined' })
          .width('100%')
          .height('5%')
          .id('textInput_selectAll_undefined')
          .selectAll(undefined)

        // Test selectAll with true
        TextInput({ placeholder: 'TextInput selectAll true' })
          .width('100%')
          .height('5%')
          .id('textInput_selectAll_true')
          .selectAll(true)

        // Test selectAll with false
        TextInput({ placeholder: 'TextInput selectAll false' })
          .width('100%')
          .height('5%')
          .id('textInput_selectAll_false')
          .selectAll(false)
      }
      .width('100%')
    }
    .height('100%')
  }
}
