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
struct FlexPadding_Auto {
  @State testPadding: number = 0;
  messageManager: MessageManager<number> = new MessageManager();
  private content: string = 'FlexPadding_Auto Page';

  onPageShow() {
    console.info('FlexPadding_Auto onPageShow');
    let value: Value<number> = {
      name: 'messageManager', message: this.messageManager
    };
    GlobalContext.getContext().setObject('value', value);
    let callback: Callback<number> = (message: Message<number>) => {
      console.log('message = ' + message.name + '--' + message.value);
      if (message.name == 'padding') {
        this.testPadding = message.value;
      }
    };
    this.messageManager.registerCallback(callback);
  }

  onBuildDone() {
    console.info('FlexPadding_Auto page build done called');
  }

  build() {
    Column() {
      Column() {
        Text('FlexPadding_1').fontSize(9).fontColor(0xCCCCCC).width('90%');
        Flex({
          direction: FlexDirection.Row,
          alignItems: ItemAlign.Auto,
          wrap: FlexWrap.NoWrap,
        }) {
          Text('1').width(150).height(50).backgroundColor(0xF5DEB3).key('ItemAlign_Auto_textFlexPadding01');
          Text('2').width(150).height(100).backgroundColor(0xD2B48C).key('ItemAlign_Auto_textFlexPadding02');
          Text('3').width(150).height(150).backgroundColor(0xF5DEB3).key('ItemAlign_Auto_textFlexPadding03');
        }
        .key('ItemAlign_Auto_flexPadding01')
        .height(200)
        .width(500)
        .padding(this.testPadding)
        .backgroundColor(0xAFEEEE)
      }.width('100%').margin({ top: 5 })
    }.width('100%')
  }
}
