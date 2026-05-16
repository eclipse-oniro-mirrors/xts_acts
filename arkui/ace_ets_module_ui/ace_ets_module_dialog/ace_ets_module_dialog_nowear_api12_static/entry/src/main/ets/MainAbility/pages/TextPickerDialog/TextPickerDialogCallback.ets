'use static';
/**
 * Copyright (c) 2025-2026 Huawei Device Co., Ltd.
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
import { Entry, Column, Component, Flex, FlexDirection, ItemAlign, FlexAlign, Text, Button, FontWeight,
  Row, ClickEvent, Margin, ButtonType, ShadowStyle, Color,DialogAlignment,
  ButtonStyleMode, ButtonRole, FontStyle, TextPickerResult, TextPickerDialogOptions} from '@ohos.arkui.component'
import { State } from '@ohos.arkui.stateManagement'
import { UIContext } from '@ohos.arkui.UIContext';
import events_emitter from '@ohos.events.emitter';
import { RecordData } from '@ohos.base';
@Entry
@Component
struct TextPickerDialogExampleA {
  uiContext: UIContext = this.getUIContext()
  private select: number = 0
  private fruits: Array<string> = new Array<string>('apple1', 'orange2', 'peach3', 'grape4', 'banana5')

  build() {
    Row() {
      Column() {       
        Button("TextPickerDialog按esc弹窗逐层退出").key('TextPicker_dialog_B')
          .margin(20)
          .onClick((e:ClickEvent) => {
            this.uiContext.showTextPickerDialog({
              range: this.fruits,
              onWillAppear: () => {
                let eventData: events_emitter.EventData = {
                  data: {
                    "action": 'onWillAppear'
                  } as Record<String,RecordData>
                }
                let event: events_emitter.InnerEvent = {
                  eventId: 50001,
                  priority: events_emitter.EventPriority.LOW
                }
                events_emitter.emit(event, eventData)
                console.info("TextPickerDialog: onWillAppear()")
              },
              onDidAppear: () => {
                let eventData: events_emitter.EventData = {
                  data: {
                    "action": 'onDidAppear'
                  } as Record<String,RecordData>
                }
                let event: events_emitter.InnerEvent = {
                  eventId: 50002,
                  priority: events_emitter.EventPriority.LOW
                }
                events_emitter.emit(event, eventData)
                console.info("TextPickerDialog: onDidAppear()")
              },
              onWillDisappear: () => {
                let eventData: events_emitter.EventData = {
                  data: {
                    "action": 'onWillDisappear'
                  } as Record<String,RecordData>
                }
                let event: events_emitter.InnerEvent = {
                  eventId: 50003,
                  priority: events_emitter.EventPriority.LOW
                }
                events_emitter.emit(event, eventData)
                console.info("TextPickerDialog: onWillDisappear()")
              },
              onDidDisappear: () => {
                let eventData: events_emitter.EventData = {
                  data: {
                    "action": 'onDidDisappear'
                  } as Record<String,RecordData>
                }
                let event: events_emitter.InnerEvent = {
                  eventId: 50004,
                  priority: events_emitter.EventPriority.LOW
                }
                events_emitter.emit(event, eventData)
                console.info("TextPickerDialog: onDidDisappear()")
              },
            } as TextPickerDialogOptions)
          })
      }.width('100%')
    }.height('100%')
  }
}