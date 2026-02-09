/*
 * Copyright (c) 2023 Huawei Device Co., Ltd.
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

@Entry
@Component
struct stageTimePickerDialog {
  private selectTime: Date = new Date('2020-12-25T08:30:00');

  build() {
    Row() {
      Column() {
        Text("TimePickerDialog1")
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
          .key("TimePickerDialog1")
          .onClick(() => {
            try {
              globalThis.uiContent.showTimePickerDialog({
                selected: this.selectTime,
                onAccept: (value: TimePickerResult) => {
                  this.selectTime.setHours(value.hour, value.minute)
                  console.info("TimePickerDialog:onAccept()" + JSON.stringify(value))
                },
                onCancel: () => {
                  console.info("TimePickerDialog:onCancel()")
                },
                onChange: (value: TimePickerResult) => {
                  console.info("TimePickerDialog:onChange()" + JSON.stringify(value))
                }
              })
              let backData: events_emitter.EventData = {
                data: {
                  "STATUS": true
                }
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

        Text("TimePickerDialog2")
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
          .key("TimePickerDialog2")
          .onClick(() => {
            try {
              globalThis.uiContent.showTimePickerDialog({
                selected: this.selectTime,
                onAccept: (value: TimePickerResult) => {
                  this.selectTime.setHours(value.hour, value.minute)
                  console.info("TimePickerDialog:onAccept()" + JSON.stringify(value))
                },
                onCancel: () => {
                  console.info("TimePickerDialog:onCancel()")
                },
                onChange: (value: TimePickerResult) => {
                  console.info("TimePickerDialog:onChange()" + JSON.stringify(value))
                }
              })
              let backData1: events_emitter.EventData = {
                data: {
                  "STATUS": 10
                }
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

        Text("TimePickerDialog3")
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
          .key("TimePickerDialog3")
          .onClick(() => {
            try {
              globalThis.uiContent.showTimePickerDialog({
                selected: this.selectTime,
                onAccept: (value: TimePickerResult) => {
                  this.selectTime.setHours(value.hour, value.minute)
                  console.info("TimePickerDialog:onAccept()" + JSON.stringify(value))
                },
                onCancel: () => {
                  console.info("TimePickerDialog:onCancel()")
                },
                onChange: (value: TimePickerResult) => {
                  console.info("TimePickerDialog:onChange()" + JSON.stringify(value))
                }
              })
              let backData2: events_emitter.EventData = {
                data: {
                  "STATUS": "STATUS"
                }
              }
              let backEvent2: events_emitter.InnerEvent = {
                eventId: 60222,
                priority: events_emitter.EventPriority.LOW
              }
              console.info("showActionMenu start to emit action state")
              events_emitter.emit(backEvent2, backData2)
            } catch (error) {
              console.error(`showActionMenu args error code is ${(error as BusinessError).code}, message is ${(error as Error).message}`);
            }
          })
      }
      .height('100%')
    }
  }
}