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
struct StartAndEndGrid {
  @State number: String[] = ['0', '1', '2', '3', '4'];
  scroller: Scroller = new Scroller();
  @State index: number = 0;
  @State text2: string = '';
  @State pad: number = 0;

  build() {
    Column({ space: 5 }) {
      Text(`onReachStart${this.index}`).id('StartAndEnd_start')
      Text(this.text2).id('StartAndEnd_end')
      Stack({ alignContent: Alignment.BottomEnd }) {
        Grid(this.scroller) {
          ForEach(this.number, (day: string) => {
            ForEach(this.number, (day: string) => {
              GridItem() {
                Text(day)
                  .fontSize(16)
                  .backgroundColor(0xF9CF93)
                  .width('100%')
                  .height('20%')
                  .textAlign(TextAlign.Center)
              }
            }, (day: string) => day)
          }, (day: string) => day)
        }
        .id('StartAndEnd')
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
        .id('StartAndEnd_scrollBar')

      }.height('70%')

    }.width('100%').margin({ top: 5 })
  }
}