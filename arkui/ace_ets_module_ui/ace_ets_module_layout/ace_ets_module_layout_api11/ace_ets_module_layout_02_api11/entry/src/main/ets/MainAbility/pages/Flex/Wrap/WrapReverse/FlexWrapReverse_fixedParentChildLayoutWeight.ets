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
struct FlexWrapReverse_fixedParentChildLayoutWeight {
  @State testHeight: number = 150;
  @State testWidth: number = 300;
  messageManager: MessageManager<number> = new MessageManager();
  private content: string = "FlexWrapReverse_fixedParentChildLayoutWeight Page";

  onPageShow() {
    console.info('FlexWrapReverse_fixedParentChildLayoutWeight page show called');
    let value: Value<number> = {
      name: 'messageManager',
      message: this.messageManager
    };
    GlobalContext.getContext().setObject('value', value);
    let callback: Callback<number> = (message: Message<number>) => {
      console.log('message = ' + message.name + "--" + message.value);
      if (message.name == 'height') {
        this.testHeight = message.value;
      }
      if (message.name == 'width') {
        this.testWidth = message.value;
      }
    };
    this.messageManager.registerCallback(callback);
  }

  onBuildDone() {
    console.info('FlexWrapReverse_fixedParentChildLayoutWeight page build done called');
  }

  build() {
    Column() {
      Flex({ direction: FlexDirection.Row, wrap: FlexWrap.WrapReverse }) {
        Text('1')
          .width(150)
          .height(100)
          .backgroundColor(0xF5DEB3)
          .layoutWeight(2)
          .key('WrapReverseTest67')
        Text('2')
          .width(100)
          .height(150)
          .backgroundColor(0xD2B48C)
          .layoutWeight(1)
          .key('WrapReverseTest68')
        Text('3')
          .width(100)
          .height(200)
          .backgroundColor(0xffa500)
          .layoutWeight(1)
          .key('WrapReverseTest69')
      }
      .key('FlexWrapReverseTest23')
      .height(this.testHeight)
      .width(this.testWidth)
      .backgroundColor(0xAFEEEE)
    }.width('100%')
  }
}