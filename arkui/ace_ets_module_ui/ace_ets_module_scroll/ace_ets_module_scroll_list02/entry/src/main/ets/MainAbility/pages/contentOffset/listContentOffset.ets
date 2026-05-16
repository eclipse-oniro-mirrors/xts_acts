/**
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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
struct ListContentOffsetNum {
  scroller: Scroller = new Scroller()
  @State arr: number[] = []
  @State startOffset: number = 20;
  @State endOffset: number = 30;

  aboutToAppear() {
    for (let i = 0;i <= 9; i++) {
      this.arr.push(i)
    }
  }
  build() {
    Column() {
      Button('Bottom')
        .id('list_contentOffset_btm')
        .onClick(() => {
          this.scroller.scrollEdge(Edge.Bottom,{velocity:700})
        })
      Row() {
        Button('start ++')
          .id('list_contentOffset_start')
          .onClick(() => {
            this.startOffset += 10
          })
        Button('end --')
          .id('list_contentOffset_end')
            .onClick(() => {
            this.endOffset -= 10
          })
      }

      List({scroller: this.scroller}){
        ForEach(this.arr, (item: number, index: number) => {
          ListItem() {
            Text('item' + item)
              .width('90%')
              .height('20%')
              .fontSize(16)
              .textAlign(TextAlign.Center)
              .focusable(true)
              .borderRadius(10)
              .backgroundColor(Color.Orange)
          }
          .id('list_item_' + item)
        }, (item: string) => item)
      }
      .id('list_contentOffset_num')
      .contentStartOffset(this.startOffset)
      .contentEndOffset(this.endOffset)
      .scrollBar(BarState.On)
      .scrollBarWidth(20)
      .width('80%')
      .height('50%')
      .backgroundColor(Color.Green)
    }
    .width('100%')
    .height('100%')
    .padding({ top: 5 })
  }
}