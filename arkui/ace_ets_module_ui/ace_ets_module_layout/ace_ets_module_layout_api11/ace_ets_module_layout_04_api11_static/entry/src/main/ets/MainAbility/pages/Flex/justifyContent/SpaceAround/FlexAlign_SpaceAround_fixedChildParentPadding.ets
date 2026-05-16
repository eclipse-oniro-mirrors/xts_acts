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

import { Entry, Component, Column, FlexAlign, Alignment,Text, Flex, FlexDirection, FlexWrap } from '@ohos.arkui.component'
import { State,AppStorage } from '@ohos.arkui.stateManagement';
import { GlobalContext } from '../../../../common/GlobalContext';
import { ValueT } from '../../../../common/Value';
import { MessageManager, Callback, Message } from '../../../../common/MessageManager';

@Entry
@Component
struct FlexAlign_SpaceAround_fixedChildParentPadding {
  @State testPadding: number = 0;
  messageManager: MessageManager<number> = new MessageManager<number>();
  private content: string = "FlexAlign_SpaceAround_fixedChildParentPadding Page"

  onPageShow() {
    console.info('FlexAlign_SpaceAround_fixedChildParentPadding page show called');
    AppStorage.setOrCreate<MessageManager<number>>("messageManager",  this.messageManager);
    let callback: Callback<number> = (message: Message<number>) => {
      console.log('message = ' + message.name + "--" + message.value);
      if (message.name == 'padding') {
        this.testPadding = message.value;
      }
    };
    this.messageManager.registerCallback(callback);
  }

  onBuildDone() {
    console.info('FlexAlign_SpaceAround_fixedChildParentPadding page build done called');
  }

  build() {
    Column() {
      Text('justifyContent:Align_SpaceAround3').fontSize(9).fontColor(0xCCCCCC).width('90%')
      Flex({ direction: FlexDirection.Row, wrap: FlexWrap.NoWrap, justifyContent: FlexAlign.SpaceAround }) {
        Text('1').width(150).height(50).backgroundColor(0xF5DEB3).key('AlignSpaceAround7')
        Text('2').width(150).height(100).backgroundColor(0xD2B48C).key('AlignSpaceAround8')
        Text('3').width(150).height(150).backgroundColor(0xffa500).key('AlignSpaceAround9')
      }
      .key('FlexAlignSpaceAround3')
      .height(200)
      .width(500)
      .padding(this.testPadding)
      .backgroundColor(0xAFEEEE)
    }.width('100%')
  }
}