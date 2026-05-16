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
struct DatePickerDialogExample {
  selectedDate: Date = new Date('2010-1-1')

  build() {
    Flex({ wrap: FlexWrap.Wrap }) {
      Button('1')
        .onClick(() => {
          DatePickerDialog.show({
            start: new Date('2000-1-1'),
            end: new Date('2100-12-31'),
            selected: this.selectedDate,
            mode:DatePickerMode.DATE,
            dateTimeOptions: { hour: 'numeric', minute: '2-digit' },
            onDateAccept: (value: Date) => {
              this.selectedDate = value
            },
          })
        }).id('DatePickerDialog_001')
      Button('2')
        .onClick(() => {
          DatePickerDialog.show({
            start: new Date('2000-1-1'),
            end: new Date('2100-12-31'),
            selected: this.selectedDate,
            mode:DatePickerMode.YEAR_AND_MONTH,
            dateTimeOptions: { hour: 'numeric', minute: '2-digit' },
            onDateAccept: (value: Date) => {
              this.selectedDate = value
            },
          })
        }).id('DatePickerDialog_002')
      Button('3')
        .onClick(() => {
          DatePickerDialog.show({
            start: new Date('2000-1-1'),
            end: new Date('2100-12-31'),
            selected: this.selectedDate,
            mode:DatePickerMode.MONTH_AND_DAY,
            dateTimeOptions: { hour: 'numeric', minute: '2-digit' },
            onDateAccept: (value: Date) => {
              this.selectedDate = value
            },
          })
        }).id('DatePickerDialog_003')
      Button('4')
        .onClick(() => {
          DatePickerDialog.show({
            start: new Date('2000-1-1'),
            end: new Date('2100-12-31'),
            selected: this.selectedDate,
            mode:undefined,
            dateTimeOptions: { hour: 'numeric', minute: '2-digit' },
            onDateAccept: (value: Date) => {
              this.selectedDate = value
            },
          })
        }).id('DatePickerDialog_004')
      Button('5')
        .onClick(() => {
          DatePickerDialog.show({
            start: new Date('2000-1-1'),
            end: new Date('2100-12-31'),
            selected: this.selectedDate,
            mode:null,
            dateTimeOptions: { hour: 'numeric', minute: '2-digit' },
            onDateAccept: (value: Date) => {
              this.selectedDate = value
            },
          })
        }).id('DatePickerDialog_005')
      Button('6')
        .onClick(() => {
          DatePickerDialog.show({
            start: new Date('2000-1-1'),
            end: new Date('2100-12-31'),
            selected: this.selectedDate,
            mode:100,
            dateTimeOptions: { hour: 'numeric', minute: '2-digit' },
            onDateAccept: (value: Date) => {
              this.selectedDate = value
            },
          })
        }).id('DatePickerDialog_006')
      Button('7')
        .onClick(() => {
          DatePickerDialog.show({
            start: new Date('2000-1-1'),
            end: new Date('2100-12-31'),
            selected: this.selectedDate,
            mode:-1,
            dateTimeOptions: { hour: 'numeric', minute: '2-digit' },
            onDateAccept: (value: Date) => {
              this.selectedDate = value
            },
          })
        }).id('DatePickerDialog_007')
    }.width('100%')
  }
}