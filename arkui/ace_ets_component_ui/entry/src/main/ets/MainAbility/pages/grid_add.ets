/**
 * Copyright (c) 2023 Huawei Device Co., Ltd.
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
struct GridExampleAdd {
  @State Number: String[] = ['0', '1', '2', '3', '4']
  scroller: Scroller = new Scroller()

  build() {
    Column({ space: 5 }) {
      Grid() {
        ForEach(this.Number, (day: string) => {
          ForEach(this.Number, (day: string) => {
            GridItem() {
              Text(day)
                .fontSize(16)
                .backgroundColor(0xF9CF93)
                .width('100%')
                .height('100%')
                .textAlign(TextAlign.Center)
            }
          }, (day: string) => day)
        }, (day: string) => day)
      }
      .columnsTemplate('1fr 1fr 1fr 1fr 1fr')
      .rowsTemplate('1fr 1fr 1fr 1fr 1fr')
      .columnsGap(10)
      .rowsGap(10)
      .width('90%')
      .backgroundColor(0xFAEEE0)
      .height(300)

      Text('scroll').fontColor(0xCCCCCC).fontSize(9).width('90%')
      Grid(this.scroller,{regularSize:[12,12],irregularIndexes:[10,5,7],onGetIrregularSizeByIndex:(index: number) => {
        return [index,index]
      }
      }) {
        ForEach(this.Number, (day: string,index:number = -1) => {
          ForEach(this.Number, (day: string,index:number = -1) => {
            GridItem() {
              Text(day)
                .fontSize(16)
                .backgroundColor(0xF9CF93)
                .width('100%')
                .height(80)
                .key(''+(index+1)*(index+1))
                .textAlign(TextAlign.Center)
            }
          }, (day: string) => day)
        })
      }
      .columnsTemplate('1fr 1fr 1fr 1fr 1fr')
      .columnsGap(10)
      .rowsGap(10)
      .enableScrollInteraction(true)
      .nestedScroll({
        scrollForward:NestedScrollMode.PARENT_FIRST,
        scrollBackward:NestedScrollMode.SELF_FIRST
      })
      .edgeEffect(EdgeEffect.Spring)

      .onScrollIndex((first: number) => {
        console.info(first.toString())
      })
      .onScrollBarUpdate((index: number, offset: number) => {
        return {totalOffset: (index / 5) * (80 + 10) - 10 - offset, totalLength: 80 * 5 + 10 * 4}
      })
      .width('90%')
      .backgroundColor(0xFAEEE0)
      .height(300)
      Button('next page')
        .onClick(() => { // 点击后滑到下一页
          this.scroller.scrollPage({ next: true })
        }).key('nexpageAdd')
    }.width('100%').margin({ top: 5 })
  }
}