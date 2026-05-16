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
struct TextSpecialOptionsNull {
  build() {
    Column({ space: 2 }) {
      Row(){
        // Test 1: dataDetectorConfig with null parameter
        Text('dataDetectorConfig with null')
          .id('text_dataDetectorConfig_null')
          .dataDetectorConfig(null)
          .height('5%')

        // Test 2: dataDetectorConfig with undefined parameter
        Text('dataDetectorConfig with undefined')
          .id('text_dataDetectorConfig_undefined')
          .dataDetectorConfig(undefined)
          .height('5%')
      }

      Row(){
        // Test 3: enableSelectedDataDetector with null parameter
        Text('enableSelectedDataDetector with null')
          .id('text_enableSelectedDataDetector_null')
          .enableSelectedDataDetector(null)
          .height('5%')

        // Test 4: enableSelectedDataDetector with undefined parameter
        Text('enableSelectedDataDetector with undefined')
          .id('text_enableSelectedDataDetector_undefined')
          .enableSelectedDataDetector(undefined)
          .height('5%')
      }

      Row(){
        // Test 6: textSelectable with null parameter
        Text('textSelectable with null')
          .id('text_textSelectable_null')
          .textSelectable(null)
          .height('5%')

        // Test 7: textSelectable with undefined parameter
        Text('textSelectable with undefined')
          .id('text_textSelectable_undefined')
          .textSelectable(undefined)
          .height('5%')
      }

      Row() {
        // Test 8: marqueeOptions with null parameter
        Text('marqueeOptions with null')
          .id('text_marqueeOptions_null')
          .marqueeOptions(null)
          .height('5%')

        // Test 9: marqueeOptions with undefined parameter
        Text('marqueeOptions with undefined')
          .id('text_marqueeOptions_undefined')
          .marqueeOptions(undefined)
          .height('5%')
      }

      Row() {
        // Test 10: editMenuOptions with null parameter
        Text('editMenuOptions with null')
          .id('text_editMenuOptions_null')
          .editMenuOptions(null)
          .height('5%')

        // Test 11: editMenuOptions with undefined parameter
        Text('editMenuOptions with undefined')
          .id('text_editMenuOptions_undefined')
          .editMenuOptions(undefined)
          .height('5%')
      }

      // Test 12: Default values for comparison
      Text('Default (for comparison)')
        .id('text_specialOptions_default')
        .height('5%')
    }
    .width('100%')
    .height('100%')
    .backgroundColor('#F5F5F5')
  }
}
