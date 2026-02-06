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
  Length
} from '@ohos.arkui.component';
import { State, AppStorage } from '@ohos.arkui.stateManagement';
import { MessageManager, Callback, Message, GlobalMessage } from '../../../common/MessageManager1';

class MyDataSource50 implements IDataSource<number> {
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
struct SwiperNextPrevMarginExample50 {
  private swiperController: SwiperController = new SwiperController()
  private data: MyDataSource50 = new MyDataSource50([])
  @State prevMargin: number = 0;
  @State nextMargin: number = 0;
  @State vertical: boolean = false;
  @State itemSpace: number = 0;
  @State displayCount: int = 0;
  @State loop: boolean = false;

  aboutToAppear(): void {
    let list: number[] = []
    for (let i = 1; i <= 10; i++) {
      list.push(i);
    }
    this.data = new MyDataSource50(list)
  }

  messageManager: MessageManager<Length | boolean> = new MessageManager<Length | boolean>()

  onPageShow() {
    console.info('SwiperNextPrevMargin onPageShow')
    AppStorage.setOrCreate<MessageManager<Length | boolean>>('SwiperNextPrevMarginExample50', this.messageManager);
    let callback: Callback<Length | boolean> = (message: Message<Length | boolean>) => {
      console.error('message = ' + message.name + "--" + message.value)
      if (message.name == 'prevMargin') {
        this.prevMargin = Number(message.value?.toString()) ?? 0
      }
      if (message.name == 'nextMargin') {
        this.nextMargin = Number(message.value?.toString()) ?? 0
      }
      if (message.name == 'vertical') {
        this.vertical = message.value ? message.value as boolean : false
      }
      if (message.name == 'itemSpace') {
        this.itemSpace = Number(message.value?.toString()).toInt() ?? 0
      }
      if (message.name == 'displayCount') {
        this.displayCount = Number(message.value?.toString()).toInt() ?? 0
      }
      if (message.name == 'loop') {
        this.loop = message.value ? message.value as boolean : false
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
            .borderColor(Color.Red)
            .borderWidth(0)
            .fontSize(30)
            .key(index + "")
        }, (item: number) => item.toString())
      }
      .cachedCount(2)
      .index(1)
      .autoPlay(false, undefined)
      .interval(4000)
      .nextMargin(this.nextMargin)
      .vertical(this.vertical)
      .prevMargin(this.prevMargin)
      .displayCount(this.displayCount)
      .borderWidth(0)
      .width(250)
      .height(400)
      .itemSpace(this.itemSpace)
      .displayMode(SwiperDisplayMode.STRETCH)
      .loop(this.loop)
      .duration(1000)
      .key("swiperNextPrevMargin50")

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
    .margin({ top: 5 } as Margin).key('ColumnSwiper50')
  }
}