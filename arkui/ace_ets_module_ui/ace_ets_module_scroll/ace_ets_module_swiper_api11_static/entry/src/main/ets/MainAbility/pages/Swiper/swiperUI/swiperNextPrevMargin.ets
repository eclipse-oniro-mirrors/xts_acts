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
  FontWeight,
  Resource,
  Length
} from '@ohos.arkui.component';
import { State, AppStorage } from '@ohos.arkui.stateManagement';
import { MessageManager, Callback, Message, GlobalMessage } from '../../../common/MessageManager1';

class MyDataSource implements IDataSource<number> {
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
struct SwiperNextPrevMarginExample {
  private swiperController: SwiperController = new SwiperController()
  private data: MyDataSource = new MyDataSource([])
  @State prevMargin: Length = 0.0
  @State nextMargin: Length = 0.0
  messageManager: MessageManager<Length | undefined | null> = new MessageManager<Length | undefined | null>()

  onPageShow() {
    console.info('SwiperNextPrevMargin onPageShow')
    AppStorage.setOrCreate<MessageManager<Length | undefined | null>>('SwiperNextPrevMarginExample', this.messageManager);
    let callback: Callback<Length | undefined | null> = (message: Message<Length | undefined | null>) => {
      console.error('message = ' + message.name + "--" + message.value)
      if (message.name == 'prevMargin') {
        this.prevMargin = message.value as Length
      }
      if (message.name == 'nextMargin') {
        this.nextMargin = message.value as Length
      }
    }
    this.messageManager.registerCallback(callback)
  }

  aboutToAppear(): void {
    let list: number[] = []
    for (let i = 1; i <= 10; i++) {
      list.push(i);
    }
    this.data = new MyDataSource(list)
  }

  build() {
    Column({ space: 5 } as ColumnOptions) {
      Swiper(this.swiperController) {
        LazyForEach(this.data, (item: number, index: int) => {
          Text(item.toString())
            .width('90%')
            .height(160)
            .backgroundColor(0xAFEEEE)
            .textAlign(TextAlign.Center)
            .fontSize(30)
        }, (item: number) => item.toString())
      }
      .cachedCount(2)
      .index(1)
      .autoPlay(false, undefined)
      .interval(4000)
      .nextMargin(this.nextMargin)
      .prevMargin(this.prevMargin)
      .indicator(Indicator.digit()
        .right("43%")
        .top(200)
        .fontColor(Color.Gray)
        .selectedFontColor(Color.Gray)
        .digitFont({ size: 20, weight: FontWeight.Bold })
        .selectedDigitFont({ size: 20, weight: FontWeight.Normal }))
      .loop(true)
      .duration(1000)
      .itemSpace(0)
      .displayArrow(true, false)
      .key("swiperNextPrevMargin")

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
    .margin({ top: 5 } as Margin).key('ColumnSwiper')
  }
}