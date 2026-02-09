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
  EdgeEffect,
  Entry,
  ForEach,
  Grid,
  GridItem,
  Margin,
  Scroller,
  ScrollSource,
  ScrollState,
  Text,
  TextAlign
} from '@ohos.arkui.component'
import { State } from '@ohos.arkui.stateManagement';

@Entry
@Component
struct gridNextAnimationTrueExample {
  @State numbers: String[] = ['0', '1', '2', '3', '4']
  scroller: Scroller = new Scroller()
  @State gridPosition: number = 0 //0代表滚动到grid顶部，1代表中间值，2代表滚动到grid底部。
  @State onText: string = 'Grid: '
  @State nextBln: boolean = false

  build() {
    Column({ space: 5 } as ColumnOptions) {
      Text('' + this.onText)
        .id('grid_true_onText')
        .width('90%')

      Button('next page true')
        .id('grid_next_animation_true')
        .onClick((e: ClickEvent) => { // 点击后滑到下一页
          this.nextBln = true
          this.scroller.scrollPage({ next: this.nextBln, animation: true })
        })
      Grid(this.scroller) {
        ForEach(this.numbers, (day: string) => {
          ForEach(this.numbers, (day: string) => {
            GridItem() {
              Text(day)
                .fontSize(16)
                .backgroundColor(0xF9CF93)
                .width('100%')
                .height('30%')
                .textAlign(TextAlign.Center)
            }
          }, (day: string) => day)
        }, (day: string) => day)
      }
      .width('90%')
      .height('40%')
      .columnsTemplate('1fr 1fr 1fr 1fr 1fr')
      .columnsGap(10)
      .rowsGap(10)
      .friction(0.6)
      .enableScrollInteraction(true)
      .supportAnimation(false)
      .multiSelectable(false)
      .edgeEffect(EdgeEffect.Spring)
      .scrollBar(BarState.On)
      .scrollBarColor(Color.Grey)
      .scrollBarWidth(4)
      .backgroundColor(0xFAEEE0)
      .onScrollIndex((first: int, last: int) => {
        console.info(first.toString())
        console.info(last.toString())
      })
      .onWillScroll((scrollOffset: number, scrollState: ScrollState, scrollSource: ScrollSource): undefined => {
        console.info('scrollSource: ' + scrollSource)
        console.info(`onWillScroll scrollState = ${scrollState[scrollState]}, offset = ${scrollOffset}`)
        return undefined
      })
      .onDidScroll((scrollOffset: number, scrollState: ScrollState): void => {
        console.info(`onDidScroll scrollState = ${scrollState[scrollState]}, offset = ${scrollOffset}`)
        if (scrollState == ScrollState.Idle) {
          this.onText += 'onDidScroll-'
          console.info('ScrollState.Idle: ' + scrollState)
        }
      })
      .onScrollStart(() => {
        this.onText += 'onScrollStart-'
        console.info('animation' + "Grid onScrollStart")
      })
      .onScrollStop(() => {
        this.onText += 'onScrollStop'
        console.info("animation" + "Grid onScrollStop")
      })
      .onReachStart(() => {
        this.gridPosition = 0
        this.onText += 'onReachStart-'
        console.info("animation" + "Grid onReachStart")
      })
      .onReachEnd(() => {
        this.gridPosition = 2
        this.onText += 'onReachEnd-'
        console.info("animation" + "Grid onReachEnd")
      })

    }.width('100%')
    .height('100%')
    .margin({ top: 5 } as Margin)
  }
}