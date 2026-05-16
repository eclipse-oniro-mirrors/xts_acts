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
import { Entry, Component, Column, Text, Rating, Margin, Row, TimePickerResult, ClickEvent, Alignment, TextAlign, TextOverflow, Button } from '@ohos.arkui.component';
import { UIContext } from '@ohos.arkui.UIContext';
import { State, AppStorage } from '@ohos.arkui.stateManagement'
import { RecordData } from '@ohos.base';
@Entry
@Component
struct TimeStampExample {
  @State text: string = ''

  build() {
    Column() {
      Button('Click').backgroundColor(0x2788D9)
        .key('button')
        .onClick((event: ClickEvent) => {
          this.text = event.timestamp.toString()
          console.info(this.text)
          try {
            let backData: events_emitter.EventData = {
              data: {
                "Text": this.text,
              } as Record<String,RecordData>
            }
            let backEvent: events_emitter.InnerEvent = {
              eventId: 230,
              priority: events_emitter.EventPriority.LOW
            }
            events_emitter.emit(backEvent, backData)
          } catch (err) {
            console.info('button emit action state err: ' + JSON.stringify((err as Error).message))
          }
        })
      Text(this.text).padding(15)
    }.height(300).width('100%').padding(35)
  }
}