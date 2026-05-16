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
import { Entry, Component, Row, Text, Column, Position, ColumnOptions, RowOptions } from '@ohos.arkui.component'
import { State, AppStorage  } from '@ohos.arkui.stateManagement';
import { MessageManager, Callback, Message } from '../../../common/MessageManager';

@Entry
@Component
struct Row_TextPosition {
  @State testPosition: Position = { x: 0, y: 0 } as Position;
  messageManager: MessageManager<Position> = new MessageManager<Position>();

  onPageShow() {
    console.info('Row_TextPosition onPageShow');
    AppStorage.setOrCreate<MessageManager<Position>>('messageManager', this.messageManager as MessageManager<Position>);
    let callback: Callback<Position> = (message: Message<Position>) => {
      console.error('message = ' + message.name + "--" + message.value);
      if (message.name == 'position') {
        this.testPosition = message.value;
      }
    };
    this.messageManager.registerCallback(callback);
  }

  build() {
    Column({ space: 30 } as ColumnOptions) {
      Row({ space: 10 } as RowOptions) {
        Text('1')
          .width(100)
          .height(50)
          .position(this.testPosition)
          .backgroundColor(0xD2B48C)
          .key('Row_TextPosition1')
        Text('2').width(100).height(100).backgroundColor(0xF5DEB3).key('Row_TextPosition2')
        Text('3').width(100).height(150).backgroundColor(0xD2B48C).key('Row_TextPosition3')
      }
      .width(350)
      .height(200)
      .backgroundColor(0xAFEEEE)
      .key('Row_TextPosition_Container01')
    }
    .width('100%')
    .height('100%')
  }
}