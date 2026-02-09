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
import { LengthMetrics } from '@ohos.arkui.node'
import {
  $r,
  ArrowStyle,
  Button,
  ClickEvent,
  Color,
  Column,
  ColumnOptions,
  Component,
  DotIndicator,
  Entry,
  ForEach,
  Margin,
  Swiper,
  SwiperAnimationEvent,
  SwiperController,
  Text,
  TextAlign,
} from '@ohos.arkui.component';
import { AppStorage, Link, PropRef, State, } from '@ohos.arkui.stateManagement';
import { Router, UIContext } from '@ohos.arkui.UIContext';
import inspector from '@ohos.arkui.inspector';
import { BusinessError } from '@ohos.base';

@Entry
@Component
struct onUnselectedSwiperExample {
  private swiperController: SwiperController = new SwiperController()
  private data: number[] = [] as number[];
  @State autoPlay: boolean = false
  @State displayCount: int = 1
  @State hideIndex: number = -1
  @State backColor: Color = Color.Gray
  @State selectedIndex: number = -1
  @State space: LengthMetrics = LengthMetrics.vp(0)
  @State ignoreSize: boolean = false

  aboutToAppear(): void {
    for (let i = 0; i <= 6; i++) {
      this.data.push(i)
    }

  }

  build() {
    Column() {
      Text('index: ' + this.hideIndex)
        .id('onUnselected_swiper_index')
        .margin({ top: 10 } as Margin)
      Text('selectedIndex: ' + this.selectedIndex)
        .id('onSelected_swiper_index')

      Swiper(this.swiperController) {
        ForEach(this.data, (item: number) => {
          Text(String(item))
            .width('90%')
            .height(160)
            .backgroundColor('0xAFEEEE')
            .textAlign(TextAlign.Center)
            .fontSize(30)
        }, (item: number) => String(item))
      }
      .id('onSelect_swiper')
      .index(1)
      .backgroundColor(this.backColor)
      .displayCount(this.displayCount)
      .autoPlay(this.autoPlay, undefined)
      .indicator(new DotIndicator()
        .space(LengthMetrics.vp(5))
        // .bottom(LengthMetrics.vp(0), this.ignoreSize)
        .itemWidth(15)
        .itemHeight(15)
        .selectedItemWidth(15)
        .selectedItemHeight(15)
        .color(Color.Gray)
        .selectedColor(Color.Blue))
      .displayArrow({
        showBackground: true,
        isSidebarMiddle: true,
        backgroundSize: 24,
        backgroundColor: Color.White,
        arrowSize: 18,
        arrowColor: Color.Blue
      } as ArrowStyle, false)
      .onSelected((index: int): void => {
        console.log('onSelected index:' + index);
        this.selectedIndex = index
      })
      .onUnselected((index: int): void => {
        this.hideIndex = index
        console.log('onUnselected: ' + index)
      })
      .onGestureSwipe((index: int, extraInfo: SwiperAnimationEvent): void => {
        console.info('onGestureSwipe index: ' + index)
        console.info('onGestureSwipe current offset: ' + extraInfo.currentOffset)
        console.info('onGestureSwipe target offset: ' + extraInfo.targetOffset)
        console.info('onGestureSwipe velocity: ' + extraInfo.velocity)
      })
      .onAnimationStart((index: int, targetIndex: int, extraInfo: SwiperAnimationEvent): void => {
        console.info('onAnimationStart index: ' + index)
        console.info('onAnimationStart targetIndex: ' + targetIndex)
        console.info('onAnimationStart current offset: ' + extraInfo.currentOffset)
        console.info('onAnimationStart target offset: ' + extraInfo.targetOffset)
        console.info('onAnimationStart velocity: ' + extraInfo.velocity)
        if (index === targetIndex) {
          return
        }
        this.selectedIndex = targetIndex
      })
      .onAnimationEnd((index: int, extraInfo: SwiperAnimationEvent): void => {
        console.info(String(index))
        console.info('onAnimationEnd index: ' + index)
        console.info('onAnimationEnd current offset: ' + extraInfo.currentOffset)
        console.info('onAnimationEnd target offset: ' + extraInfo.targetOffset)
        console.info('onAnimationEnd velocity: ' + extraInfo.velocity)
      })
    }
  }
}
