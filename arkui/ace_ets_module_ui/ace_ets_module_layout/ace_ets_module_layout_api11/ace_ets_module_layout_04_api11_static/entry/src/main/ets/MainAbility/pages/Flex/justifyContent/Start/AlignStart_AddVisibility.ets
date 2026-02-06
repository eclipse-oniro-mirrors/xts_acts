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
import { Entry, Component, Column, FlexAlign, Alignment, Text, Flex, Visibility, FlexDirection } from '@ohos.arkui.component'
import { State,AppStorage } from '@ohos.arkui.stateManagement';
import { GlobalContext } from '../../../../common/GlobalContext';
import { ValueT } from '../../../../common/Value';
import { MessageManager, Callback, Message } from '../../../../common/MessageManager';

@Entry
@Component
struct AlignStart_AddVisibility {
  @State OneVisibility: Visibility = Visibility.Visible;
  messageManager: MessageManager<Visibility> = new MessageManager<Visibility>();

  onPageShow() {
    console.info('AlignStart_AddVisibility onPageShow');
    AppStorage.setOrCreate<MessageManager<Visibility>>("messageManager",  this.messageManager);
    let callback: Callback<Visibility> = (message: Message<Visibility>) => {
      console.log('message = ' + message.name + "--" + message.value);
      if (message.name == 'OneVisibility') {
        this.OneVisibility = message.value;
      }
    };
    this.messageManager.registerCallback(callback);
  }

  @State justifyContent: FlexAlign = FlexAlign.Start;

  build() {
    Column() {
      Text('justifyContent:FlexAlign.Start').fontSize(9).fontColor(0xCCCCCC).width('90%');
      Flex({ justifyContent: this.justifyContent, direction: FlexDirection.Row }) {
        Text('1')
          .width(150)
          .height(50)
          .backgroundColor(0xF5DEB3)
          .key("Start_AddVisibility_011")
          .visibility(this.OneVisibility);
        Text('2').width(150).height(100).backgroundColor(0xD2B48C).key("Start_AddVisibility_012");
        Text('3').width(150).height(150).backgroundColor(0xF5DEB3).key("Start_AddVisibility_013");
      }
      .key("Start_AddVisibility_01")
      .width(500)
      .height(200)
      .backgroundColor(0xAFEEEE)
    }
  }
}