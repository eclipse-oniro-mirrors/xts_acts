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
  BarState,
  Color,
  ScrollAlign,
  ClickEvent,
  Scroller,
  Scroll
} from '@ohos.arkui.component'
import { LengthMetrics } from '@ohos.arkui.node'

@Entry
@Component
struct ScrollApi1 {
  private arr: Array<number> = new Array<number>(0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10)
  private scrollerForScroll: Scroller = new Scroller()
  private scrollerForList: Scroller = new Scroller()

  build() {
    Column() {
      Button('scrollToIndex').onClick((e: ClickEvent) => {
        this.scrollerForList.scrollToIndex(
          1, false, ScrollAlign.START, { extraOffset: LengthMetrics.vp(0) }
        )
      }).height(20).id('ScrollApi1_btn')
      Scroll(this.scrollerForScroll) {
        Column() {
          List({ space: 20, scroller: this.scrollerForList }) {
            ForEach(this.arr, (item: number) => {
              ListItem() {
                Text("ListItem" + item)
                  .width("100%")
                  .height("100%")
                  .borderRadius(15)
                  .fontSize(16)
                  .fontColor(Color.White)
                  .textAlign(TextAlign.Center)
                  .backgroundColor(Color.Gray)
                  .id('ScrollApi1_listItem' + item)
              }.width("100%").height(100)
            }, (item: number) => item.toString())
          }
          .width("100%")
          .height("50%")
          .id('ScrollApi1_Scroll')
        }
      }
      .width("100%").height("100%")
    }
  }
}