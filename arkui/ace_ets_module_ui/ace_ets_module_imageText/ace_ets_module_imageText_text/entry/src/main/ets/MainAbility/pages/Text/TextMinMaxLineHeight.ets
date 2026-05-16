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
struct TextMinMaxLineHeight {
  build() {
    Column({ space: 2 }) {
      Text('Text MinLineHeight & MaxLineHeight Null/Undefined Test')
        .fontSize(24)
        .fontWeight(FontWeight.Bold)
        .height('3%')

      // ==================== minLineHeight null/undefined tests ====================
      Text('minLineHeight Tests')
        .fontSize(18)
        .fontWeight(FontWeight.Medium)
        .height('3%')

      Row() {
        // Test 1: minLineHeight with null parameter
        Text('minLineHeight with null\nThis is a multiline text\nto test minLineHeight effect')
          .id('text_minLineHeight_null')
          .minLineHeight(null)
          .height('5%')

        // Test 2: minLineHeight with undefined parameter
        Text('minLineHeight with undefined\nThis is a multiline text\nto test minLineHeight effect')
          .id('text_minLineHeight_undefined')
          .minLineHeight(undefined)
          .height('5%')

        // Test 3: Default minLineHeight for comparison
        Text('Default minLineHeight\nThis is a multiline text\nto test minLineHeight effect')
          .id('text_minLineHeight_default')
          .height('5%')
      }

      // ==================== maxLineHeight null/undefined tests ====================
      Text('maxLineHeight Tests')
        .fontSize(18)
        .fontWeight(FontWeight.Medium)
        .height('5%')

      Row() {
        // Test 4: maxLineHeight with null parameter
        Text('maxLineHeight with null\nThis is a multiline text\nto test maxLineHeight effect')
          .id('text_maxLineHeight_null')
          .maxLineHeight(null)
          .height('5%')

        // Test 5: maxLineHeight with undefined parameter
        Text('maxLineHeight with undefined\nThis is a multiline text\nto test maxLineHeight effect')
          .id('text_maxLineHeight_undefined')
          .maxLineHeight(undefined)
          .height('5%')

        // Test 6: Default maxLineHeight for comparison
        Text('Default maxLineHeight\nThis is a multiline text\nto test maxLineHeight effect')
          .id('text_maxLineHeight_default')
          .height('5%')
      }
    }
    .width('100%')
    .height('100%')
    .backgroundColor('#F5F5F5')
  }
}
