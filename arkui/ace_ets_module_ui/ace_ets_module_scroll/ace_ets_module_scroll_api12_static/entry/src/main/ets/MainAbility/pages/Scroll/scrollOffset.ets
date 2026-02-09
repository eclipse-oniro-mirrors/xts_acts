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
  Column,
  Component,
  Text,
  List,
  ForEach,
  ListItem,
  TextAlign,
  Axis,
  Button,
  ScrollSource,
  ScrollDirection,
  EdgeEffect,
  ColumnOptions,
  ClickEvent,
  Edge,
  Stack,
  Alignment,
  ScrollState,
  OffsetResult,
  Margin,
  BarState,
  Color,
  ScrollAlign,
  ClickEvent,
  Scroller,
  Scroll,
  ICurve,
  Padding
} from '@ohos.arkui.component'
import { State } from '@ohos.arkui.stateManagement'

import Curves from '@ohos.curves'

@Entry
@Component
struct scrollOffsetExample {
  scroller: Scroller = new Scroller;
  private arr: number[] = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15] as number[]
  @State message1: string = 'scroll1'
  @State message2: string = 'scroll2'

  build() {
    Column() {
      Text(this.message1).id('scroll_mess1')
      Text(this.message2).id('scroll_mess2')
      Button('scroll 100').id('canOver_scroll')
        .onClick((e: ClickEvent) => { // 点击后滑动到指定位置，即下滑100.0vp的距离，滑动过程配置有动画
          let curve = Curves.interpolatingSpring(10, 1, 228, 30) //创建一个阶梯曲线
          const yOffset: number = this.scroller.currentOffset()!.yOffset;
          this.scroller.scrollTo({
            xOffset: 0,
            yOffset: yOffset + 100,
            animation: {
              duration: 1000,
              curve: curve,
              canOverScroll: true
            }
          })
        })
      Scroll(this.scroller) {
        Column() {
          ForEach(this.arr, (item: number) => {
            Text(item.toString())
              .width('90%')
              .height(80)
              .fontSize(16)
              .textAlign(TextAlign.Center)
              .borderRadius(10)
              .backgroundColor(0xFFFFFF)
          }, (item: number) => item.toString())
        }.width('100%')
      }
      .id('Scroll_Offset')
      .height('60%')
      .scrollable(ScrollDirection.Vertical)
      .scrollBar(BarState.On)
      .scrollBarColor(Color.Gray)
      .scrollBarWidth(10)
      .initialOffset({
        xOffset: 0, yOffset: 250
      })
      .onWillScroll((xOffset: number, yOffset: number, scrollState: ScrollState,
        scrollSource: ScrollSource): undefined | OffsetResult => {
        this.message1 = 'onWillScroll'
      })
      .onDidScroll((): void => {
        this.message2 = 'onDidScroll'
      })
    }
    .width('100%')
    .height('100%')
    .backgroundColor(0xDCDCDC)
    .padding({ top: 5 } as Padding)
  }
}