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

import { Entry, Component, Column, ColumnOptions, Visibility, Flex, FlexWrap, Text } from '@ohos.arkui.component'
import { State,AppStorage } from '@ohos.arkui.stateManagement';
import { MessageManager, Callback, Message } from '../../../../common/MessageManager';

@Entry
@Component
struct Flex_NoWrap_Visibility {
  @State testVisibility: Visibility = Visibility.Visible;
  @State firstTextWidth: number = 150;
  @State secondTextWidth: number = 150;
  @State thirdTextWidth: number = 150;
  messageManager: MessageManager<number|Visibility> = new MessageManager<number|Visibility>();

  onPageShow() {
    console.info('Flex_NoWrap_Visibility onPageShow');
    AppStorage.setOrCreate<MessageManager<number|Visibility>>("messageManager",  this.messageManager);
    let callback: Callback<number|Visibility> = (message: Message<number|Visibility>) => {
      console.log('message = ' + message.name + "--" + message.value);
      if (message.name == 'visibility') {
        this.testVisibility = message.value as Visibility;
      }
      if (message.name == 'firstTextWidth') {
        this.firstTextWidth = message.value as number;
      }
      if (message.name == 'secondTextWidth') {
        this.secondTextWidth = message.value as number;
      }
      if (message.name == 'secondTextWidth') {
        this.thirdTextWidth = message.value as number;
      }
    };
    this.messageManager.registerCallback(callback);
  }

  build() {
    Column({ space: 30 } as ColumnOptions) {
      Flex({ wrap: FlexWrap.NoWrap }) {
        Text('1')
          .width(this.firstTextWidth)
          .height(100)
          .backgroundColor(0xF5DEB3)
          .visibility(this.testVisibility)
          .key('NoWrap_Text_Visibility1');
        Text('2').width(this.secondTextWidth).height(150).backgroundColor(0xD2B48C).key('NoWrap_Text_Visibility2');
        Text('3').width(this.thirdTextWidth).height(200).backgroundColor(0xF5DEB3).key('NoWrap_Text_Visibility3');
      }
      .width(500)
      .height(200)
      .backgroundColor(0xAFEEEE)
      .key('Flex_NoWrap_Visibility_Container01')
    }.width('100%').height('100%')
  }
}