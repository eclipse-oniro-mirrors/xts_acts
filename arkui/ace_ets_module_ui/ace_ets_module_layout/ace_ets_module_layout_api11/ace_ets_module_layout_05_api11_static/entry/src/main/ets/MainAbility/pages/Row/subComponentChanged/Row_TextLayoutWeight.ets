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
import { Entry, Component, Column, Color, ColumnOptions, RowOptions, Row, Text } from '@ohos.arkui.component'
import { State, AppStorage } from '@ohos.arkui.stateManagement';
import { MessageManager, Callback, Message } from '../../../common/MessageManager';

@Entry
@Component
struct Row_TextLayoutWeight {
  @State firstTextLayoutWeight: number = 0;
  @State secondTextLayoutWeight: number = 0;
  @State thirdTextLayoutWeight: number = 0;
  messageManager: MessageManager<number> = new MessageManager<number>();

  onPageShow() {
    console.info('Row_TextLayoutWeight onPageShow');
    AppStorage.setOrCreate<MessageManager<number>>('messageManager', this.messageManager);
    let callback: Callback<number> = (message: Message<number>) => {
      console.error('message = ' + message.name + "--" + message.value);
      if (message.name == 'firstTextLayoutWeight') {
        this.firstTextLayoutWeight = message.value;
      }
      if (message.name == 'secondTextLayoutWeight') {
        this.secondTextLayoutWeight = message.value;
      }
      if (message.name == 'thirdTextLayoutWeight') {
        this.thirdTextLayoutWeight = message.value;
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
          .layoutWeight(this.firstTextLayoutWeight)
          .backgroundColor(0xD2B48C)
          .key('Row_TextLayoutWeight1')
        Text('2')
          .width(200)
          .height(100)
          .layoutWeight(this.secondTextLayoutWeight)
          .backgroundColor(0xF5DEB3)
          .key('Row_TextLayoutWeight2')
        Text('3')
          .width(150)
          .height(150)
          .layoutWeight(this.thirdTextLayoutWeight)
          .backgroundColor(0xD2B48C)
          .key('Row_TextLayoutWeight3')
      }
      .width(350)
      .height(200)
      .backgroundColor(0xAFEEEE)
      .key('Row_TextLayoutWeight_Container01')
    }
    .width('100%')
    .height('100%')
  }
}