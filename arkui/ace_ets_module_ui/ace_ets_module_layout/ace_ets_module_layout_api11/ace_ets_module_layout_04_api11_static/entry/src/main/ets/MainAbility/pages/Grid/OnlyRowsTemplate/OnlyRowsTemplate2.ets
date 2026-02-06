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
import { Entry, Component, Column, Color, ColumnOptions, Grid, GridItem, Text, TextAlign, Text } from '@ohos.arkui.component'
import { State, AppStorage } from '@ohos.arkui.stateManagement';
import { MessageManager, Callback, Message } from '../../../common/MessageManager';

@Entry
@Component
struct OnlyRowsTemplate2 {
  @State rowStart1: int = 1;
  @State rowStart2: int = 1;
  messageManager: MessageManager<int> = new MessageManager<int>();

  onPageShow() {
    console.info('OnlyRowsTemplate2 page show called');
    AppStorage.setOrCreate<MessageManager<int>>('messageManager', this.messageManager);
    let callback: Callback<int> = (message: Message<int>) => {
      console.log('message = ' + message.name + "--" + message.value);
      if (message.name == 'rowStart1') {
        this.rowStart1 = message.value;
      } else if (message.name == 'rowStart2') {
        this.rowStart2 = message.value;
      }
    };
    this.messageManager.registerCallback(callback);
  }

  build() {
    Column({ space: 5 } as ColumnOptions) {
      Grid() {
        GridItem() {
          Text('1')
            .fontSize(16)
            .backgroundColor(0xFFFFFF)
            .textAlign(TextAlign.Center)
            .width("100%")
            .height("100%")
        }
        .border({ width: 1 })
        .borderColor(0x000000)
        .width(100)
        .height("100%")
        .rowStart(this.rowStart1)
        .key('OnlyRowsTemplate2_GridItem_01')

        GridItem() {
          Text('2')
            .fontSize(16)
            .backgroundColor(0xFFFFFF)
            .textAlign(TextAlign.Center)
            .width("100%")
            .height("100%")
        }
        .border({ width: 1 })
        .borderColor(0x000000)
        .width(100)
        .height("100%")
        .rowStart(this.rowStart2)
        .key('OnlyRowsTemplate2_GridItem_02')

      }
      .rowsTemplate('1fr 1fr 1fr 1fr 1fr')
      .width("100%")
      .backgroundColor(0xFAEEE0)
      .height(300)
      .key('OnlyRowsTemplate2_Grid_1')
    }.width('100%')
  }
}
