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
  GridItem,
  List,
  ListItem,
  TextAlign,
  Axis,
  BarState,
  ListItemAlign
} from '@ohos.arkui.component'
import { State, AppStorage } from '@ohos.arkui.stateManagement'

@Entry
@Component
struct List_aspectRatio_neither {
  @State aspectRatio1: number = 1;
  messageManager: MessageManager<number> = new MessageManager<number>();

  onPageShow(){
    console.info('Grid_RowCol_ItemContentSize onPageShow');
      AppStorage.setOrCreate<MessageManager<number>>("messageManager", this.messageManager );
    let callback: Callback<number> = (message: Message<number>) => {
      console.log('message = ' + message.name + '--' + message.value);
      if (message.name == 'aspectRatio1') {
        this.aspectRatio1 = message.value;
      }
    };
    this.messageManager.registerCallback(callback);
  }

  build(){
    Column() {
      List({ space: 10 }) {
        ListItem() {
          Text('1')
            .width('80%')
            .height(50)
            .fontSize(16)
            .borderRadius(10)
            .textAlign(TextAlign.Center)
            .backgroundColor(Color.White)
        }.key('List_aspectRatio_neither_001')

        ListItem() {
          Text('2')
            .width('80%')
            .height(50)
            .fontSize(16)
            .borderRadius(10)
            .textAlign(TextAlign.Center)
            .backgroundColor(Color.White)
        }

        ListItem() {
          Text('3')
            .width('80%')
            .height(50)
            .fontSize(16)
            .borderRadius(10)
            .textAlign(TextAlign.Center)
            .backgroundColor(Color.White)
        }

        ListItem() {
          Text('4')
            .width('80%')
            .height(50)
            .fontSize(16)
            .borderRadius(10)
            .textAlign(TextAlign.Center)
            .backgroundColor(Color.White)
        }
      }
      .aspectRatio(this.aspectRatio1)
      .listDirection(Axis.Vertical)
      .scrollBar(BarState.On)
      .backgroundColor(0xAFEEEE)
      .key('List_aspectRatio_neither_01')
      .alignListItem(ListItemAlign.Center)
    }
    .width('40%')
    .height('100%')
    .key('List_aspectRatio_neither_column')
  }
}