/**
 * Copyright (c) 2023 iSoftStone Information Technology (Group) Co.,Ltd.
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
struct Grid_ScrollAndScrollIndex {
  @State number: String[] = ['0', '1', '2', '3', '4'];
  scroller: Scroller = new Scroller();
  @State index: number = 0;
  @State text2: string = '';

  build() {
    Column({ space: 5 }) {
      Button('scroll_Reset_bt')
        .id('scroll_Reset_bt')
        .height('5%')
        .onClick(() => { // reset the init state
          this.scroller.scrollEdge(Edge.Top);
          this.index = 0;
          this.text2 = ''
        })
      Text(`onScrollIndex${this.index}`).id('Grid_ScrollAndScrollIndex_tex1').fontSize(14)
      Text(this.text2).id('Grid_ScrollAndScrollIndex_tex2').fontSize(14)

      Stack({ alignContent: Alignment.BottomEnd }) {
        Grid(this.scroller) {
          ForEach(this.number, (day: string) => {
            ForEach(this.number, (day: string) => {
              GridItem() {
                Text(day)
                  .fontSize(16)
                  .backgroundColor(0xF9CF93)
                  .width('100%')
                  .height('25%')
                  .textAlign(TextAlign.Center)
              }
            }, (day: string) => day)
          }, (day: string) => day)
        }
        .id('Grid_ScrollAndScrollIndex_grid')
        .margin({ right: 25 })
        .columnsTemplate('1fr 1fr 1fr 1fr 1fr')
        .columnsGap(10)
        .rowsGap(10)
        .width('80%')
        .backgroundColor(0xFAEEE0)
        .height(300)
        .scrollBar(BarState.Off)
        .onScrollIndex(() => {
          this.index++
        })
        .onScroll(() => {
          this.text2 = 'onScroll'
        })

        ScrollBar({ scroller: this.scroller, direction: ScrollBarDirection.Vertical, state: BarState.On }) {
          Text()
            .width(20)
            .height('60%')
            .borderRadius(10)
            .backgroundColor('#C0C0C0')
        }.width(20).backgroundColor('#ededed')
        .id('Grid_ScrollAndScrollIndex_scrollBar')

      }.height(300)

    }.width('100%').margin({ top: 5 })
  }
}