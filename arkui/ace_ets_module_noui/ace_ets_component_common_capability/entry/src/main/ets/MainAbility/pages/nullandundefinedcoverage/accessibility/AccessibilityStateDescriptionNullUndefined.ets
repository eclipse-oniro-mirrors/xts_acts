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
struct AccessibilityStateDescriptionNullUndefinedTest {
  build() {
    Row() {
      Column() {
        // ========== accessibilityStateDescription tests ==========
        // Test accessibilityStateDescription default value
        Text('Text accessibilityStateDescription default')
          .width('100%')
          .height('5%')
          .id('text_accessibilityStateDescription_default')
          .maxLines(1)

        // Test accessibilityStateDescription with null parameter
        Text('Text accessibilityStateDescription null')
          .width('100%')
          .height('5%')
          .id('text_accessibilityStateDescription_null')
          .maxLines(1)
          .accessibilityStateDescription(null)

        // Test accessibilityStateDescription with undefined parameter
        Text('Text accessibilityStateDescription undefined')
          .width('100%')
          .height('5%')
          .id('text_accessibilityStateDescription_undefined')
          .maxLines(1)
          .accessibilityStateDescription(undefined)

        // Test accessibilityStateDescription with empty string parameter
        Text('Text accessibilityStateDescription empty string')
          .width('100%')
          .height('5%')
          .id('text_accessibilityStateDescription_empty')
          .maxLines(1)
          .accessibilityStateDescription('')

        // Test accessibilityStateDescription with valid string parameter
        Text('Text accessibilityStateDescription valid string')
          .width('100%')
          .height('5%')
          .id('text_accessibilityStateDescription_valid_string')
          .maxLines(1)
          .accessibilityStateDescription('state description')
      }
      .width('100%')
    }
    .width('100%')
    .height('100%')
  }
}
