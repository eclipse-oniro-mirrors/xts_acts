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
import Curves from '@ohos.curves'
import {
  Entry,
  Component,
  Column,
  Scroller,
  Stack,
  Edge,
  Alignment,
  Scroll,
  Button,
  ForEach,
  ScrollDirection,
  BarState,
  Color,
  EdgeEffect,
  ScrollSnapAlign,
  NestedScrollMode,
  Margin,
  ClickEvent,
  Text,
  ICurve,
  TextAlign,
  ScrollSource,
  ScrollState
} from '@ohos.arkui.component'
import { State } from '@ohos.arkui.stateManagement';

@Entry
@Component
struct ScrollExample {
  scroller: Scroller = new Scroller()
  private arr: number[] = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9] as number[]

  build() {
    Stack({ alignContent: Alignment.TopStart }) {
      Scroll(this.scroller) {
        Column() {
          ForEach(this.arr, (item: number, index: int) => {
            Text(item.toString())
              .width('90%')
              .height('10%')
              .backgroundColor(0xFFFFFF)
              .borderRadius(15)
              .fontSize(16)
              .key(item.toString())
              .textAlign(TextAlign.Center)
              .margin({ top: 10 } as Margin)
          }, (item: number, index: int) => String(item))
        }.width('100%')
      }
      .scrollable(ScrollDirection.Vertical) // 滚动方向纵向
      .scrollBar(BarState.On) // 滚动条常驻显示
      .scrollBarColor(Color.Gray) // 滚动条颜色
      .scrollBarWidth(10) // 滚动条宽度
      .edgeEffect(EdgeEffect.None)
      .enableScrollInteraction(true)
      .key('scrollAdd')
      .scrollSnap({
        snapAlign: ScrollSnapAlign.START,
        snapPagination: undefined,
        enableSnapToStart: false,
        enableSnapToEnd: false
      })
      .nestedScroll({
        scrollForward: NestedScrollMode.SELF_ONLY,
        scrollBackward: NestedScrollMode.PARALLEL
      })
      .onWillScroll((xOffset: number, yOffset: number, scrollState: ScrollState, scrollSource: ScrollSource) => {
        console.info(xOffset + ' ' + yOffset)
      })
      .onScrollEdge((side: Edge): void => {
        console.info('To the edge')
      })
      .onScrollStop(() => {
        console.info('Scroll Stop')
      })

      Button('scroll 150')
        .height('5%')
        .onClick((e: ClickEvent) => { // 点击后下滑指定距离150.0vp
          this.scroller.scrollBy(0, 150)
        })
        .margin({ top: 10, left: 20 } as Margin)
      Button('scroll 100')
        .height('5%')
        .onClick((e: ClickEvent) => { // 点击后滑动到指定位置，即下滑100.0vp的距离
          this.scroller.scrollTo({ xOffset: 0, yOffset: this.scroller.currentOffset()!.yOffset + 100 })
        })
        .margin({ top: 60, left: 20 } as Margin)
      Button('scroll 100')
        .height('5%')
        .onClick((e: ClickEvent) => { // 点击后滑动到指定位置，即下滑100.0vp的距离，滑动过程配置有动画
          let curve = Curves.interpolatingSpring(100, 1, 228, 30) as ICurve //创建一个阶梯曲线
          this.scroller.scrollTo({
            xOffset: 0,
            yOffset: this.scroller.currentOffset()!.yOffset + 100,
            animation: { duration: 1000, curve: curve }
          })
        })
        .margin({ top: 110, left: 20 } as Margin)
      Button('back top')
        .height('5%')
        .onClick((e: ClickEvent) => { // 点击后回到顶部
          this.scroller.scrollEdge(Edge.Top)

        })
        .margin({ top: 160, left: 20 } as Margin)
      Button('next page')
        .height('5%')
        .onClick((e: ClickEvent) => { // 点击后滑到下一页
          this.scroller.scrollPage({ next: true })
        })
        .margin({ top: 210, left: 20 } as Margin)


      Button('back top')
        .height('5%')
        .onClick((e: ClickEvent) => { // 点击后回到顶部
          this.scroller.scrollEdge(Edge.Top)

        })
        .margin({ top: 160, left: 20 } as Margin)
      Button('isScrollEnd')
        .height('5%')
        .key('isScrollEnd')
        .onClick((e: ClickEvent) => { // 点击后滑到下一页
          this.scroller.isAtEnd();
        })
        .margin({ top: 210, left: 20 } as Margin)
    }.width('100%').height('100%').backgroundColor(0xDCDCDC)
  }
}