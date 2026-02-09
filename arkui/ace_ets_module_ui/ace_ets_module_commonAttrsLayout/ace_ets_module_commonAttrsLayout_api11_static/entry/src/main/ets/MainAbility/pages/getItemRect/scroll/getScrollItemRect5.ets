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
  BarState,
  Builder,
  Button,
  ClickEvent,
  Color,
  Column,
  ColumnOptions,
  Component,
  Edge,
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
  Scroll,
  ScrollDirection,
  Scroller,
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
struct getScrollItemRect5 {
  scroller: Scroller = new Scroller()
  @State arr: string[] = ['0', '1', '2', '3', '4', '5']
  @State padding1: number = 0
  @State margin1: number = 0
  @State index: Int = 0
  @State x: number = 0
  @State y: number = 0
  @State width1: number = 0
  @State height1: number = 0
  messageManager: MessageManager<Object> = new MessageManager<Object>()

  onPageShow() {
    console.info('getScrollItemRect5 onPageShow');
    AppStorage.setOrCreate<MessageManager<Object>>('messageManager', this.messageManager);
    let callback: Callback<Object> = (message: Message<Object>) => {
      console.error('message = ' + message.name + "--" + message.value);
      if (message.name == 'index') {
        this.index = message.value as Int;
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
        this.x = this.scroller.getItemRect(this.index).x
        this.y = this.scroller.getItemRect(this.index).y
        this.width1 = this.scroller.getItemRect(this.index).width
        this.height1 = this.scroller.getItemRect(this.index).height
      }).id('getScrollItemRect5_button')
      Text('' + this.x).key('getScrollItemRect5_text1')
      Text('' + this.y).key('getScrollItemRect5_text2')
      Text('' + this.width1).key('getScrollItemRect5_text3')
      Text('' + this.height1).key('getScrollItemRect5_text4')

      Button('点击滚动到底部').onClick((event: ClickEvent) => {
        this.scroller.scrollEdge(Edge.End)
      }).id('getScrollItemRect5_button2')

      Scroll(this.scroller) {
        Column() {
          ForEach(this.arr, (item: string) => {
            Text(item.toString())
              .width('100%')
              .height(100)
              .backgroundColor('#3366CC')
              .borderRadius(15)
              .fontSize(16)
              .textAlign(TextAlign.Center)
          })
        }
        .width(300)
        .margin(this.margin1)

      }
      .scrollable(ScrollDirection.Vertical)
      .scrollBar(BarState.Auto)
      .height(500)
      .padding(this.padding1)

    }
  }
}