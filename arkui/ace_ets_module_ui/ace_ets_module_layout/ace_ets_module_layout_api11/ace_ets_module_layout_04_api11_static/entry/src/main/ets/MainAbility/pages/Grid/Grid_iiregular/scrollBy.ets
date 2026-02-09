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
import { Entry, Component, Column, Color, ForEach, ComputedBarAttribute, EdgeEffect,Text,TextAlign, GridItem, BarState, ClickEvent, Scroller, ColumnOptions, Grid, Button, Margin } from '@ohos.arkui.component'
import { State, AppStorage } from '@ohos.arkui.stateManagement';
import { MessageManager, Callback, Message } from '../../../common/MessageManager';

@Entry
@Component
struct scrollBy {
  @State Number01: String[] = ['0', '1', '2', '3', '4'] as string[];
  scroller: Scroller = new Scroller();
  @State distance: number = 0;
  messageManager: MessageManager<number> = new MessageManager<number>();

  onPageShow() {
    console.info('List_lanes page show called');
    AppStorage.setOrCreate<MessageManager<number>>('messageManager', this.messageManager);
    let callback: Callback<number> = (message: Message<number>) => {
      console.log('message = ' + message.name + "--" + message.value);
      if (message.name == 'distance') {
        this.distance = message.value;
      }
    }
    this.messageManager.registerCallback(callback);
  }

  build() {
    Column({ space: 5 } as ColumnOptions) {
      Grid(this.scroller) {
        ForEach(this.Number01, (item: string) => {
          ForEach(this.Number01, (day: string) => {
            GridItem() {
              Text(day)
                .fontSize(16)
                .backgroundColor(0xF9CF93)
                .width('100%')
                .height(70)
                .textAlign(TextAlign.Center)
                .key('content' + day + item)
            }
          }, (day: string) => day)
        }, (item: string) => item)
      }
      .columnsTemplate('1fr')
      .columnsGap(10)
      .rowsGap(10)
      .key('scrollByPages')
      .friction(0.6)
      .edgeEffect(EdgeEffect.Spring)
      .scrollBar(BarState.On)
      .onScrollIndex((first: int,last: int) => {
        console.info(first)
      })
      .onScrollBarUpdate((index: int, offset: number) => {
        return { totalOffset: (index / 5) * (80 + 10) - offset, totalLength: 80 * 5 + 10 * 4 } as ComputedBarAttribute
      })
      .width('90%')
      .backgroundColor(0xFAEEE0)
      .height(70)

      Button('scroll 0')
        .height('5%')
        .id('scrollButton')
        .onClick((e: ClickEvent) => {
          this.scroller.scrollBy(0, this.distance)
        })
    }.width('100%').margin({ top: 5 } as Margin)
  }
}