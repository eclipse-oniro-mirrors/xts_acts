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

import GlobalContext from '../../../../common/GlobalContext';
import { Value } from '../../../../common/Value';
import { MessageManager, Callback, Message } from '../../../../common/MessageManager';

@Entry
@Component
struct Flex_NoWrap_DisplayPriority {
  @State firstTextPriority: number = 1;
  @State secondTextPriority: number = 1;
  @State thirdTextPriority: number = 1;
  messageManager: MessageManager<number> = new MessageManager();

  onPageShow() {
    console.info('Flex_NoWrap_DisplayPriority onPageShow');
    let value: Value<number> = {
      name: 'messageManager',
      message: this.messageManager
    };
    GlobalContext.getContext().setObject('value', value);
    let callback: Callback<number> = (message: Message<number>) => {
      console.log('message = ' + message.name + "--" + message.value);
      if (message.name == 'firstTextPriority') {
        this.firstTextPriority = message.value;
      }
      if (message.name == 'secondTextPriority') {
        this.secondTextPriority = message.value;
      }
      if (message.name == 'thirdTextPriority') {
        this.thirdTextPriority = message.value;
      }
    };
    this.messageManager.registerCallback(callback);
  }

  build() {
    Column({ space: 30 }) {
      Flex({ wrap: FlexWrap.NoWrap }) {
        Text('1')
          .width(150)
          .height(100)
          .backgroundColor(0xF5DEB3)
          .displayPriority(this.firstTextPriority)
          .key('NoWrap_DisplayPriority01');
        Text('2')
          .width(150)
          .height(150)
          .backgroundColor(0xD2B48C)
          .displayPriority(this.secondTextPriority)
          .key('NoWrap_DisplayPriority02');
        Text('3')
          .width(250)
          .height(200)
          .backgroundColor(0xF5DEB3)
          .displayPriority(this.thirdTextPriority)
          .key('NoWrap_DisplayPriority03');
      }
      .width(500)
      .height(200)
      .backgroundColor(0xAFEEEE)
      .key('Flex_DisplayPriority_Container01')
    }
    .width('100%')
    .height('100%')
  }
}