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
struct TextLineHeightMultipleLineSpacing {
  build() {
    Column({ space: 2 }) {
      Text('Text LineHeightMultiple & LineSpacing Null/Undefined Test')
        .fontSize(24)
        .fontWeight(FontWeight.Bold)
        .height('3%')

      // ==================== lineHeightMultiple null/undefined tests ====================
      Text('lineHeightMultiple Tests')
        .fontSize(18)
        .fontWeight(FontWeight.Medium)
        .height('3%')

      Row(){
        // Test 1: lineHeightMultiple with null parameter
        Text('lineHeightMultiple with null\nThis is a multiline text\nto test lineHeightMultiple effect')
          .id('text_lineHeightMultiple_null')
          .lineHeightMultiple(null)
          .height('5%')

        // Test 2: lineHeightMultiple with undefined parameter
        Text('lineHeightMultiple with undefined\nThis is a multiline text\nto test lineHeightMultiple effect')
          .id('text_lineHeightMultiple_undefined')
          .lineHeightMultiple(undefined)
          .height('5%')

        // Test 3: Default lineHeightMultiple for comparison
        Text('Default lineHeightMultiple (for comparison)\nThis is a multiline text\nto test lineHeightMultiple effect')
          .id('text_lineHeightMultiple_default')
          .height('5%')
      }

      // ==================== lineSpacing(value, options?) null/undefined tests ====================
      Text('lineSpacing(value, options?) Tests')
        .fontSize(18)
        .fontWeight(FontWeight.Medium)
        .height('3%')

      Row(){
        // Test 4: lineSpacing(value) with null value
        Text('lineSpacing(null) with null value\nThis is a multiline text\nto test lineSpacing effect')
          .id('text_lineSpacing_value_null')
          .lineSpacing(null)
          .height('5%')

        // Test 5: lineSpacing(value) with undefined value
        Text('lineSpacing(undefined) with undefined value\nThis is a multiline text\nto test lineSpacing effect')
          .id('text_lineSpacing_value_undefined')
          .lineSpacing(undefined)
          .height('5%')

        // Test 6: lineSpacing(value, options?) with null value and empty options
        Text('lineSpacing(null, {}) with null value and empty options\nThis is a multiline text\nto test lineSpacing effect')
          .id('text_lineSpacing_value_null_options_empty')
          .lineSpacing(null, {})
          .height('5%')
      }

      Row(){
        // Test 7: lineSpacing(value, options?) with undefined value and empty options
        Text('lineSpacing(undefined, {}) with undefined value and empty options\nThis is a multiline text\nto test lineSpacing effect')
          .id('text_lineSpacing_value_undefined_options_empty')
          .lineSpacing(undefined, {})
          .height('5%')

        // Test 8: lineSpacing(value, options?) with null value and null options
        Text('lineSpacing(null, null) with null value and null options\nThis is a multiline text\nto test lineSpacing effect')
          .id('text_lineSpacing_value_null_options_null')
          .lineSpacing(null, null)
          .height('5%')

        // Test 9: lineSpacing(value, options?) with undefined value and undefined options
        Text('lineSpacing(undefined, undefined) with undefined value and undefined options\nThis is a multiline text\nto test lineSpacing effect')
          .id('text_lineSpacing_value_undefined_options_undefined')
          .lineSpacing(undefined, undefined)
          .height('5%')
      }

      // Test 10: Default lineSpacing for comparison
      Text('Default lineSpacing (for comparison)\nThis is a multiline text\nto test lineSpacing effect')
        .id('text_lineSpacing_default')
        .height('5%')
    }
    .width('100%')
    .height('100%')
    .backgroundColor('#F5F5F5')
  }
}
