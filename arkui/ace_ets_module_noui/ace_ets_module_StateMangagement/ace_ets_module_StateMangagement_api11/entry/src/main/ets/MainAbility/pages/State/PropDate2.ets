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

@Component
struct ChildDate2 {
  @Prop selectedDate2: Date = new Date('2022-06-06')

  build() {
    Column() {
      Button('increase the Time by 1'+this.selectedDate2.getTime()).margin(1).width("100%").height(20)
        .id("setTime1")//更改id名字（setTime=》setTime1)
        .onClick(() => {
          this.selectedDate2.setTime(this.selectedDate2.getTime() + 1)
        })
      Button('increase the UTCFullYear by 1'+this.selectedDate2.getUTCFullYear()).margin(1).width("100%").height(20)
        .id("setUTCFullYear1")
        .onClick(() => {
          this.selectedDate2.setUTCFullYear(this.selectedDate2.getUTCFullYear() + 1)
        })
      Button('increase the UTCMonth by 1'+this.selectedDate2.getUTCMonth()).margin(1).width("100%").height(20)
        .id("setUTCMonth1")
        .onClick(() => {
          this.selectedDate2.setUTCMonth(this.selectedDate2.getUTCMonth() + 1)
        })
      Button('increase the UTCDate by 1'+this.selectedDate2.getUTCDate()).margin(1).width("100%").height(20)
        .id("getUTCDate1")
        .onClick(() => {
          this.selectedDate2.setUTCDate(this.selectedDate2.getUTCDate() + 1)
        })
      Button('increase the UTCHour by 1'+this.selectedDate2.getUTCHours()).margin(1).width("100%").height(20)
        .id("setUTCHours1")
        .onClick(() => {
          this.selectedDate2.setUTCHours(this.selectedDate2.getUTCHours() + 1)
        })
      Button('increase the UTCMinute by 1'+this.selectedDate2.getUTCMinutes()).margin(1).width("100%").height(20)
        .id("setUTCMinutes1")
        .onClick(() => {
          this.selectedDate2.setUTCMinutes(this.selectedDate2.getUTCMinutes() + 1)
        })
      Button('increase the UTCSecond by 1'+this.selectedDate2.getUTCSeconds()).margin(1).width("100%").height(20)
        .id("setUTCSeconds1")
        .onClick(() => {
          this.selectedDate2.setUTCSeconds(this.selectedDate2.getUTCSeconds() + 1)
        })
      Button('increase the UTCMillisecond by 1'+this.selectedDate2.getUTCMilliseconds()).margin(1).width("100%").height(20)
        .id("setUTCMilliseconds1")
        .onClick(() => {
          this.selectedDate2.setUTCMilliseconds(this.selectedDate2.getUTCMilliseconds() + 1)
        })
      Button("Reset").id("ChildDate2_reset")
        .onClick(() => {
          this.selectedDate2 = new Date('2021-08-08')
        })

      DatePicker({
        start: new Date('1970-1-1'),
        end: new Date('2100-1-1'),
        selected: this.selectedDate2
      }).margin(1).width("100%").height(20)
    }
  }
}


@Entry
@Component
struct PropDate2 {
  @State selectedDate: Date = new Date('2021-08-08')

  build() {
    Column() {

      Button('increase the Time by 1'+this.selectedDate.getTime()).margin(1).width("100%").height(20)
        .id("setTime002")
        .onClick(() => {
          this.selectedDate.setTime(this.selectedDate.getTime() + 1)
        })
      Button('increase the UTCFullYear by 1'+this.selectedDate.getUTCFullYear()).margin(1).width("100%").height(20)
        .id("setUTCFullYear")
        .onClick(() => {
          this.selectedDate.setUTCFullYear(this.selectedDate.getUTCFullYear() + 1)
        })
      Button('increase the UTCMonth by 1'+this.selectedDate.getUTCMonth()).margin(1).width("100%").height(20)
        .id("setUTCMonth")
        .onClick(() => {
          this.selectedDate.setUTCMonth(this.selectedDate.getUTCMonth() + 1)
        })
      Button('increase the UTCDate by 1'+this.selectedDate.getUTCDate()).margin(1).width("100%").height(20)
        .id("setUTCDate")
        .onClick(() => {
          this.selectedDate.setUTCDate(this.selectedDate.getUTCDate() + 1)
        })
      Button('increase the UTCHour by 1'+this.selectedDate.getUTCHours()).margin(1).width("100%").height(20)
        .id("setUTCHours")
        .onClick(() => {
          this.selectedDate.setUTCHours(this.selectedDate.getUTCHours() + 1)
        })
      Button('increase the UTCMinute by 1'+this.selectedDate.getUTCMinutes()).margin(1).width("100%").height(20)
        .id("setUTCMinutes")
        .onClick(() => {
          this.selectedDate.setUTCMinutes(this.selectedDate.getUTCMinutes() + 1)
        })
      Button('increase the UTCSecond by 1'+this.selectedDate.getUTCSeconds()).margin(1).width("100%").height(20)
        .id("setUTCSeconds")
        .onClick(() => {
          this.selectedDate.setUTCSeconds(this.selectedDate.getUTCSeconds() + 1)
        })
      Button('increase the UTCMillisecond by 1'+this.selectedDate.getUTCMilliseconds()).margin(1).width("100%").height(20)
        .id("setUTCMilliseconds")
        .onClick(() => {
          this.selectedDate.setUTCMilliseconds(this.selectedDate.getUTCMilliseconds() + 1)
        })
      Button("Reset").id("PropDate2_reset")
        .onClick(() => {
          this.selectedDate = new Date('2021-08-08')
        })

      DatePicker({
        start: new Date('1970-1-1'),
        end: new Date('2100-1-1'),
        selected: this.selectedDate
      }).id("Prop_Date2").margin(1).width("100%").height(20)
      ChildDate2({selectedDate2: this.selectedDate})
    }.width('100%')
  }
}