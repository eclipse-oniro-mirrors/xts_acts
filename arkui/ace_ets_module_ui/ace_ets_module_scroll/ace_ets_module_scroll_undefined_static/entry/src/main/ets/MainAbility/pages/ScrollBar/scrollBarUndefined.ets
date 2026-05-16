'use static'
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
  Entry, Text, Column, Row, Component, Button, ClickEvent, Scroller, Scroll, ForEach, TextAlign,
  Margin, Color, ScrollBar
} from '@ohos.arkui.component'
import { State } from '@ohos.arkui.stateManagement'

@Entry
@Component
struct ScrollBar1 {
  scroller: Scroller = new Scroller();
  private arr: Array<number> = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15];
  @State isEnableNestedScroll: boolean = false;

  build() {
    Column() {
      Column() {
        Text('Scroll')
          .height('30%')
        Scroll(this.scroller) {
          Column() {
            ForEach(this.arr, (item: number) => {
              Text('Item ' + item)
                .width('90%')
                .height(20)
                .backgroundColor(0xFFFFFF)
                .borderRadius(10)
                .fontSize(16)
                .textAlign(TextAlign.Center)
                .margin({ top: 10 } as Margin)
            })
          }
        }
        .width('80%')
        .height('70%')

        ScrollBar({ scroller: this.scroller})
          .id('scrollBar_action')
          .enableNestedScroll(this.isEnableNestedScroll ? true : undefined)
      }
      .width('100%')
      .height('30%')

      Row() {
        Button('0' + this.isEnableNestedScroll).onClick((event: ClickEvent) => {
          this.isEnableNestedScroll = !this.isEnableNestedScroll;
        }).margin(5).id('enableNestedScroll_action')
      }
    }
    .width('100%')
    .height('100%')
  }
}