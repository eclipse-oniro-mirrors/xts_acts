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
struct AlignStart_AddLayoutWeight {
  @State OneLayoutWeight1: number = 1;
  @State OneLayoutWeight2: number = 1;
  @State OneLayoutWeight3: number = 1;
  messageManager: MessageManager<number> = new MessageManager<number>();

  onPageShow() {
    console.info('AlignStart_AddLayoutWeight onPageShow');
    AppStorage.setOrCreate<MessageManager<number>>("messageManager",  this.messageManager);
    let callback: Callback<number> = (message: Message<number>) => {
      console.log('message = ' + message.name + "--" + message.value);
      if (message.name == 'OneLayoutWeight1') {
        this.OneLayoutWeight1 = message.value;
      }
      if (message.name == 'OneLayoutWeight2') {
        this.OneLayoutWeight2 = message.value;
      }
      if (message.name == 'OneLayoutWeight3') {
        this.OneLayoutWeight3 = message.value;
      }
    };
    this.messageManager.registerCallback(callback);
  }

  @State justifyContent: FlexAlign = FlexAlign.Start

  build() {
    Column() {
      Text('justifyContent:FlexAlign.Start').fontSize(9).fontColor(Color.Red).width('90%');
      Flex({ justifyContent: this.justifyContent, direction: FlexDirection.Row } as FlexOptions) {
        Text('1')
          .width(150)
          .height(50)
          .backgroundColor(Color.Red)
          .key("Start_AddLayoutWeight_011")
          .layoutWeight(this.OneLayoutWeight1);
        Text('2')
          .width(150)
          .height(100)
          .backgroundColor(Color.Red)
          .key("Start_AddLayoutWeight_012")
          .layoutWeight(this.OneLayoutWeight2);
        Text('3')
          .width(150)
          .height(150)
          .backgroundColor(Color.Red)
          .key("Start_AddLayoutWeight_013")
          .layoutWeight(this.OneLayoutWeight3);
      }
      .key("Start_AddLayoutWeight_01")
      .width(500)
      .height(200)
      .backgroundColor(Color.Red)
    }
  }
}
