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
import { Entry, Component, Column, ColumnOptions, Row, RowOptions, Text, Visibility } from '@ohos.arkui.component'
import { State, AppStorage } from '@ohos.arkui.stateManagement';
import { MessageManager, Callback, Message } from '../../../common/MessageManager';

@Entry
@Component
struct Row_TextVisibility {
  @State secondTextVisibility: Visibility = Visibility.Visible;
  messageManager: MessageManager<Visibility> = new MessageManager<Visibility>();

  onPageShow() {
    console.info('Row_TextVisibility onPageShow');
    AppStorage.setOrCreate<MessageManager<Visibility>>('messageManager', this.messageManager);
    let callback: Callback<Visibility> = (message: Message<Visibility>) => {
      console.error('message = ' + message.name + "--" + message.value);
      if (message.name == 'secondTextVisibility') {
        this.secondTextVisibility = message.value;
      }
    };
    this.messageManager.registerCallback(callback);
  }

  build() {
    Column({ space: 30 } as ColumnOptions) {
      Row({ space: 10 } as RowOptions) {
        Text('1').width(100).height(50).backgroundColor(0xD2B48C).key('Row_TextVisibility1')
        Text('2')
          .width(100)
          .height(100)
          .visibility(this.secondTextVisibility)
          .backgroundColor(0xF5DEB3)
          .key('Row_TextVisibility2')
        Text('3').width(100).height(150).backgroundColor(0xD2B48C).key('Row_TextVisibility3')
      }
      .width(350)
      .height(200)
      .backgroundColor(0xAFEEEE)
      .key('Row_TextVisibility_Container01')
    }
    .width('100%')
    .height('100%')
  }
}