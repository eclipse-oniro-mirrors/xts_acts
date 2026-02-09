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
  Column,
  Component,
  Button,
  Text,
  Row,
  Color,
  $r,
  Margin,
  ColumnOptions,
  Flex,
  Scroll,
  Padding,
  Position,
  Builder,
  Image,
  FlexDirection,
  ItemAlign,
  FlexAlign,
  Alignment,
  TextAlign,
  TextOverflow,
  ButtonAttribute,
  AttributeModifier,
  FunctionKey,
  ModifierKey
} from '@ohos.arkui.component';
import { State, AppStorage } from '@ohos.arkui.stateManagement';
import { ClickEvent } from '@ohos.arkui.component';
import { RecordData } from '@ohos.base';

class ButtonModifier1 implements AttributeModifier<ButtonAttribute> {
  applyNormalAttribute(instance: ButtonAttribute): void {
    instance.keyboardShortcut(FunctionKey.TAB, [ModifierKey.CTRL]);
  }
}

class ButtonModifier2 implements AttributeModifier<ButtonAttribute> {
  applyNormalAttribute(instance: ButtonAttribute): void {
    instance.keyboardShortcut(FunctionKey.DPAD_LEFT, [ModifierKey.SHIFT]);
  }
}

@Entry
@Component
struct KeyboardShortcutTest {
  @State buttonModifier: ButtonModifier1 = new ButtonModifier1();
  @State buttonModifier2: ButtonModifier2 = new ButtonModifier2();
  baseEvent1: number = 35872
  baseEvent2: number = 35873

  sendEvent(message: string, eventId: number) {
    let eventData: events_emitter.EventData = {
      data: {
        "msg": message
      } as Record<String,RecordData>
    } as events_emitter.EventData
    let event: events_emitter.InnerEvent = {
      eventId: eventId as Long,
      priority: events_emitter.EventPriority.LOW
    } as events_emitter.InnerEvent
    events_emitter.emit(event, eventData)
  }

  build() {
    Scroll() {
      Column({ space: 10 } as ColumnOptions) {
        Button("Ctrl + TAB")
          .attributeModifier(this.buttonModifier)
          .onClick((e: ClickEvent) => {
            this.sendEvent('Ctrl_TAB', this.baseEvent1)
          })
          .key('KeyboardShortcut_Button_0')
        Button("Shift + left")
          .attributeModifier(this.buttonModifier2)
          .onClick((e: ClickEvent) => {
            this.sendEvent('Shift_left', this.baseEvent2)
          })
          .key('KeyboardShortcut_Button_1')
      }.width("100%")
    }
  }
}