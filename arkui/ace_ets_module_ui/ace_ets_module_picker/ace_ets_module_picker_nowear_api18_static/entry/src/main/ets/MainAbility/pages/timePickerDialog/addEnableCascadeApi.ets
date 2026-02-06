'use static';
/*
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
 *
 */
import { MessageManager, Callback, Message } from '../../common/MessageManager';
import { Entry, Column, ColumnOptions, Component, Button, ClickEvent, Color, FontWeight, TimePickerResult } from '@ohos.arkui.component'
import { State, AppStorage } from '@ohos.arkui.stateManagement'

export interface GlobalMessage {
  name: string,
  message: MessageManager
}
@Entry
@Component
struct TimePickerPage {
  @State isMilitaryTime: boolean = false
  private selectedTime: Date = new Date('2022-07-22T10:00:00')
  @State hour: number = 10
  @State minute: number = 0
  @State mode: boolean = true
  messageManager: MessageManager = new MessageManager()
  @State enableCascade: boolean | undefined | null = true

  onPageShow() {
    console.info('TimePicker onPageShow')
    const globalMessage: GlobalMessage = {
      name: 'messageManager', message: this.messageManager
    } as GlobalMessage;
    AppStorage.setOrCreate<GlobalMessage>('TimePickerPage', globalMessage);
    let callback: Callback = (message: Message): void => {
      console.error('message = ' + message.name + '--' + message.value)
      if (message.name == 'isMilitaryTime') {
        this.isMilitaryTime = message.value as boolean
      }
      if (message.name == 'selectedTime') {
        // this.selectedTime = message.value
      }
      if (message.name == 'hour') {
      }
      if (message.name == 'minute') {
      }
    }
    this.messageManager.registerCallback(callback)
  }

