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
struct TextMinMaxFontSize {
  build() {
    Column({ space: 2 }) {
      Row(){
        Text('Text MinFontSize & MaxFontSize Test')
        .fontSize(24)
        .fontWeight(FontWeight.Bold)
        .height('5%')

      // Test 1: minFontSize with null parameter
      Text('minFontSize with null')
        .id('text_minsize_null')
        .minFontSize(null)
        .height('5%')

      // Test 2: minFontSize with undefined parameter
      Text('minFontSize with undefined')
        .id('text_minsize_undefined')
        .minFontSize(undefined)
        .height('5%')
      }
      
      Row(){
        // Test 3: minFontSize with empty string parameter
        Text('minFontSize with empty string')
          .id('text_minsize_empty')
          .minFontSize('')
          .height('5%')

        // Test 4: maxFontSize with null parameter
        Text('maxFontSize with null')
          .id('text_maxsize_null')
          .maxFontSize(null)
          .height('5%')

        // Test 5: maxFontSize with undefined parameter
        Text('maxFontSize with undefined')
          .id('text_maxsize_undefined')
          .maxFontSize(undefined)
          .height('5%')
      }

      Row(){
        // Test 6: maxFontSize with empty string parameter
        Text('maxFontSize with empty string')
          .id('text_maxsize_empty')
          .maxFontSize('')
          .height('5%')

        // Test 7: Default minFontSize/maxFontSize for comparison
        Text('Default minFontSize/maxFontSize (for comparison)')
          .id('text_sizing_default')
          .height('5%')
      }
    }
    .width('100%')
    .height('100%')
    .backgroundColor('#F5F5F5')
  }
}