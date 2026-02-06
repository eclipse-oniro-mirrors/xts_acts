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
struct FlexWrapReverse_notFixedParentPaddind {
  @State testHeight: number = 150;
  @State testWidth: number = 450;
  @State testPadding: number = 10;
  messageManager: MessageManager<number> = new MessageManager<number>();
  private content: string = "FlexWrapReverse_notFixedParentPaddind Page";

  onPageShow() {
    console.info('FlexWrapReverse_notFixedParentPaddind page show called');
    AppStorage.setOrCreate<MessageManager<number>>("messageManager",  this.messageManager);
    let callback: Callback<number> = (message: Message<number>) => {
      console.log('message = ' + message.name + "--" + message.value);
      if (message.name == 'height') {
        this.testHeight = message.value;
      }
      if (message.name == 'width') {
        this.testWidth = message.value;
      }
      if (message.name == 'padding') {
        this.testPadding = message.value;
      }
    };
    this.messageManager.registerCallback(callback);
  }

  onBuildDone() {
    console.info('FlexWrapReverse_notFixedParentPaddind page build done called');
  }

  build() {
    Column() {
      Text('Wrap:WrapReverseTest4').fontSize(9).fontColor(Color.Red).width('90%')
      Flex({ direction: FlexDirection.Row, wrap: FlexWrap.WrapReverse }  as FlexOptions) {
        Text('1').width(150).height(50).backgroundColor(Color.Red).key('WrapReverseTest10')
        Text('2').width(150).height(100).backgroundColor(Color.Red).key('WrapReverseTest11')
        Text('3').width(150).height(150).backgroundColor(Color.Red).key('WrapReverseTest12')
      }
      .key('FlexWrapReverseTest4')
      .height(this.testHeight)
      .width(this.testWidth)
      .padding(this.testPadding)
      .backgroundColor(Color.Red)
    }.width('100%')
  }
}