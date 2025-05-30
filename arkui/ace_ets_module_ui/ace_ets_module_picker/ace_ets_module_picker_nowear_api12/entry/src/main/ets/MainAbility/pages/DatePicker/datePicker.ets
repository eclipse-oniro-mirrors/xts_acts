/**
 * Copyright (c) 2022 Shenzhen Kaihong Digital Industry Development Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

class DatePickerModifier1 implements AttributeModifier<DatePickerAttribute> {
  applyNormalAttribute(instance: DatePickerAttribute): void {
    instance
      .selectedTextStyle({ color: '#ff182431', font: { size: '18fp', weight: FontWeight.Normal } })
      .disappearTextStyle({ color: '#FF000000', font: { size: '8fp', weight: FontWeight.Lighter } })
      .textStyle({ color: '#ff0000FF', font: { size: '26fp', weight: FontWeight.Normal } })
      .lunar(true)
  }
}

@Entry
@Component
struct DatePickerExample {
  @State datePickerModifier1: DatePickerModifier1 = new DatePickerModifier1();
  private selectedDate: Date = new Date('2021-08-08')

  build() {
    Column() {
      DatePicker({
        start: new Date('1970-1-1'),
        end: new Date('2100-1-1'),
        selected: this.selectedDate
      })
      .key('DatePicker')
      .attributeModifier(this.datePickerModifier1)
    }
    .width('100%')
    .height('100%')
  }
}
