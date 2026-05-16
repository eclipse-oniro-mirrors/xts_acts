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
struct AccessibilityDefaultFocusFalseTest {
  build() {
    Row() {
      Column() {
        // ========== accessibilityDefaultFocus tests ==========
        // Test accessibilityDefaultFocus with true parameter (valid - should be default focus)
        Text('Text accessibilityDefaultFocus true')
          .width('100%')
          .height('5%')
          .id('text_accessibilityDefaultFocus_true')
          .maxLines(1)
          .accessibilityDefaultFocus(true)
          .accessibilityLevel('yes')

        // Test accessibilityDefaultFocus with false parameter
        Text('Text accessibilityDefaultFocus false')
          .width('100%')
          .height('5%')
          .id('text_accessibilityDefaultFocus_false')
          .maxLines(1)
          .accessibilityDefaultFocus(false)
          .accessibilityLevel('yes')

        // Test accessibilityDefaultFocus with undefined parameter
        Text('Text accessibilityDefaultFocus undefined')
          .width('100%')
          .height('5%')
          .id('text_accessibilityDefaultFocus_undefined')
          .maxLines(1)
          .accessibilityDefaultFocus(undefined)
          .accessibilityLevel('yes')
      }
      .width('100%')
    }
    .height('100%')
  }
}
