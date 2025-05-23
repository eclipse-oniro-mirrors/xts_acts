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
struct List_scrollToIndex2 {
  private arr: number[] = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9];
  private scroller: Scroller = new Scroller();

  build() {
    Column({ space: 2 }) {
      Column({ space: 2 }) {
        Row({ space: 2 }) {
          Button('scrollToIndex 20')
            .height('5%')
            .fontSize(14)
            .id('List_scrollToIndex2_to20')
            .onClick(() => {
              this.scroller.scrollToIndex(20)
            })

          Button('scrollToIndex -3')
            .height('5%')
            .id('List_scrollToIndex2_to-3')
            .fontSize(14)
            .onClick(() => {
              this.scroller.scrollToIndex(-3)
            })
        }

        Row({ space: 2 }) {
          Button('scrollToIndex 0')
            .height('5%')
            .fontSize(14)
            .id('List_scrollToIndex2_to0')
            .onClick(() => {
              this.scroller.scrollToIndex(0)
            })

          Button('scrollToIndex 9')
            .height('5%')
            .id('List_scrollToIndex2_to9')
            .fontSize(14)
            .onClick(() => {
              this.scroller.scrollToIndex(9)
            })
        }
      }

      Column({ space: 2 }) {
        Column() {
          Text('ScrollAlign.START')
          Row({ space: 2 }) {
            Button('scrollToIndex 5')
              .height('5%')
              .id('List_scrollToIndex2_START5')
              .fontSize(14)
              .onClick(() => {
                this.scroller.scrollToIndex(5, false, ScrollAlign.START)
              })
          }
        }

        Column() {
          Text('ScrollAlign.CENTER')
          Row({ space: 2 }) {
            Button('scrollToIndex 5')
              .height('5%')
              .id('List_scrollToIndex2_CENTER5')
              .fontSize(14)
              .onClick(() => {
                this.scroller.scrollToIndex(5, false, ScrollAlign.CENTER)
              })
          }
        }

        Column() {
          Text('ScrollAlign.END')
          Row({ space: 2 }) {
            Button('scrollToIndex 5')
              .height('5%')
              .id('List_scrollToIndex2_END5')
              .fontSize(14)
              .onClick(() => {
                this.scroller.scrollToIndex(5, false, ScrollAlign.END)
              })
          }
        }

        Column({ space: 2 }) {
          Text('ScrollAlign.AUTO')
          Row({ space: 2 }) {
            Button('scrollToIndex 1')
              .height('5%')
              .id('List_scrollToIndex2_AUTO1')
              .fontSize(14)
              .onClick(() => {
                this.scroller.scrollToIndex(1, false, ScrollAlign.AUTO)
              })

            Button('scrollToIndex 4')
              .height('5%')
              .id('List_scrollToIndex2_AUTO4')
              .fontSize(14)
              .onClick(() => {
                this.scroller.scrollToIndex(4, false, ScrollAlign.AUTO)
              })
          }

          Row({ space: 2 }) {
            Button('scrollToIndex 5')
              .height('5%')
              .id('List_scrollToIndex2_AUTO5')
              .fontSize(14)
              .onClick(() => {
                this.scroller.scrollToIndex(5, false, ScrollAlign.AUTO)
              })
          }
        }
      }
      List({ space: 10, initialIndex: 0, scroller: this.scroller }) {
        ForEach(this.arr, (item: number, index?: number) => {
          ListItem() {
            Text('ListItem' + item)
              .width('90%')
              .height(40)
              .textAlign(TextAlign.Center)
              .borderRadius(10)
              .backgroundColor(0xFFFFFF)
          }.id('List_scrollToIndex2_ListItem' + item)
        }, (item: string) => item)
      }
      .id('List_scrollToIndex2_List')
      .width('80%')
      .height(230)
      .backgroundColor(Color.Pink)
      .edgeEffect(EdgeEffect.None)
      .scrollBar(BarState.On)

    }.width('100%').height('100%').backgroundColor(0xDCDCDC)
  }
}