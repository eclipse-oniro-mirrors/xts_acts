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

import inspector from '@ohos.arkui.inspector';
import { AppStorage, State } from '@ohos.arkui.stateManagement'
import { Router, UIContext } from '@ohos.arkui.UIContext';
import {
  BarState,
  Blank,
  Button,
  Checkbox,
  Color,
  Column,
  Component,
  Entry,
  FontWeight,
  Image,
  KeyEvent,
  KeyType,
  Menu,
  Radio,
  Row,
  ScrollBar,
  ScrollBarDirection,
  Scroller,
  Text,
  Toggle,
  ToggleType,
  TouchEvent
} from '@ohos.arkui.component'

const TAG = 'ets_apiLack_add';

@Entry
@Component
struct KeyEventExample {
  @State text: string = '';
  @State eventType: string = '';

  build() {
    Column() {
      Button('KeyEvent').backgroundColor(0x2788D9)
        .onKeyEvent((event: KeyEvent) => {
          if (event.type === KeyType.Down) {
            this.eventType = 'Down'
          }
          if (event.type === KeyType.Up) {
            this.eventType = 'Up'
          }
          console.info(this.text =
            'KeyType:' + this.eventType + '\nkeyCode:' + event.keyCode + '\nkeyText:' + event.keyText +
              '\nKeyboard:' + event.keySource.Keyboard)
          return false;
        })
      Text(this.text).padding(15)
    }.height(300).width('100%').padding(35)
  }
}