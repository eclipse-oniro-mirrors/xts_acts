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



import { MessageManager, Callback, Message } from '../../../../common/MessageManager';
import { Entry, Component, Column,ColumnOptions,Text,Flex,FlexDirection,Color,FlexWrap,FlexAlign,ItemAlign,FlexOptions,HorizontalAlign,Margin,Position } from '@ohos.arkui.component';
import { State,AppStorage } from '@ohos.arkui.stateManagement';

@Entry
@Component
struct AlignStart_AddOffset {
  @State OneOffset: Position = { x: 0, y: 0 } as Position;
  messageManager: MessageManager<Position> = new MessageManager<Position>();

  onPageShow() {
    console.info('AlignStart_AddOffset onPageShow');
    AppStorage.setOrCreate<MessageManager<Position>>("messageManager",  this.messageManager);
    let callback: Callback<Position> = (message: Message<Position>) => {
      console.log('message = ' + message.name + "--" + message.value);
      if (message.name == 'OneOffset') {
        this.OneOffset = message.value;
      }
    };
    this.messageManager.registerCallback(callback);
  }

  @State justifyContent: FlexAlign = FlexAlign.Start;

  build() {
    Column() {
      Text('justifyContent:FlexAlign.Start').fontSize(9).fontColor(Color.Red).width('90%');
      Flex({ justifyContent: this.justifyContent, direction: FlexDirection.Row } as FlexOptions) {
        Text('1')
          .width(150)
          .height(50)
          .backgroundColor(Color.Red)
          .key("Start_AddOffset_011")
          .offset(this.OneOffset);
        Text('2').width(150).height(100).backgroundColor(Color.Red).key("Start_AddOffset_012");
        Text('3').width(150).height(150).backgroundColor(Color.Red).key("Start_AddOffset_013");
      }
      .key("Start_AddOffset_01")
      .width(500)
      .height(200)
      .backgroundColor(Color.Red)
    }
  }
}
