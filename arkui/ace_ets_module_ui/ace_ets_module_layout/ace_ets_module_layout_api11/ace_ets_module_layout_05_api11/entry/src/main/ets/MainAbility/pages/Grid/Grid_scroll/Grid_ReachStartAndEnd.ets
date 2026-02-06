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
struct Grid_ReachStartAndEnd {
  @State Number: String[] = ['0', '1', '2', '3', '4'];
  scroller: Scroller = new Scroller();
  @State index: number = 0;
  @State text2: string = '111';
  @State pad: number = 0;

  build() {
    Column({ space: 5 }) {
      Button('change grid padding')
        .id('Grid_ReachStartAndEnd_changePadding')
        .height('5%')
        .onClick(() => {
          this.pad = 30
        })
      
      Row(){
        Button('to top')
          .id('Grid_ReachStartAndEnd_toTop')
          .height('5%')
          .onClick(() => { // 点击后滑到顶部
            this.scroller.scrollEdge(Edge.Top)
          })

        Button('to bottom')
          .id('Grid_ReachStartAndEnd_toBottom')
          .height('5%')
          .onClick(() => { // 点击后滑到底部
            this.scroller.scrollEdge(Edge.Bottom)
          })
      }

      Button('grid_Reset_bt')
        .id('grid_Reset_bt')
        .height('5%')
        .onClick(() => { // reset the init state
          this.index = 0;
          this.text2 = '111'
        })
      Text(`onReachStart${this.index}`).fontSize(14).id('Grid_ReachStartAndEnd_tex1')
      Text(this.text2).fontSize(14).id('Grid_ReachStartAndEnd_tex2')

      Stack({ alignContent: Alignment.BottomEnd }) {
        Grid(this.scroller) {
          ForEach(this.Number, (day: string) => {
            ForEach(this.Number, (day: string) => {
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
        .id('Grid_ReachStartAndEnd_grid')
        .padding(this.pad)
        .margin({ right: 25 })
        .columnsTemplate('1fr 1fr 1fr 1fr 1fr')
        .columnsGap(10)
        .rowsGap(10)
        .width('80%')
        .backgroundColor(0xFAEEE0)
        .height('100%')
        .scrollBar(BarState.Off)
        .onReachStart(() => {
          this.index++
        })
        .onReachEnd(() => {
          this.text2 = 'onReachEnd'
        })

        ScrollBar({ scroller: this.scroller, direction: ScrollBarDirection.Vertical, state: BarState.On }) {
          Text()
            .width(20)
            .height('60%')
            .borderRadius(10)
            .backgroundColor('#C0C0C0')
        }.width(20).backgroundColor('#ededed')
        .id('Grid_ReachStartAndEnd_scrollBar')

      }.height('50%')

    }.width('100%').margin({ top: 5 })
  }
}