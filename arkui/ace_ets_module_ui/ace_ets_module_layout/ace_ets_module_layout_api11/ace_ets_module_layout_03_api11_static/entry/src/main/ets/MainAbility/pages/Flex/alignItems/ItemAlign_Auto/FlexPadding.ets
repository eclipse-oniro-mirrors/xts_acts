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
import { Entry,Color, Component, Column,ColumnOptions,Text,Flex,FlexDirection,FlexWrap,FlexAlign,ItemAlign,FlexOptions,HorizontalAlign,Margin } from '@ohos.arkui.component';
import { State,AppStorage } from '@ohos.arkui.stateManagement';

@Entry
@Component
struct FlexPadding_Auto {
  @State testPadding: number = 0;
  messageManager: MessageManager<number> = new MessageManager<number>();
  private content: string = "FlexPadding_Auto Page";

  onPageShow() {
    console.info('FlexPadding_Auto onPageShow');
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
    console.info('FlexPadding_Auto page build done called');
  }

  build() {
    Column() {
      Column() {
        Text('FlexPadding_1').fontSize(9).fontColor(Color.Red).width('90%');
        Flex({
          direction: FlexDirection.Row,
          alignItems: ItemAlign.Auto,
          wrap: FlexWrap.NoWrap,
        }  as FlexOptions)  {
          Text('1').width(150).height(50).backgroundColor(Color.Red).key('textFlexPadding01');
          Text('2').width(150).height(100).backgroundColor(Color.Red).key('textFlexPadding02');
          Text('3').width(150).height(150).backgroundColor(Color.Red).key('textFlexPadding03');
        }
        .key('flexPadding01')
        .height(200)
        .width(500)
        .padding(this.testPadding)
        .backgroundColor(Color.Red)
      }.width('100%').margin({ top: 5 } as Margin)
    }.width('100%')
  }
}
