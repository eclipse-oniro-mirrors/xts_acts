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
  GridDirection,
  Grid,
  GridItem,
  TextAlign,
  Margin,
  Padding
} from '@ohos.arkui.component'
import { State, AppStorage } from '@ohos.arkui.stateManagement'



@Entry
@Component
struct GridLayoutDirection {
  @State numberData: String[] = ['0', '1', '2']
  scroller: Scroller = new Scroller()
  @State columnsTemplate: string = '1fr 1fr 1fr'
  @State layoutDirection: GridDirection = GridDirection.Row
  @State gridPadding: number = 0
  @State gridMargin: number = 0
  messageManager: MessageManager<number | GridDirection> = new MessageManager<number | GridDirection>()

  onPageShow() {
    console.info('navigationPosition  onPageShow');
    AppStorage.setOrCreate<MessageManager<number | GridDirection>>("messageManager",  this.messageManager);
    let callback: Callback<number | GridDirection> = (message: Message<number | GridDirection>) => {
      console.error('message = ' + message.name + "--" + message.value);
      if (message.name == 'layoutDirection') {
        this.layoutDirection = message.value as GridDirection
      }
      if (message.name == 'gridPadding') {
        this.gridPadding = message.value as number
      }
      if (message.name == 'gridMargin') {
        this.gridMargin = message.value as number
      }

    }
    this.messageManager.registerCallback(callback);
  }

  build() {
    Column({ space: 5 } as ColumnOptions) {
      Grid() {
        ForEach(this.numberData, (day: string ,index1:int|undefined) => {
          ForEach(this.numberData, (day: string ,index2:int|undefined) => {
            GridItem() {
              Text(day)
                .fontSize(16)
                .backgroundColor(0xF9CF93)
                .width('100%')
                .height('100%')
                .textAlign(TextAlign.Center)
            }.width(90).height(90)
            .key('GridItem' + index1 + index2)
          }, (day: string) => day)
        }, (day: string) => day)
      }
      .key('GridLayoutDirKey')
      .margin({ top:this.gridMargin } as Margin)
      .padding({ top:this.gridPadding } as Padding)
      .layoutDirection(this.layoutDirection)
      .columnsGap(10)
      .rowsGap(10)
      .width('90%')
      .backgroundColor(0xFAEEE0)
      .height(300)
    }.width('100%').margin({ top: 5 } as Margin).key('ColumnKey')
  }
}