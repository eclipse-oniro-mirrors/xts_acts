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
  Column,
  ColumnOptions,
  Component,
  Entry,
  ForEach,
  Grid,
  GridItem,
  GridLayoutOptions,
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
struct irregularGridAnimationExample {
  @State numbers: String[] = ['0', '1', '2', '3', '4']
  scroller: Scroller = new Scroller()
  @State onText: string = 'Grid: '
  layoutOptions1: GridLayoutOptions = {
    regularSize: [1, 1],
    irregularIndexes: [0, 7], // 索引为0和7的GridItem占用的列数由onGetIrregularSizeByIndex指定
    onGetIrregularSizeByIndex: (index: Int) => {
      if (index === 0) {
        return [1, 5] as [Int, Int]
      }
      return [1, index % 6 + 1] as [Int, Int]
    }
  } as GridLayoutOptions

  build() {
    Column({ space: 5 } as ColumnOptions) {
      Text('' + this.onText)
        .id('irGrid_true_onText')
        .width('90%')

      Button('next page true')
        .id('irGrid_next_animation_true')
        .onClick((e: ClickEvent) => { // 点击后滑到下一页
          this.scroller.scrollPage({ next: true, animation: true })
        })
      Grid(this.scroller, this.layoutOptions1) {
        ForEach(this.numbers, (day: string) => {
          ForEach(this.numbers, (day: string) => {
            GridItem() {
              Text(day)
                .fontSize(16)
                .backgroundColor(0xF9CF93)
                .width('100%')
                .height(80)
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
      .scrollBar(BarState.Off)
      .backgroundColor(0xFAEEE0)
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
        console.info('animation' + 'Grid onScrollStart')
      })
      .onScrollStop(() => {
        this.onText += 'onScrollStop'
        console.info('animation' + 'Grid onScrollStop')
      })

    }.width('100%')
    .height('100%')
    .margin({ top: 5 } as Margin)
  }
}