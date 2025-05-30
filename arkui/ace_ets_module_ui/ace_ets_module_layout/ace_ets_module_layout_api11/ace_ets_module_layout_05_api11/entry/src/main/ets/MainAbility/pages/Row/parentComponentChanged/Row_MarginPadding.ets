/*
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
struct Row_MarginPadding {
  @State rowPadding: number = 10;
  messageManager: MessageManager<number> = new MessageManager();

  onPageShow() {
    console.info('Row_MarginPadding onPageShow');
    globalThis.value = {
      name: 'messageManager',
      message: this.messageManager
    };
    let callback: Callback<number> = (message: Message<number>) => {
      console.error('message = ' + message.name + "--" + message.value);
      if (message.name == 'padding') {
        this.rowPadding = message.value;
      }
    };
    this.messageManager.registerCallback(callback);
  }

  build() {
    Column() {
      Row({ space: 10 }) {
        Text('1').width(100).height(50).backgroundColor(0xAFEEEE).key('Row_MarginPadding_Text1')
        Text('2').width(100).height(100).backgroundColor(0x00FFFF).key('Row_MarginPadding_Text2')
        Text('3').width(100).height(150).backgroundColor(0xAFEEEE).key('Row_MarginPadding_Text3')
      }
      .key('Row_MarginPadding')
      .width(350)
      .height(200)
      .margin(5)
      .padding(this.rowPadding)
      .backgroundColor(0xB05F77)
    }
    .width('100%')
    .alignItems(HorizontalAlign.Start)
    .key('Column_Row_MarginPadding')
  }
}
