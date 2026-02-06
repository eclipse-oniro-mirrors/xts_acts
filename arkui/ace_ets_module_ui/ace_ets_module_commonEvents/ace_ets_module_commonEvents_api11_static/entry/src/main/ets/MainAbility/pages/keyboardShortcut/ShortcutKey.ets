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

import emitter from '@ohos.events.emitter';
import {
  $rawfile,
  Button,
  ClickEvent,
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
  ForEach,
  FunctionKey,
  ItemAlign,
  Margin,
  ModifierKey,
  Padding,
  Row,
  Scroll,
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
struct ShortcutKey {
  baseEvent: Long = 62000
  baseEvent2: Long = 73000
  private functionKey: FunctionKey[] = [
    FunctionKey.ESC,
    FunctionKey.F1,
    FunctionKey.F2,
    FunctionKey.F3,
    FunctionKey.F4,
    FunctionKey.F5,
    FunctionKey.F6,
    FunctionKey.F7,
    FunctionKey.F8,
    FunctionKey.F9,
    FunctionKey.F10,
    FunctionKey.F11,
    FunctionKey.F12,
  ]

  sendEvent(message: string, eventId: Long) {
    let eventData: emitter.EventData = {
      data: {
        "msg": message
      } as Record<String,RecordData>
    }
    let event: emitter.InnerEvent = {
      eventId: eventId,
      priority: emitter.EventPriority.LOW
    }
    emitter.emit(event, eventData)
  }

  build() {
    Scroll() {
      Column({ space: 10 } as ColumnOptions) {
        Button("Ctrl + B")
          .keyboardShortcut('B', [ModifierKey.CTRL])
          .onClick((e: ClickEvent) => {
            this.sendEvent('Ctrl_B', this.baseEvent)
          })
          .key('ShortcutKey_Button_0')

        ForEach(this.functionKey, (item: FunctionKey, index: Int): void => {
          Button("CTRL + " + item)
            .keyboardShortcut(item, [ModifierKey.CTRL])
            .onClick((e: ClickEvent) => {
              this.sendEvent('Ctrl_' + FunctionKey[item], this.baseEvent2 + index.toLong())
            })
            .width("80%")
            .key('ShortcutKey2_Ctrl_' + item)
        }, (item: FunctionKey): string => item.toString())

        Button("Shift+1")
          .keyboardShortcut("1", [ModifierKey.SHIFT])
          .onClick((e: ClickEvent) => {
            this.sendEvent('Shift_1', 72002)
          })
        Button("Alt+Q")
          .keyboardShortcut("Q", [ModifierKey.ALT])
          .onClick((e: ClickEvent) => {
            this.sendEvent('Alt_Q', 72003)
          })
      }.width("100%")
    }
  }
}