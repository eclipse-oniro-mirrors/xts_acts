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
  ListItemAlign,
  Axis,
  Dimension,
  List,
  ListItem,
  $r
} from '@ohos.arkui.component'
import { State, AppStorage } from '@ohos.arkui.stateManagement'
@Entry
@Component
struct ListLanes05 {
  private arr: Array<number> = new Array<number>(0, 1, 2, 3, 4, 5)
  listGutter: Dimension = '0vp'
  @State listDirection: Axis = Axis.Horizontal
  @State listSpace: string = '20'
  @State alignListItem: ListItemAlign = ListItemAlign.Start
  @State initialIndex: int = 0

  build() {
    Column() {
      List({ space: this.listSpace, initialIndex: this.initialIndex }) {
        ForEach(this.arr, (item: number) =>  {
          ListItem() {
            Text('' + item)
              .width(100).height('100%').fontSize(16)
              .textAlign(TextAlign.Center).borderRadius(10).backgroundColor(0xFFFFFF)
          }.key('ListItem0501_' + item)
        }, (item: number) => item.toString())
      }
      .key('ListLanesKey05_1')
      .listDirection(this.listDirection) 
      .alignListItem(this.alignListItem)
      .lanes(2,'10lpx')
      .width('100%')
      .height('20%')

      List({ space: this.listSpace, initialIndex: this.initialIndex }) {
        ForEach(this.arr, (item: number) =>  {
          ListItem() {
            Text('' + item)
              .width(100).height('100%').fontSize(16)
              .textAlign(TextAlign.Center).borderRadius(10).backgroundColor(0xFFFFFF)
          }.key('ListItem02_' + item)
        }, (item: number) => item.toString())
      }
      .key('ListLanesKey05_2')
      .listDirection(this.listDirection) 
      .alignListItem(this.alignListItem)
      .lanes(2,'10px')
      .width('100%')
      .height('20%')

      List({ space: this.listSpace, initialIndex: this.initialIndex }) {
        ForEach(this.arr, (item: number) =>  {
          ListItem() {
            Text('' + item)
              .width(100).height('100%').fontSize(16)
              .textAlign(TextAlign.Center).borderRadius(10).backgroundColor(0xFFFFFF)
          }.key('ListItem03_' + item)
        }, (item: number) => item.toString())
      }
      .key('ListLanesKey05_3')
      .listDirection(this.listDirection) 
      .alignListItem(this.alignListItem)
      .lanes(2,'10vp')
      .width('100%')
      .height('20%')

      List({ space: this.listSpace, initialIndex: this.initialIndex }) {
        ForEach(this.arr, (item: number) =>  {
          ListItem() {
            Text('' + item)
              .width(100).height('100%').fontSize(16)
              .textAlign(TextAlign.Center).borderRadius(10).backgroundColor(0xFFFFFF)
          }.key('ListItem04_' + item)
        }, (item: number) => item.toString())
      }
      .key('ListLanesKey05_4')
      .listDirection(this.listDirection) 
      .alignListItem(this.alignListItem)
      .lanes(2,$r('app.string.gutter_10'))
      .width('100%')
      .height('20%')


    }
    .width('100%')
    .height('100%')
    .backgroundColor(0xDCDCDC)
  }
}