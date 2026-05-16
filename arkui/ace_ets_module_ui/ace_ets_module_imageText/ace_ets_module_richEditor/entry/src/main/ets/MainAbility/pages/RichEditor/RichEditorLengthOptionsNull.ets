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
struct RichEditorLengthOptionsNull {
  controller: RichEditorController = new RichEditorController();
  options: RichEditorOptions = { controller: this.controller };

  build() {
    Column({ space: 10 }) {
      Row() {
        // Test 1: maxLength with null parameter (API 18+)
        RichEditor(this.options)
          .id('richEditor_maxLength_null')
          .maxLength(null)
          .height('5%')

        // Test 2: maxLength with undefined parameter (API 18+)
        RichEditor(this.options)
          .id('richEditor_maxLength_undefined')
          .maxLength(undefined)
          .height('5%')
      }

      Row() {
        // Test 3: maxLines with null parameter (API 18+)
        RichEditor(this.options)
          .id('richEditor_maxLines_null')
          .maxLines(null)
          .height('5%')

        // Test 4: maxLines with undefined parameter (API 18+)
        RichEditor(this.options)
          .id('richEditor_maxLines_undefined')
          .maxLines(undefined)
          .height('5%')
      }

      Row() {
        // Test 5: enableAutoSpacing with null parameter (API 20+)
        RichEditor(this.options)
          .id('richEditor_enableAutoSpacing_null')
          .enableAutoSpacing(null)
          .height('5%')

        // Test 6: enableAutoSpacing with undefined parameter (API 20+)
        RichEditor(this.options)
          .id('richEditor_enableAutoSpacing_undefined')
          .enableAutoSpacing(undefined)
          .height('5%')
      }

      Row() {
        // Test 7: keyboardAppearance with null parameter (API 15+)
        RichEditor(this.options)
          .id('richEditor_keyboardAppearance_null')
          .keyboardAppearance(null)
          .height('5%')

        // Test 8: keyboardAppearance with undefined parameter (API 15+)
        RichEditor(this.options)
          .id('richEditor_keyboardAppearance_undefined')
          .keyboardAppearance(undefined)
          .height('5%')
      }

      Row() {
        // Test 9: stopBackPress with null parameter (API 18+)
        RichEditor(this.options)
          .id('richEditor_stopBackPress_null')
          .stopBackPress(null)
          .height('5%')

        // Test 10: stopBackPress with undefined parameter (API 18+)
        RichEditor(this.options)
          .id('richEditor_stopBackPress_undefined')
          .stopBackPress(undefined)
          .height('5%')
      }

      // Default values for comparison
      RichEditor(this.options)
        .id('richEditor_lengthOptions_default')
        .height('5%')
    }
    .width('100%')
    .height('100%')
    .backgroundColor('#F5F5F5')
  }
}
