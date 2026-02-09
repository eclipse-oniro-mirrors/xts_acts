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
import { Entry, Color,Component, Column,ColumnOptions,Text,Flex,FlexDirection,FlexWrap,FlexAlign,ItemAlign,FlexOptions,HorizontalAlign,Visibility } from '@ohos.arkui.component';
import { State,AppStorage } from '@ohos.arkui.stateManagement';

@Entry
@Component
struct AlignContentFlexP_Fixed_Visibility {
  @State textVisibility: Visibility = Visibility.Visible;
  messageManager: MessageManager<Visibility> = new MessageManager<Visibility>();

  onPageShow() {
    console.info('AlignContentFlex onPageShow');
    AppStorage.setOrCreate<MessageManager<Visibility>>("messageManager",  this.messageManager);
    let callback: Callback<Visibility> = (message: Message<Visibility>) => {
      console.error('message = ' + message.name + "--" + message.value);
      if (message.name == 'visibility') {
        this.textVisibility = message.value;
      }
    };
    this.messageManager.registerCallback(callback);
  }

  build() {
    Column() {

      Text('AlignContentFlexP_Fixed_Visibility').fontSize(9).fontColor(Color.Red).width('90%')
      Flex({
        direction: FlexDirection.Row,
        wrap: FlexWrap.Wrap,
        alignContent: FlexAlign.SpaceEvenly,
        alignItems: ItemAlign.Start
      } as FlexOptions) {
        Text('1')
          .width(150)
          .height(50)
          .backgroundColor(Color.Red)
          .key('AlignContentFlexP_Fixed_Visibility_1')
          .visibility(this.textVisibility == 0? Visibility.Visible:(this.textVisibility == 1? Visibility.Hidden:Visibility.None))
        Text('2').width(150).height(100).backgroundColor(Color.Red).key('AlignContentFlexP_Fixed_Visibility_2')
        Text('3').width(150).height(150).backgroundColor(Color.Red).key('AlignContentFlexP_Fixed_Visibility_3')
        Text('4').width(150).height(200).backgroundColor(Color.Red).key('AlignContentFlexP_Fixed_Visibility_4')
      }
      .key('AlignContentFlexP_Fixed_Visibility_flex')
      .width(500)
      .height(400)
      .backgroundColor(Color.Red)
    }.width('100%')
  }
}
