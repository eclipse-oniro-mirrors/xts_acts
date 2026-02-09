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
struct Row_TextDisplayPriority {
  @State firstTextDisplayPriority: number = 0;
  @State secondTextDisplayPriority: number = 0;
  @State thirdTextDisplayPriority: number = 0;
  messageManager: MessageManager<number> = new MessageManager();

  onPageShow() {
    console.info('Row_TextDisplayPriority onPageShow');
    globalThis.value = {
      name: 'messageManager',
      message: this.messageManager
    };
    let callback: Callback<number> = (message: Message<number>) => {
      console.error('message = ' + message.name + "--" + message.value);
      if (message.name == 'firstTextDisplayPriority') {
        this.firstTextDisplayPriority = message.value;
      }
      if (message.name == 'secondTextDisplayPriority') {
        this.secondTextDisplayPriority = message.value;
      }
      if (message.name == 'thirdTextDisplayPriority') {
        this.thirdTextDisplayPriority = message.value;
      }
    };
    this.messageManager.registerCallback(callback);
  }

  build() {
    Column({ space: 30 }) {
      Row({ space: 10 }) {
        Text('1')
          .width(100)
          .height(50)
          .displayPriority(this.firstTextDisplayPriority)
          .backgroundColor(0xD2B48C)
          .key('Row_TextDisplayPriority1')
        Text('2')
          .width(150)
          .height(100)
          .displayPriority(this.secondTextDisplayPriority)
          .backgroundColor(0xF5DEB3)
          .key('Row_TextDisplayPriority2')
        Text('3')
          .width(200)
          .height(150)
          .displayPriority(this.thirdTextDisplayPriority)
          .backgroundColor(0xD2B48C)
          .key('Row_TextDisplayPriority3')
      }
      .width(350)
      .height(200)
      .backgroundColor(0xAFEEEE)
      .key('Row_TextDisplayPriority_Container01')
    }
    .width('100%')
    .height('100%')
  }
}