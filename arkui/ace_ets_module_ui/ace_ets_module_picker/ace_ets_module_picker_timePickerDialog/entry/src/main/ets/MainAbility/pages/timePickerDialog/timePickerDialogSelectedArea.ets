/**
 * Copyright (c) 2025 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the 'License');
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an 'AS IS' BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
class SelectTime{
  private selectTime: Date = new Date('2020-12-25T08:30:00')
  hours(h:number,m:number){
    this.selectTime.setHours(h,m)
  }
}

@Entry
@Component
struct TimePickerDialogSelectedAreaExample {
  @State selectTime: Date = new Date('2023-12-25T08:30:00');
  @State selectedFlag: string = ''
  build() {
    Column() {
      Button('showTimePickerDialog ' + this.selectedFlag)
        .id('showTimePickerDialog')
        .margin(30)
        .onClick(() => {
          this.selectedFlag = ''
          this.getUIContext().showTimePickerDialog({
            selected: this.selectTime,
            onAccept: (value: TimePickerResult) => {
              // 设置selectTime为按下确定按钮时的时间，这样当弹窗再次弹出时显示选中的为上一次确定的时间
              let time = new SelectTime()
              if(value.hour&&value.minute){
                time.hours(value.hour, value.minute)
              }
              console.info('TimePickerDialog:onAccept()' + JSON.stringify(value))
            },
            onCancel: () => {
              console.info('TimePickerDialog:onCancel()')
            },
            onChange: (value: TimePickerResult) => {
              console.info('TimePickerDialog:onChange()' + JSON.stringify(value))
            },
            onEnterSelectedArea: (value: TimePickerResult) => {
              this.selectedFlag = 'enter'
              console.info('TimePickerDialog:onEnterSelectedArea()' + JSON.stringify(value))
            }
          })
        })
      Text(this.selectedFlag).id('textFlag').height('5%').width('90%').margin({ top: 10, bottom: 10 }).textAlign(TextAlign.Center)
    }.width('100%').height('100%').margin({ top: 5 }).id('colComponent')
  }
}