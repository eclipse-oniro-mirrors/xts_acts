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

@Entry
@Component
struct scrollReachExample {
  scroller: Scroller = new Scroller();
  private arr: Array<number> = new Array<number>(0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12)
  @State onReachStartText: string = 'onReachStart'
  @State onReachEndText: string = 'onReachEnd'
  @State onText: string = 'onScrollEdge'

  build() {
    Column() {
      Text(this.onReachStartText)
        .id('scroll_reachStart')
      Text(this.onReachEndText)
        .id('scroll_reachEnd')
      Text(this.onText)
        .id('scroll_edge')

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
      .id('Scroll_Reach')
      .height('60%')
      .scrollable(ScrollDirection.Vertical)
      .scrollBar(BarState.On)
      .scrollBarColor(Color.Gray)
      .scrollBarWidth(10)
      .onWillScroll((xOffset: number, yOffset: number, scrollState: ScrollState,
        scrollSource: ScrollSource): undefined | OffsetResult => {
        console.info('onWillScroll !')
      })
      .onDidScroll((): void => {
        console.info('onDidScroll !')
      })
      .onScrollEdge((side: Edge): void => {
        this.onText = 'onScrollEdge:succ'
        console.info('To the edge')
      })
      .onReachStart(() => {
        this.onReachStartText = 'onReachStart:succ'
        console.info('onReachStart !')
      })
      .onReachEnd(() => {
        this.onReachEndText = 'onReachEnd:succ'
        console.info('onReachEnd !')
      })

      Button('scroll Bottom')
        .id('scrollEdge_btn')
        .onClick((e: ClickEvent) => { // 滑动到底部
          console.log('scrollTo Bottom')
          this.scroller.scrollEdge(Edge.Bottom, { velocity: 700 })
        })
    }
    .width('100%')
    .height('100%')
    .backgroundColor(0xDCDCDC)
    .padding({ top: 5 } as Padding)
  }
}