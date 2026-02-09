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
  FlexAlign,
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
  Visibility
} from '@ohos.arkui.component';
import { AppStorage, Link, PropRef, State, } from '@ohos.arkui.stateManagement';
import { ComponentUtils, Router, UIContext } from '@ohos.arkui.UIContext';
import inspector from '@ohos.arkui.inspector';

@Entry
@Component
struct getListItemRect2 {
  @State x1: number = 0
  @State y1: number = 0
  @State index: Int = 0
  @State x: number = 0
  @State y: number = 0
  @State width1: number = 0
  @State height1: number = 0
  messageManager: MessageManager<Object> = new MessageManager<Object>()
  private arr: string[] = ['1', '2', '3', '4', '5', '6', '7', '8', '9']
  private listScroller: ListScroller = new ListScroller()

  onPageShow() {
    console.info('getListItemRect2 onPageShow');
    AppStorage.setOrCreate<MessageManager<Object>>('messageManager', this.messageManager);
    let callback: Callback<Object> = (message: Message<Object>) => {
      console.error('message = ' + message.name + "--" + message.value);
      if (message.name == 'index') {
        this.index = message.value as Int;
      } else if (message.name == 'x1') {
        this.x1 = message.value as number;
      } else if (message.name == 'y1') {
        this.y1 = message.value as number;
      }
    }
    this.messageManager.registerCallback(callback);
  }

  build() {
    Column() {
      Button('点击获取信息').onClick((event: ClickEvent) => {
        this.x = this.listScroller.getItemRect(this.index).x
        this.y = this.listScroller.getItemRect(this.index).y
        this.width1 = this.listScroller.getItemRect(this.index).width
        this.height1 = this.listScroller.getItemRect(this.index).height
      }).id('getListItemRect2_button')
      Text('' + this.x).key('getListItemRect2_text1')
      Text('' + this.y).key('getListItemRect2_text2')
      Text('' + this.width1).key('getListItemRect2_text3')
      Text('' + this.height1).key('getListItemRect2_text4')

      List({ space: 20, initialIndex: 0, scroller: this.listScroller }) {

        ListItem() {
          Text('0')
            .width('100%')
            .height('100%')
            .fontSize(16)
            .textAlign(TextAlign.Center)
            .borderRadius(10)
            .backgroundColor(0xFFFFFF)
            .key('getListItemRect2_listItem_0')
        }.width('100%').height(100).offset({ x: this.x1, y: this.y1 } as Position)

        ForEach(this.arr, (item: string) => {
          ListItem() {
            Text('' + item)
              .width('100%')
              .height('100%')
              .fontSize(16)
              .textAlign(TextAlign.Center)
              .borderRadius(10)
              .backgroundColor(0xFFFFFF)
              .key('getListItemRect2_listItem_' + item)
          }.width('100%').height(100)
        }, (item: string) => item)

      }
      .key('getListItemRect2_list1')
      .listDirection(Axis.Vertical) // 排列方向
      .scrollBar(BarState.Off)
      .edgeEffect(EdgeEffect.Spring) // 边缘效果设置为Spring
      .width(300)
      .height(500)

    }
    .width('100%')
    .height('100%')
    .backgroundColor(0xDCDCDC)
    .margin(5)

  }
}

