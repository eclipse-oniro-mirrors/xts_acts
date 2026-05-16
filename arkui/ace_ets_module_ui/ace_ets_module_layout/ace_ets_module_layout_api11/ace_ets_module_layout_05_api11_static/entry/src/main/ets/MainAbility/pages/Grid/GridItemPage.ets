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
  ForEach,
  Color,
  Grid,
  GridItem,
  TextAlign,
  Margin
} from '@ohos.arkui.component'
import { State, AppStorage } from '@ohos.arkui.stateManagement'

@Entry
@Component
struct GridItemPage {
  @State numbers: string[] = Array.from(Array(16).keys() as Iterable<number>).map((item: number) => String(item));
  @State rowStart: int = 1
  @State rowEnd: int = 4
  @State columnStart: int = 1
  @State columnEnd: int = 5
  @State forceRebuild: boolean = true
  @State selectable: boolean = false
  @State onSelect: string = 'a'
  messageManager:MessageManager<string> = new MessageManager<string>()

  onPageShow() {
    console.info('GridItemPage onPageShow')
    AppStorage.setOrCreate<MessageManager<string>>("messageManager",  this.messageManager);
    let callback: Callback<string> = (message: Message<string>) => {
      console.error('message = ' + message.name + "--" + message.value)
      if (message.name == 'rowStart') {
        this.rowStart = Number.parseInt(message.value) as int
      }
      if (message.name == 'rowEnd') {
        this.rowEnd = Number.parseInt(message.value) as int
      }
      if (message.name == 'columnStart') {
        this.columnStart = Number.parseInt(message.value) as int
      }
      if (message.name == 'columnEnd') {
        this.columnEnd = Number.parseInt(message.value) as int
      }
      if (message.name == 'forceRebuild') {
        this.forceRebuild = Boolean(message.value)
      }
      if (message.name == 'selectable') {
        this.selectable = Boolean(message.value)
      }
      if (message.name == 'onSelect') {
        this.onSelect = message.value
      }
    }
    this.messageManager.registerCallback(callback)
  }

  build() {
    Column() {
      Grid() {
        GridItem() {
          Text(this.onSelect)
            .key('onSelect')
            .fontSize(16)
            .backgroundColor(0xFAEEE0)
            .width('100%')
            .height('100%')
            .textAlign(TextAlign.Center)
        }.rowStart(this.rowStart)
        .rowEnd(this.rowEnd)
        .key("gridItem1")
        .selectable(this.selectable)
        .onSelect((isSelected: boolean) =>{
          this.onSelect = 'true'
          console.info('isSelected: ' + isSelected)
        })

        ForEach(this.numbers, (item: string) => {
          GridItem() {
            Text(item)
              .fontSize(16)
              .backgroundColor(0xF9CF93)
              .width('100%')
              .height('100%')
              .textAlign(TextAlign.Center)
              .key(item)
          }
          .key("gridItem2")
        }, (item: string) => item)

        GridItem() {
          Text('b')
            .fontSize(16)
            .backgroundColor(0xDBD0C0)
            .width('100%')
            .height('100%')
            .textAlign(TextAlign.Center)
        }.columnStart(this.columnStart).columnEnd(this.columnEnd).key("gridItem3")
      }
      .key('grid1')
      .columnsGap("4")
      .rowsGap("5")
      .multiSelectable(true)
      .columnsTemplate('1fr 1fr 1fr 1fr 1fr')
      .rowsTemplate('1fr 1fr 1fr 1fr 1fr')
      .width('90%').height(300)
    }.width('100%').margin({ top: 5 } as Margin)
  }
}