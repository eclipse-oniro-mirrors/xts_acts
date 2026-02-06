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
  Padding
} from '@ohos.arkui.component';
import { State, AppStorage } from '@ohos.arkui.stateManagement';
import { MessageManager, Callback, Message, GlobalMessage } from '../../../common/MessageManager';

class MyDataSource1 implements IDataSource<number> {
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
struct SwiperMinSize {
  messageManager: MessageManager = new MessageManager()
  private swiperController: SwiperController = new SwiperController()
  private data: MyDataSource1 = new MyDataSource1([])
  @State minSize: number = 0
  @State swiperTextWidth: number = 160
  @State swiperWidth: number = 160
  @State swiperPadding: number = 0
  @State swiperMargin: number = 0
  @State itemSpace: number = 0
  @State nextMargin: number = 0
  @State text: string = ''

  onPageShow() {
    console.info('navigationPosition  onPageShow');
    const globalMessage: GlobalMessage = {
      name: 'messageManager', message: this.messageManager
    } as GlobalMessage;
    AppStorage.setOrCreate<GlobalMessage>('SwiperMinSize', globalMessage);
    let callback: Callback = (message: Message) => {
      console.error('message = ' + message.name + "--" + message.value);
      if (message.name == 'minSize') {
        this.minSize = Number(message?.value?.toString()) ?? 0;
      }
      if (message.name == 'swiperTextWidth') {
        this.swiperTextWidth = Number(message?.value?.toString()) ?? 0;
      }
      if (message.name == 'swiperWidth') {
        this.swiperWidth = Number(message?.value?.toString()) ?? 0;
      }
      if (message.name == 'swiperPadding') {
        this.swiperPadding = Number(message?.value?.toString()) ?? 0;
      }
      if (message.name == 'swiperMargin') {
        this.swiperMargin = Number(message?.value?.toString()) ?? 0;
      }
      if (message.name == 'itemSpace') {
        this.itemSpace = Number(message?.value?.toString()) ?? 0;
      }
      if (message.name == 'nextMargin') {
        this.nextMargin = Number(message?.value?.toString()) ?? 0;
      }
    }
    this.messageManager.registerCallback(callback);
  }

  aboutToAppear(): void {
    let list: number[] = []
    for (let i = 1; i <= 10; i++) {
      list.push(i);
    }
    this.data = new MyDataSource1(list)
  }

  build() {
    Column({ space: 5 } as ColumnOptions) {

      Swiper(this.swiperController) {
        LazyForEach(this.data, (item: number, index: int) => {
          Text(item.toString())
            .height(160)
            .backgroundColor(0xAFEEEE)
            .textAlign(TextAlign.Center)
            .fontSize(30)
        }, (item: number) => item.toString())
      }
      .width(160)
      .key('swiperMinSize1')
      .autoPlay(false, undefined)
      .indicator(true)
      .loop(true)
      .displayArrow({
        showBackground: true,
        isSidebarMiddle: true,
        backgroundSize: 24,
        backgroundColor: Color.White,
        arrowSize: 18,
        arrowColor: Color.Blue
      } as ArrowStyle, false)

      Swiper(this.swiperController) {
        LazyForEach(this.data, (item: number, index: int) => {
          Text(item.toString())
            .width(this.swiperTextWidth)
            .height(160)
            .backgroundColor(0xAFEEEE)
            .textAlign(TextAlign.Center)
            .fontSize(30)
            .key('swiperText' + item)
        }, (item: number) => item.toString())
      }
      .width(this.swiperWidth)
      .key('swiperMinSize2')
      .autoPlay(false, undefined)
      .indicator(true)
      .loop(true)
      .displayArrow({
        showBackground: true,
        isSidebarMiddle: true,
        backgroundSize: 24,
        backgroundColor: Color.White,
        arrowSize: 18,
        arrowColor: Color.Blue
      } as ArrowStyle, false)
      .displayCount({ minSize: this.minSize } as SwiperAutoFill)
      .itemSpace(this.itemSpace)
      .nextMargin(this.nextMargin)
      .padding({ top: this.swiperPadding } as Padding)
      .margin({ top: this.swiperMargin } as Margin)
      .vertical(false)

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
  }
}