/*
 * Copyright (c) 2024 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *   http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

@Entry
@Component
struct TimePickerExample {
  private selectedTime1: Date = new Date('2020-07-22T08:00:00')
  private selectedTime2: Date = new Date('2021-07-22T08:00:00')
  private selectedTime3: Date = new Date('2022-07-22T08:00:00')

  build() {
    Column() {
      TimePicker({
        selected: this.selectedTime1,
      })
        .digitalCrownSensitivity(CrownSensitivity.HIGH)
        .focusable(true)
        .focusOnTouch(true)
        .useMilitaryTime(false)
        .onChange((value: TimePickerResult) => {
          if (value.hour) {
            this.selectedTime1.setHours(value.hour, value.minute)
            console.info('select current date is: ' + JSON.stringify(value))
          }
        })
        .key('timepicker01')
        .defaultFocus(true)
        .disappearTextStyle({ color: Color.Red, font: { size: 15, weight: FontWeight.Lighter } })
        .textStyle({ color: Color.Green, font: { size: 20, weight: FontWeight.Normal } })
        .selectedTextStyle({ color: Color.Orange, font: { size: 30, weight: FontWeight.Bolder } })

      TimePicker({
        selected: this.selectedTime2,
      })
        .key('timepicker02')
        .focusable(false)
        .focusOnTouch(false)
        .digitalCrownSensitivity(CrownSensitivity.LOW)

      TimePicker({
        selected: this.selectedTime3,
      })
        .key('timepicker03')
        .defaultFocus(false)
        .digitalCrownSensitivity(CrownSensitivity.MEDIUM)

      TimePicker({})
        .key('timepicker04')

      TimePicker({})
        .key('timepicker05')
        .defaultFocus(false)
        .digitalCrownSensitivity(-1)

      TimePicker({})
        .key('timepicker05')
        .defaultFocus(false)
        .digitalCrownSensitivity(-1)

      TimePicker({})
        .key('timepicker06')
        .defaultFocus(false)
        .digitalCrownSensitivity(null)

      TimePicker({})
        .key('timepicker07')
        .defaultFocus(false)
        .digitalCrownSensitivity(undefined)
    }
  }
}