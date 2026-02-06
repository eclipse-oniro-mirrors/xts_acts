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
import { MessageManager, Callback, Message } from '../../common/MessageManager';
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
  Checkbox
} from '@ohos.arkui.component';
import { State, AppStorage } from '@ohos.arkui.stateManagement';
import { ClickEvent } from '@ohos.arkui.component';
import { UIContext } from '@ohos.arkui.UIContext';

@Entry
@Component
struct CheckboxExample {
  @State select: boolean = true;
  @State selectedColor: string = "#ed6f21"
  messageManager: MessageManager<string | boolean> = new MessageManager<string | boolean>()

  onPageShow() {
    console.info('Checkbox onPageShow')
    AppStorage.setOrCreate<MessageManager<string | boolean>>("messageManager", this.messageManager);
    let callback: Callback<string | boolean> = (message: Message<string | boolean>) => {
      console.error('message = ' + message.name + "--" + message.value)
      if (message.name == 'select') {
        this.select = message.value as Boolean
      }
      if (message.name == 'selectedColor') {
        this.selectedColor = message.value as String
      }

    }
    this.messageManager.registerCallback(callback)

  }

  build() {
    Row() {
      Checkbox({ name: 'checkbox1', group: 'checkboxGroup' })
        .select(this.select)
        .selectedColor(this.selectedColor)
        .onClick(() => {
          this.select = !this.select
        })
        .onChange((value: boolean) => {
          if (value) {
            this.selectedColor = "#ffff21"
          } else {
            this.selectedColor = "#000000"
          }
        }).id('chek1')
      Checkbox({ name: 'checkbox2', group: 'checkboxGroup' })
        .select(false)
        .selectedColor(0x39a2db)
        .onChange((value: boolean) => {
          console.info('Checkbox2 change is' + value)
        }).key("check2")
    }
  }
}