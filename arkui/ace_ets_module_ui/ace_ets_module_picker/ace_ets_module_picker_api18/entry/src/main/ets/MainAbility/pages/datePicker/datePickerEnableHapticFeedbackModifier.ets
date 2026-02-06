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
class DatePickerModifier1 implements AttributeModifier<DatePickerAttribute> {
  applyNormalAttribute(instance: DatePickerAttribute): void {
    instance.enableHapticFeedback(true)
  }
}
class DatePickerModifier2 implements AttributeModifier<DatePickerAttribute> {
  applyNormalAttribute(instance: DatePickerAttribute): void {
    instance.enableHapticFeedback(false)
  }
}
class DatePickerModifier3 implements AttributeModifier<DatePickerAttribute> {
  applyNormalAttribute(instance: DatePickerAttribute): void {
    instance.enableHapticFeedback(undefined)
  }
}
class DatePickerModifier4 implements AttributeModifier<DatePickerAttribute> {
  applyNormalAttribute(instance: DatePickerAttribute): void {
    instance.enableHapticFeedback(null)
  }
}

@Entry
@Component
struct DatePickerModifierPage {
  private selectedDate: Date = new Date('2021-08-08')
  @State isLunar: boolean = false
  @State mod1: DatePickerModifier1 = new DatePickerModifier1()
  @State mod2: DatePickerModifier2 = new DatePickerModifier2()
  @State mod3: DatePickerModifier3 = new DatePickerModifier3()
  @State mod4: DatePickerModifier4 = new DatePickerModifier4()
  build() {
    Column() {
      DatePicker({
        start: new Date('1970-1-1'),
        end: new Date('2100-1-1'),
        selected: this.selectedDate
      })
        .id('datePicker5')
        .disappearTextStyle({color: Color.Gray, font: {size: '16fp', weight: FontWeight.Bold}})
        .textStyle({color: '#ff182431', font: {size: '18fp', weight: FontWeight.Normal}})
        .selectedTextStyle({color: '#ff0000FF', font: {size: '26fp', weight: FontWeight.Regular}})
        .lunar(this.isLunar)
        .attributeModifier(this.mod1)
        .onDateChange((value: Date) => {
          this.selectedDate = value
          console.info('select current date is: ' + value.toString())
        })
      DatePicker({
        start: new Date('1970-1-1'),
        end: new Date('2100-1-1'),
        selected: this.selectedDate
      })
        .id('datePicker6')
        .disappearTextStyle({color: Color.Gray, font: {size: '16fp', weight: FontWeight.Bold}})
        .textStyle({color: '#ff182431', font: {size: '18fp', weight: FontWeight.Normal}})
        .selectedTextStyle({color: '#ff0000FF', font: {size: '26fp', weight: FontWeight.Regular}})
        .lunar(this.isLunar)
        .attributeModifier(this.mod2)
        .onDateChange((value: Date) => {
          this.selectedDate = value
          console.info('select current date is: ' + value.toString())
        })
      DatePicker({
        start: new Date('1970-1-1'),
        end: new Date('2100-1-1'),
        selected: this.selectedDate
      })
        .id('datePicker7')
        .disappearTextStyle({color: Color.Gray, font: {size: '16fp', weight: FontWeight.Bold}})
        .textStyle({color: '#ff182431', font: {size: '18fp', weight: FontWeight.Normal}})
        .selectedTextStyle({color: '#ff0000FF', font: {size: '26fp', weight: FontWeight.Regular}})
        .lunar(this.isLunar)
        .attributeModifier(this.mod3)
        .onDateChange((value: Date) => {
          this.selectedDate = value
          console.info('select current date is: ' + value.toString())
        })
      DatePicker({
        start: new Date('1970-1-1'),
        end: new Date('2100-1-1'),
        selected: this.selectedDate
      })
        .id('datePicker8')
        .disappearTextStyle({color: Color.Gray, font: {size: '16fp', weight: FontWeight.Bold}})
        .textStyle({color: '#ff182431', font: {size: '18fp', weight: FontWeight.Normal}})
        .selectedTextStyle({color: '#ff0000FF', font: {size: '26fp', weight: FontWeight.Regular}})
        .lunar(this.isLunar)
        .attributeModifier(this.mod4)
        .onDateChange((value: Date) => {
          this.selectedDate = value
          console.info('select current date is: ' + value.toString())
        })

    }
  }
}
