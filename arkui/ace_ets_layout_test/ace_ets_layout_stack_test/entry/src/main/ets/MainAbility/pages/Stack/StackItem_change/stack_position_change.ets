/**
 * Copyright (c) 2023 iSoftStone Information Technology (Group) Co.,Ltd.
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

import { MessageManager, Callback, Message } from '../../../common/MessageManager';

@Entry
@Component
struct Stack_Position_Change {
  @State addPosition: Position = { x: 20, y: 20 };
  @State addAlignContent: number = Alignment.TopStart;
  messageManager: MessageManager<Position | number> = new MessageManager();

  onPageShow() {
    console.info('Stack_Position_Change onPageShow');
    globalThis.value = {
      name: 'messageManager', message: this.messageManager
    };
    let callback: Callback<Position | number> = (message: Message<Position | number>) => {
      console.log('message = ' + message.name + "--" + message.value);
      if (message.name == 'addPosition') {
        this.addPosition = message.value as Position;
      }
      if (message.name == 'addAlignContent') {
        this.addAlignContent = message.value as number;
      }
    };
    this.messageManager.registerCallback(callback);
  }

  build() {
    Stack({ alignContent: this.addAlignContent }) {
      Text('1')
        .width(200)
        .height(200)
        .backgroundColor(0xF5DEB3)
        .key('Stack_Position_Change_011')
        .position(this.addPosition);
      Text('2').width(100).height(100).backgroundColor(0xD2B48C).key('Stack_Position_Change_012');
    }
    .width(300)
    .height(300)
    .backgroundColor(0xAFEEEE)
    .key('Stack_Position_Change_01')
  }
}