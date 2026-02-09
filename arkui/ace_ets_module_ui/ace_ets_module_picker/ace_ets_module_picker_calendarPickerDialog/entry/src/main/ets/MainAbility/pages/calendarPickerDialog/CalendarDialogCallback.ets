/**
 * Copyright (c) 2024 Huawei Device Co., Ltd.
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
 */
import events_emitter from '@ohos.events.emitter';

@Entry
@Component
struct CalendarDialogCallbackPage {
  private selectedDate: Date = new Date()
  build() {
    Column() {
      Button('CalendarPickerDialog按esc弹窗逐层退出').key('Calendar_dialog_A')
        .margin(20)
        .onClick(() => {
          console.info('CalendarDialog.show')
          CalendarPickerDialog.show({
            selected: this.selectedDate,
            onAccept: (value) => {
              console.info('calendar onAccept:' + JSON.stringify(value))
            },
            onCancel: () => {
              console.info('calendar onCancel')
            },
            onChange: (value) => {
            },
            onWillAppear: () => {
              let eventData: events_emitter.EventData = {
                data: {
                  'action': 'onWillAppear'
                }
              }
              let event: events_emitter.InnerEvent = {
                eventId: 50001,
                priority: events_emitter.EventPriority.LOW
              }
              events_emitter.emit(event, eventData)
              console.info('CalendarPickerDialog: onWillAppear()')
            },
            onDidAppear: () => {
              let eventData: events_emitter.EventData = {
                data: {
                  'action': 'onDidAppear'
                }
              }
              let event: events_emitter.InnerEvent = {
                eventId: 50002,
                priority: events_emitter.EventPriority.LOW
              }
              events_emitter.emit(event, eventData)
              console.info('CalendarPickerDialog: onDidAppear()')
            },
            onWillDisappear: () => {
              let eventData: events_emitter.EventData = {
                data: {
                  'action': 'onWillDisappear'
                }
              }
              let event: events_emitter.InnerEvent = {
                eventId: 50003,
                priority: events_emitter.EventPriority.LOW
              }
              events_emitter.emit(event, eventData)
              console.info('CalendarPickerDialog: onWillDisappear()')
            },
            onDidDisappear: () => {
              let eventData: events_emitter.EventData = {
                data: {
                  'action': 'onDidDisappear'
                }
              }
              let event: events_emitter.InnerEvent = {
                eventId: 50004,
                priority: events_emitter.EventPriority.LOW
              }
              events_emitter.emit(event, eventData)
              console.info('CalendarPickerDialog: onDidDisappear()')
            },
          })
        })


    }.width('100%').margin({ top: 200 })
  }
}