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
struct DatePickerDialogExampleA {
  selectedDate: Date = new Date("2010-1-1")

  build() {
    Column() {
      Button("DatePickerDialog按esc弹窗逐层退出").key('DatePicker_dialog_B')
        .margin(20)
        .onClick(() => {
          DatePickerDialog.show({
            start: new Date("2000-1-1"),
            end: new Date("2100-12-31"),
            selected: this.selectedDate,
            lunar: true,
            disappearTextStyle: { color: Color.Pink, font: { size: '22fp', weight: FontWeight.Bold } },
            textStyle: { color: '#ff00ff00', font: { size: '18fp', weight: FontWeight.Normal } },
            selectedTextStyle: { color: '#ff182431', font: { size: '14fp', weight: FontWeight.Regular } },
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
              console.info("DatePickerDialog onWillAppear()")
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
              console.info("DatePickerDialog:onDidAppear()")
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
              console.info("DatePickerDialog onWillDisappear()")
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
              console.info("DatePickerDialog:onDidDisappear()")
            },
          })
        })
    }.width('100%').margin({ top: 200 })
  }
}