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
 * TextPicker DisappearTextStyle Test Page
 * 测试TextPicker组件的disappearTextStyle属性
 */
@Entry
@Component
struct TextPickerDisappearTextStyleNullUndefined {
  build() {
    Row() {
      Column() {
        Text('TextPicker DisappearTextStyle Test')
          .fontSize(24)
          .fontWeight(FontWeight.Bold)
          .margin({ top: 20, bottom: 20 })

        // Test 1: normal value - full PickerTextStyle with color and font
        Text('Test 1: disappearTextStyle - full PickerTextStyle')
          .fontSize(16)
          .margin({ top: 10 })
        TextPicker({
          range: ['A', 'B', 'C', 'D', 'E']
        })
          .id('textPicker_disappearTextStyle_full')
          .disappearTextStyle({
            color: '#FF0000',
            font: { size: 18, weight: FontWeight.Bold }
          })
          .height('8%')
          .margin({ top: 5, bottom: 5 })

        // Test 2: normal value - only set color
        Text('Test 2: disappearTextStyle - only color')
          .fontSize(16)
          .margin({ top: 10 })
        TextPicker({
          range: ['A', 'B', 'C', 'D', 'E']
        })
          .id('textPicker_disappearTextStyle_color_only')
          .disappearTextStyle({ color: '#00FF00' })
          .height('8%')
          .margin({ top: 5, bottom: 5 })

        // Test 3: normal value - only set font size
        Text('Test 3: disappearTextStyle - only font size')
          .fontSize(16)
          .margin({ top: 10 })
        TextPicker({
          range: ['A', 'B', 'C', 'D', 'E']
        })
          .id('textPicker_disappearTextStyle_font_size_only')
          .disappearTextStyle({ font: { size: 20 } })
          .height('8%')
          .margin({ top: 5, bottom: 5 })

        // Test 4: normal value - only set font weight
        Text('Test 4: disappearTextStyle - only font weight')
          .fontSize(16)
          .margin({ top: 10 })
        TextPicker({
          range: ['A', 'B', 'C', 'D', 'E']
        })
          .id('textPicker_disappearTextStyle_font_weight_only')
          .disappearTextStyle({ font: { weight: FontWeight.Medium } })
          .height('8%')
          .margin({ top: 5, bottom: 5 })

        // Test 5: normal value - different color values
        Text('Test 5: disappearTextStyle - color Blue')
          .fontSize(16)
          .margin({ top: 10 })
        TextPicker({
          range: ['A', 'B', 'C', 'D', 'E']
        })
          .id('textPicker_disappearTextStyle_color_blue')
          .disappearTextStyle({ color: Color.Blue })
          .height('8%')
          .margin({ top: 5, bottom: 5 })

        // Test 6: normal value - font weight as number
        Text('Test 6: disappearTextStyle - font weight as number')
          .fontSize(16)
          .margin({ top: 10 })
        TextPicker({
          range: ['A', 'B', 'C', 'D', 'E']
        })
          .id('textPicker_disappearTextStyle_weight_number')
          .disappearTextStyle({ font: { weight: 700 } })
          .height('8%')
          .margin({ top: 5, bottom: 5 })

        // Test 7: normal value - font size as string
        Text('Test 7: disappearTextStyle - font size as string')
          .fontSize(16)
          .margin({ top: 10 })
        TextPicker({
          range: ['A', 'B', 'C', 'D', 'E']
        })
          .id('textPicker_disappearTextStyle_size_string')
          .disappearTextStyle({ font: { size: '16fp' } })
          .height('8%')
          .margin({ top: 5, bottom: 5 })

        // Test 8: empty object
        Text('Test 8: disappearTextStyle - empty object {}')
          .fontSize(16)
          .margin({ top: 10 })
        TextPicker({
          range: ['A', 'B', 'C', 'D', 'E']
        })
          .id('textPicker_disappearTextStyle_empty_object')
          .disappearTextStyle({} as PickerTextStyle)
          .height('8%')
          .margin({ top: 5, bottom: 5 })

        // Test 9: null parameter
        Text('Test 9: disappearTextStyle = null (should restore to default)')
          .fontSize(16)
          .margin({ top: 10 })
        TextPicker({
          range: ['A', 'B', 'C', 'D', 'E']
        })
          .id('textPicker_disappearTextStyle_null')
          .disappearTextStyle(null)
          .height('8%')
          .margin({ top: 5, bottom: 5 })

        // Test 10: undefined parameter
        Text('Test 10: disappearTextStyle = undefined (should use default)')
          .fontSize(16)
          .margin({ top: 10 })
        TextPicker({
          range: ['A', 'B', 'C', 'D', 'E']
        })
          .id('textPicker_disappearTextStyle_undefined')
          .disappearTextStyle(undefined)
          .height('8%')
          .margin({ top: 5, bottom: 5 })

        // Test 11: default value (no disappearTextStyle set)
        Text('Test 11: default value (no disappearTextStyle set)')
          .fontSize(16)
          .margin({ top: 10 })
        TextPicker({
          range: ['A', 'B', 'C', 'D', 'E']
        })
          .id('textPicker_disappearTextStyle_default')
          .height('8%')
          .margin({ top: 5, bottom: 5 })

        // Test 12: normal value - color as string with different format
        Text('Test 12: disappearTextStyle - color as short hex #F00')
          .fontSize(16)
          .margin({ top: 10 })
        TextPicker({
          range: ['A', 'B', 'C', 'D', 'E']
        })
          .id('textPicker_disappearTextStyle_color_hex_short')
          .disappearTextStyle({ color: '#F00' })
          .height('8%')
          .margin({ top: 5, bottom: 5 })

        // Test 13: normal value - color with alpha
        Text('Test 13: disappearTextStyle - color with alpha #80FF0000')
          .fontSize(16)
          .margin({ top: 10 })
        TextPicker({
          range: ['A', 'B', 'C', 'D', 'E']
        })
          .id('textPicker_disappearTextStyle_color_alpha')
          .disappearTextStyle({ color: '#80FF0000' })
          .height('8%')
          .margin({ top: 5, bottom: 5 })
      }
      .width('100%')
    }
    .height('100%')
  }
}
