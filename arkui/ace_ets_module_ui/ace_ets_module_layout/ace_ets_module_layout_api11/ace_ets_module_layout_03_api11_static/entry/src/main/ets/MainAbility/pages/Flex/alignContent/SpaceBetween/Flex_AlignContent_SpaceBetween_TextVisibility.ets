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
import { Entry, Component, Column,Color,ColumnOptions,Text,Flex,FlexDirection,FlexWrap,FlexAlign,ItemAlign,FlexOptions,HorizontalAlign,Visibility } from '@ohos.arkui.component';
import { State,AppStorage } from '@ohos.arkui.stateManagement';

@Entry
@Component
struct FlexAlign_SpaceBetween_TextVisibility {
  @State testVisibility: Visibility = Visibility.Visible;
  messageManager: MessageManager<Visibility> = new MessageManager<Visibility>();

  onPageShow() {
    console.info('FlexAlign_SpaceBetween_TextVisibility onPageShow');
    AppStorage.setOrCreate<MessageManager<Visibility>>("messageManager",  this.messageManager);
    let callback: Callback<Visibility> = (message: Message<Visibility>) => {
      console.log('message = ' + message.name + "--" + message.value);
      if (message.name == 'visibility') {
        this.testVisibility = message.value;
      }
    };
    this.messageManager.registerCallback(callback);
  }

  build() {
    Column({ space: 30 } as ColumnOptions) {
      Flex({ wrap: FlexWrap.Wrap, alignContent: FlexAlign.SpaceBetween } as FlexOptions) {
        Text('1')
          .width(150)
          .height(50)
          .backgroundColor(Color.Red)
          .key('AlignContent_SpaceBetween_TextVisibility01')
          .visibility(this.testVisibility == 0? Visibility.Visible:(this.testVisibility == 1? Visibility.Hidden:Visibility.None));
        Text('2').width(150).height(100).backgroundColor(Color.Red).key('AlignContent_SpaceBetween_TextVisibility02');
        Text('3').width(150).height(50).backgroundColor(Color.Red).key('AlignContent_SpaceBetween_TextVisibility03');
        Text('4').width(150).height(100).backgroundColor(Color.Red).key('AlignContent_SpaceBetween_TextVisibility04');
      }
      .width(200)
      .height(400)
      .backgroundColor(Color.Red)
      .key('FlexAlign_SpaceBetween_TextVisibility_Container01')
    }
    .width('100%')
    .height('100%')
  }
}