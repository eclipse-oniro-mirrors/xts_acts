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
  Component,
  SwiperController,
  Column,
  Text,
  LazyForEach,
  Margin,
  IDataSource,
  DataChangeListener,
  DotIndicator,
  ColumnOptions,
  Swiper,
  TextAlign,
  Color,
  EdgeEffect,
  Visibility,
  ClickEvent,
  SwiperDisplayMode,
  SwiperAnimationEvent,
  Row,
  RowOptions,
  Button,
  Curve,
  SwiperAnimationEvent,
  HorizontalAlign,
  ArrowStyle,
  SwiperAutoFill,
  Padding,
  Indicator,
  FontWeight
} from '@ohos.arkui.component';
import { State, AppStorage } from '@ohos.arkui.stateManagement';
import { MessageManager, Callback, Message, GlobalMessage } from '../../../common/MessageManager1';

class MyDataSource78 implements IDataSource<number> {
  private list: number[] = []

  constructor(list: number[]) {
    this.list = list
  }

  totalCount(): int {
    return this.list.length
  }

  getData(index: int): number {
    return this.list[index as int]
  }

  registerDataChangeListener(listener: DataChangeListener): void {
  }

  unregisterDataChangeListener(listener: DataChangeListener) {
  }
}

@Entry
@Component
struct SwiperNextPrevMarginExample78 {
  private swiperController: SwiperController = new SwiperController()
  private data: MyDataSource78 = new MyDataSource78([])
  @State displayCount: int = 1;

  aboutToAppear(): void {
    let list: number[] = []
    for (let i = 1; i <= 10; i++) {
      list.push(i);
    }
    this.data = new MyDataSource78(list)
  }

  messageManager: MessageManager<int> = new MessageManager<int>()

  onPageShow() {
    console.info('SwiperNextPrevMargin78 onPageShow')
    AppStorage.setOrCreate<MessageManager<int>>('SwiperNextPrevMarginExample78', this.messageManager);
    let callback: Callback<int> = (message: Message<int>) => {
      console.error('message = ' + message.name + "--" + message.value)
      if (message.name == 'displayCount') {
        this.displayCount = message.value
      }
    }
    this.messageManager.registerCallback(callback)
  }

  build() {
    Column({ space: 5 } as ColumnOptions) {
      Swiper(this.swiperController) {
        LazyForEach(this.data, (item: number, index: int) => {
          Text(item.toString())
            .width('100%')
            .height(160)
            .backgroundColor(0xAFEEEE)
            .textAlign(TextAlign.Center)
            .fontSize(30)
            .key(index + "")
        }, (item: number) => item.toString())
      }
      .cachedCount(2)
      .index(1)
      .autoPlay(false, undefined)
      .interval(4000)
      .displayMode(SwiperDisplayMode.STRETCH)
      .padding(10)
      .nextMargin(4)
      .displayCount(this.displayCount)
      .prevMargin(2)
      .loop(true)
      .duration(1000)
      .itemSpace(0)
      .key("swiperNextPrevMargin78")

      Row({ space: 12 } as RowOptions) {
        Button('showNext')
          .onClick((e: ClickEvent) => {
            this.swiperController.showNext()
          })
        Button('showPrevious')
          .onClick((e: ClickEvent) => {
            this.swiperController.showPrevious()
          })
      }.margin(5)
    }.width('100%')
    .margin({ top: 5 } as Margin).key('ColumnSwiper78')
  }
}