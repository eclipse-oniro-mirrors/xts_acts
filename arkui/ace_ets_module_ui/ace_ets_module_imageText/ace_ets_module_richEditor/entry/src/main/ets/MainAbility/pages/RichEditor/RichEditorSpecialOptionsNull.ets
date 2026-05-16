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
struct RichEditorSpecialOptionsNull {
  controller: RichEditorController = new RichEditorController();
  options: RichEditorOptions = { controller: this.controller };

  @Builder
  CustomMenuBuilder() {
    Column() {
      Text('Menu Item')
        .fontSize(20)
    }
  }

  @Builder
  CustomKeyboardBuilder() {
    Column() {
      Text('Custom Keyboard')
        .fontSize(20)
    }
  }

  build() {
    Column({ space: 10 }) {
      Row() {
        // Test 1: copyOptions with null parameter
        RichEditor(this.options)
          .id('richEditor_copyOptions_null')
          .copyOptions(null)
          .height('5%')

        // Test 2: copyOptions with undefined parameter
        RichEditor(this.options)
          .id('richEditor_copyOptions_undefined')
          .copyOptions(undefined)
          .height('5%')
      }

      Row() {
        // Test 3: customKeyboard with null parameter (API 23+)
        RichEditor(this.options)
          .id('richEditor_customKeyboard_null')
          .customKeyboard(null, null)
          .height('5%')

        // Test 4: customKeyboard with undefined parameter (API 23+)
        RichEditor(this.options)
          .id('richEditor_customKeyboard_undefined')
          .customKeyboard(undefined, undefined)
          .height('5%')
      }

      Row() {
        // Test 5: enableDataDetector with null parameter
        RichEditor(this.options)
          .id('richEditor_enableDataDetector_null')
          .enableDataDetector(null)
          .height('5%')

        // Test 6: enableDataDetector with undefined parameter
        RichEditor(this.options)
          .id('richEditor_enableDataDetector_undefined')
          .enableDataDetector(undefined)
          .height('5%')
      }

      Row() {
        // Test 7: enablePreviewText with null parameter
        RichEditor(this.options)
          .id('richEditor_enablePreviewText_null')
          .enablePreviewText(null)
          .height('5%')

        // Test 8: enablePreviewText with undefined parameter
        RichEditor(this.options)
          .id('richEditor_enablePreviewText_undefined')
          .enablePreviewText(undefined)
          .height('5%')
      }

      Row() {
        // Test 9: bindSelectionMenu with null content parameter
        RichEditor(this.options)
          .id('richEditor_bindSelectionMenu_null')
          .bindSelectionMenu(null, this.CustomMenuBuilder, null)
          .height('5%')

        // Test 10: bindSelectionMenu with undefined content parameter
        RichEditor(this.options)
          .id('richEditor_bindSelectionMenu_undefined')
          .bindSelectionMenu(undefined, this.CustomMenuBuilder, undefined)
          .height('5%')
      }

      // Default values for comparison
      RichEditor(this.options)
        .id('richEditor_specialOptions_default')
        .height('5%')
    }
    .width('100%')
    .height('100%')
    .backgroundColor('#F5F5F5')
  }
}
