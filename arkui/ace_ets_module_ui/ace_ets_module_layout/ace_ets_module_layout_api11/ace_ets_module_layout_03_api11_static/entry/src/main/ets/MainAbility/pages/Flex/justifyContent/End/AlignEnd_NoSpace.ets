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
import { Entry, Component, Column,ColumnOptions,Color,Text,Flex,FlexDirection,FlexWrap,FlexAlign,ItemAlign,FlexOptions,HorizontalAlign,Margin } from '@ohos.arkui.component';
import { State,AppStorage } from '@ohos.arkui.stateManagement';

@Entry
@Component
struct AlignEnd_NoSpace {
  @State DadWidth: number = 200;
  messageManager: MessageManager<number> = new MessageManager<number>();

  onPageShow() {
    console.info('AlignEnd_NoSpace onPageShow');
    AppStorage.setOrCreate<MessageManager<number>>("messageManager",  this.messageManager);
    let callback: Callback<number> = (message: Message<number>) => {
      console.log('message = ' + message.name + "--" + message.value);
      if (message.name == 'DadWidth') {
        this.DadWidth = message.value;
      }
    };
    this.messageManager.registerCallback(callback);
  }

  @State justifyContent: FlexAlign = FlexAlign.End;

  build() {
    Column() {
      Text('justifyContent:FlexAlign.End').fontSize(9).fontColor(Color.Red).width('90%');
      Flex({ justifyContent: this.justifyContent, direction: FlexDirection.Row } as FlexOptions) {
        Text('1').width(150).height(50).backgroundColor(Color.Red).key("End_NoSpace_011");
        Text('2').width(150).height(100).backgroundColor(Color.Red).key("End_NoSpace_012");
        Text('3').width(150).height(150).backgroundColor(Color.Red).key("End_NoSpace_013");
      }
      .key("End_NoSpace_01")
      .width(this.DadWidth)
      .height(200)
      .backgroundColor(Color.Red)
    }
  }
}
