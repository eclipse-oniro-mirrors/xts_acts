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
import {MessageManager,Callback} from '../../common/MessageManager';
import{DatePickerModifier} from '@ohos.arkui.modifier'
@Entry
@Component
struct TimePickerPage {
  @State isMilitaryTime: boolean = false
  private selectedTime: Date = new Date('2022-07-22T10:00:00')
  private selectedDate: Date = new Date('2021-08-08')
  private selectedDate1: Date = new Date('2021-08-08')
  @State hour: number = 10
  @State isLunar: boolean = false
  @State minute: number = 0
  @State onChangeOff: string = 'false'
  @State onDateChangeOff: string = 'false'
  messageManager: MessageManager = new MessageManager()
  @State enableCascade: boolean | undefined | null = true
  @State modifier:DatePickerModifier = new DatePickerModifier().onDateChange((value: Date) => {
    this.onDateChangeOff = 'true'
    console.info('check002 DatePickerOnDateChangeModifier select: ' + value.toString())
  })
  @State modifier1:DatePickerModifier = new DatePickerModifier().onChange((value: DatePickerResult) => {
    console.info('check002 DatePickerOnchange modifier select current year is: ' + value.year)
    console.info('check002 DatePickerOnchange modifier select current month is: ' + value.month)
    console.info('check002 DatePickerOnchange modifier select current day is: ' + value.day)
    this.onChangeOff = 'true'
  })


  build() {
    Column() {
      Row() {
        Button('切换公历农历')
          .margin({ top: 30, bottom: 30 })
          .onClick(() => {
            this.isLunar = !this.isLunar
          }).id('LunarBtn')
      }

      DatePicker({
        start: new Date('1970-1-1'),
        end: new Date('2100-1-1'),
        selected: this.selectedDate
      })
        .id('DatePicker')
        .lunar(this.isLunar)
        .attributeModifier(this.modifier1 as DatePickerModifier)
        .attributeModifier(this.modifier as DatePickerModifier)

      Text(this.onChangeOff.toString()).key('onChangeOff')
      Text(this.onDateChangeOff.toString()).key('onDateChangeOff')
    }
  }
}
