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
import { Entry, Component, Column,ColumnOptions,Text,Flex,FlexDirection,Color,FlexWrap,FlexAlign,ItemAlign,FlexOptions,HorizontalAlign,Margin,Position } from '@ohos.arkui.component';
import { State,AppStorage } from '@ohos.arkui.stateManagement';

@Entry
@Component
struct FlexAlign_SpaceAround_fixedParent {
  @State testOffsetX: number = 0;
  @State testOffsetY: number = 0;
  messageManager: MessageManager<number> = new MessageManager<number>();
  private content: string = "FlexAlign_SpaceAround_fixedParent Page"

  onPageShow() {
    console.info('FlexAlign_SpaceAround_fixedParent page show called');
    AppStorage.setOrCreate<MessageManager<number>>("messageManager",  this.messageManager);
    let callback: Callback<number> = (message: Message<number>) => {
      console.error('message = ' + message.name + "--" + message.value);
      if (message.name == 'x') {
        this.testOffsetX = message.value;
      }
      if (message.name == 'y') {
        this.testOffsetY = message.value;
      }
    };
    this.messageManager.registerCallback(callback);
  }

  onBuildDone() {
    console.info('FlexAlign_SpaceAround_fixedParent page build done called');
  }

  build() {
    Column() {
      Text('justifyContent:Align_SpaceAround9').fontSize(9).fontColor(Color.Red).width('90%')
      Flex({ justifyContent: FlexAlign.SpaceAround } as FlexOptions) {
        Text('1')
          .width(150)
          .height(50)
          .backgroundColor(Color.Red)
          .key('AlignSpaceAround25')
          .offset({ x: this.testOffsetX, y: this.testOffsetY }as Position)
        Text('2').width(150).height(100).backgroundColor(Color.Red).key('AlignSpaceAround26')
        Text('3').width(150).height(150).backgroundColor(Color.Red).key('AlignSpaceAround27')
      }
      .key('FlexAlignSpaceAround9')
      .height(200)
      .width(500)
      .backgroundColor(Color.Red)
    }.width('100%')
  }
}