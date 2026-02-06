/**
 * Copyright (c) 2024 Huawei Device Co., Ltd.
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
import events_emitter from '@ohos.events.emitter';

@Entry
@Component
struct TimePickerDialogCallbackPage {
  private selectTime: Date = new Date('2020-12-25T08:30:00')

  build() {
    Column() {
      Button("TimePickerDialog按esc弹窗逐层退出").key('TimePicker_dialog_B')
        .margin(20)
        .onClick(() => {
          TimePickerDialog.show({
            selected: this.selectTime,
            disappearTextStyle: { color: Color.Red, font: { size: 15, weight: FontWeight.Lighter } },
            textStyle: { color: Color.Black, font: { size: 20, weight: FontWeight.Normal } },
            selectedTextStyle: { color: Color.Blue, font: { size: 30, weight: FontWeight.Bolder } },

            onWillAppear: () => {
              let eventData: events_emitter.EventData = {
                data: {
                  "action": 'onWillAppear'
                }
              }
              let event: events_emitter.InnerEvent = {
                eventId: 50001,
                priority: events_emitter.EventPriority.LOW
              }
              events_emitter.emit(event, eventData)
              console.info("TimePickerDialog: onWillAppear()")
            },
            onDidAppear: () => {
              let eventData: events_emitter.EventData = {
                data: {
                  "action": 'onDidAppear'
                }
              }
              let event: events_emitter.InnerEvent = {
                eventId: 50002,
                priority: events_emitter.EventPriority.LOW
              }
              events_emitter.emit(event, eventData)
              console.info("TimePickerDialog: onDidAppear()")
            },
            onWillDisappear: () => {
              let eventData: events_emitter.EventData = {
                data: {
                  "action": 'onWillDisappear'
                }
              }
              let event: events_emitter.InnerEvent = {
                eventId: 50003,
                priority: events_emitter.EventPriority.LOW
              }
              events_emitter.emit(event, eventData)
              console.info("TimePickerDialog: onWillDisappear()")
            },
            onDidDisappear: () => {
              let eventData: events_emitter.EventData = {
                data: {
                  "action": 'onDidDisappear'
                }
              }
              let event: events_emitter.InnerEvent = {
                eventId: 50004,
                priority: events_emitter.EventPriority.LOW
              }
              events_emitter.emit(event, eventData)
              console.info("TimePickerDialog: onDidDisappear()")
            },
          })
        })
    }.width('100%')
  }
}