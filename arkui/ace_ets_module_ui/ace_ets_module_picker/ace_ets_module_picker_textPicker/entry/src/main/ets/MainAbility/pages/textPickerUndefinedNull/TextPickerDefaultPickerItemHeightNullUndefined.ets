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

/**
 * TextPicker DefaultPickerItemHeight Test Page
 * 测试TextPicker组件的defaultPickerItemHeight属性
 */
@Entry
@Component
struct TextPickerDefaultPickerItemHeightNullUndefined {
  build() {
    Row() {
      Column() {
        Text('TextPicker DefaultPickerItemHeight Test')
          .fontSize(24)
          .fontWeight(FontWeight.Bold)
          .margin({ top: 20, bottom: 20 })

        // Test 1: normal value - number 50
        Text('Test 1: defaultPickerItemHeight = 50 (number)')
          .fontSize(16)
          .margin({ top: 10 })
        TextPicker({
          range: ['A', 'B', 'C', 'D', 'E']
        })
          .id('textPicker_defaultPickerItemHeight_50_number')
          .defaultPickerItemHeight(50)
          .height('8%')
          .margin({ top: 5, bottom: 5 })

        // Test 2: normal value - number 100
        Text('Test 2: defaultPickerItemHeight = 100 (number)')
          .fontSize(16)
          .margin({ top: 10 })
        TextPicker({
          range: ['A', 'B', 'C', 'D', 'E']
        })
          .id('textPicker_defaultPickerItemHeight_100_number')
          .defaultPickerItemHeight(100)
          .height('10%')
          .margin({ top: 5, bottom: 5 })

        // Test 3: normal value - string "50"
        Text('Test 3: defaultPickerItemHeight = "50" (string)')
          .fontSize(16)
          .margin({ top: 10 })
        TextPicker({
          range: ['A', 'B', 'C', 'D', 'E']
        })
          .id('textPicker_defaultPickerItemHeight_50_string')
          .defaultPickerItemHeight('50')
          .height('8%')
          .margin({ top: 5, bottom: 5 })

        // Test 4: normal value - string "100"
        Text('Test 4: defaultPickerItemHeight = "100" (string)')
          .fontSize(16)
          .margin({ top: 10 })
        TextPicker({
          range: ['A', 'B', 'C', 'D', 'E']
        })
          .id('textPicker_defaultPickerItemHeight_100_string')
          .defaultPickerItemHeight('100')
          .height('10%')
          .margin({ top: 5, bottom: 5 })

        // Test 5: boundary value - number 0
        Text('Test 5: defaultPickerItemHeight = 0 (boundary)')
          .fontSize(16)
          .margin({ top: 10 })
        TextPicker({
          range: ['A', 'B', 'C', 'D', 'E']
        })
          .id('textPicker_defaultPickerItemHeight_0')
          .defaultPickerItemHeight(0)
          .height('5%')
          .margin({ top: 5, bottom: 5 })

        // Test 6: empty string ''
        Text('Test 6: defaultPickerItemHeight = "" (empty string)')
          .fontSize(16)
          .margin({ top: 10 })
        TextPicker({
          range: ['A', 'B', 'C', 'D', 'E']
        })
          .id('textPicker_defaultPickerItemHeight_empty_string')
          .defaultPickerItemHeight('')
          .height('8%')
          .margin({ top: 5, bottom: 5 })

        // Test 7: null parameter
        Text('Test 7: defaultPickerItemHeight = null (should restore to default)')
          .fontSize(16)
          .margin({ top: 10 })
        TextPicker({
          range: ['A', 'B', 'C', 'D', 'E']
        })
          .id('textPicker_defaultPickerItemHeight_null')
          .defaultPickerItemHeight(null)
          .height('8%')
          .margin({ top: 5, bottom: 5 })

        // Test 8: undefined parameter
        Text('Test 8: defaultPickerItemHeight = undefined (should maintain previous value)')
          .fontSize(16)
          .margin({ top: 10 })
        TextPicker({
          range: ['A', 'B', 'C', 'D', 'E']
        })
          .id('textPicker_defaultPickerItemHeight_undefined')
          .defaultPickerItemHeight(undefined)
          .height('8%')
          .margin({ top: 5, bottom: 5 })

        // Test 9: default value (no defaultPickerItemHeight set)
        Text('Test 9: default value (selected 56vp, unselected 36vp)')
          .fontSize(16)
          .margin({ top: 10 })
        TextPicker({
          range: ['A', 'B', 'C', 'D', 'E']
        })
          .id('textPicker_defaultPickerItemHeight_default')
          .height('8%')
          .margin({ top: 5, bottom: 5 })

        // Test 10: normal value - number 36 (same as unselected default)
        Text('Test 10: defaultPickerItemHeight = 36 (number)')
          .fontSize(16)
          .margin({ top: 10 })
        TextPicker({
          range: ['A', 'B', 'C', 'D', 'E']
        })
          .id('textPicker_defaultPickerItemHeight_36_number')
          .defaultPickerItemHeight(36)
          .height('6%')
          .margin({ top: 5, bottom: 5 })

        // Test 11: normal value - string "36"
        Text('Test 11: defaultPickerItemHeight = "36" (string)')
          .fontSize(16)
          .margin({ top: 10 })
        TextPicker({
          range: ['A', 'B', 'C', 'D', 'E']
        })
          .id('textPicker_defaultPickerItemHeight_36_string')
          .defaultPickerItemHeight('36')
          .height('6%')
          .margin({ top: 5, bottom: 5 })

        // Test 12: normal value - number 56 (same as selected default)
        Text('Test 12: defaultPickerItemHeight = 56 (number)')
          .fontSize(16)
          .margin({ top: 10 })
        TextPicker({
          range: ['A', 'B', 'C', 'D', 'E']
        })
          .id('textPicker_defaultPickerItemHeight_56_number')
          .defaultPickerItemHeight(56)
          .height('8%')
          .margin({ top: 5, bottom: 5 })

        // Test 13: normal value - string "56"
        Text('Test 13: defaultPickerItemHeight = "56" (string)')
          .fontSize(16)
          .margin({ top: 10 })
        TextPicker({
          range: ['A', 'B', 'C', 'D', 'E']
        })
          .id('textPicker_defaultPickerItemHeight_56_string')
          .defaultPickerItemHeight('56')
          .height('8%')
          .margin({ top: 5, bottom: 5 })
      }
      .width('100%')
    }
    .height('100%')
  }
}
