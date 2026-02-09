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
import { Entry, Component, Column, ColumnOptions, Row, RowOptions, Text } from '@ohos.arkui.component'
import { State, AppStorage } from '@ohos.arkui.stateManagement';
import { MessageManager, Callback, Message } from '../../../common/MessageManager';

@Entry
@Component
struct RowMar_TextMarPad {
  @State rowMargin: number = 0;
  @State firstTextMargin: number = 0;
  @State firstTextPadding: number = 0;
  messageManager: MessageManager<number> = new MessageManager<number>();

  onPageShow() {
    console.info('RowMar_TextMarPad onPageShow');
    AppStorage.setOrCreate<MessageManager<number>>('messageManager', this.messageManager);
    let callback: Callback<number> = (message: Message<number>) => {
      console.error('message = ' + message.name + "--" + message.value);
      if (message.name == 'rowMargin') {
        this.rowMargin = message.value;
      }
      if (message.name == 'firstTextMargin') {
        this.firstTextMargin = message.value;
      }
      if (message.name == 'firstTextPadding') {
        this.firstTextPadding = message.value;
      }
    };
    this.messageManager.registerCallback(callback);
  }

  build() {
    Column({ space: 30 } as ColumnOptions) {
      Row({ space: 10 } as RowOptions) {
        Text('1')
          .width(100)
          .height(50)
          .backgroundColor(0xD2B48C)
          .margin(this.firstTextMargin)
          .padding(this.firstTextPadding)
          .key('RowMar_TextMarPad1')
        Text('2').width(100).height(100).backgroundColor(0xF5DEB3).key('RowMar_TextMarPad2')
        Text('3').width(100).height(150).backgroundColor(0xD2B48C).key('RowMar_TextMarPad3')
      }
      .width(350)
      .height(200)
      .backgroundColor(0xAFEEEE)
      .margin(this.rowMargin)
      .key('RowMar_TextMarPad_Container01')
    }
    .width('100%')
    .height('100%')
    .key('Column_RowMar_TextMarPad_Container01')
  }
}