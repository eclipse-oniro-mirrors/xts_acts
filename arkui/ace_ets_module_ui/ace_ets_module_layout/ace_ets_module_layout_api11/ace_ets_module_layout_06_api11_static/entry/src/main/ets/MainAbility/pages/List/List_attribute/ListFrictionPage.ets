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

import {
  Entry,
  Text,
  TextAttribute,
  Column,
  Component,
  Button,
  ButtonAttribute,
  ClickEvent,

  Image,
  ImageFit,
  Scroller,
  Scroll,
  ForEach,
  Search,
  SafeAreaType,
  ScrollDirection,
  BarState,
  Color,
  EdgeEffect,
  HorizontalAlign,
  FlexAlign,
  GridLayoutOptions,
  ColumnOptions,
  Grid,
  Margin,
  GridItem,
  TextAlign,
  Padding,
  Builder,
  List,
  ListItem,
  Axis
} from '@ohos.arkui.component'
import{
  State,
  AppStorage
} from '@ohos.arkui.stateManagement'
import { MessageManager, Callback,Message } from '../../../common/MessageManager';
@Entry
@Component
struct ListFrictionPage {
  private arr: Array<number> = new Array<number>(1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12);
  @State friction: number = 1000;
  messageManager: MessageManager<number> = new MessageManager<number>();

  onPageShow() {
    console.info('List_lanes page show called');
      AppStorage.setOrCreate<MessageManager<number>>("messageManager", this.messageManager );
    let callback: Callback<number> = (message: Message<number>) => {
      console.log('message = ' + message.name + "--" + message.value);
      if (message.name == 'friction') {
        this.friction = message.value;
      }
    };
    this.messageManager.registerCallback(callback);
  }

  build() {
    Column() {
      List({ initialIndex: 0 }) {
        ForEach(this.arr, (item: number) => {
          ListItem() {
            Text('' + item)
              .width('100%')
              .height('30%')
              .fontSize(16)
              .textAlign(TextAlign.Center)
          }
        })
      }
      .width('90%')
      .height('10%')
      .key('list_friction_default')

      List({ space: 20, initialIndex: 0 }) {
        ForEach(this.arr, (item: number) => {
          ListItem() {
            Text('' + item)
              .width('100%')
              .height(100)
              .fontSize(16)
              .textAlign(TextAlign.Center)
              .borderRadius(10)
              .backgroundColor(0xFFFFFF)
          }
        })
      }
      .listDirection(Axis.Vertical) 
      .divider({ strokeWidth: 2, color: 0xFFFFFF, startMargin: 20, endMargin: 20 }) 
      .edgeEffect(EdgeEffect.Spring) 
      .onScrollIndex((firstIndex: int, lastIndex: int):void => {
        console.info('first' + firstIndex)
        console.info('last' + lastIndex)
      })
      .width('90%')
      .height('60%')
      .friction(this.friction)
      .key('List_ListFriction')
    }
    .width('100%')
    .height('100%')
    .backgroundColor(0xDCDCDC)
    .padding({ top: 5 } as Padding)
  }
}
