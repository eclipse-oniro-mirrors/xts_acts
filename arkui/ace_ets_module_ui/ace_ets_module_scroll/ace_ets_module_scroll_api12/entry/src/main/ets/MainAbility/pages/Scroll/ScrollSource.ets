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
@Entry
@Component
struct ScrollExample {
  scroller: Scroller = new Scroller()
  private arr: number[] = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9]
  @State scrollStateValue: string = "scroll to bottom 700"

  build() {
    Stack({ alignContent: Alignment.TopStart }) {
      Scroll(this.scroller) {
        Column() {
          ForEach(this.arr, (item: number) => {
            Text(item.toString())
              .width('90%')
              .height(150)
              .backgroundColor(0xFFFFFF)
              .borderRadius(15)
              .fontSize(16)
              .textAlign(TextAlign.Center)
              .margin({ top: 10 })
          }, (item: string) => item)
        }.width('100%')
      }
      .scrollable(ScrollDirection.Vertical) 
      .scrollBar(BarState.On) 
      .scrollBarColor(Color.Gray) 
      .scrollBarWidth(10) 
      .friction(0.6)
      .edgeEffect(EdgeEffect.None)
      .onWillScroll((xOffset: number, yOffset: number, scrollState: ScrollState, scrollSource: ScrollSource) => {
        console.info("xOffset: " + xOffset + ' ' + "yOffset: " + yOffset)
        console.info("scrollState: " + scrollState)
        this.scrollStateValue = "scrollSource: " + scrollSource
      })
      .onScrollEdge((side: Edge) => {
        console.info('To the edge')
      })
      .onScrollStop(() => {
        console.info('Scroll Stop')
      })

      Button(this.scrollStateValue)
        .id("scrollSource")
        .height('5%')
        .onClick(() => { 
          this.scroller.scrollEdge(Edge.Bottom, { velocity: 700 })
        })
        .margin({ top: 100, left: 20 })
      Button(this.scrollStateValue)
        .id("scrollSourceOther")
        .height('5%')
        .onClick(() => {
          this.scroller.scrollBy(0, -600)
        })
        .margin({ top: 150, left: 20 })
    }.width('100%').height('100%').backgroundColor(0xDCDCDC)
  }
}