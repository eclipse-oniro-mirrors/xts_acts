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
struct Flex_Wrap_FlexPad_TextMarPad {
  @State flexMargin: number = 0;
  @State flexPadding: number = 0;
  messageManager: MessageManager<number> = new MessageManager();

  onPageShow() {
    console.info('Flex_Wrap_FlexPad_TextMarPad onPageShow');
    let value: Value<number> = {
      name: 'messageManager',
      message: this.messageManager
    };
    GlobalContext.getContext().setObject('value', value);
    let callback: Callback<number> = (message: Message<number>) => {
      console.log('message = ' + message.name + "--" + message.value);
      if (message.name == 'flexMargin') {
        this.flexMargin = message.value;
      }
      if (message.name == 'flexPadding') {
        this.flexPadding = message.value;
      }
    };
    this.messageManager.registerCallback(callback);
  }

  build() {
    Column({ space: 30 }) {
      Flex({ wrap: FlexWrap.Wrap, direction: FlexDirection.Row }) {
        Text('1').width(150).height(50).backgroundColor(0xF5DEB3).key('Wrap_flex_pad1');
        Text('2').width(150).height(100).backgroundColor(0xD2B48C).key('Wrap_flex_pad2');
        Text('3').width(150).height(150).backgroundColor(0xF5DEB3).key('Wrap_flex_pad3');
      }
      .width(500)
      .height(300)
      .padding(this.flexPadding)
      .margin(this.flexMargin)
      .backgroundColor(0xAFEEEE)
      .key('Flex_Wrap_Pad_Container01')
    }
    .width('100%')
    .height('100%')
    .key('Column_Wrap_FlexPad_Container01')
  }
}