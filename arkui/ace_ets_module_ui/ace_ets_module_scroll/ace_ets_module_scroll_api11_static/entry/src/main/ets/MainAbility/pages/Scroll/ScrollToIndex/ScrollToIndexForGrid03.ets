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
  Margin,
  Scroller,
  Scroll,
  ColumnOptions,
  ForEach,
  BarState,
  TextAlign,
  Row,
  Visibility,
  FlexWrap,
  ScrollAlign,
  Grid,
  GridItem,
  Flex,
  FlexDirection,
  FlexAlign,
  Button,
  ButtonType,
  GridLayoutOptions,
  ClickEvent,
  Position
} from '@ohos.arkui.component'
import { State } from '@ohos.arkui.stateManagement';

@Entry
@Component
struct ScrollToIndexForGrid03 {
  private scrollerForGrid: Scroller = new Scroller()
  @State numbers: string[] = ['']
  @State Number1: String[] = ['0', '1', '2', '3', '4']
  @State isSmooth: boolean = false
  layoutOptions2: GridLayoutOptions = {
    regularSize: [1, 1],
    irregularIndexes: [0, 7, 9], // 索引为0和7的GridItem占用的列数由onGetIrregularSizeByIndex指定
    onGetIrregularSizeByIndex: (index: int) => {
      if (index === 0) {
        return [1, 5] as [int, int]
      }
      return [1, index % 6 + 1] as [int, int]
    }
  } as GridLayoutOptions

  aboutToAppear() {
    for (let i = 1; i <= 169; i++) {
      this.numbers.push(i + '')
    }
  }

  build() {
    Column({ space: 5 } as ColumnOptions) {
      Text('have smooth...')
        .fontSize(16)
        .width('95%')
        .height(30)
        .backgroundColor(Color.Orange)
        .textAlign(TextAlign.Center)
        .visibility(this.isSmooth ? Visibility.Visible : Visibility.None)
        .id('isHaveSmooth_Grid03')
        .position({ x: 12, y: 20 } as Position)
      Column() {
        Flex({
          direction: FlexDirection.Row,
          wrap: FlexWrap.Wrap,
          justifyContent: FlexAlign.SpaceBetween
        }) { // 子组件在容器主轴上行布局
          Button('10-true-end', { type: ButtonType.Normal, stateEffect: true })
            .width('35%')
            .height('5%')
            .borderRadius(8)
            .backgroundColor(0x317aff)
            .onClick((e: ClickEvent) => {
              this.isSmooth = false
              const yOffsetStart: number = this.scrollerForGrid.currentOffset()!.yOffset;
              this.scrollerForGrid.scrollToIndex(10, true, ScrollAlign.END)
              setTimeout(() => {
                const yOffsetEnd: number = this.scrollerForGrid.currentOffset()!.yOffset;
                console.info('yOffsetStart==>' + yOffsetStart + 'yOffsetEnd==>' + yOffsetEnd)
                this.isSmooth = (yOffsetStart == yOffsetEnd) ? false : true;
                console.info(this.isSmooth + 'isSmooth')
              }, 1000)
            })
            .margin(10)
          Button('98-true-Start', { type: ButtonType.Normal, stateEffect: true })
            .width('35%')
            .height('5%')
            .borderRadius(8)
            .backgroundColor(0x317aff)
            .onClick((e: ClickEvent) => {
              this.isSmooth = false
              const yOffsetStart: number = this.scrollerForGrid.currentOffset()!.yOffset;
              this.scrollerForGrid.scrollToIndex(98, true, ScrollAlign.START)
              setTimeout(() => {
                const yOffsetEnd: number = this.scrollerForGrid.currentOffset()!.yOffset;
                console.info('yOffsetStart==>' + yOffsetStart + 'yOffsetEnd==>' + yOffsetEnd)
                this.isSmooth = (yOffsetStart == yOffsetEnd) ? false : true;
                console.info(this.isSmooth + 'isSmooth')
              }, 1000)
            })
            .margin(10)
          Button('128-true-end', { type: ButtonType.Normal, stateEffect: true })
            .width('35%')
            .height('5%')
            .borderRadius(8)
            .backgroundColor(0x317aff)
            .onClick((e: ClickEvent) => {
              this.isSmooth = false
              const yOffsetStart: number = this.scrollerForGrid.currentOffset()!.yOffset;
              this.scrollerForGrid.scrollToIndex(128, true, ScrollAlign.END)
              setTimeout(() => {
                const yOffsetEnd: number = this.scrollerForGrid.currentOffset()!.yOffset;
                console.info('yOffsetStart==>' + yOffsetStart + 'yOffsetEnd==>' + yOffsetEnd)
                this.isSmooth = (yOffsetStart == yOffsetEnd) ? false : true;
                console.info(this.isSmooth + 'isSmooth')
              }, 1000)

            })
            .margin(10)
          Button('22-false-center', { type: ButtonType.Normal, stateEffect: true })
            .width('35%')
            .height('5%')
            .borderRadius(8)
            .backgroundColor(0x317aff)
            .onClick((e: ClickEvent) => {
              this.isSmooth = false
              this.scrollerForGrid.scrollToIndex(22, false, ScrollAlign.CENTER)
            })
            .margin(10)
        }
      }

      Text('scroll')
        .fontColor(0xCCCCCC)
        .fontSize(9).width('90%')
      // 不使用scroll，需要undefined占位
      Grid(this.scrollerForGrid, this.layoutOptions2) {
        ForEach(this.numbers, (day: string) => {
          GridItem() {
            Text(day)
              .fontSize(16)
              .backgroundColor(0xF9CF93)
              .width('100%')
              .height('20%')
              .textAlign(TextAlign.Center)
          }.id('gridIndex03_' + day)
        }, (day: string) => day)
      }
      .columnsTemplate('1fr 1fr 1fr 1fr 1fr')
      .columnsGap(10)
      .rowsGap(10)
      .scrollBar(BarState.Off)
      .width('90%')
      .backgroundColor(0xFAEEE0)
      .height('60%')
      .id("GridID_Grid03")

    }.width('100%').margin({ top: 5 } as Margin)

  }
}