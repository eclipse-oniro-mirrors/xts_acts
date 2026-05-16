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
struct AccessibilityTextNullUndefinedTest {
  build() {
    Row() {
      Column() {
        // ========== accessibilityText tests ==========
        // Test accessibilityText default value
        Text('Text accessibilityText default')
          .width('100%')
          .height('5%')
          .id('text_accessibilityText_default')
          .maxLines(1)

        // Test accessibilityText with null parameter
        Text('Text accessibilityText null')
          .width('100%')
          .height('5%')
          .id('text_accessibilityText_null')
          .maxLines(1)
          .accessibilityText(null)

        // Test accessibilityText with undefined parameter
        Text('Text accessibilityText undefined')
          .width('100%')
          .height('5%')
          .id('text_accessibilityText_undefined')
          .maxLines(1)
          .accessibilityText(undefined)

        // Test accessibilityText with empty string parameter
        Text('Text accessibilityText empty string')
          .width('100%')
          .height('5%')
          .id('text_accessibilityText_empty')
          .maxLines(1)
          .accessibilityText('')

        // Test accessibilityText with valid string parameter
        Text('Text accessibilityText valid')
          .width('100%')
          .height('5%')
          .id('text_accessibilityText_valid')
          .maxLines(1)
          .accessibilityText('valid text')

        // ========== accessibilityTextHint tests ==========
        // Test accessibilityTextHint default value
        Text('Text accessibilityTextHint default')
          .width('100%')
          .height('5%')
          .id('text_accessibilityTextHint_default')
          .maxLines(1)

        // Test accessibilityTextHint with null parameter
        Text('Text accessibilityTextHint null')
          .width('100%')
          .height('5%')
          .id('text_accessibilityTextHint_null')
          .maxLines(1)
          .accessibilityTextHint(null)

        // Test accessibilityTextHint with undefined parameter
        Text('Text accessibilityTextHint undefined')
          .width('100%')
          .height('5%')
          .id('text_accessibilityTextHint_undefined')
          .maxLines(1)
          .accessibilityTextHint(undefined)

        // Test accessibilityTextHint with empty string parameter
        Text('Text accessibilityTextHint empty string')
          .width('100%')
          .height('5%')
          .id('text_accessibilityTextHint_empty')
          .maxLines(1)
          .accessibilityTextHint('')

        // Test accessibilityTextHint with valid string parameter
        Text('Text accessibilityTextHint valid')
          .width('100%')
          .height('5%')
          .id('text_accessibilityTextHint_valid')
          .maxLines(1)
          .accessibilityTextHint('hint text')

        // ========== accessibilityDescription tests ==========
        // Test accessibilityDescription default value
        Text('Text accessibilityDescription default')
          .width('100%')
          .height('5%')
          .id('text_accessibilityDescription_default')
          .maxLines(1)

        // Test accessibilityDescription with null parameter
        Text('Text accessibilityDescription null')
          .width('100%')
          .height('5%')
          .id('text_accessibilityDescription_null')
          .maxLines(1)
          .accessibilityDescription(null)

        // Test accessibilityDescription with undefined parameter
        Text('Text accessibilityDescription undefined')
          .width('100%')
          .height('5%')
          .id('text_accessibilityDescription_undefined')
          .maxLines(1)
          .accessibilityDescription(undefined)

        // Test accessibilityDescription with empty string parameter
        Text('Text accessibilityDescription empty string')
          .width('100%')
          .height('5%')
          .id('text_accessibilityDescription_empty')
          .maxLines(1)
          .accessibilityDescription('')

        // Test accessibilityDescription with valid string parameter
        Text('Text accessibilityDescription valid')
          .width('100%')
          .height('5%')
          .id('text_accessibilityDescription_valid')
          .maxLines(1)
          .accessibilityDescription('description')

        // ========== accessibilityNextFocusId tests ==========
        // Test accessibilityNextFocusId default value
        Text('Text accessibilityNextFocusId default')
          .width('100%')
          .height('5%')
          .id('text_accessibilityNextFocusId_default')
          .maxLines(1)

        // Test accessibilityNextFocusId with null parameter
        Text('Text accessibilityNextFocusId null')
          .width('100%')
          .height('5%')
          .id('text_accessibilityNextFocusId_null')
          .maxLines(1)
          .accessibilityNextFocusId(null)

        // Test accessibilityNextFocusId with undefined parameter
        Text('Text accessibilityNextFocusId undefined')
          .width('100%')
          .height('5%')
          .id('text_accessibilityNextFocusId_undefined')
          .maxLines(1)
          .accessibilityNextFocusId(undefined)

        // Test accessibilityNextFocusId with empty string parameter
        Text('Text accessibilityNextFocusId empty string')
          .width('100%')
          .height('5%')
          .id('text_accessibilityNextFocusId_empty')
          .maxLines(1)
          .accessibilityNextFocusId('')

        // Test accessibilityNextFocusId with valid string parameter
        Text('Text accessibilityNextFocusId valid')
          .width('100%')
          .height('5%')
          .id('text_accessibilityNextFocusId_valid')
          .maxLines(1)
          .accessibilityNextFocusId('nextFocusId')

        Text('Text accessibilityNextFocusId valid1')
          .width('100%')
          .height('5%')
          .id('nextFocusId')
          .maxLines(1)
          .accessibilityNextFocusId('nextFocusId')
      }
      .width('100%')
    }
    .height('100%')
  }
}
