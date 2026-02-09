'use static';
/*
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
import { Entry,Color, Component, Column,ColumnOptions,Text,Flex,FlexDirection,FlexWrap,FlexAlign,ItemAlign,FlexOptions,HorizontalAlign } from '@ohos.arkui.component';
import { State,AppStorage } from '@ohos.arkui.stateManagement';

@Entry
@Component
struct AlignContentFlex_Start {
  @State flexHeight: number = 300;
  messageManager: MessageManager<number> = new MessageManager<number>();

  onPageShow() {
    console.info('AlignContentFlex onPageShow');
    AppStorage.setOrCreate<MessageManager<number>>("messageManager",  this.messageManager);
    let callback: Callback<number> = (message: Message<number>) => {
      console.error('message = ' + message.name + "--" + message.value);
      if (message.name == 'height') {
        this.flexHeight = message.value;
      }
    };
    this.messageManager.registerCallback(callback);
  }

  build() {
    Column() {

      Text('AlignContentFlex_Start').fontSize(9).fontColor(Color.Red).width('90%')
      Flex({
        direction: FlexDirection.Row,
        wrap: FlexWrap.Wrap,
        alignContent: FlexAlign.Start,
        alignItems: ItemAlign.Start
      }  as FlexOptions) {
        Text('1').width(150).height(50).backgroundColor(Color.Red).key('AlignContentFlex_Start_flex001_1')
        Text('2').width(150).height(100).backgroundColor(Color.Red).key('AlignContentFlex_Start_flex001_2')
        Text('3').width(150).height(150).backgroundColor(Color.Red).key('AlignContentFlex_Start_flex001_3')
        Text('4').width(150).height(200).backgroundColor(Color.Red).key('AlignContentFlex_Start_flex001_4')
      }
      .key('AlignContentFlex_Start_flex001')
      .width(400)
      .height(this.flexHeight)
      .backgroundColor(Color.Red)

    }.width('100%')
  }
}
