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
  Entry, Text, Column, Component, Button, ClickEvent, Path, Row, Color, AttributeModifier, PathAttribute
} from '@ohos.arkui.component'
import { State } from '@ohos.arkui.stateManagement'
import hilog from '@ohos.hilog'
import { Observed } from '@ohos.arkui.stateManagement'

@Observed
export class MyModifier implements AttributeModifier<PathAttribute> {
  public isCommands: boolean = false;
  applyNormalAttribute(instance: PathAttribute): void {
    instance
      .commands(this.isCommands ? 'M0 0 L100 0' : undefined)
  }
}

@Entry
@Component
struct CommandsModifier1 {
  @State modifier: MyModifier = new MyModifier();

  build() {
    Column() {
      Text('action commands')
      Path()
        .id('path_action_modifier')
        .width('90%')
        .height('30%')
        .stroke(Color.Red)
        .strokeWidth(3)
        .attributeModifier(this.modifier)

      Row() {
        Button('isCommands' + this.modifier.isCommands).onClick((event: ClickEvent) => {
          this.modifier.isCommands = !this.modifier.isCommands;
        }).margin(5).id('commands_action_modifier')
      }
    }
    .width('100%')
    .height('100%')
  }
}