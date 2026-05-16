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
struct TextSpecialAttrsNull {
  controller1: TextController = new TextController();
  controller2: TextController = new TextController();

  build() {
    Column({ space: 2 }) {
      Row() {
        // Test 1: fallbackLineSpacing with null parameter
        Text('fallbackLineSpacing with null')
          .id('text_fallbackLineSpacing_null')
          .fallbackLineSpacing(null)
          .height('5%')

        // Test 2: fallbackLineSpacing with undefined parameter
        Text('fallbackLineSpacing with undefined')
          .id('text_fallbackLineSpacing_undefined')
          .fallbackLineSpacing(undefined)
          .height('5%')
      }

      Row() {
        // Test 3: compressLeadingPunctuation with null parameter
        Text('compressLeadingPunctuation with null')
          .id('text_compressLeadingPunctuation_null')
          .compressLeadingPunctuation(null)
          .height('5%')

        // Test 4: compressLeadingPunctuation with undefined parameter
        Text('compressLeadingPunctuation with undefined')
          .id('text_compressLeadingPunctuation_undefined')
          .compressLeadingPunctuation(undefined)
          .height('5%')
      }

      Row() {
        // Test 5: selectedDragPreviewStyle with null parameter
        Text('selectedDragPreviewStyle with null')
          .id('text_selectedDragPreviewStyle_null')
          .selectedDragPreviewStyle(null)
          .height('5%')

        // Test 6: selectedDragPreviewStyle with undefined parameter
        Text('selectedDragPreviewStyle with undefined')
          .id('text_selectedDragPreviewStyle_undefined')
          .selectedDragPreviewStyle(undefined)
          .height('5%')
      }

      Row() {
        // Test 7: textDirection with null parameter
        Text('textDirection with null')
          .id('text_textDirection_null')
          .textDirection(null)
          .height('5%')

        // Test 8: textDirection with undefined parameter
        Text('textDirection with undefined')
          .id('text_textDirection_undefined')
          .textDirection(undefined)
          .height('5%')
      }

      Row() {
        // Test 9: setStyledString with null parameter
        Text(undefined, { controller: this.controller1 })
          .id('text_setStyledString_null')
          .height('5%')

        // Test 10: setStyledString with undefined parameter
        Text(undefined, { controller: this.controller2 })
          .id('text_setStyledString_undefined')
          .height('5%')
      }

      // Default values for comparison
      Text('Default (for comparison)')
        .id('text_specialAttrs_default')
        .height('5%')
    }
    .width('100%')
    .height('100%')
    .backgroundColor('#F5F5F5')
    .onAppear(() => {
      try {
        this.controller1.setStyledString(null);
      } catch (e) {
        console.info('setStyledString null error: ' + JSON.stringify(e));
      }
      try {
        this.controller2.setStyledString(undefined);
      } catch (e) {
        console.info('setStyledString undefined error: ' + JSON.stringify(e));
      }
    })
  }
}
