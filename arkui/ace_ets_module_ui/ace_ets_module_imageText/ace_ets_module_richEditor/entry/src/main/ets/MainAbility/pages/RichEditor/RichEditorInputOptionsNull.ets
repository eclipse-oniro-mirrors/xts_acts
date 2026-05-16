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
struct RichEditorInputOptionsNull {
  controller: RichEditorController = new RichEditorController();
  options: RichEditorOptions = { controller: this.controller };

  build() {
    Column({ space: 10 }) {
      Row() {
        // Test 1: enterKeyType with null parameter (API 12+)
        RichEditor(this.options)
          .id('richEditor_enterKeyType_null')
          .enterKeyType(null)
          .height('5%')

        // Test 2: enterKeyType with undefined parameter (API 12+)
        RichEditor(this.options)
          .id('richEditor_enterKeyType_undefined')
          .enterKeyType(undefined)
          .height('5%')
      }

      Row() {
        // Test 3: barState with null parameter (API 13+)
        RichEditor(this.options)
          .id('richEditor_barState_null')
          .barState(null)
          .height('5%')

        // Test 4: barState with undefined parameter (API 13+)
        RichEditor(this.options)
          .id('richEditor_barState_undefined')
          .barState(undefined)
          .height('5%')
      }

      Row() {
        // Test 5: enableHapticFeedback with null parameter (API 13+)
        RichEditor(this.options)
          .id('richEditor_enableHapticFeedback_null')
          .enableHapticFeedback(null)
          .height('5%')

        // Test 6: enableHapticFeedback with undefined parameter (API 13+)
        RichEditor(this.options)
          .id('richEditor_enableHapticFeedback_undefined')
          .enableHapticFeedback(undefined)
          .height('5%')
      }

      Row() {
        // Test 7: editMenuOptions with null parameter (API 12+)
        RichEditor(this.options)
          .id('richEditor_editMenuOptions_null')
          .editMenuOptions(null)
          .height('5%')

        // Test 8: editMenuOptions with undefined parameter (API 12+)
        RichEditor(this.options)
          .id('richEditor_editMenuOptions_undefined')
          .editMenuOptions(undefined)
          .height('5%')
      }

      Row() {
        // Test 9: onWillAttachIME with null parameter (API 22+)
        RichEditor(this.options)
          .id('richEditor_onWillAttachIME_null')
          .onWillAttachIME(null)
          .height('5%')

        // Test 10: onWillAttachIME with undefined parameter (API 22+)
        RichEditor(this.options)
          .id('richEditor_onWillAttachIME_undefined')
          .onWillAttachIME(undefined)
          .height('5%')
      }

      // Default values for comparison
      RichEditor(this.options)
        .id('richEditor_inputOptions_default')
        .height('5%')
    }
    .width('100%')
    .height('100%')
    .backgroundColor('#F5F5F5')
  }
}
