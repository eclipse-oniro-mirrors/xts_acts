/**
 * Copyright (c) 2024 Huawei Device Co., Ltd.
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
import Curves from '@ohos.curves'
@Entry
@Component
struct ScrollSourceOtherExample {
  scroller: Scroller = new Scroller()
  private arr: number[] = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9]
  @State scrollStateValue: string = "scroll to bottom 700"
  @State Value: string = "scroll 100"
  @State SCROLL_BAR_FLING: string = "afterEach"
  @State SCROLL_BAR: string = "afterEach"

  build() {
    Stack({ alignContent: Alignment.TopStart }) {
      Scroll(this.scroller) {
        Column() {
          ForEach(this.arr, (item: number) => {
            Text(item.toString())
              .width('90%')
              .height('20%')
              .backgroundColor(0xFFFFFF)
              .borderRadius(15)
              .fontSize(16)
              .textAlign(TextAlign.Center)
              .margin({ top: 10 })
          }, (item: string) => item)
        }.width('100%')
      }
      .id('scrollSourceOther')
      .edgeEffect(EdgeEffect.Spring)
      .scrollable(ScrollDirection.Vertical)
      .scrollBar(BarState.On)
      .scrollBarColor(Color.Gray)
      .scrollBarWidth(20)
      .friction(0.6)
      .edgeEffect(EdgeEffect.Spring)
      .onWillScroll((xOffset: number, yOffset: number, scrollState: ScrollState, scrollSource: ScrollSource) => {
        console.info("xOffset: " + xOffset + ' ' + "yOffset: " + yOffset)
        console.info("scrollState: " + scrollState)
        this.scrollStateValue = "scrollSource: " + scrollSource
        if (scrollSource != 1) {
          this.Value = "scrollSource: 1"
        }
        if (scrollSource != 4) {
          this.SCROLL_BAR = "scrollSource: 4"
        }
        if (scrollSource != 5) {
          this.SCROLL_BAR_FLING = "scrollSource: 5"
        }
      })
      .onScrollEdge((side: Edge) => {
        console.info('To the edge')
      })
      .onScrollStop(() => {
        console.info('Scroll Stop')
      })

      Button(this.scrollStateValue)
        .id("SCROLLER_ANIMATION")
        .height('5%')
        .onClick(() => {
          this.scroller.scrollEdge(Edge.Bottom, { velocity: 700 })
        })
        .margin({ top: 100, left: 20 })
      Button(this.scrollStateValue)
        .id("SCROLLER")
        .height('5%')
        .onClick(() => {
          this.scroller.scrollBy(0, -600)
        })
        .margin({ top: 150, left: 20 })
      Button(this.Value)
        .id("EDGE_EFFECT")
        .height('5%')
        .onClick(() => { 
          let curve = Curves.interpolatingSpring(10, 1, 228, 30) 
          const yOffset: number = this.scroller.currentOffset().yOffset;
          this.scroller.scrollTo({ xOffset: 0, yOffset: yOffset + 300, animation: { duration: 1000, curve: curve , canOverScroll: true} })
        })
        .margin({ top: 200, left: 20 })
      Button(this.SCROLL_BAR_FLING)
        .id("SCROLL_BAR_FLING")
        .onClick(() => {
          this.scroller.scrollEdge(Edge.Top, { velocity: 700 })
        })
        .height('5%')
        .margin({ top: 250, left: 20 })

      Button(this.SCROLL_BAR)
        .id("SCROLL_BAR")
        .onClick(() => {
          this.scroller.scrollEdge(Edge.Top, { velocity: 700 })
        })
        .height('5%')
        .margin({ top: 300, left: 20 })
    }.width('100%').height('100%').backgroundColor(0xDCDCDC)
  }
}