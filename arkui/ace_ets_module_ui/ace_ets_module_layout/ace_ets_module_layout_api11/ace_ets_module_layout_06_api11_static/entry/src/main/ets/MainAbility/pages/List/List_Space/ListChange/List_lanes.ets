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
  LengthConstrain
} from '@ohos.arkui.component'
import { State, AppStorage } from '@ohos.arkui.stateManagement'

@Entry
@Component
struct List_lanes {
  @State addLanes: LengthConstrain | int = {
    minLength:0,
    maxLength:10
  } as LengthConstrain;
  messageManager: MessageManager<LengthConstrain | int> = new MessageManager<LengthConstrain | int>();
  private content: string = "List_lanes Page";

  onPageShow() {
    console.info('List_lanes page show called');
      AppStorage.setOrCreate<MessageManager<LengthConstrain | int>>("messageManager", this.messageManager);
    let callback: Callback<LengthConstrain | int> = (message: Message<LengthConstrain | int>) => {
      console.log('message = ' + message.name + "--" + message.value);
      if (message.name == 'addLanes') {
        this.addLanes = message.value;
      }
    };
    this.messageManager.registerCallback(callback);
  }

  onBuildDone() {
    console.info('List_lanes page build done called');
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
        .width(100)
        .height(100)
        .key('List_lanes_011')
        .backgroundColor(0xF5DEB3)

        ListItem() {
          Text('2')
            .width('100%')
            .height('100%')
            .fontSize(16)
        }
        .width(100)
        .height(100)
        .key('List_lanes_012')
        .backgroundColor(0xD2B48C)

        ListItem() {
          Text('3')
            .width('100%')
            .height('100%')
            .fontSize(16)
        }
        .width(100)
        .height(100)
        .key('List_lanes_013')
        .backgroundColor(0xffa500)

        ListItem() {
          Text('4')
            .width('100%')
            .height('100%')
            .fontSize(16)
        }
        .width(100)
        .height(100)
        .key('List_lanes_014')
        .backgroundColor(0xFFFFFF)
      }
      .height(520)
      .width(350)
      .key('List_lanes_01')
      .backgroundColor(0xAFEEEE)
      .lanes(this.addLanes)
      .scrollBar(BarState.On)
    }.width('100%').height('100%').backgroundColor(0xDCDCDC)
  }
}