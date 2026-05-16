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
  Column,
  IDataSource,
  DataChangeListener,
  SwiperController,
  SwiperAnimationEvent,
  Color,
  Curve,
  ColumnOptions,
  Margin,
  Swiper,
  Row,
  Text,
  LazyForEach,
  RowOptions,
  TextAlign,
  ClickEvent,
  ArrowStyle,
  Button,
  SwiperDisplayMode
} from '@ohos.arkui.component'
import { State } from '@ohos.arkui.stateManagement';

class MyDataSourceSwiperAdd implements IDataSource<number> {
  private list: number[] = []
  private listener?: DataChangeListener = undefined

  constructor(list: number[]) {
    this.list = list
  }

  totalCount(): int {
    return this.list.length
  }

  getData(index: int): number {
    return this.list[index.toInt()]
  }

  registerDataChangeListener(listener: DataChangeListener): void {
    this.listener = listener
  }

  unregisterDataChangeListener(listener: DataChangeListener): void {
  }
}

@Entry
@Component
struct SwiperAddExample {
  private swiperController: SwiperController = new SwiperController()
  private data: MyDataSourceSwiperAdd = new MyDataSourceSwiperAdd([])
  @State stringValue: string = "hello"

  aboutToAppear(): void {
    let list: number[] = []
    for (let i = 1; i <= 10; i++) {
      list.push(i);
    }
    this.data = new MyDataSourceSwiperAdd(list)
  }

  build() {
    Column({ space: 5 } as ColumnOptions) {
      Swiper(this.swiperController) {
        LazyForEach(this.data, (item: number, index: int) => {
          Text(String(item))
            .width('90%')
            .height('60%')
            .backgroundColor(0xAFEEEE)
            .textAlign(TextAlign.Center)
            .fontSize(30)
        }, (item: number, index: int) => String(item))
      }
      .cachedCount(2)
      .index(1)
      .autoPlay(false, undefined)
      .interval(4000)
      .indicator(true)
      .loop(false)
      .duration(1000)
      .itemSpace(0)
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
        this.stringValue = 'swiper'
        console.info("index: " + index)
        console.info("current offset: " + extraInfo.currentOffset)
      })
      .onAnimationStart((index: int, targetIndex: int, extraInfo: SwiperAnimationEvent): void => {
        console.info("index: " + index)
        console.info("targetIndex: " + targetIndex)
        console.info("current offset: " + extraInfo.currentOffset)
        console.info("target offset: " + extraInfo.targetOffset)
        console.info("velocity: " + extraInfo.velocity)
        console.info("mode: " + SwiperDisplayMode.STRETCH)
      })
      .onAnimationEnd((index: int, extraInfo: SwiperAnimationEvent): void => {
        console.info("index: " + index)
        console.info("current offset: " + extraInfo.currentOffset)
      })
      .key('swiperAdd')

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

      Text(this.stringValue).key('swiperValue')
    }.width('100%')
    .margin({ top: 5 } as Margin)
  }
}