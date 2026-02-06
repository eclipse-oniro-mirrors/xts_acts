/**
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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
struct CalendarPickerStartEndTestExample {
  build() {
    Column() {
      Column() {
        CalendarPicker({ hintRadius: 10, start: new Date('2024-03-05'), end: new Date('2024-04-05') })
          .textStyle({ color: '#ff182431', font: { size: 20, weight: FontWeight.Normal } })
          .margin(10)
          .id('CalendarPicker01')
        CalendarPicker({ hintRadius: 10, start: new Date('2024-05-05'), end: new Date('2024-04-05') })
          .textStyle({ color: '#ff182431', font: { size: 20, weight: FontWeight.Normal } })
          .margin(10)
          .id('CalendarPicker02')
        CalendarPicker({ hintRadius: 10, start: null, end: null })
          .textStyle({ color: '#ff182431', font: { size: 20, weight: FontWeight.Normal } })
          .margin(10)
          .id('CalendarPicker03')
        CalendarPicker({ hintRadius: 10, start: undefined, end: undefined })
          .textStyle({ color: '#ff182431', font: { size: 20, weight: FontWeight.Normal } })
          .margin(10)
          .id('CalendarPicker04')
        CalendarPicker({ hintRadius: 10, start: new Date('2024-03-05'), end: new Date('2024-03-05') })
          .textStyle({ color: '#ff182431', font: { size: 20, weight: FontWeight.Normal } })
          .margin(10)
          .id('CalendarPicker05')
      }.alignItems(HorizontalAlign.End).width('100%')

    }.width('100%').margin({ top: 350 })
  }
}