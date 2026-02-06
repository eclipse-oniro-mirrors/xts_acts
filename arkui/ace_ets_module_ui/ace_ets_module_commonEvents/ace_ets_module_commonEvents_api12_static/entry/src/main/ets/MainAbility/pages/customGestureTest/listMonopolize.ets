'use static';
/*
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
  Axis,
  BarState,
  Button,
  Color,
  Column,
  ColumnOptions,
  Component,
  CustomBuilder,
  DragItemInfo,
  Entry,
  FlexAlign,
  ForEach,
  GestureEvent,
  List,
  ListItem,
  Margin,
  Padding,
  Row,
  Scroll,
  TapGesture,
  Text,
  TextAlign,
  TouchEvent,
  TouchType
} from '@ohos.arkui.component'
import { AppStorage, State } from '@ohos.arkui.stateManagement'
import { Router, UIContext } from '@ohos.arkui.UIContext';

@Entry
@Component
struct ListGesture {
  @State monopolize: boolean = false
  @State logMsg1: string = ''
  @State logMsg2: string = ''
  private arr: Array<number> = new Array<number>(0, 1, 2, 3, 4, 5, 6, 7, 8, 9)

  build() {
    Column({ space: 20 } as ColumnOptions) {
      Text(this.logMsg2)
        .id('listText')
        .fontSize(20)
        .fontColor(Color.Blue)
        .margin(10)
      List({ space: 20, initialIndex: 0 }) {
        ForEach(this.arr, (item: number, index: Int): void => {
          ListItem() {
            Text('' + item)
              .width('100%')
              .height(100)
              .fontSize(16)
              .textAlign(TextAlign.Center)
              .borderRadius(10)
              .backgroundColor('0xFFFFFF')
          }
        }, (item: number, index: Int): string => String(item))
      }
      .padding({ top: 5 } as Padding)
      .listDirection(Axis.Vertical) // 排列方向
      .scrollBar(BarState.Off)
      .friction(0.6)
      .backgroundColor(Color.Pink)
      .width("100%")
      .height(300)
      .divider({
        strokeWidth: 2,
        color: '0xFFFFFF',
        startMargin: 20,
        endMargin: 20
      }) // 每行之间的分界线
      .onDidScroll((event) => {
        if (event) {
          this.logMsg1 = 'OnScroll start'
        }
      })

      Column() {
      }
      .id("column")
      .backgroundColor(Color.Blue)
      .width("100%")
      .height(300)
      .gesture(
        TapGesture({ count: 1 })
          .onAction((event: GestureEvent) => {
            if (event) {
              this.logMsg2 = 'TapGesture onActionEnd success'
            }
          })
      )
    }.height('100%').width('100%').justifyContent(FlexAlign.Center)
  }
}