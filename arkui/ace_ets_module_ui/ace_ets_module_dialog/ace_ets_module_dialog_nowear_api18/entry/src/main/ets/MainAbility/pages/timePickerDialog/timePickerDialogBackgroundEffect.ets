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
struct timePickerDialog2 {
  private selectTime: Date = new Date('2020-12-25T08:30:00')
  build() {
    Column({ space: 10 }){
      Button('TimePickerDialog_Effect001')
        .id('TimePickerDialog_Effect001')
        .onClick(() => {
          TimePickerDialog.show({
            selected: this.selectTime,
            format: TimePickerFormat.HOUR_MINUTE,
            useMilitaryTime: false,
            dateTimeOptions: { hour: 'numeric', minute: '2-digit' },
            onAccept: (value: TimePickerResult) => {
              // 设置selectTime为按下确定按钮时的时间，这样当弹窗再次弹出时显示选中的为上一次确定的时间
              if (value.hour != undefined && value.minute != undefined) {
                this.selectTime.setHours(value.hour, value.minute)
                console.info('TimePickerDialog:onAccept()' + JSON.stringify(value))
              }
            },
            backgroundEffect: {
              radius: 40,
              saturation: 25,
              brightness: 2,
              color: Color.Pink,
              adaptiveColor: AdaptiveColor.DEFAULT,
              policy:BlurStyleActivePolicy.ALWAYS_ACTIVE,
              inactiveColor:Color.Blue,
              blurOptions: {
                grayscale: [20,20]
              }
            }
          })
        })
      Button('TimePickerDialog_Effect002')
        .id('TimePickerDialog_Effect002')
        .onClick(() => {
          TimePickerDialog.show({
            selected: this.selectTime,
            format: TimePickerFormat.HOUR_MINUTE,
            useMilitaryTime: false,
            dateTimeOptions: { hour: 'numeric', minute: '2-digit' },
            onAccept: (value: TimePickerResult) => {
              // 设置selectTime为按下确定按钮时的时间，这样当弹窗再次弹出时显示选中的为上一次确定的时间
              if (value.hour != undefined && value.minute != undefined) {
                this.selectTime.setHours(value.hour, value.minute)
                console.info('TimePickerDialog:onAccept()' + JSON.stringify(value))
              }
            },
            backgroundEffect: {
              radius: undefined,
              saturation: undefined,
              brightness: undefined,
              color: undefined,
              adaptiveColor: undefined,
              policy:undefined,
              inactiveColor:undefined,
              blurOptions: undefined,
            }
          })
        })
      Button('TimePickerDialog_Effect003')
        .id('TimePickerDialog_Effect003')
        .onClick(() => {
          TimePickerDialog.show({
            selected: this.selectTime,
            format: TimePickerFormat.HOUR_MINUTE,
            useMilitaryTime: false,
            dateTimeOptions: { hour: 'numeric', minute: '2-digit' },
            onAccept: (value: TimePickerResult) => {
              // 设置selectTime为按下确定按钮时的时间，这样当弹窗再次弹出时显示选中的为上一次确定的时间
              if (value.hour != undefined && value.minute != undefined) {
                this.selectTime.setHours(value.hour, value.minute)
                console.info('TimePickerDialog:onAccept()' + JSON.stringify(value))
              }
            },
            backgroundEffect: {
              radius: null,
              saturation: null,
              brightness: null,
              color: null,
              adaptiveColor: null,
              policy:null,
              inactiveColor:null,
              blurOptions: null,
            }
          })
        })
    }
    .height('100%')
    .width('100%')
    .backgroundImage($r('app.media.icon'))
    .backgroundImageSize({ width: '100%', height: '100%' })
  }
}