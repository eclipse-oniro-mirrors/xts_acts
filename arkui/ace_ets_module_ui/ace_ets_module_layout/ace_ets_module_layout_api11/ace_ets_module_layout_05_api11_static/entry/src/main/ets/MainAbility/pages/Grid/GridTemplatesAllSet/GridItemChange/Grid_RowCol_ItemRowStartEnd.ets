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
import {
  Entry,
  Text,
  Column,
  Component,
  Button,
  ClickEvent,
  Scroller,
  Scroll,
  ForEach,
  Search,
  Color,
  EdgeEffect,
  ColumnOptions,
  Grid,
  GridItem
} from '@ohos.arkui.component'
import { State, AppStorage } from '@ohos.arkui.stateManagement'
@Entry
@Component
struct Grid_RowCol_ItemRowStartEnd {
  @State textNumber: String[] = ['2', '3', '4', '5', '6', '7', '8', '9', '10', '11', '12', '13'];
  @State testRowStart: int = 0;
  @State testRowEnd: int = 0;
  messageManager: MessageManager<int> = new MessageManager<int>();

  onPageShow() {
    console.info('Grid_RowCol_ItemStartEnd onPageShow');
    AppStorage.setOrCreate<MessageManager<int>>("messageManager", this.messageManager);
    let callback: Callback<int> = (message: Message<int>) => {
      console.log('message = ' + message.name + "--" + message.value);
      if (message.name == 'RowStart') {
        this.testRowStart = message.value;
      }
      if (message.name == 'RowEnd') {
        this.testRowEnd = message.value;
      }
    };
    this.messageManager.registerCallback(callback);
  }

  build() {
    Column({ space: 30 } as ColumnOptions) {
      Grid() {
        GridItem() {
          Text('1').width('100%').height('100%').backgroundColor(0xF5DEB3);
        }
        .rowStart(this.testRowStart)
        .rowEnd(this.testRowEnd)
        .columnStart(0)
        .columnEnd(0)
        .key('Grid_RowCol_ItemRowStartEnd1')

        ForEach(this.textNumber, (item: string) => {
          GridItem() {
            Text(item)
              .backgroundColor(0xF5DEB3)
              .width('100%')
              .height('100%')
          }
          .key('Grid_RowCol_ItemRowStartEnd' + item)
        }, (item: string) => item)
      }
      .width(300)
      .height(300)
      .columnsTemplate('1fr 1fr 1fr 1fr')
      .rowsTemplate('1fr 1fr 1fr 1fr')
      .backgroundColor(0xAFEEEE)
      .key('Grid_RowCol_ItemRowStartEnd_Container01')
    }
    .width('100%')
    .height('100%')
  }
}