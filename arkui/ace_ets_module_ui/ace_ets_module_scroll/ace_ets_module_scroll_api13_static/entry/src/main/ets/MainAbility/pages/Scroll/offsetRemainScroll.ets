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

import { Entry, Column, Component, Flex, ClickEvent, Scroller, Color,OnScrollFrameBeginHandlerResult,
  Image, TextAlign, Scroll, ScrollState, ForEach, EdgeEffect,
  Text, Button, ClickEvent} from '@ohos.arkui.component'
import { State } from '@ohos.arkui.stateManagement'
@Entry
@Component
struct offsetRemainScroll {
  @State scrollPosition: number = 0;
  @State arr: Array<number> = new Array<number>()
  private scrollerForScroll: Scroller = new Scroller()

  aboutToAppear() {
    for (let i = 1;i <= 20; i++) {
      this.arr.push(i)
    }
  }
  build() {
    Column(undefined) {
      Text('scrollPosition: ' + this.scrollPosition)
        .id('scroll_offsetRemain_text')

      Text('Scroll Area')
        .width('100%')
        .height('10%')
        .backgroundColor('0X330000FF')
        .fontSize(16)
        .textAlign(TextAlign.Center)

      Scroll(this.scrollerForScroll) {
        Column(undefined) {
          ForEach(this.arr, (item: number) => {
            Text(item.toString())
              .width('90%')
              .height(100)
              .backgroundColor('0xFFFFFF')
              .borderWidth(1)
              .borderColor(Color.Black)
              .borderRadius(15)
              .fontSize(16)
              .textAlign(TextAlign.Center)
          }, (item:number) => item.toString())
        }.width('100%').backgroundColor('0xDCDCDC')
      }
      .id('scroll_offsetRemain')
      .width('100%')
      .height('60%')
      .edgeEffect(EdgeEffect.None)
      .friction(0.6)
      .onReachStart(() => {
        this.scrollPosition = 0
      })
      .onReachEnd(() => {
        this.scrollPosition = 2
      })
      .onScrollFrameBegin((offset: number, scrollState: ScrollState): OnScrollFrameBeginHandlerResult => {
        if ((this.scrollPosition == 0 && offset <= 0) || (this.scrollPosition == 2 && offset >= 0)) {
          this.scrollerForScroll.scrollBy(0, offset)
          return { offsetRemain: 0 }
        }
        this.scrollPosition = 1
        return { offsetRemain: offset };
      })

      Text('Scroll Area')
        .width('100%')
        .height('10%')
        .backgroundColor('0X330000FF')
        .fontSize(16)
        .textAlign(TextAlign.Center)

    }.width('100%')
    .height('100%')
    .backgroundColor('0xDCDCDC')
  }
}