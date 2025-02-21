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
struct List_scrollToIndex1 {
  private arr: number[] = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9];
  private scroller: Scroller = new Scroller();

  build() {
    Column() {
      List({ space: 10, initialIndex: 0, scroller: this.scroller }) {
        ForEach(this.arr, (item: number, index?: number) => {
          ListItem() {
            Text('ListItem' + item)
              .width('90%')
              .height(40)
              .textAlign(TextAlign.Center)
              .borderRadius(10)
              .backgroundColor(0xFFFFFF)
          }.id('List_scrollToIndex1_ListItem' + item)
        }, (item: string) => item)
      }
      .id('List_scrollToIndex1_List')
      .width('80%')
      .height(230)
      .backgroundColor(Color.Pink)
      .edgeEffect(EdgeEffect.None)
      .scrollBar(BarState.On)

      Button('scrollToIndex 5')
        .id('List_scrollToIndex1_to5')
        .fontSize(14)
        .margin(5)
        .onClick(() => {
          this.scroller.scrollToIndex(5)
        })

    }.width('100%').height('100%').backgroundColor(0xDCDCDC)

  }
}