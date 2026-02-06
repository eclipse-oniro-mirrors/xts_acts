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
  Component,
  Column,
  Scroller,
  ColumnOptions,
  Button,
  GridItem,
  TextAlign,
  ComputedBarAttribute,
  ClickEvent,
  Grid,
  Text,
  Margin,
  ForEach,
  NestedScrollMode,
  EdgeEffect
} from '@ohos.arkui.component'
import { State } from '@ohos.arkui.stateManagement';

@Entry
@Component
struct GridExampleAdd {
  @State Number1: String[] = ['0', '1', '2', '3', '4']
  scroller: Scroller = new Scroller()

  build() {
    Column({ space: 5 } as ColumnOptions) {
      Button('next page')
        .height('8%')
        .onClick((e: ClickEvent) => { // 点击后滑到下一页
          this.scroller.scrollPage({ next: true })
        }).key('nexpageAdd')
      Grid() {
        ForEach(this.Number1, (day: string) => {
          ForEach(this.Number1, (day: string) => {
            GridItem() {
              Text(day)
                .fontSize(16)
                .backgroundColor(0xF9CF93)
                .width('100%')
                .height('100%')
                .textAlign(TextAlign.Center)
            }
          }, (day: string) => day)
        }, (day: string) => day)
      }
      .columnsTemplate('1fr 1fr 1fr 1fr 1fr')
      .rowsTemplate('1fr 1fr 1fr 1fr 1fr')
      .columnsGap(10)
      .rowsGap(10)
      .width('90%')
      .backgroundColor(0xFAEEE0)
      .height('20%')

      Text('scroll').fontColor(0xCCCCCC).fontSize(9).width('90%')
      Grid(this.scroller, {
        regularSize: [12, 12], irregularIndexes: [10, 5, 7], onGetIrregularSizeByIndex: (index: int) => {
          return [index, index] as [int, int]
        }
      }) {
        ForEach(this.Number1, (day: string, index: int) => {
          ForEach(this.Number1, (day: string, index: int) => {
            GridItem() {
              Text(day)
                .fontSize(16)
                .backgroundColor(0xF9CF93)
                .width('100%')
                .height('20%')
                .key('' + (index + 1) * (index + 1))
                .textAlign(TextAlign.Center)
            }
          }, (day: string) => day)
        })
      }
      .columnsTemplate('1fr 1fr 1fr 1fr 1fr')
      .columnsGap(10)
      .rowsGap(10)
      .enableScrollInteraction(true)
      .nestedScroll({
        scrollForward: NestedScrollMode.PARENT_FIRST,
        scrollBackward: NestedScrollMode.SELF_FIRST
      })
      .edgeEffect(EdgeEffect.Spring)

      .onScrollIndex((first: int): void => {
        console.info(first.toString())
      })
      .onScrollBarUpdate((index: int, offset: number) => {
        return {
          totalOffset: (index / 5) * (80 + 10) - 10 - offset,
          totalLength: 80 * 5 + 10 * 4
        } as ComputedBarAttribute
      })
      .width('90%')
      .backgroundColor(0xFAEEE0)
      .height('50%')
    }.width('100%').margin({ top: 5 } as Margin)
  }
}