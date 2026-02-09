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
  Row,
  Position,
  Visibility,
  FlexWrap,
  ScrollAlign,
  Grid,
  GridItem,
  Flex,
  FlexDirection,
  ItemAlign,
  FlexAlign,
  FontWeight,
  Button,
  ButtonType,
  ClickEvent
} from '@ohos.arkui.component'
import { State } from '@ohos.arkui.stateManagement';
import router from '@ohos.router'
import { AppStorage } from '@ohos.arkui.stateManagement';
import { Router } from '@ohos.arkui.UIContext';

@Entry
@Component
struct ScrollToIndexForGrid02 {
  @State numbers: Array<string> = new Array<string>()
  private scrollerForGrid: Scroller = new Scroller()
  private scrollerItemForGrid: Scroller = new Scroller()
  @State moreItem: boolean = false
  @State isSmooth: boolean = false

  aboutToAppear() {
    for (let i = 0; i <= 199; i++) {
      this.numbers.push(i + '')
    }
  }

  build() {
    Flex() {
      Column() {
        Text('have smooth...')
          .fontSize(16)
          .width('95%')
          .height(20)
          .backgroundColor(Color.Orange)
          .textAlign(TextAlign.Center)
          .visibility(this.isSmooth ? Visibility.Visible : Visibility.None)
          .id('isHaveSmooth_Grid02')
          .position({ x: 12, y: 10 } as Position)
        Column() {
          Flex({
            direction: FlexDirection.Row,
            wrap: FlexWrap.Wrap,
            justifyContent: FlexAlign.SpaceBetween
          }) { // 子组件在容器主轴上行布局
            Button('grid-66-true-center', { type: ButtonType.Normal, stateEffect: true })
              .width('30%')
              .height('5%')
              .borderRadius(8)
              .backgroundColor(0x317aff)
              .onClick((e: ClickEvent) => {

                this.isSmooth = false
                this.scrollerForGrid.scrollToIndex(66, true, ScrollAlign.CENTER)
              })
              .margin(5)
            Button('item-66-true-start', { type: ButtonType.Normal, stateEffect: true })
              .width('30%')
              .height('5%')
              .borderRadius(8)
              .backgroundColor(0x317aff)
              .onClick((e: ClickEvent) => {
                this.isSmooth = false
                const yOffsetStart: number = this.scrollerItemForGrid.currentOffset()!.yOffset;
                this.scrollerItemForGrid.scrollToIndex(66, true, ScrollAlign.START)
                setTimeout(() => {
                  const yOffsetEnd: number = this.scrollerItemForGrid.currentOffset()!.yOffset;
                  console.info('yOffsetStart==>' + yOffsetStart + 'yOffsetEnd==>' + yOffsetEnd)
                  this.isSmooth = (yOffsetStart == yOffsetEnd) ? false : true;
                  console.info(this.isSmooth + 'isSmooth')
                }, 1000)
              })
              .margin(5)
            Button('item-99-false-start', { type: ButtonType.Normal, stateEffect: true })
              .width('30%')
              .height('5%')
              .borderRadius(8)
              .backgroundColor(0x317aff)
              .onClick((e: ClickEvent) => {
                this.isSmooth = false
                this.scrollerItemForGrid.scrollToIndex(99, false, ScrollAlign.START)
              })
              .margin(5)
            Button('item-178-true-start', { type: ButtonType.Normal, stateEffect: true })
              .width('30%')
              .height('5%')
              .borderRadius(8)
              .backgroundColor(0x317aff)
              .onClick((e: ClickEvent) => {
                this.isSmooth = false
                const yOffsetStart: number = this.scrollerItemForGrid.currentOffset()!.yOffset;
                this.scrollerItemForGrid.scrollToIndex(178, true, ScrollAlign.START)
                setTimeout(() => {
                  const yOffsetEnd: number = this.scrollerItemForGrid.currentOffset()!.yOffset;
                  console.info('yOffsetStart==>' + yOffsetStart + 'yOffsetEnd==>' + yOffsetEnd)
                  this.isSmooth = (yOffsetStart == yOffsetEnd) ? false : true;
                  console.info(this.isSmooth + 'isSmooth')
                }, 1000)
              })
              .margin(5)
            Button('item-22-true-end', { type: ButtonType.Normal, stateEffect: true })
              .width('30%')
              .height('5%')
              .borderRadius(8)
              .backgroundColor(0x317aff)
              .onClick((e: ClickEvent) => {
                this.isSmooth = false
                this.scrollerItemForGrid.scrollToIndex(22, true, ScrollAlign.END)
              })
              .margin(5)
            Button('item-108-false-end', { type: ButtonType.Normal, stateEffect: true })
              .width('30%')
              .height('5%')
              .borderRadius(8)
              .backgroundColor(0x317aff)
              .onClick((e: ClickEvent) => {
                this.isSmooth = false
                this.scrollerItemForGrid.scrollToIndex(108, false, ScrollAlign.END)
              })
              .margin(5)
            Button('item-100-false-center', { type: ButtonType.Normal, stateEffect: true })
              .width('30%')
              .height('5%')
              .borderRadius(8)
              .backgroundColor(0x317aff)
              .onClick((e: ClickEvent) => {
                this.isSmooth = false
                this.scrollerItemForGrid.scrollToIndex(100, false, ScrollAlign.CENTER)
              })
              .margin(5)
            Button('moreColumns', { type: ButtonType.Normal, stateEffect: true })
              .width('30%')
              .height('5%')
              .borderRadius(8)
              .backgroundColor(Color.Gray)
              .onClick((e: ClickEvent) => {
                this.isSmooth = false
                this.scrollerItemForGrid.scrollToIndex(0, false)
                this.moreItem = !this.moreItem
              })
              .margin(5)
          }
        }

        Grid(this.scrollerForGrid) {
          ForEach(this.numbers, (day: string) => {
            if (day == '66') {
              GridItem() {
                Grid(this.scrollerItemForGrid) {
                  ForEach(this.numbers, (day: string) => {
                    GridItem() {
                      Text(day)
                        .fontSize(16)
                        .backgroundColor(0xF5CF53)
                        .width('90%')
                        .height('10%')
                        .textAlign(TextAlign.Center)
                    }.id('gridIndex02_' + day)
                  })
                }
                .columnsTemplate(!this.moreItem ? "1fr 1fr 1fr" : "1fr 1fr 1fr 1fr")
                .columnsGap(10)
                .rowsGap(10)
                .cachedCount(0)
                .width('95%')
                .backgroundColor(0xFAEEE0)
                .height('20%')
                .margin({
                  top: 5,
                  bottom: 5
                } as Margin)
                .id("GridID_Grid02")
              }
            } else {
              GridItem() {
                Text(day)
                  .fontSize(16)
                  .backgroundColor(0xF9CF93)
                  .width('95%')
                  .height(120)
                  .textAlign(TextAlign.Center)
              }
            }
          })
        }
        .columnsTemplate("1fr 1fr")
        .columnsGap(10)
        .rowsGap(10)
        .width('95%')
        .backgroundColor(0xFAEEE0)
        .height('60%')
        .margin({
          top: 20,
          bottom: 20
        } as Margin)

        Column() {
          Flex({ justifyContent: FlexAlign.SpaceBetween }) {
            Button('next page', { type: ButtonType.Normal, stateEffect: true })
              .borderRadius(8)
              .backgroundColor(0x317aff)
              .width(150)
              .height(30)
              .onClick((e: ClickEvent) => {
                const routerScroll = AppStorage.get<Router>("router") as Router
                routerScroll.pushUrl({ url: 'pages/GridDome01' })
              })
            Button('go back', { type: ButtonType.Normal, stateEffect: true })
              .borderRadius(8)
              .backgroundColor(0x317aff)
              .width(150)
              .height(30)
              .onClick((e: ClickEvent) => {
                const routerScroll = AppStorage.get<Router>("router") as Router
                routerScroll.back()
              })
          }
        }

      }
    }.width('100%').height('100%').backgroundColor(0xDCDCDC)
    .padding(20)
  }
}