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
import {
  Entry,
  Component,
  Column,
  Row,
  Text,
  ColumnOptions,
  TouchType,
  CustomBuilder,
  DragItemInfo,
  Color,
  Button,
  TouchEvent,
  Margin,
  Scroll,
  GestureEvent,
  LongPressGesture,
  TapGesture,
  ClickEvent,
  FlexAlign,
  GestureInfo,
  BaseGestureEvent,
  DragEvent,
  GestureControl,
  GestureJudgeResult,
  FunctionKey,
  ModifierKey
} from '@ohos.arkui.component'
import { State, AppStorage } from '@ohos.arkui.stateManagement'
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { RecordData } from '@ohos.base';

@Entry
@Component
struct ShortcutKeyDPADDOWN {
  sendEvent(message: string, eventId: Long) {
    let eventData: events_emitter.EventData = {
      data: {
        "msg": message
      } as Record<String,RecordData>
    }
    let event: events_emitter.InnerEvent = {
      eventId: eventId,
      priority: events_emitter.EventPriority.LOW
    }
    events_emitter.emit(event, eventData)
  }



  build() {
    Scroll() {
      Column({ space: 10 } as ColumnOptions) {
          Button('CTRL+DPAD_DOWN')
            .keyboardShortcut(FunctionKey.DPAD_DOWN, [ModifierKey.CTRL])
            .onClick((e:ClickEvent) => {
              this.sendEvent('CTRL+DPAD_DOWN', 75002)
            })
            .width("80%")
      }.width("100%")
    }
  }
}