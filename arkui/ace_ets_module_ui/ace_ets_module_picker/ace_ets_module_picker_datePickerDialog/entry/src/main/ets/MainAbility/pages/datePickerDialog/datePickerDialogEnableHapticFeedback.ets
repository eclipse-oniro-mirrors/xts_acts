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
struct DatePickerExample {
  private selectedDate: Date = new Date('2021-08-08')

  build() {
    Flex({ wrap: FlexWrap.Wrap }) {
      Button('1')
        .margin(20)
        .id('DatePickerDialog1')
        .onClick(() => {
          DatePickerDialog.show({
            start: new Date('2000-1-1'),
            end: new Date('2100-12-31'),
            selected: this.selectedDate,
            enableHapticFeedback: true,
          })
        })
      Button('2')
        .margin(20)
        .id('DatePickerDialog2')
        .onClick(() => {
          DatePickerDialog.show({
            start: new Date('2000-1-1'),
            end: new Date('2100-12-31'),
            selected: this.selectedDate,
            enableHapticFeedback: false,
          })
        })
      Button('3')
        .margin(20)
        .id('DatePickerDialog3')
        .onClick(() => {
          DatePickerDialog.show({
            start: new Date('2000-1-1'),
            end: new Date('2100-12-31'),
            selected: this.selectedDate,
            enableHapticFeedback: undefined,
          })
        })
      Button('4')
        .margin(20)
        .id('DatePickerDialog4')
        .onClick(() => {
          DatePickerDialog.show({
            start: new Date('2000-1-1'),
            end: new Date('2100-12-31'),
            selected: this.selectedDate,
            enableHapticFeedback: null,
          })
        })
    }.width('100%')
  }
}