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
struct scrollEge {
  @State Number: String[] = ['0', '1', '2', '3', '4', '5', '6', '7', '8', '9', '10', '11', '12', '13', '14', '15', '16', '17', '18', '19', '20', '21', '22', '23', '24', '25'];
  scroller: Scroller = new Scroller();

  build() {
    Column({ space: 5 }) {
      Grid(this.scroller) {
        // ForEach(this.Number, (day: string) => {
        ForEach(this.Number, (day: string) => {
          GridItem() {
            Text(day)
              .fontSize(16)
              .backgroundColor(0xF9CF93)
              .width('100%')
              .height(80)
              .textAlign(TextAlign.Center)
              .key('text' + day)
          }.height('100%')

          // }, (day: string) => day)
        }, (day: string) => day)
      }
      .key('scrollEgePages')
      .columnsTemplate('1fr')
      .columnsGap(10)
      .rowsGap(10)
      .friction(0.6)
      .edgeEffect(EdgeEffect.Spring)
      .scrollBar(BarState.On)
      .onScrollIndex((first: number) => {
        console.info(first.toString())
      })
      .onScrollBarUpdate((index: number, offset: number) => {
        return { totalOffset: (index / 5) * (80 + 10) - offset, totalLength: 80 * 5 + 10 * 4 }
      })
      .width('90%')
      .backgroundColor(0xFAEEE0)
      .height(80)

      Button('scroll Edge.Bottom')
        .height('5%')
        .id('scrollEge1')
        .onClick(() => {
          this.scroller.scrollEdge(Edge.Bottom)
        })


      Button('scroll Edge.End')
        .height('5%')
        .id('scrollEge2')
        .onClick(() => {
          this.scroller.scrollEdge(Edge.End)
        })


      Button('scroll Edge.Start')
        .height('5%')
        .id('scrollEge3')
        .onClick(() => {
          this.scroller.scrollEdge(Edge.Start)
        })


      Button('scroll Edge.Top')
        .height('5%')
        .id('scrollEge4')
        .onClick(() => {
          this.scroller.scrollEdge(Edge.Top)
        })


      Button('scrollToIndex -5')
        .height('5%')
        .id('scrollEge5')
        .onClick(() => {
          this.scroller.scrollToIndex(-5)
        })


      Button('scrollToIndex 25')
        .height('5%')
        .id('scrollEge6')
        .onClick(() => {
          this.scroller.scrollToIndex(25)
        })


      Button('scrollToIndex 5')
        .height('5%')
        .id('scrollEge7')
        .onClick(() => {
          this.scroller.scrollToIndex(5)
        })


      Button('scrollToIndex undefined')
        .height('5%')
        .id('scrollEge8')
        .onClick(() => {
          this.scroller.scrollToIndex(undefined)
        })

    }.width('100%').margin({ top: 5 }).height('100%').key('columnKeys')
  }
}