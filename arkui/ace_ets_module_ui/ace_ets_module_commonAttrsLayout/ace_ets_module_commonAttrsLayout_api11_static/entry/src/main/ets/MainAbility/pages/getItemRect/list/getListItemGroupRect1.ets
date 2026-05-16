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
import { Callback, Message, MessageManager } from '../../../common/MessageManager';
import emitter from '@ohos.events.emitter'
import {
  Alignment,
  Axis,
  BarState,
  Builder,
  Button,
  ClickEvent,
  Color,
  Column,
  ColumnOptions,
  Component,
  Edge,
  EdgeEffect,
  Entry,
  ForEach,
  Grid,
  GridItem,
  Image,
  ImageSize,
  List,
  ListItem,
  ListItemGroup,
  ListScroller,
  Padding,
  Position,
  Row,
  SizeOptions,
  Text,
  TextAlign,
  Visibility,
} from '@ohos.arkui.component';
import { AppStorage, Link, PropRef, State, } from '@ohos.arkui.stateManagement';
import { ComponentUtils, Router, UIContext } from '@ohos.arkui.UIContext';
import inspector from '@ohos.arkui.inspector';

@Entry
@Component
struct getListItemGroupRect1 {
  @State space1: number = 20
  @State space2: number = 0
  @State index: Int = 0
  @State indexInGroup: Int = 0
  @State padding1: number = 0
  @State margin1: number = 0
  @State x: number = 0
  @State y: number = 0
  @State width1: number = 0
  @State height1: number = 0
  messageManager: MessageManager<number> = new MessageManager<number>()
  private arr: string[] = ['0', '1', '2', '3', '4', '5', '6', '7']
  private listScroller: ListScroller = new ListScroller()

  @Builder
  itemHead(text: string) {
    Text(text)
      .fontSize(20)
      .backgroundColor(0xAABBCC)
      .width('100%')
      .height(50)
  }

  @Builder
  itemFoot(num: number) {
    Text('共' + num + '个')
      .fontSize(20)
      .backgroundColor(0xAABBCC)
      .width('100%')
      .height(50)
  }

  onPageShow() {
    console.info('getListItemGroupRect1 onPageShow');
    AppStorage.setOrCreate<MessageManager<number>>('messageManager', this.messageManager);
    let callback: Callback<number> = (message: Message<number>) => {
      console.error('message = ' + message.name + "--" + message.value);
      if (message.name == 'index') {
        this.index = message.value as Int;
      } else if (message.name == 'indexInGroup') {
        this.indexInGroup = message.value as Int;
      } else if (message.name == 'space2') {
        this.space2 = message.value as number;
      } else if (message.name == 'padding1') {
        this.padding1 = message.value as number;
      } else if (message.name == 'margin1') {
        this.margin1 = message.value as number;
      }
    }
    this.messageManager.registerCallback(callback);
  }

  build() {
    Column() {
      Button('点击获取信息').onClick((event: ClickEvent) => {
        this.x = this.listScroller.getItemRectInGroup(this.index, this.indexInGroup).x
        this.y = this.listScroller.getItemRectInGroup(this.index, this.indexInGroup).y
        this.width1 = this.listScroller.getItemRectInGroup(this.index, this.indexInGroup).width
        this.height1 = this.listScroller.getItemRectInGroup(this.index, this.indexInGroup).height
      }).id('getListItemGroupRect1_button')
      Text('' + this.x).key('getListItemGroupRect1_text1')
      Text('' + this.y).key('getListItemGroupRect1_text2')
      Text('' + this.width1).key('getListItemGroupRect1_text3')
      Text('' + this.height1).key('getListItemGroupRect1_text4')
      Button('点击滚动到底部').onClick((event: ClickEvent) => {
        this.listScroller.scrollEdge(Edge.End)
      }).id('getListItemGroupRect1_button2')

      Button('还原').onClick((event: ClickEvent) => {
        this.index = 0
        this.indexInGroup = 0
        this.space2 = 0
        this.padding1 = 0
        this.margin1 = 0
        this.listScroller.scrollEdge(Edge.Start)
      }).id('getListItemGroupRect1_button3')

      List({ space: this.space1, initialIndex: 0, scroller: this.listScroller }) {
        ListItemGroup({
          header: () => {
            this.itemHead('0')
          }, footer: () => {
            this.itemFoot(this.arr.length)
          }, space: this.space2
        }) {
          ForEach(this.arr, (item: string) => {
            ListItem() {
              Text('listItemGroup' + item)
                .width('100%')
                .height("100%")
                .fontSize(16)
                .borderRadius(10)
                .textAlign(TextAlign.Center)
                .backgroundColor('#3366CC')
            }
            .width('100%')
            .height(10)
            .margin(this.margin1)
            .key('getListItemGroupRect1_listItemGroup_' + item)
          })
        }
        .padding(this.padding1)
      }
      .key('getListItemGroupRect1_list_1')
      .listDirection(Axis.Vertical) // 排列方向
      .scrollBar(BarState.Off)
      .edgeEffect(EdgeEffect.Spring) // 边缘效果设置为Spring
      .width(300)
      .height('80%')

    }
    .width('100%')
    .height('100%')
    .backgroundColor(0xDCDCDC)
    .margin(5)
  }
}
