/**
 * Copyright (c) 2024 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the 'License');
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an 'AS IS' BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
@Entry
@Component
struct ScrollSourceDRAGExample {
  scroller: Scroller = new Scroller()
  private arr: number[] = [0, 1, 2, 3, 4, 5, 6]
  @State scrollStateValue: string = 'scrollSource'

  build() {
    Column() {
      Column(){
        Button(this.scrollStateValue)
          .id('scroller_DRAG')
          .height('5%')
      }.margin(5)
      
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
          }, (item: string) => item)
        }.width('100%')
      }
      .id('scrollSource_drag')
      .width('90%')
      .height('60%')
      .backgroundColor(0xDCDCDC)
      .edgeEffect(EdgeEffect.Spring)
      .scrollable(ScrollDirection.Vertical)
      .scrollBar(BarState.On)
      .scrollBarColor(Color.Gray)
      .scrollBarWidth(20)
      .friction(0.6)
      .edgeEffect(EdgeEffect.Spring)
      .onWillScroll((xOffset: number, yOffset: number, scrollState: ScrollState, scrollSource: ScrollSource) => {
        console.info('xOffset: ' + xOffset + ' ' + 'yOffset: ' + yOffset)
        console.info('scrollState: ' + scrollState)
        console.info('scrollSource: ' + scrollSource)
        if (scrollSource == ScrollSource.DRAG) {
          this.scrollStateValue = 'drag'
        }
      })
      .onScrollEdge((side: Edge) => {
        console.info('To the edge')
      })
      .onScrollStop(() => {
        console.info('Scroll Stop')
      })

    }
    .width('100%')
    .height('100%')
  }
}