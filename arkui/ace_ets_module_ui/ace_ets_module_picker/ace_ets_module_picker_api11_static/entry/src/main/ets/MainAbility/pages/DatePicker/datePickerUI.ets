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
import {MessageManager,Callback, Message} from '../../../MainAbility/common/MessageManager';
import {
  Entry,
  Component,
  Column,
  Text,
  Margin,
  Row,
  ClickEvent,
  Flex,
  FlexDirection,
  ItemAlign,
  FlexAlign,
  Alignment,
  TextAlign,
  TextOverflow,
  Color,
  $r,
  DatePicker,
  DatePickerResult,
  DatePickerOptions,
  Button
} from '@ohos.arkui.component';
import { State, AppStorage } from '@ohos.arkui.stateManagement'
@Entry
@Component
struct DatePickerUIExample {
  @State isLunar: boolean = false
  @State message: string = 'touch'
  private selectedDate: Date = new Date('2021-08-08')
    @State options:DatePickerOptions = {
      start: new Date('1970-1-1'),
      end: new Date('2100-1-1'),
      selected: this.selectedDate
  } as DatePickerOptions
  messageManager:MessageManager = new MessageManager()
   onPageShow() {
    console.info('Checkbox onPageShow')
    AppStorage.setOrCreate('messageManager', this.messageManager)
    let callback:Callback = (message: Message) => {
      if (message.name == 'isLunar') {
        console.log('message.value',message.value)
          this.isLunar = message.value as boolean
      }
      if (message.name == 'options') {
          this.options = message.value as DatePickerOptions
      }

    }
    this.messageManager.registerCallback(callback)

  }

  build() {
    Column() {
      Button('切换公历农历')
        .margin({ top: 30 } as Margin)
        .onClick((e:ClickEvent) => {
          this.isLunar = !this.isLunar
        })
      Text(this.message)
        .fontSize(14)
        .lineHeight(20)
        .fontColor('#182431')
        .fontWeight(500)
        .margin({ top: 20 } as Margin)
        .key('dptouch')
        .id('dptouch')
      DatePicker(this.options)
        .lunar(this.isLunar)
        .onDateChange((value: Date) => {
          this.selectedDate.setFullYear(value.getYear() ?? 0, value.getMonth(), value.getDate())
          console.info('select current date is: ' + JSON.stringify(value))
          this.message = JSON.stringify(value.getYear())
        })
        .key('datePickerUI')
        .id('datePickerUI')

    }.width('100%')
  }
}