  build() {
    Column() {
      Button('TimePickerDialog1')
        .key('TimePickerDialog1')
        .margin(20)
        .onClick((e: ClickEvent) => {
          this.getUIContext().showTimePickerDialog({
            selected: this.selectedTime,
            useMilitaryTime: this.isMilitaryTime,
            disappearTextStyle: { color: Color.Red, font: { size: 15, weight: FontWeight.Lighter } },
            textStyle: { color: Color.Black, font: { size: 20, weight: FontWeight.Normal } },
            selectedTextStyle: { color: Color.Blue, font: { size: 30, weight: FontWeight.Bolder } },
            onAccept: (value: TimePickerResult) => {
              if (value.hour != undefined && value.minute != undefined) {
                this.selectedTime.setHours(value.hour.toInt(), value.minute.toInt())
                console.info('TimePickerDialog:onAccept()' + JSON.stringify(value))
              }
            },
            enableCascade: true,
            onCancel: () => {
              console.info('TimePickerDialog:onCancel()')
            },
            onChange: (value: TimePickerResult) => {
              console.info('TimePickerDialog:onChange()' + JSON.stringify(value))
            },
            onDidAppear: () => {
              console.info('TimePickerDialog:onDidAppear()')
            },
            onDidDisappear: () => {
              console.info('TimePickerDialog:onDidDisappear()')
            },
            onWillAppear: () => {
              console.info('TimePickerDialog:onWillAppear()')
            },
            onWillDisappear: () => {
              console.info('TimePickerDialog:onWillDisappear()')
            }
          })
        })
      Button('TimePickerDialog2')
        .key('TimePickerDialog2')
        .margin(20)
        .onClick((e: ClickEvent) => {
          this.getUIContext().showTimePickerDialog({
            selected: this.selectedTime,
            useMilitaryTime: this.isMilitaryTime,
            disappearTextStyle: { color: Color.Red, font: { size: 15, weight: FontWeight.Lighter } },
            textStyle: { color: Color.Black, font: { size: 20, weight: FontWeight.Normal } },
            selectedTextStyle: { color: Color.Blue, font: { size: 30, weight: FontWeight.Bolder } },
            onAccept: (value: TimePickerResult) => {
              if (value.hour != undefined && value.minute != undefined) {
                this.selectedTime.setHours(value.hour.toInt(), value.minute.toInt())
                console.info('TimePickerDialog:onAccept()' + JSON.stringify(value))
              }
            },
            enableCascade: false,
            onCancel: () => {
              console.info('TimePickerDialog:onCancel()')
            },
            onChange: (value: TimePickerResult) => {
              console.info('TimePickerDialog:onChange()' + JSON.stringify(value))
            },
            onDidAppear: () => {
              console.info('TimePickerDialog:onDidAppear()')
            },
            onDidDisappear: () => {
              console.info('TimePickerDialog:onDidDisappear()')
            },
            onWillAppear: () => {
              console.info('TimePickerDialog:onWillAppear()')
            },
            onWillDisappear: () => {
              console.info('TimePickerDialog:onWillDisappear()')
            }
          })
        })
      Button('TimePickerDialog3')
        .key('TimePickerDialog3')
        .margin(20)
        .onClick((e: ClickEvent) => {
          this.getUIContext().showTimePickerDialog({
            selected: this.selectedTime,
            useMilitaryTime: this.isMilitaryTime,
            disappearTextStyle: { color: Color.Red, font: { size: 15, weight: FontWeight.Lighter } },
            textStyle: { color: Color.Black, font: { size: 20, weight: FontWeight.Normal } },
            selectedTextStyle: { color: Color.Blue, font: { size: 30, weight: FontWeight.Bolder } },
            onAccept: (value: TimePickerResult) => {
              if (value.hour != undefined && value.minute != undefined) {
                this.selectedTime.setHours(value.hour.toInt(), value.minute.toInt())
                console.info('TimePickerDialog:onAccept()' + JSON.stringify(value))
              }
            },
            onCancel: () => {
              console.info('TimePickerDialog:onCancel()')
            },
            onChange: (value: TimePickerResult) => {
              console.info('TimePickerDialog:onChange()' + JSON.stringify(value))
            },
            onDidAppear: () => {
              console.info('TimePickerDialog:onDidAppear()')
            },
            onDidDisappear: () => {
              console.info('TimePickerDialog:onDidDisappear()')
            },
            onWillAppear: () => {
              console.info('TimePickerDialog:onWillAppear()')
            },
            onWillDisappear: () => {
              console.info('TimePickerDialog:onWillDisappear()')
            }
          })
        })
      Button('TimePickerDialog4')
        .key('TimePickerDialog4')
        .margin(20)
        .onClick((e: ClickEvent) => {
          this.getUIContext().showTimePickerDialog({
            selected: this.selectedTime,
            useMilitaryTime: this.isMilitaryTime,
            disappearTextStyle: { color: Color.Red, font: { size: 15, weight: FontWeight.Lighter } },
            textStyle: { color: Color.Black, font: { size: 20, weight: FontWeight.Normal } },
            selectedTextStyle: { color: Color.Blue, font: { size: 30, weight: FontWeight.Bolder } },
            onAccept: (value: TimePickerResult) => {
              if (value.hour != undefined && value.minute != undefined) {
                this.selectedTime.setHours(value.hour.toInt(), value.minute.toInt())
                console.info('TimePickerDialog:onAccept()' + JSON.stringify(value))
              }
            },
            enableCascade: undefined,
            onCancel: () => {
              console.info('TimePickerDialog:onCancel()')
            },
            onChange: (value: TimePickerResult) => {
              console.info('TimePickerDialog:onChange()' + JSON.stringify(value))
            },
            onDidAppear: () => {
              console.info('TimePickerDialog:onDidAppear()')
            },
            onDidDisappear: () => {
              console.info('TimePickerDialog:onDidDisappear()')
            },
            onWillAppear: () => {
              console.info('TimePickerDialog:onWillAppear()')
            },
            onWillDisappear: () => {
              console.info('TimePickerDialog:onWillDisappear()')
            }
          })
        })

    }
    .width('100%')
    .height('50%')
  }
}
