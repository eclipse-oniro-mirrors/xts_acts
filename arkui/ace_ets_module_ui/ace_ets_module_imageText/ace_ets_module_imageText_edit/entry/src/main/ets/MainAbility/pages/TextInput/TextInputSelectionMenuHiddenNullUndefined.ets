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
struct TextInputSelectionMenuHiddenNullUndefinedTest {
  build() {
    Row() {
      Column() {
        // ========== selectionMenuHidden tests ==========
        // Test selectionMenuHidden default value (未设置 selectionMenuHidden)
        TextInput({ placeholder: 'TextInput selectionMenuHidden default' })
          .width('100%')
          .height('5%')
          .id('textInput_selectionMenuHidden_default')

        // Test selectionMenuHidden with null parameter
        TextInput({ placeholder: 'TextInput selectionMenuHidden null' })
          .width('100%')
          .height('5%')
          .id('textInput_selectionMenuHidden_null')
          .selectionMenuHidden(null)

        // Test selectionMenuHidden with undefined parameter
        TextInput({ placeholder: 'TextInput selectionMenuHidden undefined' })
          .width('100%')
          .height('5%')
          .id('textInput_selectionMenuHidden_undefined')
          .selectionMenuHidden(undefined)

        // Test selectionMenuHidden with true
        TextInput({ placeholder: 'TextInput selectionMenuHidden true' })
          .width('100%')
          .height('5%')
          .id('textInput_selectionMenuHidden_true')
          .selectionMenuHidden(true)

        // Test selectionMenuHidden with false
        TextInput({ placeholder: 'TextInput selectionMenuHidden false' })
          .width('100%')
          .height('5%')
          .id('textInput_selectionMenuHidden_false')
          .selectionMenuHidden(false)
      }
      .width('100%')
    }
    .height('100%')
  }
}
