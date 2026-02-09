'use static';
/**
 * Copyright (c) 2025 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the 'License');
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an 'AS IS' BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
import {
  Entry,
  Component,
  Margin,
  DataChangeListener,
  SwiperController,
  Column,
  DotIndicator,
  SwiperAnimationEvent,
  IDataSource,
  ColumnOptions,
  Swiper,
  Text,
  LazyForEach,
  TextAlign,
  Color,
  ArrowStyle,
  SwiperNestedScrollMode,
  Curve
} from '@ohos.arkui.component'
import { State } from '@ohos.arkui.stateManagement';
import { LengthMetrics } from '@ohos.arkui.node'

class MyDataSource implements IDataSource<number> {
  private list: number[] = []

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
  }

  unregisterDataChangeListener(listener: DataChangeListener): void {
  }
}

@Entry
@Component
struct nestedScrollSwiperExample {
  private swiperController: SwiperController = new SwiperController()
  private data: MyDataSource = new MyDataSource([])

  aboutToAppear(): void {
    let list: number[] = new Array<number>()
    for (let i = 1; i <= 6; i++) {
      list.push(i);
    }
    this.data = new MyDataSource(list)
  }

  build() {
    Column({ space: 5 } as ColumnOptions) {
      Text('Swiper start1')
      Swiper(this.swiperController) {
        LazyForEach(this.data, (item: number, index: int) => {
          Text(item.toString())
            .width('100%')
            .height('100%')
            .backgroundColor(0xAFEEEE)
            .textAlign(TextAlign.Center)
            .fontSize(30)
        }, (item: number, index: int) => String(item))
      }
      .id('swiper_nestedScroll_1')
      .width('80%')
      .height('30%')
      .cachedCount(2)
      .index(1)
      .autoPlay(false, undefined)
      .interval(4000)
      .loop(true)
      .indicatorInteractive(true)
      .duration(1000)
      .itemSpace(0)
      .indicator( // 设置圆点导航点样式
        new DotIndicator()
          .itemWidth(15)
          .itemHeight(15)
          .selectedItemWidth(15)
          .selectedItemHeight(15)
          .color(Color.Gray)
          .selectedColor(Color.Blue)
          .maxDisplayCount(5)
          .start(LengthMetrics.vp(30))
      )
      .displayArrow({
        // 设置导航点箭头样式
        showBackground: true,
        isSidebarMiddle: true,
        backgroundSize: 24,
        backgroundColor: Color.White,
        arrowSize: 18,
        arrowColor: Color.Blue
      } as ArrowStyle, false)
      .nestedScroll(SwiperNestedScrollMode.SELF_ONLY)
      .curve(Curve.Linear)
      .onChange((index: int): void => {
        console.info(index.toString())
      })
      .onGestureSwipe((index: int, extraInfo: SwiperAnimationEvent): void => {
        console.info('index: ' + index)
        console.info('current offset: ' + extraInfo.currentOffset)
        console.info('target offset: ' + extraInfo.targetOffset)
        console.info('velocity: ' + extraInfo.velocity)
      })

      Text('Swiper end2')
      Swiper(this.swiperController) {
        LazyForEach(this.data, (item: number, index: int) => {
          Text(item.toString())
            .width('100%')
            .height('100%')
            .backgroundColor(0xAFEEEE)
            .textAlign(TextAlign.Center)
            .fontSize(30)
        }, (item: number, index: int) => String(item))
      }
      .id('swiper_nestedScroll_2')
      .width('80%')
      .height('30%')
      .cachedCount(2)
      .index(1)
      .autoPlay(false, undefined)
      .interval(4000)
      .loop(true)
      .indicatorInteractive(true)
      .duration(1000)
      .itemSpace(0)
      .indicator( // 设置圆点导航点样式
        new DotIndicator()
          .itemWidth(15)
          .itemHeight(15)
          .selectedItemWidth(15)
          .selectedItemHeight(15)
          .color(Color.Gray)
          .selectedColor(Color.Blue)
          .maxDisplayCount(5)
          .end(LengthMetrics.vp(30))
      )
      .displayArrow({
        // 设置导航点箭头样式
        showBackground: true,
        isSidebarMiddle: true,
        backgroundSize: 24,
        backgroundColor: Color.White,
        arrowSize: 18,
        arrowColor: Color.Blue
      } as ArrowStyle, false)
      .nestedScroll(SwiperNestedScrollMode.SELF_FIRST)
      .curve(Curve.Linear)
      .onChange((index: int): void => {
        console.info(index.toString())
      })
      .onAnimationStart((index: int, targetIndex: int, extraInfo: SwiperAnimationEvent): void => {
        console.info('index: ' + index)
        console.info('targetIndex: ' + targetIndex)
        console.info('current offset: ' + extraInfo.currentOffset)
        console.info('target offset: ' + extraInfo.targetOffset)
        console.info('velocity: ' + extraInfo.velocity)
      })
      .onAnimationEnd((index: int, extraInfo: SwiperAnimationEvent): void => {
        console.info('index: ' + index)
        console.info('current offset: ' + extraInfo.currentOffset)
      })

    }.width('100%')
    .margin({ top: 5 } as Margin)
  }
}