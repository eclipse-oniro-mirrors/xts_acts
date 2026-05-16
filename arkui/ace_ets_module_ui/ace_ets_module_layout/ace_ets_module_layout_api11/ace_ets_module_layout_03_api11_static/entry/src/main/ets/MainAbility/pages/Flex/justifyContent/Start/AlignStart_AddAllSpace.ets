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

import { Entry, Component, Column,ColumnOptions,Color,Text,Flex,FlexDirection,FlexWrap,FlexAlign,ItemAlign,FlexOptions,HorizontalAlign,Margin } from '@ohos.arkui.component';
import { State,AppStorage } from '@ohos.arkui.stateManagement';


import { MessageManager, Callback, Message } from '../../../../common/MessageManager';

@Entry
@Component
struct AlignStart_AddAllSpace {
  @State DadAllSpace: number = 10;
  messageManager: MessageManager<number> = new MessageManager<number>();

  onPageShow() {
    console.info('AlignStart_AddAllSpace onPageShow');
    AppStorage.setOrCreate<MessageManager<number>>("messageManager",  this.messageManager);
    let callback: Callback<number> = (message: Message<number>) => {
      console.log('message = ' + message.name + "--" + message.value);
      if (message.name == 'DadAllSpace') {
        this.DadAllSpace = message.value;
      }
    };
    this.messageManager.registerCallback(callback);
  }

  @State justifyContent: FlexAlign = FlexAlign.Start;

  build() {
    Column() {
      Flex({ justifyContent: this.justifyContent, direction: FlexDirection.Row } as FlexOptions) {
        Text('1').width(150).height(50).backgroundColor(Color.Red).key("Start_AddAllSpace_011");
        Text('2').width(150).height(100).backgroundColor(Color.Red).key("Start_AddAllSpace_012");
        Text('3').width(150).height(150).backgroundColor(Color.Red).key("Start_AddAllSpace_013");
      }
      .key("Start_AddAllSpace_01")
      .width(500)
      .height(200)
      .padding(this.DadAllSpace)
      .margin(10)
      .backgroundColor(Color.Red)
    }
    .key("Start_AddAllSpace_01_Box")
    .width("100%")
    .alignItems(HorizontalAlign.Start)
  }
}