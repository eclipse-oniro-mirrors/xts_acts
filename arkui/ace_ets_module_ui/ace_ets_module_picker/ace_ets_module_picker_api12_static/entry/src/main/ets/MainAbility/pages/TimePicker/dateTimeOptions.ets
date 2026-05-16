'use static';
/*
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
import { ToolType } from '@ohos.multimodalInput.mouseEvent'
import Intl from '@ohos.intl';
import { Entry, Column, Component, Row,RowOptions,ClickEvent, Toggle,  Text, TimePickerFormat,TimePicker,
  TextPicker,Color,Button,FontWeight,Color,TimePickerResult, DateTimeOptions } from '@ohos.arkui.component'
import { State, UIUtils } from '@ohos.arkui.stateManagement';

@Entry
@Component
struct dateTimeOptionsExample {
  @State indexNumber1: int = 0
  @State indexNumber2: int = 0
  @State indexNumber3: int = 0
  @State indexNumber4: int = 0
  @State isMilitaryTime: boolean = false
  @State timeformat: (TimePickerFormat)[] = [
  TimePickerFormat.HOUR_MINUTE,
  TimePickerFormat.HOUR_MINUTE_SECOND
  ]
  @State opt: Array<Intl.DateTimeOptions| undefined | null > = new Array<Intl.DateTimeOptions| undefined | null>(
    {hour: 'numeric', minute: 'numeric', second: 'numeric' }, //Case 1
    {hour: 'numeric', minute: '2-digit', second: 'numeric' }, //Case 2
    {hour: 'numeric', minute: 'numeric', second: '2-digit' }, //Case 3
    {hour: '2-digit', minute: '2-digit', second: '2-digit' }, //Case 4
    {hour: '2-digit', minute: 'numeric', second: '2-digit' }, //Case 5
    {hour: '2-digit', minute: '2-digit', second: 'numeric' }, //Case 6
    {hour: 'undefined', minute: 'numeric', second: 'numeric' }, //Case 7
    {hour: 'undefined', minute: '2-digit', second: 'numeric' }, //Case 8
    {hour: 'undefined', minute: 'numeric', second: '2-digit' }, //Case 7
    undefined,
    null
  )
  @State timeformatString: (string)[] = [
    'HOUR_MINUTE',
    'HOUR_MINUTE_SECOND'
  ]
  private setTime: (Date)[] = [
    new Date('2022-07-22T00:00:00'),
    new Date('2022-07-22T01:01:01'),
    new Date('2022-07-22T02:02:02'),
    new Date('2022-07-22T03:03:03'),
    new Date('2022-07-22T04:04:04'),
    new Date('2022-07-22T05:05:05'),
    new Date('2022-07-22T06:06:06'),
    new Date('2022-07-22T07:07:07'),
    new Date('2022-07-22T08:08:08'),
    new Date('2022-07-22T09:09:09'),
    new Date('2022-07-22T10:10:10'),
    new Date('2022-07-22T11:11:11'),
    new Date('2022-07-22T12:12:12'),
    new Date('2022-07-22T13:13:13'),
    new Date('2022-07-22T14:14:14'),
    new Date('2022-07-22T15:15:15'),
    new Date('2022-07-22T16:16:16'),
    new Date('2022-07-22T17:17:17'),
    new Date('2022-07-22T18:18:18'),
    new Date('2022-07-22T19:19:19'),
    new Date('2022-07-22T20:20:20'),
    new Date('2022-07-22T21:21:21'),
    new Date('2022-07-22T22:22:22'),
    new Date('2022-07-22T23:23:23'),
  ]

  build() {
    Column() {
      Button('切换12小时制/24小时制')
        .margin(30)
        .onClick((e:ClickEvent) => {
          this.isMilitaryTime = !this.isMilitaryTime
        })

      TimePicker({
        selected: this.setTime[this.indexNumber1],
        format: this.timeformat[this.indexNumber4]
      })
        .height("30%")
        .useMilitaryTime(this.isMilitaryTime)
        .onChange((value: TimePickerResult):void => {
          if(value.hour) {
            this.setTime[this.indexNumber1].setHours(value.hour, value.minute)
            console.info('select current date is: ' + JSON.stringify(value))
          }
        })
        .selectedTextStyle({color: Color.Blue, font: {size: 30, weight: FontWeight.Bolder}})
        .dateTimeOptions(this.opt[this.indexNumber2] as DateTimeOptions)

      Row({space: 2} as RowOptions){
        Button('Set TimeType ++')
          .id("dateTimeOptionsXTS")
          .margin(10)
          .onClick((e:ClickEvent) => {
            this.indexNumber2++
            if (this.indexNumber2 > this.opt.length -1) {
              this.indexNumber2 = 0
            }
          })
      }

      Row({space: 2} as RowOptions){
        Button('Set TimeType --')
          .margin(10)
          .onClick((e:ClickEvent) => {
            this.indexNumber2--
            if (this.indexNumber2 < 0) {
              this.indexNumber2 = this.opt.length - 1
            }
          })
      }

      Text(`${this.indexNumber2 + 1} / ${this.opt.length}`)
      Text(JSON.stringify(UIUtils.getTarget(this.opt[this.indexNumber2])))
        .id("dateTimeOptionsValue")
        .height('100vp')
        .width('100%')

      Button("set TimeFormat")
        .margin(20)
        .onClick((e:ClickEvent) => {
          this.indexNumber4++
          if (this.indexNumber4 > this.timeformat.length - 1) {
            this.indexNumber4 = 0
          }
        })

      Text("Time Format: " + this.timeformatString[this.indexNumber4]).fontSize(12).fontColor(Color.Blue).width("100%")
      Row({space: 2} as RowOptions){
        Button("Change Date and Time").margin(5).onClick((e:ClickEvent) => {
          this.indexNumber1++
          if(this.indexNumber1 > this.setTime.length - 1) {
            this.indexNumber1 = 0
          }
        })
      }

    }.width('100%')
  }
}