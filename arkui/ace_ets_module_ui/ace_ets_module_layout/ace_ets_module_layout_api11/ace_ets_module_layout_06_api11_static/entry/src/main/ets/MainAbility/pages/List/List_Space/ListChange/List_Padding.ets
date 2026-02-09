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
  ListItemAlign
} from '@ohos.arkui.component'
import { State, AppStorage } from '@ohos.arkui.stateManagement'

@Entry
@Component
struct List_Padding {
  @State addPadding: number = 20;
  messageManager: MessageManager<number> = new MessageManager<number>();
  private content: string = "List_Padding Page";

  onPageShow() {
    console.info('List_Padding page show called');
      AppStorage.setOrCreate<MessageManager<number>>("messageManager", this.messageManager );
    let callback: Callback<number> = (message: Message<number>) => {
      console.log('message = ' + message.name + "--" + message.value);
      if (message.name == 'addPadding') {
        this.addPadding = message.value;
      }
    };
    this.messageManager.registerCallback(callback);
  }

  onBuildDone() {
    console.info('List_Padding page build done called');
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
        .width(300)
        .height(100)
        .key('List_Padding_011')
        .backgroundColor(0xF5DEB3)

        ListItem() {
          Text('2')
            .width('100%')
            .height('100%')
            .fontSize(16)
        }
        .width(300)
        .height(100)
        .key('List_Padding_012')
        .backgroundColor(0xD2B48C)

        ListItem() {
          Text('3')
            .width('100%')
            .height('100%')
            .fontSize(16)
        }
        .width(300)
        .height(100)
        .key('List_Padding_013')
        .backgroundColor(0xffa500)

        ListItem() {
          Text('4')
            .width('100%')
            .height('100%')
            .fontSize(16)
        }
        .width(300)
        .height(100)
        .key('List_Padding_014')
        .backgroundColor(0xFFFFFF)
      }
      .height(500)
      .width(350)
      .key('List_Padding_01')
      .backgroundColor(0xAFEEEE)
      .padding(this.addPadding)
      .scrollBar(BarState.On)
    }.width('100%').height('100%')
  }
}