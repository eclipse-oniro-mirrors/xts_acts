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
  Column,
  Component,
  Button,
  ClickEvent,
  Scroller,
  Scroll,
  ForEach,
  Search,
  Color,
  EdgeEffect,
  ColumnOptions,
  Grid,
  GridItem,
  Stack,
  Margin,
  TextAlign,
  Alignment,
  ScrollBar,
  BarState,
  ScrollBarDirection
} from '@ohos.arkui.component'
import { State, AppStorage } from '@ohos.arkui.stateManagement'
@Entry
@Component
struct scrollPage {
  @State Number1: string[] = ['0', '1'];
  scroller: Scroller = new Scroller();

  build() {
    Column({ space: 5 } as ColumnOptions) {
      Grid(this.scroller) {
        ForEach(this.Number1, (day: string) => {
          GridItem() {
            Text(day)
              .fontSize(16)
              .backgroundColor(0xF9CF93)
              .width('100%')
              .height(80)
              .textAlign(TextAlign.Center)
              .key('scrollPage_text' + day)
          }
        }, (day: string) => day)
      }
      .key('gridPage')
      .columnsTemplate('1fr')
      .friction(0.6)
      .edgeEffect(EdgeEffect.Spring)
      .scrollBar(BarState.On)
      .onScrollIndex((first: int,last: int):void => {
        console.info(first.toString())
      })
      .onScrollBarUpdate((index: int, offset: number) => {
        return { totalOffset: (index / 5) * (80 + 10) - offset, totalLength: 80 * 5 + 10 * 4 }
      })
      .width('90%')
      .backgroundColor(0xFAEEE0)
      .height(80)

      Button('next page')
        .height('5%')
        .id('scrollPage1')
        .onClick((e:ClickEvent) => { 
          this.scroller.scrollPage({ next: true })
        })


      Button('next false')
        .height('5%')
        .id('scrollPage2')
        .onClick((e:ClickEvent) => {
          this.scroller.scrollPage({ next: false })
        })
    }.width('100%').margin({ top: 5 } as Margin)
  }
}