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
 * TextPicker SelectedTextStyle Test Page
 * 测试TextPicker组件的selectedTextStyle属性
 */
@Entry
@Component
struct TextPickerSelectedTextStyleNullUndefined {
  build() {
    Row() {
      Column() {
        Text('TextPicker SelectedTextStyle Test')
          .fontSize(24)
          .fontWeight(FontWeight.Bold)
          .margin({ top: 20, bottom: 20 })

        // Test 1: normal value - full PickerTextStyle with color and font
        Text('Test 1: selectedTextStyle - full PickerTextStyle')
          .fontSize(16)
          .margin({ top: 10 })
        TextPicker({
          range: ['A', 'B', 'C', 'D', 'E']
        })
          .id('textPicker_selectedTextStyle_full')
          .selectedTextStyle({
            color: '#FF0000',
            font: { size: 24, weight: FontWeight.Bold }
          })
          .height('8%')
          .margin({ top: 5, bottom: 5 })

        // Test 2: normal value - only set color
        Text('Test 2: selectedTextStyle - only color')
          .fontSize(16)
          .margin({ top: 10 })
        TextPicker({
          range: ['A', 'B', 'C', 'D', 'E']
        })
          .id('textPicker_selectedTextStyle_color_only')
          .selectedTextStyle({ color: '#00FF00' })
          .height('8%')
          .margin({ top: 5, bottom: 5 })

        // Test 3: normal value - only set font size
        Text('Test 3: selectedTextStyle - only font size')
          .fontSize(16)
          .margin({ top: 10 })
        TextPicker({
          range: ['A', 'B', 'C', 'D', 'E']
        })
          .id('textPicker_selectedTextStyle_font_size_only')
          .selectedTextStyle({ font: { size: 28 } })
          .height('8%')
          .margin({ top: 5, bottom: 5 })

        // Test 4: normal value - only set font weight
        Text('Test 4: selectedTextStyle - only font weight')
          .fontSize(16)
          .margin({ top: 10 })
        TextPicker({
          range: ['A', 'B', 'C', 'D', 'E']
        })
          .id('textPicker_selectedTextStyle_font_weight_only')
          .selectedTextStyle({ font: { weight: FontWeight.Medium } })
          .height('8%')
          .margin({ top: 5, bottom: 5 })

        // Test 5: normal value - different color values
        Text('Test 5: selectedTextStyle - color Orange')
          .fontSize(16)
          .margin({ top: 10 })
        TextPicker({
          range: ['A', 'B', 'C', 'D', 'E']
        })
          .id('textPicker_selectedTextStyle_color_orange')
          .selectedTextStyle({ color: Color.Orange })
          .height('8%')
          .margin({ top: 5, bottom: 5 })

        // Test 6: normal value - font weight as number
        Text('Test 6: selectedTextStyle - font weight as number')
          .fontSize(16)
          .margin({ top: 10 })
        TextPicker({
          range: ['A', 'B', 'C', 'D', 'E']
        })
          .id('textPicker_selectedTextStyle_weight_number')
          .selectedTextStyle({ font: { weight: 800 } })
          .height('8%')
          .margin({ top: 5, bottom: 5 })

        // Test 7: normal value - font size as string
        Text('Test 7: selectedTextStyle - font size as string')
          .fontSize(16)
          .margin({ top: 10 })
        TextPicker({
          range: ['A', 'B', 'C', 'D', 'E']
        })
          .id('textPicker_selectedTextStyle_size_string')
          .selectedTextStyle({ font: { size: '22fp' } })
          .height('8%')
          .margin({ top: 5, bottom: 5 })

        // Test 8: empty object
        Text('Test 8: selectedTextStyle - empty object {}')
          .fontSize(16)
          .margin({ top: 10 })
        TextPicker({
          range: ['A', 'B', 'C', 'D', 'E']
        })
          .id('textPicker_selectedTextStyle_empty_object')
          .selectedTextStyle({} as PickerTextStyle)
          .height('8%')
          .margin({ top: 5, bottom: 5 })

        // Test 9: null parameter
        Text('Test 9: selectedTextStyle = null (should restore to default)')
          .fontSize(16)
          .margin({ top: 10 })
        TextPicker({
          range: ['A', 'B', 'C', 'D', 'E']
        })
          .id('textPicker_selectedTextStyle_null')
          .selectedTextStyle(null)
          .height('8%')
          .margin({ top: 5, bottom: 5 })

        // Test 10: undefined parameter
        Text('Test 10: selectedTextStyle = undefined (should use default)')
          .fontSize(16)
          .margin({ top: 10 })
        TextPicker({
          range: ['A', 'B', 'C', 'D', 'E']
        })
          .id('textPicker_selectedTextStyle_undefined')
          .selectedTextStyle(undefined)
          .height('8%')
          .margin({ top: 5, bottom: 5 })

        // Test 11: default value (no selectedTextStyle set)
        Text('Test 11: default value (no selectedTextStyle set)')
          .fontSize(16)
          .margin({ top: 10 })
        TextPicker({
          range: ['A', 'B', 'C', 'D', 'E']
        })
          .id('textPicker_selectedTextStyle_default')
          .height('8%')
          .margin({ top: 5, bottom: 5 })

        // Test 12: normal value - color as string with different format
        Text('Test 12: selectedTextStyle - color as short hex #00F')
          .fontSize(16)
          .margin({ top: 10 })
        TextPicker({
          range: ['A', 'B', 'C', 'D', 'E']
        })
          .id('textPicker_selectedTextStyle_color_hex_short')
          .selectedTextStyle({ color: '#00F' })
          .height('8%')
          .margin({ top: 5, bottom: 5 })

        // Test 13: normal value - color with alpha
        Text('Test 13: selectedTextStyle - color with alpha #CC0000FF')
          .fontSize(16)
          .margin({ top: 10 })
        TextPicker({
          range: ['A', 'B', 'C', 'D', 'E']
        })
          .id('textPicker_selectedTextStyle_color_alpha')
          .selectedTextStyle({ color: '#CC0000FF' })
          .height('8%')
          .margin({ top: 5, bottom: 5 })

        // Test 14: normal value - font weight as string
        Text('Test 14: selectedTextStyle - font weight as string')
          .fontSize(16)
          .margin({ top: 10 })
        TextPicker({
          range: ['A', 'B', 'C', 'D', 'E']
        })
          .id('textPicker_selectedTextStyle_weight_string')
          .selectedTextStyle({ font: { weight: '900' } })
          .height('8%')
          .margin({ top: 5, bottom: 5 })
      }
      .width('100%')
    }
    .height('100%')
  }
}
