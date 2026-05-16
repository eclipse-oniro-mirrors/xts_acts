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
struct Stack_AlignContent {
  @State addAlignContent: Alignment = Alignment.TopStart;
  messageManager: MessageManager<Alignment> = new MessageManager<Alignment>();

  onPageShow() {
    console.info('Stack_AlignContent onPageShow');
    AppStorage.setOrCreate<MessageManager<Alignment>>("messageManager",  this.messageManager);
    let callback: Callback<Alignment> = (message: Message<Alignment>) => {
      console.log('message = ' + message.name + "--" + message.value);
      if (message.name == 'addAlignContent') {
        this.addAlignContent = message.value;
      }
    };
    this.messageManager.registerCallback(callback);
  }

  build() {
    Column() {
      Stack() {
        Text('1').width(300).height(300).backgroundColor(0xF5DEB3).key('Stack_AlignContent_011');
        Text('2').width(200).height(200).backgroundColor(0xD2B48C).key('Stack_AlignContent_012');
        Text('3').width(100).height(100).backgroundColor(0xF5DEB3).key('Stack_AlignContent_013');
      }
      .width(350)
      .height(350)
      .backgroundColor(0xAFEEEE)
      .key('Stack_AlignContent_01')

      Stack({ alignContent: this.addAlignContent }) {
        Text('1').width(300).height(300).backgroundColor(0xF5DEB3).key('Stack_AlignContent_021');
        Text('2').width(200).height(200).backgroundColor(0xD2B48C).key('Stack_AlignContent_022');
        Text('3').width(100).height(100).backgroundColor(0xF5DEB3).key('Stack_AlignContent_023');
      }
      .width(350)
      .height(350)
      .backgroundColor(0xAFEEEE)
      .key('Stack_AlignContent_02')
    }
  }
}