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
  Axis,
  ListItemAlign,
  List,
  ListItem
} from '@ohos.arkui.component'
import { State, AppStorage } from '@ohos.arkui.stateManagement'
import { UIContext } from '@ohos.arkui.UIContext';
@Entry
@Component
struct ListLanes03 {
  private arr: Array<number> = new Array<number>(0, 1)
  @State listDirection: Axis = Axis.Vertical
  @State listSpace: string = '2'
  @State alignListItem: ListItemAlign = ListItemAlign.Start
  @State initialIndex: int = 0

  onPageShow(): void {
    let context = this.getUIContext() as UIContext
    AppStorage.setOrCreate<UIContext>("context",  context);
  }

  build() {
    Column() {
      List({ space: this.listSpace, initialIndex: this.initialIndex }) {
        ForEach(this.arr, (item: number) =>  {
          ListItem() {
            Text('' + item)
              .width('100%')
              .height('20%')
              .fontSize(16)
              .textAlign(TextAlign.Center)
              .borderRadius(10)
              .backgroundColor(0xFFFFFF)
          }.key('ListLanes31_' + item)
        }, (item: number) => item.toString())
      }
      .listDirection(this.listDirection) 
      .edgeEffect(EdgeEffect.Spring) 
      .alignListItem(this.alignListItem)
      .lanes(2, '10vp')
      .width('100%')
      .padding(5)
      .margin({ top: 10 } as Margin)

      List({ space: this.listSpace, initialIndex: this.initialIndex }) {
        ForEach(this.arr, (item: number) =>  {
          ListItem() {
            Text('' + item)
              .width('100%')
              .height('20%')
              .fontSize(16)
              .textAlign(TextAlign.Center)
              .borderRadius(10)
              .backgroundColor(0xFFFFFF)
          }.key('ListLanes32_' + item)
        }, (item: number) => item.toString())
      }
      .listDirection(this.listDirection) 
      .edgeEffect(EdgeEffect.Spring) 
      .alignListItem(this.alignListItem)
      .lanes(2, '10fp')
      .width('100%')
      .padding(5)
      .margin({ top: 10 } as Margin)

      List({ space: this.listSpace, initialIndex: this.initialIndex }) {
        ForEach(this.arr, (item: number) =>  {
          ListItem() {
            Text('' + item)
              .width('100%')
              .height('20%')
              .fontSize(16)
              .textAlign(TextAlign.Center)
              .borderRadius(10)
              .backgroundColor(0xFFFFFF)
          }.key('ListLanes33_' + item)
        }, (item: number) => item.toString())
      }
      .listDirection(this.listDirection) 
      .edgeEffect(EdgeEffect.Spring) 
      .alignListItem(this.alignListItem)
      .lanes(2, '10lpx')
      .width('100%')
      .padding(5)
      .margin({ top: 10 } as Margin)

      List({ space: this.listSpace, initialIndex: this.initialIndex }) {
        ForEach(this.arr, (item: number) =>  {
          ListItem() {
            Text('' + item)
              .width('100%')
              .height('20%')
              .fontSize(16)
              .textAlign(TextAlign.Center)
              .borderRadius(10)
              .backgroundColor(0xFFFFFF)
          }.key('ListLanes34_' + item)
        }, (item: number) => item.toString())
      }
      .listDirection(this.listDirection) 
      .edgeEffect(EdgeEffect.Spring) 
      .alignListItem(this.alignListItem)
      .lanes(2, '10px')
      .width('100%')
      .padding(5)
      .margin({ top: 10 } as Margin)

    }
    .width('100%')
    .height('100%')
    .backgroundColor(0xDCDCDC)
  }
}