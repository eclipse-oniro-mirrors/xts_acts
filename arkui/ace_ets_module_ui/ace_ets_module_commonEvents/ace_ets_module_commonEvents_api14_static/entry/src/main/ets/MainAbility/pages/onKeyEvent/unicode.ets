'use static';
/**
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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
import { IntentionCode } from '@ohos.multimodalInput.intentionCode';
import { State, AppStorage } from '@ohos.arkui.stateManagement'
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { sendKeyEvent } from "@ohos.arkui.Test";
import router from '@ohos.router';
import {
  KeyEvent,
  KeySource,
  KeyType,
  Color,
  HorizontalAlign,
  Padding,
  GestureEvent,
  ColumnOptions,
  Entry,
  Column,
  Text,
  Button,
  ClickEvent,
  Component,
  Margin,
  SourceTool,
  KeySource
} from '@ohos.arkui.component'

@Entry
@Component
struct KeyEventExample {
  @State label: boolean = false

  build() {
    Column() {
      Button('' + this.label)
        .defaultFocus(true)
        .onFocus(() => {
          setTimeout(() => {
            let keyEvent: KeyEvent = {
              type: KeyType.Down,
              keyCode: 2017,
              keyText: 'A',
              keySource: KeySource.Keyboard,
              deviceId: 0,
              metaKey: 1,
              timestamp: 0,
              unicode: 97,
              stopPropagation: () => {
              },
              intentionCode: IntentionCode.INTENTION_SELECT
            }
            const res = sendKeyEvent(keyEvent)
            
          }, 20)
        })
        .id('unicode_KeyEvent')
        .onKeyEvent((event?: KeyEvent):boolean => {
          if (event) {
            
            if (event.unicode == 97) {
              this.label = true;
            }
          }
          return true
        })
    }.height(300).width('100%').padding(35)
  }
}