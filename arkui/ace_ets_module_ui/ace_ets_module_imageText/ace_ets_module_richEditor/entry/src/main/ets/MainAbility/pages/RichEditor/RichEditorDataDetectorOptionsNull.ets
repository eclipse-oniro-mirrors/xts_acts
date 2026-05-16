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
struct RichEditorDataDetectorOptionsNull {
  controller: RichEditorController = new RichEditorController();
  options: RichEditorOptions = { controller: this.controller };

  build() {
    Column({ space: 10 }) {
      Row() {
        // Test 1: dataDetectorConfig with null parameter
        RichEditor(this.options)
          .id('richEditor_dataDetectorConfig_null')
          .enableDataDetector(true)
          .dataDetectorConfig(null)
          .height('5%')

        // Test 2: dataDetectorConfig with undefined parameter
        RichEditor(this.options)
          .id('richEditor_dataDetectorConfig_undefined')
          .enableDataDetector(true)
          .dataDetectorConfig(undefined)
          .height('5%')
      }

      Row() {
        // Test 3: enableSelectedDataDetector with null parameter (API 22+)
        RichEditor(this.options)
          .id('richEditor_enableSelectedDataDetector_null')
          .enableSelectedDataDetector(null)
          .height('5%')

        // Test 4: enableSelectedDataDetector with undefined parameter (API 22+)
        RichEditor(this.options)
          .id('richEditor_enableSelectedDataDetector_undefined')
          .enableSelectedDataDetector(undefined)
          .height('5%')
      }

      Row() {
        // Test 5: placeholder with null parameter
        RichEditor(this.options)
          .id('richEditor_placeholder_null')
          .placeholder(null)
          .height('5%')

        // Test 6: placeholder with undefined parameter
        RichEditor(this.options)
          .id('richEditor_placeholder_undefined')
          .placeholder(undefined)
          .height('5%')
      }

      Row() {
        // Test 7: placeholder with empty string
        RichEditor(this.options)
          .id('richEditor_placeholder_empty')
          .placeholder('')
          .height('5%')

        // Test 8: caretColor with null parameter (API 12+)
        RichEditor(this.options)
          .id('richEditor_caretColor_null')
          .caretColor(null)
          .height('5%')
      }

      Row() {
        // Test 9: caretColor with undefined parameter (API 12+)
        RichEditor(this.options)
          .id('richEditor_caretColor_undefined')
          .caretColor(undefined)
          .height('5%')

        // Test 10: selectedBackgroundColor with null parameter (API 12+)
        RichEditor(this.options)
          .id('richEditor_selectedBackgroundColor_null')
          .selectedBackgroundColor(null)
          .height('5%')
      }

      Row() {
        // Test 11: selectedBackgroundColor with undefined parameter (API 12+)
        RichEditor(this.options)
          .id('richEditor_selectedBackgroundColor_undefined')
          .selectedBackgroundColor(undefined)
          .height('5%')

        // Default values for comparison
        RichEditor(this.options)
          .id('richEditor_dataDetector_default')
          .height('5%')
      }
    }
    .width('100%')
    .height('100%')
    .backgroundColor('#F5F5F5')
  }
}
