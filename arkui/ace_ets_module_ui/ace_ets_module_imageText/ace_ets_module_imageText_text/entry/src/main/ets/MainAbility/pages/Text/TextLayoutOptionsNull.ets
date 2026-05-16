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
struct TextLayoutOptionsNull {
  build() {
    Column({ space: 2 }) {
      Row() {
        // Test 1: enableHapticFeedback with null parameter
        Text('enableHapticFeedback with null')
          .id('text_enableHapticFeedback_null')
          .enableHapticFeedback(null)
          .height('5%')

        // Test 2: enableHapticFeedback with undefined parameter
        Text('enableHapticFeedback with undefined')
          .id('text_enableHapticFeedback_undefined')
          .enableHapticFeedback(undefined)
          .height('5%')
      }

      Row() {
        // Test 3: optimizeTrailingSpace with null parameter
        Text('optimizeTrailingSpace with null')
          .id('text_optimizeTrailingSpace_null')
          .optimizeTrailingSpace(null)
          .height('5%')

        // Test 4: optimizeTrailingSpace with undefined parameter
        Text('optimizeTrailingSpace with undefined')
          .id('text_optimizeTrailingSpace_undefined')
          .optimizeTrailingSpace(undefined)
          .height('5%')
      }

      Row() {
        // Test 5: enableAutoSpacing with null parameter
        Text('enableAutoSpacing with null')
          .id('text_enableAutoSpacing_null')
          .enableAutoSpacing(null)
          .height('5%')

        // Test 6: enableAutoSpacing with undefined parameter
        Text('enableAutoSpacing with undefined')
          .id('text_enableAutoSpacing_undefined')
          .enableAutoSpacing(undefined)
          .height('5%')
      }

      Row() {
        // Test 7: contentTransition with null parameter
        Text('contentTransition with null')
          .id('text_contentTransition_null')
          .contentTransition(null)
          .height('5%')

        // Test 8: contentTransition with undefined parameter
        Text('contentTransition with undefined')
          .id('text_contentTransition_undefined')
          .contentTransition(undefined)
          .height('5%')
      }

      Row() {
        // Test 9: includeFontPadding with null parameter
        Text('includeFontPadding with null')
          .id('text_includeFontPadding_null')
          .includeFontPadding(null)
          .height('5%')

        // Test 10: includeFontPadding with undefined parameter
        Text('includeFontPadding with undefined')
          .id('text_includeFontPadding_undefined')
          .includeFontPadding(undefined)
          .height('5%')
      }

      // Test 11: Default values for comparison
      Text('Default (for comparison)')
        .id('text_layoutOptions_default')
        .height('5%')
    }
    .width('100%')
    .height('100%')
    .backgroundColor('#F5F5F5')
  }
}
