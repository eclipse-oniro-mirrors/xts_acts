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
 * DatePicker SelectedTextStyle Test Page
 * 测试DatePicker组件的selectedTextStyle属性
 */
@Entry
@Component
struct DatePickerSelectedTextStyleNullUndefined {
  build() {
    Row() {
      Column() {
        Text('DatePicker SelectedTextStyle Test')
          .fontSize(24)
          .fontWeight(FontWeight.Bold)
          .margin({ top: 20, bottom: 20 })

        // Test 1: normal PickerTextStyle - custom style
        Text('Test 1: custom style (gray color, 22fp font)')
          .fontSize(16)
          .margin({ top: 10 })
        DatePicker({
          start: new Date('1970-1-1'),
          end: new Date('2100-12-31'),
          selected: new Date('2021-08-08')
        })
          .id('datePicker_selectedTextStyle_custom')
          .selectedTextStyle({ color: '#FF808080', font: { size: '22fp', weight: FontWeight.Bold } })
          .height('8%')
          .margin({ top: 5, bottom: 5 })

        // Test 2: default value (no selectedTextStyle set)
        Text('Test 2: default value')
          .fontSize(16)
          .margin({ top: 10 })
        DatePicker({
          start: new Date('1970-1-1'),
          end: new Date('2100-12-31'),
          selected: new Date('2021-08-08')
        })
          .id('datePicker_selectedTextStyle_default')
          .height('8%')
          .margin({ top: 5, bottom: 5 })

        // Test 3: null parameter
        Text('Test 3: null parameter (should restore to default)')
          .fontSize(16)
          .margin({ top: 10 })
        DatePicker({
          start: new Date('1970-1-1'),
          end: new Date('2100-12-31'),
          selected: new Date('2021-08-08')
        })
          .id('datePicker_selectedTextStyle_null')
          .selectedTextStyle(null)
          .height('8%')
          .margin({ top: 5, bottom: 5 })

        // Test 4: undefined parameter
        Text('Test 4: undefined parameter (should restore to default)')
          .fontSize(16)
          .margin({ top: 10 })
        DatePicker({
          start: new Date('1970-1-1'),
          end: new Date('2100-12-31'),
          selected: new Date('2021-08-08')
        })
          .id('datePicker_selectedTextStyle_undefined')
          .selectedTextStyle(undefined)
          .height('8%')
          .margin({ top: 5, bottom: 5 })

        // Test 5: another custom style (red color, 24fp font)
        Text('Test 5: custom style (red color, 24fp font)')
          .fontSize(16)
          .margin({ top: 10 })
        DatePicker({
          start: new Date('1970-1-1'),
          end: new Date('2100-12-31'),
          selected: new Date('2021-08-08')
        })
          .id('datePicker_selectedTextStyle_custom2')
          .selectedTextStyle({ color: '#FFFF0000', font: { size: '24fp', weight: FontWeight.Medium } })
          .height('8%')
          .margin({ top: 5, bottom: 5 })
      }
      .width('100%')
    }
    .height('100%')
  }
}
