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
import {MessageManager,Callback} from '../../utils/MessageManager';

@Entry
@Component
struct TimePickerPage {
  @State isMilitaryTime: boolean = true
  private selectedTime: Date = new Date('2022-02-22T08:00:00')
  @State hour: number = 8
  @State minute: number = 0
  @State mode: boolean = true
  messageManager:MessageManager = new MessageManager()

  onPageShow() {
    console.info('TimePicker onPageShow')
    globalThis.value = {
      name:'messageManager',message:this.messageManager
    }
    let callback:Callback = (message: ESObject) => {
      console.error('message = ' + message.name + "--" + message.value)
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
      Button('切换12小时制/24小时制')
        .fontSize(14)
        .key('button')
        .onClick(() => {
          this.mode = !this.mode
          this.isMilitaryTime = !this.isMilitaryTime
        })
      TimePicker({
        selected: this.selectedTime,
      })
        .key('timePicker')
        .width('60%')
        .height("50%")
        .useMilitaryTime(this.isMilitaryTime)
        .onChange((value: TimePickerResult) => {
          this.hour = value.hour
          this.minute = value.minute
          this.selectedTime.setHours(value.hour, value.minute)
          console.info('select current date is: ' + JSON.stringify(value))
        })
      Text('hour:' + this.hour).fontSize(14).key('hour')
      Text('minute:' + this.minute).fontSize(14).key('minute')
      Text('24hour:' + this.mode).fontSize(14).key('mode')
    }.alignItems(HorizontalAlign.Center).width('100%').height('90%').margin({ top: 20 })
  }
}