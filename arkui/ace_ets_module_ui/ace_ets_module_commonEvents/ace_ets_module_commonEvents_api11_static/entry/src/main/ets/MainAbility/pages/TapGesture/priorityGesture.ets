'use static';
/**
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
import emitter from '@ohos.events.emitter'
import {
  $rawfile,
  Color,
  Column,
  ColumnOptions,
  Component,
  CopyOptions,
  CustomBuilder,
  DragItemInfo,
  Entry,
  Flex,
  FlexAlign,
  FlexDirection,
  GestureEvent,
  GestureMask,
  ItemAlign,
  Margin,
  Padding,
  Row,
  TapGesture,
  Text,
  TextAlign,
  TextArea,
  TouchType,
  Visibility
} from '@ohos.arkui.component'
import { AppStorage, State } from '@ohos.arkui.stateManagement'
import { Router, UIContext } from '@ohos.arkui.UIContext';
import { RecordData } from '@ohos.base';

@Entry
@Component
struct GestureSettingsExample {
  @State value: string = ''

  build() {
    Column() {
      Text('Click\n' + this.value).gesture(TapGesture()
        .onAction(() => {
          this.value = 'gesture onAction'
          try {
            let backData: emitter.EventData = {
              data: {
                "value": this.value
              } as Record<String,RecordData>
            }
            let backEvent: emitter.InnerEvent = {
              eventId: 162,
              priority: emitter.EventPriority.LOW
            }
            console.info("click to emit action state")
            emitter.emit(backEvent, backData)
          } catch (err: Error) {
            console.info("click action state err: " + JSON.stringify((err as Error)?.message))
          }
        })
      )
        .key('tapGesture')
    }
    .height(200)
    .width(300)
    .padding(60)
    .border({ width: 1 })
    .margin(30)
    .priorityGesture(
      TapGesture()
        .onAction(() => {
          this.value = 'priorityGesture onAction'
        }), GestureMask.IgnoreInternal
    )
  }
}