/*
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
struct ShortcutKey {
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

  sendEvent(message: string, eventId: number) {
    let eventData: events_emitter.EventData = {
      data: {
        "msg": message
      }
    }
    let event: events_emitter.InnerEvent = {
      eventId: eventId,
      priority: events_emitter.EventPriority.LOW
    }
    events_emitter.emit(event, eventData)
  }

  baseEvent = 62000
  baseEvent2 = 73000

  build() {
    Scroll() {
      Column({ space: 10 }) {
        Button("Ctrl + B")
          .keyboardShortcut('B', [ModifierKey.CTRL])
          .onClick(() => {
            this.sendEvent('Ctrl_B', this.baseEvent)
          })
          .key('ShortcutKey_Button_0')

        ForEach(this.functionKey, (item: string, index) => {
          Button("CTRL + " + item)
            .keyboardShortcut(item, [ModifierKey.CTRL])
            .onClick(() => {
              this.sendEvent('Ctrl_' + FunctionKey[item], this.baseEvent2 + index)
            })
            .width("80%")
            .key('ShortcutKey2_Ctrl_' + item)
        }, (item: string) => item)

        Button("Shift+1")
          .keyboardShortcut("1", [ModifierKey.SHIFT])
          .onClick(() => {
            this.sendEvent('Shift_1', 72002)
          })
        Button("Alt+Q")
          .keyboardShortcut("Q", [ModifierKey.ALT])
          .onClick(() => {
            this.sendEvent('Alt_Q', 72003)
          })
      }.width("100%")
    }
  }
}