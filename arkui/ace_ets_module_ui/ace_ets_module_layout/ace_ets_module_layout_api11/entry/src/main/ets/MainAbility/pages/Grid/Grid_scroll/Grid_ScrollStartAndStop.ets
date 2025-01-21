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
struct Grid_ScorllStartAndStop {
  @State Number: String[] = ['0', '1', '2', '3', '4'];
  scroller: Scroller = new Scroller();
  @State text1: string = '';
  @State text2: string = '';

  build() {
    Column({ space: 5 }) {
      Stack({ alignContent: Alignment.BottomEnd }) {
        Grid(this.scroller) {
          ForEach(this.Number, (day: string) => {
            ForEach(this.Number, (day: string) => {
              GridItem() {
                Text(day)
                  .fontSize(16)
                  .backgroundColor(0xF9CF93)
                  .width('100%')
                  .height(80)
                  .textAlign(TextAlign.Center)
              }
            }, (day: string) => day)
          }, (day: string) => day)
        }
        .margin({ right: 25 })
        .columnsTemplate('1fr 1fr 1fr 1fr 1fr')
        .columnsGap(10)
        .rowsGap(10)
        .width('80%')
        .backgroundColor(0xFAEEE0)
        .height(300)
        .scrollBar(BarState.Off)
        .onScrollStart(() => {
          this.text1 = 'onScrollStart'
        })
        .onScrollStop(() => {
          this.text2 = 'onScrollStop'
        })
        .id('Grid_ScrollStartandStop_grid')

        ScrollBar({ scroller: this.scroller, direction: ScrollBarDirection.Vertical, state: BarState.On }) {
          Text()
            .width(20)
            .height(150)
            .borderRadius(10)
            .backgroundColor('#C0C0C0')
        }.width(20).backgroundColor('#ededed')
      }.height(300)
      .id('Grid_ScrollStartandStop_scrollBar')


      Button('animation')
        .id('button_grid_scroller_animation')
        .onClick(() => {
          this.scroller.scrollTo({
            xOffset: 0,
            yOffset: 20,
            animation: {
              duration: 1000,
              curve: Curve.Linear
            }
          })
        })

      Button('no animation')
        .id('button_grid_scroller_noanimation')
        .onClick(() => {
          this.scroller.scrollTo({
            xOffset: 0,
            yOffset: 40,
          })
        })

      Text(this.text1).id('Grid_ScrollStartandStop_tex1')
      Text(this.text2).id('Grid_ScrollStartandStop_tex2')

      Button('scrollStartAndStop_Reset_bt')
        .id('scrollStartAndStop_Reset_bt')
        .onClick(() => { // reset the init state
          this.text1 = ""
          this.text2 = ""
          this.scroller.scrollEdge(Edge.Top);

        })


    }.width('100%').margin({ top: 5 })
  }
}