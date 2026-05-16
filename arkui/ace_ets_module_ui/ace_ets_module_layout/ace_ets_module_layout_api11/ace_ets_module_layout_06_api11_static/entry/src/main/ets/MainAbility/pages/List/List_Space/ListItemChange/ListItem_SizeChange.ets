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
  TextAlign,
  List,
  ListItem,
  BarState,
  Axis,
  ListItemAlign,
  Position
} from '@ohos.arkui.component'
import { State, AppStorage } from '@ohos.arkui.stateManagement'

@Entry
@Component
struct ListItem_SizeChange {
  @State testWidth: number = 300;
  @State testHeight: number = 100;
  private arr: Array<number> = new Array<number>(0, 1, 2, 3, 4);
  messageManager: MessageManager<number> = new MessageManager<number>();
  private content: string = "ListItem_SizeChange Page";

  onPageShow() {
    console.info('ListItem_SizeChange page show called');
      AppStorage.setOrCreate<MessageManager<number>>("messageManager", this.messageManager );
    let callback: Callback<number> = (message: Message<number>) => {
      console.log('message = ' + message.name + "--" + message.value);
      if (message.name == 'width') {
        this.testWidth = message.value;
      }
      if (message.name == 'height') {
        this.testHeight = message.value;
      }
    };
    this.messageManager.registerCallback(callback);
  }

  onBuildDone() {
    console.info('ListItem_SizeChange page build done called');
  }

  build() {
    Column() {
      List({ space: 20, initialIndex: 0 }) {
        ListItem() {
          Text('1')
            .width('100%')
            .height('100%')
            .fontSize(16)
        }
        .width(this.testWidth)
        .height(this.testHeight)
        .key('ListItemTest1')
        .backgroundColor(Color.Yellow)

        ListItem() {
          Text('2')
            .width('100%')
            .height('100%')
            .fontSize(16)
        }
        .width(300)
        .height(100)
        .key('ListItemTest2')
        .backgroundColor(Color.Blue)

        ListItem() {
          Text('3')
            .width('100%')
            .height('100%')
            .fontSize(16)
        }
        .width(300)
        .height(100)
        .key('ListItemTest3')
        .backgroundColor(Color.Yellow)

        ListItem() {
          Text('4')
            .width('100%')
            .height('100%')
            .fontSize(16)
        }
        .width(300)
        .height(100)
        .key('ListItemTest4')
        .backgroundColor(Color.Blue)
      }
      .height(500)
      .width(350)
      .key('ListItemSizeChange1')
      .backgroundColor('#AFEEEE')
      .scrollBar(BarState.On)
      .onScrollIndex((firstIndex: int, lastIndex: int):void => {
        console.info('first' + firstIndex)
        console.info('last' + lastIndex)
      })
    }.width('100%').height('100%').backgroundColor('#DCDCDC')
  }
}