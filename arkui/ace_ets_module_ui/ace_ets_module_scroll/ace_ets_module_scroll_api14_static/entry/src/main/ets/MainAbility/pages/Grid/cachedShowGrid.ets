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
  BarState,
  Column,
  Component,
  Entry,
  ForEach,
  Grid,
  GridItem,
  GridItemStyle,
  Margin,
  Scroller,
  ScrollState,
  Text,
  TextAlign
} from '@ohos.arkui.component'
import { State, AppStorage, StoragePropRef } from '@ohos.arkui.stateManagement';
import events_emitter from '@ohos.events.emitter';
import { RecordData } from '@ohos.base';

@Entry
@Component
struct cachedCountShowGridExample {
  @State arr: string[] = ['1', '2', '3', '4', '5', '6', '7', '8', '9', '10', '11', '12', '13', '14', '15']
  scroller: Scroller = new Scroller()
  @State gridPosition: number = 0
  @StoragePropRef('clip1') clip1: boolean = false
  @StoragePropRef('show1') show1: boolean | undefined = true

  onPageShow() {
    console.info('[Grid] page show called');
    AppStorage.setOrCreate<boolean>('clip1', false);
    AppStorage.setOrCreate<boolean>('show1', true);
  }

  build() {
    Column() {
      Grid(this.scroller) {
        ForEach(this.arr, (item: string, index: int) => {
          GridItem({ style: GridItemStyle.PLAIN }) {
            Text('' + item)
              .id('show_grid_' + item)
              .width('100%')
              .height('34%')
              .fontSize(16)
              .textAlign(TextAlign.Center)
              .borderRadius(10)
              .backgroundColor('0xF9CF93')
          }
        }, (item: string) => item)
      }
      .id('cachedCount_show_grid')
      .columnsTemplate('1fr 1fr 1fr')
      .friction(0.6)
      .clip(this.clip1)
      .cachedCount(2, this.show1)
      .border({ width: 1 })
      .padding('3%')
      .width('90%')
      .height('40%')
      .scrollBar(BarState.On)
      .backgroundColor('0xFAEEE0')
      .onScrollIndex((first: int, last: int) => {
        console.info(first.toString())
        console.info(last.toString())
      })
      .onDidScroll((scrollOffset: number, scrollState: ScrollState): void => {
        console.info(scrollOffset.toString())
        console.info(scrollState.toString())
      })
      .onScrollStart(() => {
        console.info('Grid onScrollStart')
      })
      .onScrollStop(() => {
        console.info('Grid onScrollStop')
      })
      .onReachStart(() => {
        this.gridPosition = 0
        console.info('Grid onReachStart')
      })
      .onReachEnd(() => {
        this.gridPosition = 2
        console.info('Grid onReachEnd')
      })

    }.width('100%')
    .height('100%')
    .margin({ top: 5 } as Margin)
  }
}