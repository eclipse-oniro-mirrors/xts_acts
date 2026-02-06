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
import { MessageManager, Callback, Message } from './../../common/MessageManager';
import {
  Entry,
  Text,
  Column,
  Row,
  Component,
  Scroller,
  Scroll,
  ForEach,
  Color,
  Button,
  ClickEvent,
  EdgeEffect,
  BarState,
  GridDirection,
  OnScrollFrameBeginHandlerResult,
  Grid,
  ItemDragInfo,
  ScrollState,
  GridItem,
  TextAlign,
  Margin,
  ScrollState,
  Dimension,
  Axis,
  ListItemAlign,
  List,
  ListItem,
  $r
} from '@ohos.arkui.component'
import { State, AppStorage } from '@ohos.arkui.stateManagement'

@Entry
@Component
struct ListLanes02 {
  private arr: Array<number> = new Array<number>(0, 1, 2, 3, 4, 5, 6, 7, 8, 9)
  listGutter: Dimension = '0vp'
  @State listDirection: Axis = Axis.Vertical
  @State listSpace: string = '20'
  @State alignListItem: ListItemAlign = ListItemAlign.Start
  @State initialIndex: int = 0
  messageManager: MessageManager<string | int | Dimension | Axis> = new MessageManager<string | int | Dimension | Axis>()

  onPageShow() {
    console.info('ListLanes  onPageShow');
    AppStorage.setOrCreate<MessageManager<string | int | Dimension | Axis>>("messageManager",  this.messageManager);
    let callback: Callback<string | int | Dimension | Axis> = (message:Message<string | int | Dimension | Axis>) => {
      console.error('message = ' + message.name + "--" + message.value);
      if (message.name == 'listGutter') {
        this.listGutter = message.value as Dimension
      }
      if (message.name == 'listDirection') {
        this.listDirection = message.value as Axis
      }
      if (message.name == 'listSpace') {
        this.listSpace = message.value as string
      }
      if (message.name == 'initialIndex') {
        this.initialIndex = message.value as int
      }

    }
    this.messageManager.registerCallback(callback);
  }

  build() {
    Column() {
      List({ space: this.listSpace, initialIndex: this.initialIndex }) {
        ForEach(this.arr, (item: number) =>  {
          ListItem() {
            Text('' + item)
              .width('100%').height(100).fontSize(16)
              .textAlign(TextAlign.Center).borderRadius(10).backgroundColor(0xFFFFFF)
          }.key('ListItem02_' + item).borderWidth(1)
        }, (item: number) => item.toString())
      }
      .key('ListLanesKey02')
      .listDirection(this.listDirection) 
      .alignListItem(this.alignListItem)
      .borderWidth(1)
      .lanes(3,$r('app.string.gutter_10'))
      .width('100%')
    }
    .width('100%')
    .height('100%')
    .backgroundColor(0xDCDCDC)
  }
}