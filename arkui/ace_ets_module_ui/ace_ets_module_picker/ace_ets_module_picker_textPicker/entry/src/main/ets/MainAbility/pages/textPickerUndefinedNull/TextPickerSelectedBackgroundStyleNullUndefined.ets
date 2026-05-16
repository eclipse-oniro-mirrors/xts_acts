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
 * TextPicker SelectedBackgroundStyle Test Page
 * 测试TextPicker组件的selectedBackgroundStyle属性
 */
import { LengthUnit } from '@kit.ArkUI'

@Entry
@Component
struct TextPickerSelectedBackgroundStyleNullUndefined {
  private singleRange: string[] = ['A', 'B', 'C', 'D', 'E'];
  private multiRange: string[][] = [
    ['A1', 'A2', 'A3'],
    ['B1', 'B2', 'B3'],
    ['C1', 'C2', 'C3']
  ];

  build() {
    Row() {
      Column() {
        Text('TextPicker SelectedBackgroundStyle Test')
          .fontSize(24)
          .fontWeight(FontWeight.Bold)
          .margin({ top: 20, bottom: 20 })

        // Test 1: normal value - full PickerBackgroundStyle with LengthMetrics borderRadius
        Text('Test 1: full PickerBackgroundStyle - LengthMetrics borderRadius')
          .fontSize(16)
          .margin({ top: 10 })
        TextPicker({
          range: this.singleRange
        })
          .id('textPicker_selectedBackgroundStyle_full_lengthMetrics')
          .selectedBackgroundStyle({
            color: '#FFFF0000',
            borderRadius: { value: 10, unit: LengthUnit.VP }
          })
          .height('8%')
          .margin({ top: 5, bottom: 5 })

        // Test 2: normal value - only set color
        Text('Test 2: only set color')
          .fontSize(16)
          .margin({ top: 10 })
        TextPicker({
          range: this.singleRange
        })
          .id('textPicker_selectedBackgroundStyle_color_only')
          .selectedBackgroundStyle({ color: '#FF00FF00' })
          .height('8%')
          .margin({ top: 5, bottom: 5 })

        // Test 3: normal value - only set borderRadius (LengthMetrics)
        Text('Test 3: only set borderRadius (LengthMetrics)')
          .fontSize(16)
          .margin({ top: 10 })
        TextPicker({
          range: this.singleRange
        })
          .id('textPicker_selectedBackgroundStyle_borderRadius_only')
          .selectedBackgroundStyle({
            borderRadius: { value: 15, unit: LengthUnit.VP }
          })
          .height('8%')
          .margin({ top: 5, bottom: 5 })

        // Test 4: normal value - borderRadius (BorderRadiuses type)
        Text('Test 4: borderRadius - BorderRadiuses type')
          .fontSize(16)
          .margin({ top: 10 })
        TextPicker({
          range: this.multiRange
        })
          .id('textPicker_selectedBackgroundStyle_borderRadiuses')
          .selectedBackgroundStyle({
            color: '#FFFFE3F8',
            borderRadius: {
              topLeft: 5,
              topRight: 10,
              bottomLeft: 15,
              bottomRight: 20
            }
          })
          .height('8%')
          .margin({ top: 5, bottom: 5 })

        // Test 5: normal value - borderRadius (LocalizedBorderRadiuses type)
        Text('Test 5: borderRadius - LocalizedBorderRadiuses type')
          .fontSize(16)
          .margin({ top: 10 })
        TextPicker({
          range: this.multiRange
        })
          .id('textPicker_selectedBackgroundStyle_localizedRadiuses')
          .selectedBackgroundStyle({
            color: '#FFFFEEF6',
            borderRadius: {
              topStart: { value: 8, unit: LengthUnit.VP },
              topEnd: { value: 12, unit: LengthUnit.VP },
              bottomStart: { value: 16, unit: LengthUnit.VP },
              bottomEnd: { value: 20, unit: LengthUnit.VP }
            }
          })
          .height('8%')
          .margin({ top: 5, bottom: 5 })

        // Test 6: normal value - different color values (Color enum)
        Text('Test 6: color using Color.Red')
          .fontSize(16)
          .margin({ top: 10 })
        TextPicker({
          range: this.singleRange
        })
          .id('textPicker_selectedBackgroundStyle_color_red')
          .selectedBackgroundStyle({ color: Color.Red })
          .height('8%')
          .margin({ top: 5, bottom: 5 })

        // Test 7: normal value - color with alpha
        Text('Test 7: color with alpha #80FF0000')
          .fontSize(16)
          .margin({ top: 10 })
        TextPicker({
          range: this.singleRange
        })
          .id('textPicker_selectedBackgroundStyle_color_alpha')
          .selectedBackgroundStyle({ color: '#80FF0000' })
          .height('8%')
          .margin({ top: 5, bottom: 5 })

        // Test 8: normal value - borderRadius = 0 (no radius)
        Text('Test 8: borderRadius = 0 (no radius)')
          .fontSize(16)
          .margin({ top: 10 })
        TextPicker({
          range: this.singleRange
        })
          .id('textPicker_selectedBackgroundStyle_borderRadius_0')
          .selectedBackgroundStyle({
            color: '#FFD5D5D5',
            borderRadius: { value: 0, unit: LengthUnit.VP }
          })
          .height('8%')
          .margin({ top: 5, bottom: 5 })

        // Test 9: normal value - large borderRadius
        Text('Test 9: large borderRadius = 30')
          .fontSize(16)
          .margin({ top: 10 })
        TextPicker({
          range: this.singleRange
        })
          .id('textPicker_selectedBackgroundStyle_borderRadius_large')
          .selectedBackgroundStyle({
            color: '#FFD5D5D5',
            borderRadius: { value: 30, unit: LengthUnit.VP }
          })
          .height('8%')
          .margin({ top: 5, bottom: 5 })

        // Test 10: empty object
        Text('Test 10: empty object {}')
          .fontSize(16)
          .margin({ top: 10 })
        TextPicker({
          range: this.singleRange
        })
          .id('textPicker_selectedBackgroundStyle_empty_object')
          .selectedBackgroundStyle({} as PickerBackgroundStyle)
          .height('8%')
          .margin({ top: 5, bottom: 5 })

        // Test 11: null parameter
        Text('Test 11: null parameter (should restore to default)')
          .fontSize(16)
          .margin({ top: 10 })
        TextPicker({
          range: this.singleRange
        })
          .id('textPicker_selectedBackgroundStyle_null')
          .selectedBackgroundStyle(null)
          .height('8%')
          .margin({ top: 5, bottom: 5 })

        // Test 12: undefined parameter
        Text('Test 12: undefined parameter (should use default)')
          .fontSize(16)
          .margin({ top: 10 })
        TextPicker({
          range: this.singleRange
        })
          .id('textPicker_selectedBackgroundStyle_undefined')
          .selectedBackgroundStyle(undefined)
          .height('8%')
          .margin({ top: 5, bottom: 5 })

        // Test 13: default value (no selectedBackgroundStyle set)
        Text('Test 13: default value (no selectedBackgroundStyle set)')
          .fontSize(16)
          .margin({ top: 10 })
        TextPicker({
          range: this.singleRange
        })
          .id('textPicker_selectedBackgroundStyle_default')
          .height('8%')
          .margin({ top: 5, bottom: 5 })

        // Test 14: normal value - color short hex format
        Text('Test 14: color short hex format #0F0')
          .fontSize(16)
          .margin({ top: 10 })
        TextPicker({
          range: this.singleRange
        })
          .id('textPicker_selectedBackgroundStyle_color_hex_short')
          .selectedBackgroundStyle({ color: '#0F0' })
          .height('8%')
          .margin({ top: 5, bottom: 5 })

        // Test 15: normal value - BorderRadiuses with all same values
        Text('Test 15: BorderRadiuses all same value')
          .fontSize(16)
          .margin({ top: 10 })
        TextPicker({
          range: this.multiRange
        })
          .id('textPicker_selectedBackgroundStyle_borderRadiuses_same')
          .selectedBackgroundStyle({
            color: '#FFFFD5D5',
            borderRadius: {
              topLeft: 8,
              topRight: 8,
              bottomLeft: 8,
              bottomRight: 8
            }
          })
          .height('8%')
          .margin({ top: 5, bottom: 5 })
      }
      .width('100%')
    }
    .height('100%')
  }
}
