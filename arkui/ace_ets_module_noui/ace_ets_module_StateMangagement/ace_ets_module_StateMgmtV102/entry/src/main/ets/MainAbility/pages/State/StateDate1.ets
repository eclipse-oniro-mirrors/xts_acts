/**
 * Copyright (c) 2023 Huawei Device Co., Ltd.
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
struct StateDatePicker1 {
  @State selectedDate: Date = new Date('2021-08-08')

  build() {
    Column() {
      Button("Reset").id("StateDatePicker1_reset").height('5%')
        .onClick(() => {
          this.selectedDate = new Date('2021-08-08')
        })
      Text(''+ JSON.stringify(this.selectedDate)).id("date1").height('5%')
      Button('selectedDate to 2023-09-09').height('5%')
        .id("change_date")
        .onClick(() => {
          this.selectedDate = new Date('2023-09-09')
        })
      Button('increase the year by 1').height('5%')
        .id("setFullYear")
        .onClick(() => {
          this.selectedDate.setFullYear(this.selectedDate.getFullYear() + 1)
        })
      Button('increase the month by 1').height('5%')
        .id("setMonth")
        .onClick(() => {
          this.selectedDate.setMonth(this.selectedDate.getMonth() + 1)
        })
      Button('increase the day by 1').height('5%')
        .id("setDate")
        .onClick(() => {
          this.selectedDate.setDate(this.selectedDate.getDate() + 1)
        })
      Button('increase the hours by 1').height('5%')
        .id("setHours")
        .onClick(() => {
          this.selectedDate.setHours(this.selectedDate.getHours() + 1)
        })
      Button('increase the minute by 1').height('5%')
        .id("setMinutes")
        .onClick(() => {
          this.selectedDate.setMinutes(this.selectedDate.getMinutes() + 1)
        })
      Button('increase the Second by 1').height('5%')
        .id("setSeconds")
        .onClick(() => {
          this.selectedDate.setSeconds(this.selectedDate.getSeconds() + 1)
        })
      Button('increase the Millisecond by 1').height('5%')
        .id("setMilliseconds")
        .onClick(() => {
          this.selectedDate.setMilliseconds(this.selectedDate.getMilliseconds() + 1)
        })

      DatePicker({
        start: new Date('1970-1-1'),
        end: new Date('2100-1-1'),
        selected: this.selectedDate
      }).key("State_DatePicker1")
    }.width('100%')
  }
}