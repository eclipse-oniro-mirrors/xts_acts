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

@Entry
@Component
struct TimePickerEnableCascadePage {
  @State isMilitaryTime: boolean = false
  private selectedTime: Date = new Date('2022-07-22T10:00:00')
  @State hour: number = 10
  @State minute: number = 0
  @State mode: boolean = true
  messageManager: MessageManager = new MessageManager()
  @State enableCascade: boolean | undefined | null = true

  onPageShow() {
    console.info('TimePicker onPageShow')
    globalThis.value = {
      name: 'messageManager', message: this.messageManager

    }
    let callback: Callback = (message: ESObject) => {
      console.error('message = ' + message.name + '--' + message.value)
      if (message.name == 'isMilitaryTime') {
        this.isMilitaryTime = message.value
      }
      if (message.name == 'selectedTime') {
        this.selectedTime = message.value
      }
      if (message.name == 'hour') {
        this.hour = message.value
      }
      if (message.name == 'minute') {
        this.minute = message.value
      }
    }
    this.messageManager.registerCallback(callback)
  }

  build() {
    Column() {
      Row() {
        Button('切换12小时制')
          .width('5%')
          .height('5%')
          .margin({ top: 5 })
          .id('12hour')
          .onClick(() => {
            this.selectedTime = new Date('2022-07-22T10:00:00')
            this.isMilitaryTime = false
            this.hour = 10
          })

        Button('切换24小时制')
          .width('5%')
          .height('5%')
          .margin({ top: 5 })
          .id('24hour')
          .onClick(() => {
            this.selectedTime = new Date('2022-07-22T10:00:00')
            this.isMilitaryTime = true
            this.hour = 10
          })
      }

      Row() {
        Button('切换enableCascade值-true')
          .width('5%')
          .height('5%')
          .margin({ top: 5 })
          .id('timePicker-true')
          .onClick(() => {
            this.enableCascade = true

          })

        Button('切换enableCascade值-false')
          .width('5%')
          .height('5%')
          .margin({ top: 5 })
          .id('timePicker-false')
          .onClick(() => {
            this.enableCascade = false

          })
      }

      Row() {
        Button('切换enableCascade值-null')
          .width('5%')
          .height('5%')
          .margin({ top: 5 })
          .id('timePicker-null')
          .onClick(() => {
            this.enableCascade = null

          })

        Button('切换enableCascade值-undefined')
          .width('5%')
          .height('5%')
          .margin({ top: 5 })
          .id('timePicker-undefined')
          .onClick(() => {
            this.enableCascade = undefined

          })
      }

      TimePicker({
        selected: this.selectedTime,
      })
        .key('timePicker')
        .width('100%')
        .height('50%')
        .enableCascade(this.enableCascade)
        .useMilitaryTime(this.isMilitaryTime)
        .onChange((value: TimePickerResult) => {
          this.hour = value.hour
          this.minute = value.minute
          this.selectedTime.setHours(value.hour, value.minute)
          console.info('select current date is: ' + JSON.stringify(value))
        })
      Text('hour:' + this.hour).fontSize(20).margin(10).key('hour')
      Text('minute:' + this.minute).fontSize(20).margin(10).key('minute')
      Text('24hour:false')
    }
    .width('100%')
    .height('50%')
  }
}
