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
struct TimePickerDialogExample {
  private selectTime: Date = new Date('2020-12-25T08:30:00')
  @State AppearText: string = ''

  build() {
    Row() {
      Column() {
        Text(this.AppearText)
          .fontSize(20)
          .margin(10)
          .id('AppearText')
        Button("TimePickerDialog 12小时制")
          .id('TimePickerDialog')
          .margin(20)
          .onClick(() => {
            TimePickerDialog.show({
              alignment: DialogAlignment.Bottom,
              selected: this.selectTime,
              disappearTextStyle: { color: Color.Red, font: { size: 15, weight: FontWeight.Lighter } },
              textStyle: { color: Color.Black, font: { size: 20, weight: FontWeight.Normal } },
              selectedTextStyle: { color: Color.Blue, font: { size: 30, weight: FontWeight.Bolder } },
              onAccept: (value: TimePickerResult) => {
                // 设置selectTime为按下确定按钮时的时间，这样当弹窗再次弹出时显示选中的为上一次确定的时间
                if (value.hour != undefined && value.minute != undefined) {
                  this.selectTime.setHours(value.hour, value.minute)
                  console.info("TimePickerDialog:onAccept()" + JSON.stringify(value))
                }
              },
              onCancel: () => {
                console.info("TimePickerDialog:onCancel()")
              },
              onChange: (value: TimePickerResult) => {
                console.info("TimePickerDialog:onChange()" + JSON.stringify(value))
              },
              onDidAppear: () => {
                this.AppearText = this.AppearText + "onDidAppear_"
              },
              onDidDisappear: () => {
                this.AppearText = this.AppearText + "onDidDisappear"
              },
              onWillAppear: () => {
                this.AppearText = this.AppearText + "onWillAppear_"
              },
              onWillDisappear: () => {
                this.AppearText = this.AppearText + "onWillDisappear_"
              }
            })
          })
      }.width('100%')
    }.height('100%').id('row')
  }
}