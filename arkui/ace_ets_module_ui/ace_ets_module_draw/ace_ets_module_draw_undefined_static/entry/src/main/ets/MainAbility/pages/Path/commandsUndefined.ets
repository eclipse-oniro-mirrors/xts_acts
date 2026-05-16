'use static';
/**
 * Copyright (c) 2026 Huawei Device Co., Ltd.
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

import {
  Entry, Text, Column, Component, Button, ClickEvent, Path, Row, Color
} from '@ohos.arkui.component'
import { State } from '@ohos.arkui.stateManagement'
import hilog from '@ohos.hilog'

@Entry
@Component
struct Commands1 {
  @State isCommands: boolean = false;

  build() {
    Column() {
      Text('action commands')
      Path()
        .id('path_action')
        .width('90%')
        .height('30%')
        .stroke(Color.Red)
        .strokeWidth(3)
        .commands(this.isCommands ? 'M0 0 L100 0' : undefined)

      Row() {
        Button('isCommands' + this.isCommands).onClick((event: ClickEvent) => {
          this.isCommands = !this.isCommands;
        }).margin(5).id('commands_action')
      }
    }
    .width('100%')
    .height('100%')
  }
}