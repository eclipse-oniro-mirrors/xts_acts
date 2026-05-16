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
import { Entry, Component, Column,ColumnOptions,Text,Color,Flex,FlexDirection,FlexWrap,FlexAlign,ItemAlign,FlexOptions,HorizontalAlign,Margin,Visibility } from '@ohos.arkui.component';
import { State,AppStorage } from '@ohos.arkui.stateManagement';

@Entry
@Component
struct FlexAlign_SpaceAround_fixedParentVisibility {
  @State testVisibility: Visibility = Visibility.Visible;
  messageManager: MessageManager<Visibility> = new MessageManager<Visibility>();
  private content: string = "FlexAlign_SpaceAround_fixedParentVisibility Page"

  onPageShow() {
    console.info('FlexAlign_SpaceAround_fixedParentVisibility page show called');
    AppStorage.setOrCreate<MessageManager<Visibility>>("messageManager",  this.messageManager);
    let callback: Callback<Visibility> = (message: Message<Visibility>) => {
      console.log('message = ' + message.name + "--" + message.value);
      if (message.name == 'visibility') {
        this.testVisibility = message.value;
      }
    };
    this.messageManager.registerCallback(callback);
  }

  onBuildDone() {
    console.info('FlexAlign_SpaceAround_fixedParentVisibility page build done called');
  }

  build() {
    Column() {
      Text('justifyContent:Align_SpaceAround10').fontSize(9).fontColor(Color.Red).width('90%')
      Flex({ justifyContent: FlexAlign.SpaceAround } as FlexOptions) {
        Text('1')
          .width(150)
          .height(50)
          .backgroundColor(Color.Red)
          .key('AlignSpaceAround28')
          .visibility(this.testVisibility == 0? Visibility.Visible:(this.testVisibility == 1? Visibility.Hidden:Visibility.None))
        Text('2').width(150).height(100).backgroundColor(Color.Red).key('AlignSpaceAround29')
        Text('3').width(150).height(150).backgroundColor(Color.Red).key('AlignSpaceAround30')
      }
      .key('FlexAlignSpaceAround10')
      .height(200)
      .width(500)
      .backgroundColor(Color.Red)
    }.width('100%')
  }
}