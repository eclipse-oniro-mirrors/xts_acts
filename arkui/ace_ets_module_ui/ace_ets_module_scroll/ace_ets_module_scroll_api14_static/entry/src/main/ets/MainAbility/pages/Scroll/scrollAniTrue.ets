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
  BarState,
  Button,
  ClickEvent,
  Color,
  Column,
  ColumnOptions,
  Component,
  Edge,
  EdgeEffect,
  Entry,
  Flex,
  ForEach,
  Margin,
  OffsetResult,
  Scroll,
  ScrollDirection,
  Scroller,
  ScrollState,
  Text,
  TextAlign
} from '@ohos.arkui.component'
import { State } from '@ohos.arkui.stateManagement'

@Entry
@Component
struct animationScrollTrueExample {
  scroller: Scroller = new Scroller()
  private arr: Array<number> = new Array<number>(0, 1, 2, 3, 4, 5, 6)
  @State onText: string = 'Scroll: '

  build() {
    Column({ space: 5 } as ColumnOptions) {
      Text(this.onText)
        .id('scroll_true_onText')
        .width('90%')

      //scrollPage:向下带动画翻页
      Button('animation: true')
        .id('scroll_animation_true')
        .onClick((e: ClickEvent) => {
          this.scroller.scrollPage({ next: true, animation: true })
        })

      Scroll(this.scroller) {
        Column() {
          ForEach(this.arr, (item: number) => {
            Text(item.toString())
              .width('100%')
              .height('15%')
              .backgroundColor(Color.Red)
              .borderRadius(15)
              .fontSize(16)
              .textAlign(TextAlign.Center)
              .margin({ top: 10 } as Margin)
          }, (item: number) => item.toString())
        }.width('100%')
      }
      .width('90%')
      .height('40%')
      .scrollable(ScrollDirection.Vertical) // 滚动方向纵向
      .scrollBar(BarState.On) // 滚动条常驻显示
      .scrollBarColor(Color.Gray) // 滚动条颜色
      .scrollBarWidth(10) // 滚动条宽度
      .friction(0.6)
      .edgeEffect(EdgeEffect.None)
      .onWillScroll((xOffset: number, yOffset: number, scrollState: ScrollState): undefined | OffsetResult => {
        console.info(xOffset + ' ' + yOffset)
        console.info(`onWillScroll scrollState = ${scrollState[scrollState]}`)
      })
      .onDidScroll((xOffset: number, yOffset: number, scrollState: ScrollState): void => {
        console.info(`onDidScroll scrollState = ${scrollState[scrollState]}, xoffset = ${xOffset} yoffset=${yOffset}`)
        if (scrollState == ScrollState.Idle) {
          this.onText += 'onDidScroll-'
          console.info('ScrollState.Idle: ' + scrollState)
        }
      })
      .onReachStart(() => {
        this.onText += 'onReachStart-'
        console.info('onReachStart !')
      })
      .onReachEnd(() => {
        this.onText += 'onReachEnd-'
        console.info('onReachEnd !')
      })
      .onScrollStart(() => {
        this.onText += 'onScrollStart-'
        console.info('onReachStart !')
      })
      .onScrollStop(() => {
        this.onText += 'onScrollStop'
        console.info('onReachEnd !')
      })

    }
    .width('100%')
    .height('100%')
    .backgroundColor(Color.Gray)
  }
}