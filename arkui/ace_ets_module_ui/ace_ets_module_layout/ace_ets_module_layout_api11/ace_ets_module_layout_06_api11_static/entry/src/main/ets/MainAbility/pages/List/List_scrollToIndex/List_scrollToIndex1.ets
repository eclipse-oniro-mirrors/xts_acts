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
import { MessageManager, Callback, Message } from '../../../common/MessageManager';
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
  Axis
} from '@ohos.arkui.component'
import { State, AppStorage } from '@ohos.arkui.stateManagement'
@Entry
@Component
struct List_scrollToIndex1 {
  private arr: Array<number> = new Array<number>(0, 1, 2, 3, 4, 5, 6, 7, 8, 9);
  private scroller: Scroller = new Scroller();

  build() {
    Column() {
      Button('scrollToIndex 5')
        .id('List_scrollToIndex1_to5')
        .fontSize(14)
        .margin(5)
        .onClick((e:ClickEvent) => {
          this.scroller.scrollToIndex(5)
        })
      List({ space: 10, initialIndex: 0, scroller: this.scroller }) {
        ForEach(this.arr, (item: number, index?: Int) => {
          ListItem() {
            Text('ListItem' + item)
              .width('90%')
              .height(40)
              .textAlign(TextAlign.Center)
              .borderRadius(10)
              .backgroundColor(0xFFFFFF)
          }.id('List_scrollToIndex1_ListItem' + item)
        }, (item: number) => item.toString())
      }
      .id('List_scrollToIndex1_List')
      .width('80%')
      .height(230)
      .backgroundColor(Color.Pink)
      .edgeEffect(EdgeEffect.None)
      .scrollBar(BarState.On)

    }.width('100%').height('100%').backgroundColor(0xDCDCDC)

  }
}