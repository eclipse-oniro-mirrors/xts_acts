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
struct TextFontStyleLineSpacingNull {
  build() {
    Column({ space: 2 }) {
      Text('Text FontStyle & LineSpacing Null/Undefined Test')
        .fontSize(24)
        .fontWeight(FontWeight.Bold)
        .height('5%')

      // ==================== fontStyle null/undefined tests ====================
      Text('fontStyle Tests')
        .fontSize(18)
        .fontWeight(FontWeight.Medium)
        .height('5%')

      Row(){
        // Test 1: fontStyle with null parameter
        Text('fontStyle with null')
          .id('text_fontStyle_null')
          .fontStyle(null)
          .height('5%')

        // Test 2: fontStyle with undefined parameter
        Text('fontStyle with undefined')
          .id('text_fontStyle_undefined')
          .fontStyle(undefined)
          .height('5%')

        // Test 3: Default fontStyle for comparison
        Text('Default fontStyle (for comparison)')
          .id('text_fontStyle_default')
          .height('5%')
      }

      // ==================== lineSpacing null/undefined tests ====================
      Text('lineSpacing Tests')
        .fontSize(18)
        .fontWeight(FontWeight.Medium)
        .height('5%')

      Row() {
        // Test 4: lineSpacing with null parameter
        Text('lineSpacing with null\nThis is a multiline text\nto test line spacing effect')
          .id('text_lineSpacing_null')
          .lineSpacing(null)
          .height('5%')

        // Test 5: lineSpacing with undefined parameter
        Text('lineSpacing with undefined\nThis is a multiline text\nto test line spacing effect')
          .id('text_lineSpacing_undefined')
          .lineSpacing(undefined)
          .height('5%')

        // Test 6: Default lineSpacing for comparison
        Text('Default lineSpacing (for comparison)\nThis is a multiline text\nto test line spacing effect')
          .id('text_lineSpacing_default')
          .height('5%')
      }
    }
    .width('100%')
    .height('100%')
    .backgroundColor('#F5F5F5')
  }
}
