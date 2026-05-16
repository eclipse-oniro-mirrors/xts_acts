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
  Text,
  TextAttribute,
  Column,
  Component,
  Button,
  ButtonAttribute,
  ClickEvent,
  Image,
  ImageFit,
  Scroller,
  Scroll,
  ForEach,
  Search,
  SafeAreaType,
  ScrollDirection,
  BarState,
  Color,
  EdgeEffect,
  HorizontalAlign,
  FlexAlign,
  ColumnOptions,
  Grid,
  Margin,
  GridItem,
  TextAlign,
  ComputedBarAttribute
} from '@ohos.arkui.component'
import {
  State,
  AppStorage
} from '@ohos.arkui.stateManagement'
@Entry
@Component
struct scrollTo {
  @State numberData: String[] = ['0', '1', '2', '3', '4'];
  scroller: Scroller = new Scroller();

  build() {
    Column({ space: 5 } as ColumnOptions) {
      Grid(this.scroller) {
        ForEach(this.numberData, (day: string) => {
          ForEach(this.numberData, (day: string) => {
            GridItem() {
              Text(day)
                .fontSize(16)
                .backgroundColor(0xF9CF93)
                .width('100%')
                .height(80)
                .textAlign(TextAlign.Center)
                .key('scrollTo_text' + day)
            }
          }, (day: string) => day)
        }, (day: string) => day)
      }
      .key('scrollToPages')
      .columnsTemplate('1fr')
      .columnsGap(10)
      .rowsGap(10)
      .friction(0.6)
      .edgeEffect(EdgeEffect.Spring)
      .scrollBar(BarState.On)
      .onScrollIndex((first: int,last: int):void => {
        console.info(String(first))
      })
      .onScrollBarUpdate((index: int, offset: number) => {
        return { totalOffset: (index / 5) * (80 + 10) - offset, totalLength: 80 * 5 + 10 * 4 } as ComputedBarAttribute
      })
      .width('90%')
      .backgroundColor(0xFAEEE0)
      .height(80)

      Button('scrollTo+90')
        .height('5%')
        .id('scrollTo1')
        .onClick((e:ClickEvent) => {
          const yOffset: number = this.scroller.currentOffset()!.yOffset;
          this.scroller.scrollTo({ xOffset: 0, yOffset: yOffset + 90 })
        })


      Button('scrollTo-100')
        .height('5%')
        .id('scrollTo2')
        .onClick((e:ClickEvent) => {
          const yOffset: number = this.scroller.currentOffset()!.yOffset;
          this.scroller.scrollTo({ xOffset: 0, yOffset: yOffset - 100 })
        })


      Button('scrollTo 0')
        .height('5%')
        .id('scrollTo3')
        .onClick((e:ClickEvent) => {
          const yOffset: number = this.scroller.currentOffset()!.yOffset;
          this.scroller.scrollTo({ xOffset: 0, yOffset: 0 })
        })

      Button('scrollTo 100%')
        .height('5%')
        .id('scrollTo4')
        .onClick((e:ClickEvent) => {
          this.scroller.scrollTo({ xOffset: 0, yOffset: '100%' })
        })


      Button('scrollTo 900')
        .height('5%')
        .id('scrollTo5')
        .onClick((e:ClickEvent) => {
          this.scroller.scrollTo({ xOffset: 0, yOffset: 900 })
        })

      Button('scrollTo 270')
        .height('5%')
        .id('scrollTo6')
        .onClick((e:ClickEvent) => {
          const yOffset: number = this.scroller.currentOffset()!.yOffset;
          this.scroller.scrollTo({ xOffset: 0, yOffset: 270 })
        })


      Button('scrollTo aa100%')
        .height('5%')
        .id('scrollTo7')
        .onClick((e:ClickEvent) => {
          const yOffset: number = this.scroller.currentOffset()!.yOffset;
          this.scroller.scrollTo({ xOffset: 0, yOffset: 'aa100%' as string})
        })


      Button('scrollTo aa')
        .height('5%')
        .id('scrollTo8')
        .onClick((e:ClickEvent) => {
          const yOffset: number = this.scroller.currentOffset()!.yOffset;
          this.scroller.scrollTo({ xOffset: 0, yOffset: 'aa' as string })
        })

      Button('scrollTo undefined')
        .height('5%')
        .id('scrollTo9')
        .onClick((e:ClickEvent) => {
          const yOffset: number = this.scroller.currentOffset()!.yOffset;
          this.scroller.scrollTo({ xOffset: 0, yOffset: 'undefined' })         //undefined
        })

    }.width('100%').margin({ top: 5 } as Margin)
  }
}