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
import { Router } from '@ohos.arkui.UIContext';


import { MessageManager, Callback, Message } from '../../../../common/MessageManager';
import { Entry, Text, TextAttribute, Column, Component, Button, ButtonAttribute, ClickEvent, Image,ImageFit, Scroller,
  Scroll,
  ForEach,
  Search,
  SafeAreaType,
  ScrollDirection,
  BarState,
  Color,
  Flex,FlexOptions,Margin,FlexWrap,ItemAlign,FlexDirection,HorizontalAlign,Alignment,FlexAlign,Position,
  ColumnOptions
} from '@ohos.arkui.component'

import {
  State,
  

  AppStorage
} from '@ohos.arkui.stateManagement'
@Entry
@Component
struct Flex_Wrap_Position {
  @State testPosition: Position = { x: 0, y: 0 } as Position;
  messageManager: MessageManager<Position> = new MessageManager<Position>();

  onPageShow() {
    console.info('Flex_Wrap_Position onPageShow');
    AppStorage.setOrCreate<MessageManager<Position>>("messageManager",  this.messageManager);
    let callback: Callback<Position> = (message: Message<Position>) => {
      console.log('message = ' + message.name + "--" + message.value);
      if (message.name == 'position') {
        this.testPosition = message.value;
      }
    };
    this.messageManager.registerCallback(callback);
  }

  build() {
    Column({ space: 30 } as ColumnOptions) {
      Flex({ wrap: FlexWrap.Wrap } as FlexOptions) {
        Text('1')
          .width(150)
          .height(50)
          .backgroundColor(0xF5DEB3)
          .key('Wrap_Position01')
          .position(this.testPosition);
        Text('2').width(150).height(100).backgroundColor(0xD2B48C).key('Wrap_Position02');
        Text('3').width(150).height(150).backgroundColor(0xF5DEB3).key('Wrap_Position03');
      }
      .width(500)
      .height(300)
      .backgroundColor(0xAFEEEE)
      .key('Flex_Wrap_Position_Container01')
    }.width('100%').height('100%')
  }
}