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
struct TextFontNull {
  build() {
    Column({ space: 2 }) {
      Row(){
        Text('Text Font Test')
          .fontSize(24)
          .fontWeight(FontWeight.Bold)
          .height('5%')

        // Test 1: font(Font) with null parameter
        Text('font(Font) with null')
          .id('text_font_null')
          .font(null)
          .height('5%')

        // Test 2: font(Font) with undefined parameter
        Text('font(Font) with undefined')
          .id('text_font_undefined')
          .font(undefined)
          .height('5%')
      }

      Row() {
        // Test 3: font(Font, options?) with null fontValue
        Text('font(Font, options?) with null fontValue')
          .id('text_font_withoptions_null')
          .font(null, null)
          .height('5%')

        // Test 4: font(Font, options?) with undefined fontValue
        Text('font(Font, options?) with undefined fontValue')
          .id('text_font_withoptions_undefined')
          .font(undefined, undefined)
          .height('5%')

        // Test 5: Default font for comparison
        Text('Default font (for comparison)')
          .id('text_font_default')
          .height('5%')
      }
    }
    .width('100%')
    .height('100%')
    .backgroundColor('#F5F5F5')
  }
}