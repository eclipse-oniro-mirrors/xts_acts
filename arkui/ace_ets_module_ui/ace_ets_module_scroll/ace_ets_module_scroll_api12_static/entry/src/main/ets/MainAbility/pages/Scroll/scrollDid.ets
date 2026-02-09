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
  ScrollSource,
  ScrollState,
  ScrollResult,
  Margin,
  Edge,
  ScrollDirection,
  Axis,
  BarState,
  EdgeEffect,
  VisibleListContentInfo,
  Padding,
  Scroller,
  Flex,
  Scroll,
  Color,
  OffsetResult
} from '@ohos.arkui.component'
import { State } from '@ohos.arkui.stateManagement'

@Entry
@Component
struct ScrollDidExample {
  scroller: Scroller = new Scroller()
  private arr: Array<number> = new Array<number>(0, 1, 2, 3, 4, 5, 6, 7, 8, 9)
  @State tempOffset: number = 1;

  build() {
    Column() {
      Text('scrollState: ' + this.tempOffset)
        .id('scroll_onDidScroll')

      Scroll(this.scroller) {
        Column() {
          ForEach(this.arr, (item: number) => {
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
      .id('scrollSource_scroll')
      .onDidScroll((xOffset: number, yOffset: number, scrollState: ScrollState):void => {
        console.info(`onDidScroll scrollState = ${scrollState[scrollState]}, offset = ${yOffset}`)
        this.tempOffset = scrollState
        if (scrollState == ScrollState.Idle) {
          console.info('ScrollState.Idle: ' + this.tempOffset)
        }
      })
      .height('60%')
      .scrollable(ScrollDirection.Vertical)
      .scrollBar(BarState.On)
      .scrollBarColor(Color.Gray)
      .scrollBarWidth(10)
      // .friction(0.6)
      .edgeEffect(EdgeEffect.None)
      .onWillScroll((xOffset: number, yOffset: number, scrollState: ScrollState,
        scrollSource: ScrollSource): undefined | OffsetResult => {
        console.info('xOffset: ' + xOffset + ' ' + 'yOffset: ' + yOffset)
        console.info('scrollState: ' + scrollState)
      })
      .onScrollEdge((side: Edge): void => {
        console.info('To the edge')
      })
      .onScrollStop(() => {
        console.info('Scroll Stop')
      })

    }.width('100%')
    .height('100%')
    .backgroundColor(0xDCDCDC)
  }
}