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
 * TextPicker TextStyle Test Page
 * 测试TextPicker组件的textStyle属性
 */
@Entry
@Component
struct TextPickerTextStyleNullUndefined {
  build() {
    Row() {
      Column() {
        Text('TextPicker TextStyle Test')
          .fontSize(24)
          .fontWeight(FontWeight.Bold)
          .margin({ top: 20, bottom: 20 })

        // Test 1: normal value - full PickerTextStyle with color and font
        Text('Test 1: textStyle - full PickerTextStyle')
          .fontSize(16)
          .margin({ top: 10 })
        TextPicker({
          range: ['A', 'B', 'C', 'D', 'E']
        })
          .id('textPicker_textStyle_full')
          .textStyle({
            color: '#FF0000',
            font: { size: 20, weight: FontWeight.Bold }
          })
          .height('8%')
          .margin({ top: 5, bottom: 5 })

        // Test 2: normal value - only set color
        Text('Test 2: textStyle - only color')
          .fontSize(16)
          .margin({ top: 10 })
        TextPicker({
          range: ['A', 'B', 'C', 'D', 'E']
        })
          .id('textPicker_textStyle_color_only')
          .textStyle({ color: '#00FF00' })
          .height('8%')
          .margin({ top: 5, bottom: 5 })

        // Test 3: normal value - only set font size
        Text('Test 3: textStyle - only font size')
          .fontSize(16)
          .margin({ top: 10 })
        TextPicker({
          range: ['A', 'B', 'C', 'D', 'E']
        })
          .id('textPicker_textStyle_font_size_only')
          .textStyle({ font: { size: 22 } })
          .height('8%')
          .margin({ top: 5, bottom: 5 })

        // Test 4: normal value - only set font weight
        Text('Test 4: textStyle - only font weight')
          .fontSize(16)
          .margin({ top: 10 })
        TextPicker({
          range: ['A', 'B', 'C', 'D', 'E']
        })
          .id('textPicker_textStyle_font_weight_only')
          .textStyle({ font: { weight: FontWeight.Medium } })
          .height('8%')
          .margin({ top: 5, bottom: 5 })

        // Test 5: normal value - different color values
        Text('Test 5: textStyle - color Red')
          .fontSize(16)
          .margin({ top: 10 })
        TextPicker({
          range: ['A', 'B', 'C', 'D', 'E']
        })
          .id('textPicker_textStyle_color_red')
          .textStyle({ color: Color.Red })
          .height('8%')
          .margin({ top: 5, bottom: 5 })

        // Test 6: normal value - font weight as number
        Text('Test 6: textStyle - font weight as number')
          .fontSize(16)
          .margin({ top: 10 })
        TextPicker({
          range: ['A', 'B', 'C', 'D', 'E']
        })
          .id('textPicker_textStyle_weight_number')
          .textStyle({ font: { weight: 600 } })
          .height('8%')
          .margin({ top: 5, bottom: 5 })

        // Test 7: normal value - font size as string
        Text('Test 7: textStyle - font size as string')
          .fontSize(16)
          .margin({ top: 10 })
        TextPicker({
          range: ['A', 'B', 'C', 'D', 'E']
        })
          .id('textPicker_textStyle_size_string')
          .textStyle({ font: { size: '18fp' } })
          .height('8%')
          .margin({ top: 5, bottom: 5 })

        // Test 8: empty object
        Text('Test 8: textStyle - empty object {}')
          .fontSize(16)
          .margin({ top: 10 })
        TextPicker({
          range: ['A', 'B', 'C', 'D', 'E']
        })
          .id('textPicker_textStyle_empty_object')
          .textStyle({} as PickerTextStyle)
          .height('8%')
          .margin({ top: 5, bottom: 5 })

        // Test 9: null parameter
        Text('Test 9: textStyle = null (should restore to default)')
          .fontSize(16)
          .margin({ top: 10 })
        TextPicker({
          range: ['A', 'B', 'C', 'D', 'E']
        })
          .id('textPicker_textStyle_null')
          .textStyle(null)
          .height('8%')
          .margin({ top: 5, bottom: 5 })

        // Test 10: undefined parameter
        Text('Test 10: textStyle = undefined (should use default)')
          .fontSize(16)
          .margin({ top: 10 })
        TextPicker({
          range: ['A', 'B', 'C', 'D', 'E']
        })
          .id('textPicker_textStyle_undefined')
          .textStyle(undefined)
          .height('8%')
          .margin({ top: 5, bottom: 5 })

        // Test 11: default value (no textStyle set)
        Text('Test 11: default value (no textStyle set)')
          .fontSize(16)
          .margin({ top: 10 })
        TextPicker({
          range: ['A', 'B', 'C', 'D', 'E']
        })
          .id('textPicker_textStyle_default')
          .height('8%')
          .margin({ top: 5, bottom: 5 })

        // Test 12: normal value - color as string with different format
        Text('Test 12: textStyle - color as short hex #0F0')
          .fontSize(16)
          .margin({ top: 10 })
        TextPicker({
          range: ['A', 'B', 'C', 'D', 'E']
        })
          .id('textPicker_textStyle_color_hex_short')
          .textStyle({ color: '#0F0' })
          .height('8%')
          .margin({ top: 5, bottom: 5 })

        // Test 13: normal value - color with alpha
        Text('Test 13: textStyle - color with alpha #8000FF00')
          .fontSize(16)
          .margin({ top: 10 })
        TextPicker({
          range: ['A', 'B', 'C', 'D', 'E']
        })
          .id('textPicker_textStyle_color_alpha')
          .textStyle({ color: '#8000FF00' })
          .height('8%')
          .margin({ top: 5, bottom: 5 })

        // Test 14: normal value - font weight as string
        Text('Test 14: textStyle - font weight as string')
          .fontSize(16)
          .margin({ top: 10 })
        TextPicker({
          range: ['A', 'B', 'C', 'D', 'E']
        })
          .id('textPicker_textStyle_weight_string')
          .textStyle({ font: { weight: '700' } })
          .height('8%')
          .margin({ top: 5, bottom: 5 })
      }
      .width('100%')
    }
    .height('100%')
  }
}
