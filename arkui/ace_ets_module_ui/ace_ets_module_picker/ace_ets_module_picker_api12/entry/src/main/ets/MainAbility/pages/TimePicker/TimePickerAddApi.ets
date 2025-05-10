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
@Entry
@Component
struct TimePickerAddApi {
  @State isMilitaryTime: boolean = true
  private selectedTime: Date = new Date('2022-07-22T08:30:30')
  private selectTime: Date = new Date('2020-12-25T08:30:00')
  @State text: string = ''

  build() {
    Column() {


      Text(this.text).margin({ top: 50 })
        .key('TimePickerAddApiText')
      TimePicker({
        selected: this.selectedTime,
        format: TimePickerFormat.HOUR_MINUTE_SECOND
      })
        .key('TimePickerAddApi')
        .useMilitaryTime(this.isMilitaryTime)
        .onChange((value: TimePickerResult) => {
          if(value.second) {
            this.text = 'second'
          }
        })
        .width(200)
        .height(200)
        .disappearTextStyle({color: Color.Red, font: {size: 15, weight: FontWeight.Lighter}})
        .textStyle({color: Color.Black, font: {size: 20, weight: FontWeight.Normal}})
        .selectedTextStyle({color: Color.Blue, font: {size: 30, weight: FontWeight.Bolder}})

      Button('TimePickerDialog')
        .key('TimePickerAddApi2')
        .margin(20)
        .onClick(() => {
          TimePickerDialog.show({
            selected: this.selectTime,
            disappearTextStyle: { color: Color.Red, font: { size: 15, weight: FontWeight.Lighter } },
            textStyle: { color: Color.Black, font: { size: 20, weight: FontWeight.Normal } },
            selectedTextStyle: { color: Color.Blue, font: { size: 30, weight: FontWeight.Bolder } },
            dateTimeOptions: {dateStyle:'long'},
            onAccept: (value: TimePickerResult) => {
              // 设置selectTime为按下确定按钮时的时间，这样当弹窗再次弹出时显示选中的为上一次确定的时间
              if (value.hour != undefined && value.minute != undefined) {
                this.selectTime.setHours(value.hour, value.minute)
                console.info('TimePickerDialog:onAccept()' + JSON.stringify(value))
              }
            },
            onCancel: () => {
              console.info('TimePickerDialog:onCancel()')
            },
            onChange: (value: TimePickerResult) => {
              console.info('TimePickerDialog:onChange()' + JSON.stringify(value))
            }
          })
        })

    }.width('100%')
  }
}