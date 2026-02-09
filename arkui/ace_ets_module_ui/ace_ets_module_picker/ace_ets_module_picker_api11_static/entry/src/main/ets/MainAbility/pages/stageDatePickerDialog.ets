'use static';
/*
 * Copyright (c) 2025-2026 Huawei Device Co., Ltd.
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
import { BusinessError } from '@ohos.base';
import { UIContext } from '@ohos.arkui.UIContext';
import { Entry, Component, Column, Text, Rating, Margin, Row, DatePickerResult, Alignment, TextAlign, TextOverflow, ClickEvent } from '@ohos.arkui.component';
import { State, AppStorage } from '@ohos.arkui.stateManagement'
import { RecordData } from '@ohos.base';
@Entry
@Component
struct stageDatePickerDialog {
  selectedDate: Date = new Date("2010-1-1");

  build() {
    Row() {
      Column() {
        Text("DatePickerDialog1")
          .width(100)
          .height(70)
          .fontSize(20)
          .opacity(1)
          .align(Alignment.TopStart)
          .fontColor(0xCCCCCC)
          .lineHeight(25)
          .border({ width: 1 })
          .padding(10)
          .textAlign(TextAlign.Center)
          .textOverflow({ overflow: TextOverflow.None })
          .key("DatePickerDialog1")
          .onClick((e:ClickEvent) => {
            try {
              AppStorage.get<UIContext>('uiContent')?.showDatePickerDialog({
                start: new Date("2000-1-1"),
                end: new Date("2100-12-31"),
                selected: this.selectedDate,
                onDateAccept: (value: Date) => {
                  this.selectedDate.setFullYear(value.getYear() ?? 0, value.getMonth(), value.getDate())
                  console.info("DatePickerDialog:onAccept()" + JSON.stringify(value))
                },
                onCancel: () => {
                  console.info("DatePickerDialog:onCancel()")
                },
                onDateChange: (value: Date) => {
                  console.info("DatePickerDialog:onChange()" + JSON.stringify(value))
                }
              })
              let backData: events_emitter.EventData = {
                data: {
                  "STATUS": true
                } as Record<String,RecordData>
              }
              let backEvent: events_emitter.InnerEvent = {
                eventId: 60220,
                priority: events_emitter.EventPriority.LOW
              }
              console.info("showDialog start to emit action state")
              events_emitter.emit(backEvent, backData)
            } catch (error) {
              console.error("showToast emit action state err:" + JSON.stringify((error as Error).message));
            }
            ;
          })

        Text("DatePickerDialog2")
          .width(100)
          .height(70)
          .fontSize(20)
          .opacity(1)
          .align(Alignment.TopStart)
          .fontColor(0xCCCCCC)
          .lineHeight(25)
          .border({ width: 1 })
          .padding(10)
          .textAlign(TextAlign.Center)
          .textOverflow({ overflow: TextOverflow.None })
          .key("DatePickerDialog2")
          .onClick((e:ClickEvent) => {
            try {
              AppStorage.get<UIContext>('uiContent')?.showDatePickerDialog({
                start: new Date("2000-1-1"),
                end: new Date("2100-12-31"),
                selected: this.selectedDate,
                onDateAccept: (value: Date) => {
                  this.selectedDate.setFullYear(value.getYear() ?? 0, value.getMonth(), value.getDate())
                  console.info("DatePickerDialog:onAccept()" + JSON.stringify(value))
                },
                onCancel: () => {
                  console.info("DatePickerDialog:onCancel()")
                },
                onDateChange: (value: Date) => {
                  console.info("DatePickerDialog:onChange()" + JSON.stringify(value))
                }
              })
              let backData1: events_emitter.EventData = {
                data: {
                  "STATUS": 10
                } as Record<String,RecordData>
              }
              let backEvent1: events_emitter.InnerEvent = {
                eventId: 60221,
                priority: events_emitter.EventPriority.LOW
              }
              console.info("showActionMenu start to emit action state")
              events_emitter.emit(backEvent1, backData1)
            } catch (error) {

            }
            ;
          })

        Text("DatePickerDialog3")
          .width(100)
          .height(70)
          .fontSize(20)
          .opacity(1)
          .align(Alignment.TopStart)
          .fontColor(0xCCCCCC)
          .lineHeight(25)
          .border({ width: 1 })
          .padding(10)
          .textAlign(TextAlign.Center)
          .textOverflow({ overflow: TextOverflow.None })
          .key("DatePickerDialog3")
          .onClick((e:ClickEvent) => {
            try {
              AppStorage.get<UIContext>('uiContent')?.showDatePickerDialog({
                start: new Date("2000-1-1"),
                end: new Date("2100-12-31"),
                selected: this.selectedDate,
                onDateAccept: (value: Date) => {
                  this.selectedDate.setFullYear(value.getYear() ?? 0, value.getMonth(), value.getDate())
                  console.info("DatePickerDialog:onAccept()" + JSON.stringify(value))
                },
                onCancel: () => {
                  console.info("DatePickerDialog:onCancel()")
                },
                onDateChange: (value: Date) => {
                  console.info("DatePickerDialog:onChange()" + JSON.stringify(value))
                }
              })
              let backData2: events_emitter.EventData = {
                data: {
                  "STATUS": "STATUS"
                } as Record<String,RecordData>
              }
              let backEvent2: events_emitter.InnerEvent = {
                eventId: 60222,
                priority: events_emitter.EventPriority.LOW
              }
              console.info("showActionMenu start to emit action state")
              events_emitter.emit(backEvent2, backData2)
            } catch (error) {
              console.error(`showActionMenu args error code is ${(error as BusinessError).code}, message is ${(error as BusinessError).message}`);
            }
            ;
          })

      }
      .height('100%')
    }
  }
}