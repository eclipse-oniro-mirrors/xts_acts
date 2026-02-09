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
import { Entry, Component, Column,ColumnOptions,Color,Text,Flex,FlexDirection,FlexWrap,FlexAlign,ItemAlign,FlexOptions,HorizontalAlign,Margin,Alignment } from '@ohos.arkui.component';
import { State,AppStorage } from '@ohos.arkui.stateManagement';
import { AlignUtils } from '../../../../common/AlignUtils';

@Entry
@Component
struct AlignStart_AddAlign {
  @State DadAddAlign: Alignment = Alignment.TopStart;
  messageManager: MessageManager<Alignment> = new MessageManager<Alignment>();

  onPageShow() {
    console.info('AlignStart_AddAlign onPageShow');
    AppStorage.setOrCreate<MessageManager<Alignment>>("messageManager",  this.messageManager);
    let callback: Callback<Alignment> = (message: Message<Alignment>) => {
      console.log('message = ' + message.name + "--" + message.value);
      if (message.name == 'DadAddAlign') {
        this.DadAddAlign = message.value;
      }
    };
    this.messageManager.registerCallback(callback);
  }

  @State justifyContent: FlexAlign = FlexAlign.Start;

  build() {
    Column() {
      Text('justifyContent:FlexAlign.Start').fontSize(9).fontColor(Color.Red).width('90%');
      Flex({ justifyContent: this.justifyContent, direction: FlexDirection.Row } as FlexOptions) {
        Text('1').width(150).height(50).backgroundColor(Color.Red).key("Start_AddAlign_011");
        Text('2').width(150).height(100).backgroundColor(Color.Red).key("Start_AddAlign_012");
        Text('3').width(150).height(150).backgroundColor(Color.Red).key("Start_AddAlign_013");
      }
      .key("Start_AddAlign_01")
      .width(500)
      .height(200)
      .backgroundColor(Color.Red)
      .align(AlignUtils.getAlignment(this.DadAddAlign))
    }
    .width("100%")
  }
}
