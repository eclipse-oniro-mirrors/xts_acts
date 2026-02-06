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

import { GlobalContext } from '../../../../common/GlobalContext';
import { Value1 } from '../../../../common/Value';
import { MessageManager, Callback, Message } from '../../../../common/MessageManager';
import { Entry, Component, Column,ColumnOptions,Color,Text,Flex,FlexDirection,FlexWrap,FlexAlign,ItemAlign,FlexOptions,HorizontalAlign,Margin } from '@ohos.arkui.component';
import { State,AppStorage } from '@ohos.arkui.stateManagement';

@Entry
@Component
struct Flex_Wrap_TextSize {
  @State testWidth: number = 100;
  messageManager: MessageManager<number> = new MessageManager<number>();

  onPageShow() {
    console.info('Flex_Wrap_TextSize onPageShow');
    AppStorage.setOrCreate<MessageManager<number>>("messageManager",  this.messageManager);
    let callback: Callback<number> = (message: Message<number>) => {
      console.log('message = ' + message.name + "--" + message.value);
      if (message.name == 'width') {
        this.testWidth = message.value;
      }
    };
    this.messageManager.registerCallback(callback);
  }

  build() {
    Column({ space: 10 } as ColumnOptions) {
      Flex({ wrap: FlexWrap.Wrap, direction: FlexDirection.Row } as FlexOptions) {
        Text('1').width(this.testWidth).height(50).backgroundColor(Color.Red).key('Wrap_flex_TextSize1');
        Text('2').width(this.testWidth).height(100).backgroundColor(Color.Red).key('Wrap_flex_TextSize2');
        Text('3').width(this.testWidth).height(150).backgroundColor(Color.Red).key('Wrap_flex_TextSize3');
      }
      .width(500)
      .height(300)
      .backgroundColor(Color.Red)
      .key('Flex_Wrap_TextSize_Container01')
    }
    .width('100%')
    .height('100%')
  }
}