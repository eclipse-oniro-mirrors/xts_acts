/**
 * Copyright (c) 2024 Huawei Device Co., Ltd.
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

class CalendarPickerModifier1 implements AttributeModifier<CalendarPickerAttribute> {
  applyNormalAttribute(instance: CalendarPickerAttribute): void {
    instance
      .edgeAlign(CalendarAlign.END, { dx: 10, dy: 15 })
      .textStyle({ color: '#FF182431', font: { size: 8, weight: FontWeight.Lighter } })
  }
}

@Entry
@Component
struct CalendarPickerExample {
  @State calendarPickerModifier: CalendarPickerModifier1 = new CalendarPickerModifier1()
  private selectedDate: Date = new Date('2026-02-11')

  build() {
    Column() {
      CalendarPicker({ selected: this.selectedDate })
        .key('CalendarPickerKey1')
        .attributeModifier(this.calendarPickerModifier)
    }
    .width('100%')
    .height('100%')
  }
}
