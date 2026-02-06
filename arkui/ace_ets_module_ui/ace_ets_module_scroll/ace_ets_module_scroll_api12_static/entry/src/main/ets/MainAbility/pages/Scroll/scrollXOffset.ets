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
  OffsetResult,
  Padding,
  ScrollDirection,
  EdgeEffect,
  ColumnOptions,
  ClickEvent,
  Edge,
  Stack,
  Alignment,
  ScrollState,
  ScrollResult,
  Margin,
  Row,
  BarState,
  Color,
  ScrollAlign,
  ClickEvent,
  Scroller,
  Scroll
} from '@ohos.arkui.component'
import { State } from '@ohos.arkui.stateManagement'

@Entry
@Component
struct scrollXOffsetExample {
  scroller: Scroller = new Scroller;
  private arr: Array<number> = new Array<number>(0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15)
  @State message1: string = 'x:0'

  build() {
    Column() {
      Text(this.message1).id('scroll_mess')
      Button('scroll x:10').id('scroll_x')
        .onClick((e: ClickEvent) => { // 点击后滑动到指定位置，即下滑100.0vp的距离，滑动过程配置有动画
          const xOffset: number = this.scroller.currentOffset()!.xOffset;
          this.scroller.scrollTo({
            xOffset: xOffset + 10,
            yOffset: 0,
            animation: {
              duration: 1000,
              canOverScroll: true
            }
          })
        })
      Scroll(this.scroller) {
        Row() {
          ForEach(this.arr, (item: number) => {
            Text(item.toString())
              .width(80)
              .height('90%')
              .fontSize(16)
              .textAlign(TextAlign.Center)
              .borderRadius(10)
              .backgroundColor(0xFFFFFF)
          }, (item: number) => item.toString())
        }.width('100%')
      }
      .id('Scroll_XOffset')
      .height('60%')
      .width('150%')
      .scrollable(ScrollDirection.Horizontal)
      .scrollBar(BarState.On)
      .scrollBarColor(Color.Gray)
      .scrollBarWidth(10)
      .onDidScroll((): void => {
        this.message1 = 'x:' + Math.round(this.scroller.currentOffset()!.xOffset)
      })
    }
    .width('100%')
    .height('100%')
    .backgroundColor(0xDCDCDC)
    .padding({ top: 5 } as Padding)
  }
}