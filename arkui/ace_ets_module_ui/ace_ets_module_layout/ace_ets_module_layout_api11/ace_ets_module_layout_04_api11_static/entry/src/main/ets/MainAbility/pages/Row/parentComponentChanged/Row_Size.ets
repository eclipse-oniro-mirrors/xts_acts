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
import { Entry, Component, Column, FlexAlign, Text, Row, RowOptions } from '@ohos.arkui.component'
import { State, AppStorage } from '@ohos.arkui.stateManagement';
import { MessageManager, Callback, Message } from '../../../common/MessageManager';

@Entry
@Component
struct Row_Size {
  @State rowWidth: number = 400;
  @State rowHeight: number = 300;
  messageManager: MessageManager<number> = new MessageManager<number>();

  onPageShow() {
    console.info('Row_Size onPageShow');
    AppStorage.setOrCreate<MessageManager<number>>('messageManager', this.messageManager);
    let callback: Callback<number> = (message: Message<number>) => {
      console.error('message = ' + message.name + "--" + message.value);
      if (message.name == 'width') {
        this.rowWidth = message.value;
      }
      if (message.name == 'height') {
        this.rowHeight = message.value;
      }
    };
    this.messageManager.registerCallback(callback);
  }

  build() {
    Column() {
      Text('Row_Size').fontSize(9).fontColor(0xCCCCCC).width('90%')
      Row({ space: 10 } as RowOptions) {
        Text('1').width(100).height(50).backgroundColor(0xAFEEEE).key('Row_Size_Text1')
        Text('2').width(100).height(100).backgroundColor(0x00FFFF).key('Row_Size_Text2')
        Text('3').width(100).height(150).backgroundColor(0xAFEEEE).key('Row_Size_Text3')
      }
      .key('Row_Size_Row')
      .width(this.rowWidth)
      .height(this.rowHeight)
      .backgroundColor(0xB05F77)
    }
    .width('100%')
  }
}
