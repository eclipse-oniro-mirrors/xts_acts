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
import { ValueT } from '../../../../common/Value';
import { MessageManager, Callback, Message } from '../../../../common/MessageManager';
import { Entry, Component, Column, ColumnOptions, Flex, FlexWrap, FlexAlign, Text } from '@ohos.arkui.component'
import { State,AppStorage } from '@ohos.arkui.stateManagement';

@Entry
@Component
struct FlexAlign_SpaceBetween_FlexMarPad {
  @State testPadding: number = 0;
  @State testMargin: number = 0;
  messageManager: MessageManager<number> = new MessageManager<number>();

  onPageShow() {
    console.info('FlexAlign_SpaceBetween_FlexMarPad onPageShow');
    AppStorage.setOrCreate<MessageManager<number>>("messageManager",  this.messageManager);
    let callback: Callback<number> = (message: Message<number>) => {
      console.log('message = ' + message.name + "--" + message.value);
      if (message.name == 'padding') {
        this.testPadding = message.value;
      }
      if (message.name == 'margin') {
        this.testMargin = message.value;
      }
    };
    this.messageManager.registerCallback(callback);
  }

  build() {
    Column({ space: 30 } as ColumnOptions) {
      Flex({ wrap: FlexWrap.Wrap, alignContent: FlexAlign.SpaceBetween }) {
        Text('1').width(150).height(50).backgroundColor(0xD2B48C).key('AlignContent_SpaceBetween_FlexMarPad01');
        Text('2').width(150).height(100).backgroundColor(0xF5DEB3).key('AlignContent_SpaceBetween_FlexMarPad02');
        Text('3').width(150).height(150).backgroundColor(0xD2B48C).key('AlignContent_SpaceBetween_FlexMarPad03');
        Text('4').width(150).height(200).backgroundColor(0xF5DEB3).key('AlignContent_SpaceBetween_FlexMarPad04');
      }
      .width(200)
      .height(540)
      .padding(this.testPadding)
      .margin(this.testMargin)
      .backgroundColor(0xAFEEEE)
      .key('FlexAlign_SpaceBetween_FlexMarPad_Container01')
    }
    .width('100%')
    .height('100%')
    .key('Column_Align_SpaceBetween_FlexMarPad_Container01')
  }
}