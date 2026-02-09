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
  $rawfile,
  BarState,
  Color,
  Column,
  ColumnOptions,
  Component,
  CopyOptions,
  CustomBuilder,
  DragItemInfo,
  Edge,
  Entry,
  Flex,
  FlexAlign,
  FlexDirection,
  ForEach,
  ItemAlign,
  Margin,
  Padding,
  Row,
  Scroll,
  ScrollDirection,
  Scroller,
  Text,
  TextAlign,
  TextArea,
  TouchType,
  Visibility,
} from '@ohos.arkui.component'
import { AppStorage, State } from '@ohos.arkui.stateManagement'
import { Router, UIContext } from '@ohos.arkui.UIContext';

@Entry
@Component
struct ScrollExample {
  scroller: Scroller = new Scroller()
  @State testTextStr: string = "test"
  @State testRowStr: string = "test"
  private arr: Array<number> = new Array<number>(0, 1, 2, 3, 4, 5, 6, 7, 8, 9)

  build() {
    Column() {
      Column() {
        Text(this.testTextStr)
          .fontSize(20)

        Text(this.testRowStr)
          .fontSize(20)
      }
      .height(100)
      .backgroundColor(Color.Gray)
      .opacity(0.3)

      Scroll(this.scroller) {
        Column() {
          Text("Test Text Visible Change")
            .fontSize(20)
            .height(200)
            .margin({ top: 50, bottom: 20 } as Margin)
            .backgroundColor(Color.Green)// 通过设置ratios为[0.0, 1.0]，实现当组件完全显示或完全消失在屏幕中时触发回调
            .onVisibleAreaChange([0.0, 1.0], (isVisible: boolean, currentRatio: number): void => {
              console.info("Test Text isVisible: " + isVisible + ", currentRatio:" + currentRatio)
              if (isVisible && currentRatio >= 1.0) {
                console.info("Test Text is fully visible. currentRatio:" + currentRatio)
                this.testTextStr = "Test Text is fully visible"
              }

              if (!isVisible && currentRatio <= 0.0) {
                console.info("Test Text is completely invisible.")
                this.testTextStr = "Test Text is completely invisible"
              }
            })

          Row() {
            Text("Test Row Visible  Change")
              .fontSize(20)
              .margin({ bottom: 20 } as Margin)

          }
          .height(200)
          .backgroundColor(Color.Yellow)
          .onVisibleAreaChange([0.0, 1.0], (isVisible: boolean, currentRatio: number): void => {
            console.info("Test Row isVisible:" + isVisible + ", currentRatio:" + currentRatio)
            if (isVisible && currentRatio >= 1.0) {
              console.info("Test Row is fully visible.")
              this.testRowStr = "Test Row is fully visible"
            }

            if (!isVisible && currentRatio <= 0.0) {
              console.info("Test Row is is completely invisible.")
              this.testRowStr = "Test Row is is completely invisible"
            }
          })

          ForEach(this.arr, (item: number, index: Int): void => {
            Text(String(item))
              .width('90%')
              .height(150)
              .backgroundColor(0xFFFFFF)
              .borderRadius(15)
              .fontSize(16)
              .textAlign(TextAlign.Center)
              .margin({ top: 10 } as Margin)
          }, (item: number): string => String(item))

        }.width('100%')
      }
      .backgroundColor(0x317aff)
      .scrollable(ScrollDirection.Vertical)
      .scrollBar(BarState.On)
      .scrollBarColor(Color.Gray)
      .scrollBarWidth(30)
      .onDidScroll((xOffset: number, yOffset: number) => {
        console.info(xOffset + ' ' + yOffset)
      })
      .onScrollEdge((side: Edge): void => {
        console.info('To the edge')
      })
      .onScrollStop((): void => {
        console.info('Scroll Stop')
      })

    }.width('100%').height('100%').backgroundColor(0xDCDCDC)
  }
}