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
struct textPickerDialogExample {
  private selectTime: Date = new Date('2020-12-25T08:30:00')
  build() {
    Column(){
      Row({space:5}){
        Button('1')
          .id('TimePickerDialog1')
          .onClick(() => {
            TimePickerDialog.show({
              selected: this.selectTime,
              enableHapticFeedback:true,
              disappearTextStyle: { color: Color.Red, font: { size: 15, weight: FontWeight.Lighter } },
              textStyle: { color: Color.Black, font: { size: 20, weight: FontWeight.Normal } },
              selectedTextStyle: { color: Color.Blue, font: { size: 30, weight: FontWeight.Bolder } },
              onAccept: (value: TimePickerResult) => {
                if (value.hour != undefined && value.minute != undefined) {
                  this.selectTime.setHours(value.hour, value.minute)
                  console.info('TimePickerDialog:onAccept()' + JSON.stringify(value))
                }
              },
            })
          })
        Button('2')
          .id('TimePickerDialog2')
          .onClick(() => {
            TimePickerDialog.show({
              selected: this.selectTime,
              enableHapticFeedback:false,
              disappearTextStyle: { color: Color.Red, font: { size: 15, weight: FontWeight.Lighter } },
              textStyle: { color: Color.Black, font: { size: 20, weight: FontWeight.Normal } },
              selectedTextStyle: { color: Color.Blue, font: { size: 30, weight: FontWeight.Bolder } },
              onAccept: (value: TimePickerResult) => {
                if (value.hour != undefined && value.minute != undefined) {
                  this.selectTime.setHours(value.hour, value.minute)
                  console.info('TimePickerDialog:onAccept()' + JSON.stringify(value))
                }
              },
            })
          })
      }
      Row({space:5}){
        Button('3')
          .id('TimePickerDialog3')
          .onClick(() => {
            TimePickerDialog.show({
              selected: this.selectTime,
              enableHapticFeedback:undefined,
              disappearTextStyle: { color: Color.Red, font: { size: 15, weight: FontWeight.Lighter } },
              textStyle: { color: Color.Black, font: { size: 20, weight: FontWeight.Normal } },
              selectedTextStyle: { color: Color.Blue, font: { size: 30, weight: FontWeight.Bolder } },
              onAccept: (value: TimePickerResult) => {
                if (value.hour != undefined && value.minute != undefined) {
                  this.selectTime.setHours(value.hour, value.minute)
                  console.info('TimePickerDialog:onAccept()' + JSON.stringify(value))
                }
              },
            })
          })
        Button('4')
          .id('TimePickerDialog4')
          .onClick(() => {
            TimePickerDialog.show({
              selected: this.selectTime,
              enableHapticFeedback:null,
              disappearTextStyle: { color: Color.Red, font: { size: 15, weight: FontWeight.Lighter } },
              textStyle: { color: Color.Black, font: { size: 20, weight: FontWeight.Normal } },
              selectedTextStyle: { color: Color.Blue, font: { size: 30, weight: FontWeight.Bolder } },
              onAccept: (value: TimePickerResult) => {
                if (value.hour != undefined && value.minute != undefined) {
                  this.selectTime.setHours(value.hour, value.minute)
                  console.info('TimePickerDialog:onAccept()' + JSON.stringify(value))
                }
              },
            })
          })
      }
    }
  
  }
}
