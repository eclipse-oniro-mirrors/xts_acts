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
struct ScrollSourceBARExample {
  scroller: Scroller = new Scroller()
  private arr: number[] = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9]
  @State SCROLL_BAR_FLING: string = 'afterEach'
  @State SCROLL_BAR: string = 'afterEach'

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
      .edgeEffect(EdgeEffect.Spring)
      .scrollable(ScrollDirection.Vertical)
      .scrollBar(BarState.On)
      .scrollBarColor(Color.Gray)
      .friction(0.6)
      .edgeEffect(EdgeEffect.Spring)
      .onWillScroll((xOffset: number, yOffset: number, scrollState: ScrollState, scrollSource: ScrollSource) => {
        console.info('xOffset: ' + xOffset + ' ' + 'yOffset: ' + yOffset)
        console.info('scrollState: ' + scrollState)
        if (scrollSource === 0) { //拖拽事件
          console.info('scrollSource ScrollSource.FLING success')
        } else if (scrollSource === 1) {  //拖曳以速度结束后甩动
          console.info('scrollSource ScrollSource.FLING success')
        } else if (scrollSource === 2) {  //使用EdgeEffect.Spring进行滚动
          console.info('scrollSource ScrollSource.EDGE_EFFECT success')
        } else if (scrollSource === 3) {  //除拖动以外的其他用户输入，如鼠标滚轮、按键事件
          console.info('scrollSource ScrollSource.OTHER_USER_INPUT success')
        } else if (scrollSource === ScrollSource.SCROLL_BAR) {  //滚动条的拖动事件
          this.SCROLL_BAR = 'ScrollSource.SCROLL_BAR'
          console.info('scrollSource ScrollSource.SCROLL_BAR success')
        } else if (scrollSource === ScrollSource.SCROLL_BAR_FLING) {  //滚动条拖拽结束后的滑动速度
          this.SCROLL_BAR_FLING = 'ScrollSource.SCROLL_BAR_FLING'
          console.info('scrollSource ScrollSource.SCROLL_BAR_FLING success')
        } else if (scrollSource === 6) {  //不带动画的Scroller的成员方法
          console.info('scrollSource ScrollSource.SCROLLER success')
        } else if (scrollSource === 7) {  //带动画的Scroller的成员方法
          console.info('scrollSource ScrollSource.SCROLLER_ANIMATION success')
        }
      })
      .onScrollEdge((side: Edge) => {
        console.info('To the edge')
      })
      .onScrollStop(() => {
        console.info('Scroll Stop')
      })


      ScrollBar({ scroller: this.scroller, state: BarState.On }) {
        Text().backgroundColor(Color.Red).height('30%').width(50)
      }
      .id('scroller_scrollbar_bar')
      .position({ right: 0 })
      .width(50)
      .backgroundColor(Color.Gray)
      .enableNestedScroll(true)

      Button(this.SCROLL_BAR_FLING)
        .id('scrollSource_5')
        .height('5%')
        .margin({ top: 100, left: 20 })

      Button(this.SCROLL_BAR)
        .id('scrollSource_4')
        .height('5%')
        .margin({ top: 150, left: 20 })
    }.width('90%').height('70%').backgroundColor(0xDCDCDC)
  }
}