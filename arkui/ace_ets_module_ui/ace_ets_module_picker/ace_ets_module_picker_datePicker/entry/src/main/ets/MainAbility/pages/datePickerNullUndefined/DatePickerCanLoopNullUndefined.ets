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
 * DatePicker CanLoop Test Page
 * 测试DatePicker组件的canLoop属性
 */
@Entry
@Component
struct DatePickerCanLoopNullUndefined {
  build() {
    Row() {
      Column() {
        Text('DatePicker CanLoop Test')
          .fontSize(24)
          .fontWeight(FontWeight.Bold)
          .margin({ top: 20, bottom: 20 })

        // Test 1: canLoop = true (default value)
        Text('Test 1: canLoop = true (default)')
          .fontSize(16)
          .margin({ top: 10 })
        DatePicker({
          start: new Date('2000-1-1'),
          end: new Date('2100-12-31'),
          selected: new Date('2021-08-08')
        })
          .id('datePicker_canLoop_true')
          .canLoop(true)
          .height('8%')
          .margin({ top: 5, bottom: 5 })

        // Test 2: canLoop = false
        Text('Test 2: canLoop = false')
          .fontSize(16)
          .margin({ top: 10 })
        DatePicker({
          start: new Date('2000-1-1'),
          end: new Date('2100-12-31'),
          selected: new Date('2021-08-08')
        })
          .id('datePicker_canLoop_false')
          .canLoop(false)
          .height('8%')
          .margin({ top: 5, bottom: 5 })

        // Test 3: canLoop = null (should restore to default)
        Text('Test 3: canLoop = null (should restore to default)')
          .fontSize(16)
          .margin({ top: 10 })
        DatePicker({
          start: new Date('2000-1-1'),
          end: new Date('2100-12-31'),
          selected: new Date('2021-08-08')
        })
          .id('datePicker_canLoop_null')
          .canLoop(null)
          .height('8%')
          .margin({ top: 5, bottom: 5 })

        // Test 4: canLoop = undefined (should restore to default)
        Text('Test 4: canLoop = undefined (should restore to default)')
          .fontSize(16)
          .margin({ top: 10 })
        DatePicker({
          start: new Date('2000-1-1'),
          end: new Date('2100-12-31'),
          selected: new Date('2021-08-08')
        })
          .id('datePicker_canLoop_undefined')
          .canLoop(undefined)
          .height('8%')
          .margin({ top: 5, bottom: 5 })

        // Test 5: default value (no canLoop set)
        Text('Test 5: default value (no canLoop set)')
          .fontSize(16)
          .margin({ top: 10 })
        DatePicker({
          start: new Date('2000-1-1'),
          end: new Date('2100-12-31'),
          selected: new Date('2021-08-08')
        })
          .id('datePicker_canLoop_default')
          .height('8%')
          .margin({ top: 5, bottom: 5 })
      }
      .width('100%')
    }
    .height('100%')
  }
}
