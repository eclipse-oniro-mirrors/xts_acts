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

import { MessageManager, Callback, Message } from '../../../common/MessageManager';
import {Entry,Component,Column,Text,Flex,Stack,FlexDirection,Color,Position,Alignment,ItemAlign,Margin,TextAlign,TextOverflow,FontWeight,GridRow,FlexAlign,GridCol,AttributeModifier,StackAttribute} from '@ohos.arkui.component'
import {State,AppStorage} from '@ohos.arkui.stateManagement'
@Entry
@Component
struct Stack_ZIndex {
  @State addZIndex: int = 1;
  @State addAlignContent: Alignment = Alignment.TopStart;
  messageManager: MessageManager<number|Alignment> = new MessageManager<number|Alignment>();

  onPageShow() {
    console.info('Stack_ZIndex onPageShow');
    AppStorage.setOrCreate<MessageManager<number|Alignment>>("messageManager",  this.messageManager);
    let callback: Callback<number|Alignment> = (message: Message<number|Alignment>) => {
      console.log('message = ' + message.name + "--" + message.value);
      if (message.name == 'addZIndex') {
        this.addZIndex = message.value as int;
      }
      if (message.name == 'addAlignContent') {
        this.addAlignContent = message.value as Alignment;
      }
    };
    this.messageManager.registerCallback(callback);
  }

  build() {
    Stack({ alignContent: this.addAlignContent }) {
      Text()
        .width('70%')
        .height('70%')
        .backgroundColor(Color.Red)
        .key('Stack_ZIndex_011')
        .zIndex(this.addZIndex);
      Text().width('50%').height('50%').backgroundColor(Color.Blue).key('Stack_ZIndex_012');
    }
    .width('100%')
    .height('100%')
    .backgroundColor(Color.White)
    .key('Stack_ZIndex_01')
  }
}