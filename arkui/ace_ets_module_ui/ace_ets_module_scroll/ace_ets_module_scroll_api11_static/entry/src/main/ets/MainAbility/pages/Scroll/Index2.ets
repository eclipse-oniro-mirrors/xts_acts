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
  Column,
  Component,
  Color,
  Text,
  LoadingProgress,
  Margin,
  Scroller,
  Scroll,
  ColumnOptions,
  Stack,
  Edge,
  Alignment,
  ForEach,
  ScrollDirection,
  BarState,
  EdgeEffect,
  TextAlign,
  ICurve,
  Flex,
  FlexDirection,
  ItemAlign,
  FlexAlign,
  FontWeight,
  Button,
  ButtonType,
  ClickEvent,
  ScrollState,
  ScrollSource
} from '@ohos.arkui.component'
import router from '@ohos.router';
import Curves from '@ohos.curves'
import hilog from '@ohos.hilog';

@Entry
@Component
struct Index {
  aboutToAppear() {
    hilog.isLoggable(0x0000, 'testTag', hilog.LogLevel.INFO);
    hilog.info(0x0000, 'testTag', '%{public}s', 'TestAbility index aboutToAppear');
    hilog.isLoggable(0x0000, 'testTag', hilog.LogLevel.INFO);
    hilog.info(0x0000, 'testTag', '%{public}s', 'start run testcase!!!');
  }

  scroller: Scroller = new Scroller()
  private arr: Array<number> =
    new Array<number>(0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26,
      27, 28, 29, 30)

  build() {
    Stack({ alignContent: Alignment.TopStart }) {
      Scroll(this.scroller) {
        Column() {
          ForEach(this.arr, (item: number, index: int) => {
            Text(item.toString())
              .width('90%')
              .height(150)
              .backgroundColor(0xFFFFFF)
              .borderRadius(15)
              .fontSize(16)
              .textAlign(TextAlign.Center)
              .margin({ top: 10 } as Margin)
          }, (item: number) => item.toString())
        }.width('100%')
      }
      .key("ArkUX_Scroll_Visual_0010")
      .scrollable(ScrollDirection.Vertical)
      .scrollBar(BarState.On)
      .scrollBarColor(Color.Orange)
      .scrollBarWidth(10)
      .friction(0.6)
      .edgeEffect(EdgeEffect.None)
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
        .onClick((e: ClickEvent) => {
          this.scroller.scrollBy(0, 150)
        })
        .margin({ top: 10, left: 20 } as Margin)
      Button('scroll 100')
        .height('5%')
        .onClick((e: ClickEvent) => {
          const yOffset: number = this.scroller.currentOffset()!.yOffset;
          this.scroller.scrollTo({ xOffset: 0, yOffset: yOffset + 100 })
        })
        .margin({ top: 60, left: 20 } as Margin)
      Button('scroll 100')
        .height('5%')
        .onClick((e: ClickEvent) => {
          let curve = Curves.interpolatingSpring(100, 1, 228, 30) as ICurve
          const yOffset: number = this.scroller.currentOffset()!.yOffset;
          this.scroller.scrollTo({ xOffset: 0, yOffset: yOffset + 100, animation: { duration: 1000, curve: curve } })
        })
        .margin({ top: 110, left: 20 } as Margin)
      Button('back top')
        .height('5%')
        .onClick((e: ClickEvent) => {
          this.scroller.scrollEdge(Edge.Top)
        })
        .margin({ top: 160, left: 20 } as Margin)
      Button('next page1')
        .height('5%')
        .onClick((e: ClickEvent) => {
          this.scroller.scrollPage({ next: false })
        })
      Button('next page2')
        .height('5%')
        .onClick((e: ClickEvent) => {
          this.scroller.scrollPage({ next: true })
        })
    }.width('100%').height('100%').backgroundColor(0xDCDCDC)
  }
}