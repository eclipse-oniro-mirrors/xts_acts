/**
 * Copyright (c) 2022 Huawei Device Co., Ltd.
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
import { MessageManager, Callback } from '../../common/MessageManager';
@Entry
@Component
struct DatePickerExample {
  @State isLunar: boolean = false
  @State message: string = 'touch'
  private selectedDate: Date = new Date('2021-08-08')
    @State options:DatePickerOptions = {
      start: new Date('1970-1-1'),
      end: new Date('2100-1-1'),
      selected: this.selectedDate
  }
  messageManager:MessageManager = new MessageManager()
   onPageShow() {
    console.info('Checkbox onPageShow')
    globalThis.value = {
      name:'messageManager',message:this.messageManager
    }
    let callback: Callback = (message: ESObject) => {
      console.error('message = ' + message.name + "--" + message.value)
      if (message.name == 'isLunar') {
          this.isLunar = message.value
      }
      if (message.name == 'options') {
          this.options = message.value
      }
      
    }
    this.messageManager.registerCallback(callback)

  }

  build() {
    Column() {
      Button('切换公历农历')
        .margin({ top: 30 })
        .onClick(() => {
          this.isLunar = !this.isLunar
        })
      Text(this.message).fontSize(14).lineHeight(20).fontColor('#182431').fontWeight(500).margin({top:20}).key('dptouch')  
      DatePicker(this.options)
        .lunar(this.isLunar)
        .onChange((value: DatePickerResult) => {
          this.selectedDate.setFullYear(value.year, value.month, value.day)
          console.info('select current date is: ' + JSON.stringify(value))
          this.message = JSON.stringify(value.year)
        }).key('datePicker')

    }.width('100%')
  }
}