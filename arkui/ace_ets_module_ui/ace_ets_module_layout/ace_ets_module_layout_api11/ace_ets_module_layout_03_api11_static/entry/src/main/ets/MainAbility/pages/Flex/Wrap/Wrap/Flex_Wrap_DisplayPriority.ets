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
struct Flex_Wrap_DisplayPriority {
  @State firstTextPriority: number = 1;
  @State secondTextPriority: number = 1;
  @State thirdTextPriority: number = 1;
  messageManager: MessageManager<number> = new MessageManager<number>();

  onPageShow() {
    console.info('Flex_Wrap_DisplayPriority onPageShow');
    AppStorage.setOrCreate<MessageManager<number>>("messageManager",  this.messageManager);
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
    Column({ space: 30 } as ColumnOptions) {
      Flex({ wrap: FlexWrap.Wrap } as FlexOptions) {
        Text('1')
          .width(150)
          .height(100)
          .backgroundColor(Color.Red)
          .displayPriority(this.firstTextPriority)
          .key('Wrap_DisplayPriority01');
        Text('2')
          .width(150)
          .height(150)
          .backgroundColor(Color.Red)
          .displayPriority(this.secondTextPriority)
          .key('Wrap_DisplayPriority02');
        Text('3')
          .width(300)
          .height(200)
          .backgroundColor(Color.Red)
          .displayPriority(this.thirdTextPriority)
          .key('Wrap_DisplayPriority03');
      }
      .width(500)
      .height(400)
      .backgroundColor(Color.Red)
      .key('FlexWrap_DisplayPriority_Container01')
    }
    .width('100%')
    .height('100%')
  }
}