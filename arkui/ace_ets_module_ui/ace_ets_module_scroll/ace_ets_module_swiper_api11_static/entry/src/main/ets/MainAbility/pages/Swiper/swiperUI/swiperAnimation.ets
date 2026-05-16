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
  ArrowStyle
} from '@ohos.arkui.component';
import { State, AppStorage } from '@ohos.arkui.stateManagement';
import { MessageManager, Callback, Message, GlobalMessage } from '../../../common/MessageManager1';

class MyDataSourceA implements IDataSource<number> {
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
struct SwiperAnimationExample {
  private swiperController: SwiperController = new SwiperController()
  private data: MyDataSourceA = new MyDataSourceA([])
  @State onAnimationS: string = "s";
  @State onAnimationE: string = "e";
  @State onAnimationGesture: string = "GestureSwipe";
  @State autoPlay: boolean = false;
  messageManager: MessageManager<boolean> = new MessageManager<boolean>();

  aboutToAppear(): void {
    let list: number[] = []
    for (let i = 1; i <= 10; i++) {
      list.push(i);
    }
    this.data = new MyDataSourceA(list)
  }

  onPageShow() {
    console.info('swiperAnimation onPageShow')
    const globalMessage: GlobalMessage<boolean> = {
      name: 'messageManager', message: this.messageManager
    } as GlobalMessage<boolean>;
    AppStorage.setOrCreate<GlobalMessage<boolean>>('SwiperAnimationExample', globalMessage);
    let callback: Callback<boolean> = (message: Message<boolean>) => {
      console.error('message = ' + message.name + "--" + message.value)
      if (message.name == 'autoPlay') {
        this.autoPlay = message.value
      }
    }
    this.messageManager.registerCallback(callback)
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
      .autoPlay(this.autoPlay, undefined)
      .interval(4000)
      .indicator(true)
      .loop(true)
      .duration(300)
      .itemSpace(0)
      .key('swiperAnimation')
      .displayArrow({
        showBackground: true,
        isSidebarMiddle: true,
        backgroundSize: 24,
        backgroundColor: Color.White,
        arrowSize: 18,
        arrowColor: Color.Blue
      } as ArrowStyle, false)
      .curve(Curve.Linear)
      .onChange((index: int): void => {
        console.info(index.toString())
      })
      .onGestureSwipe((index: int, extraInfo: SwiperAnimationEvent): void => {
        console.info("GestureSwipe index: " + index)
        this.onAnimationGesture = "GestureSwipe index: " + index;
        console.info("current offset: " + extraInfo.currentOffset)
      })
      .onAnimationStart((index: int, targetIndex: int, extraInfo: SwiperAnimationEvent): void => {
        this.onAnimationS = "Start" + index + "-->" + targetIndex;
        console.info("index: " + index)
        console.info("targetIndex: " + targetIndex)
        console.info("current offset: " + extraInfo.currentOffset)
        console.info("target offset: " + extraInfo.targetOffset)
        console.info("velocity: " + extraInfo.velocity)
      })
      .onAnimationEnd((index: int, extraInfo: SwiperAnimationEvent): void => {
        this.onAnimationE = "End" + index + "-->";
        console.info("index: " + index)
        console.info("current offset: " + extraInfo.currentOffset)
      })

      Row({ space: 12 } as RowOptions) {
        Button('showNext')
          .onClick((e: ClickEvent) => {
            this.swiperController.showNext()
          }).key('showNext')
        Button('showPrevious')
          .onClick((e: ClickEvent) => {
            this.swiperController.showPrevious()
          }).key('showPrevious')
      }.margin(5)

      Text(this.onAnimationS).margin({ top: 20 } as Margin).key('animationStart')
      Text(this.onAnimationE).margin({ top: 20 } as Margin).key('animationEnd')
      Text(this.onAnimationGesture).margin({ top: 20 } as Margin).key('GestureSwipe')

    }.width('100%')
    .margin({ top: 5 } as Margin)
  }
}
