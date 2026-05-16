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
struct TextTextVerticalAlignContentAlign {
  build() {
    Column({ space: 2 }) {
      Text('Text textVerticalAlign & textContentAlign Null/Undefined Test')
        .fontSize(24)
        .fontWeight(FontWeight.Bold)
        .height('3%')

      // ==================== textVerticalAlign null/undefined tests ====================
      Text('textVerticalAlign Tests')
        .fontSize(18)
        .fontWeight(FontWeight.Medium)
        .height('3%')

      Row() {
        // Test 1: textVerticalAlign with null parameter
        Text('textVerticalAlign with null\nThis is a multiline text\nto test textVerticalAlign effect')
          .id('text_textVerticalAlign_null')
          .textVerticalAlign(null)
          .height('5%')

        // Test 2: textVerticalAlign with undefined parameter
        Text('textVerticalAlign with undefined\nThis is a multiline text\nto test textVerticalAlign effect')
          .id('text_textVerticalAlign_undefined')
          .textVerticalAlign(undefined)
          .height('5%')

        // Test 3: Default textVerticalAlign for comparison
        Text('Default textVerticalAlign (for comparison)\nThis is a multiline text\nto test textVerticalAlign effect')
          .id('text_textVerticalAlign_default')
          .height('5%')
      }

      // ==================== textContentAlign null/undefined tests ====================
      Text('textContentAlign Tests')
        .fontSize(18)
        .fontWeight(FontWeight.Medium)
        .height('3%')

      Row() {
        // Test 4: textContentAlign with null parameter
        Text('textContentAlign with null\nThis is a multiline text\nto test textContentAlign effect')
          .id('text_textContentAlign_null')
          .textContentAlign(null)
          .height('5%')

        // Test 5: textContentAlign with undefined parameter
        Text('textContentAlign with undefined\nThis is a multiline text\nto test textContentAlign effect')
          .id('text_textContentAlign_undefined')
          .textContentAlign(undefined)
          .height('5%')

        // Test 6: Default textContentAlign for comparison
        Text('Default textContentAlign (for comparison)\nThis is a multiline text\nto test textContentAlign effect')
          .id('text_textContentAlign_default')
          .height('5%')
      }
    }
    .width('100%')
    .height('100%')
    .backgroundColor('#F5F5F5')
  }
}
