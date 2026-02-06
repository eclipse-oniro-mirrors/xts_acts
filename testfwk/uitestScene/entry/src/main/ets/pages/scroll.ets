/**
 * Copyright (c) 2022 Huawei Device Co., Ltd.
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
struct PinchTest {
  scroller: Scroller = new Scroller()
  private arr: number[] = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]

  build() {
    Column() {
      Text('VerticalScroll')
        .fontSize(25)
        .fontWeight(FontWeight.Bold)
      Scroll(this.scroller) {
        Column() {
          ForEach(this.arr, (item: number) => {
            Text(item.toString())
              .width('90%')
              .height('40%')
              .backgroundColor(0xDCDCDC)
              .fontSize(80)
              .textAlign(TextAlign.Center)
              .margin({ top: 10 })
          }, (item: string) => item)
        }
      }
      .id('verticalScroll')
      .width('100%')
      .height('50%')
      .scrollable(ScrollDirection.Vertical)
      .scrollBar(BarState.On)
      .scrollBarColor(Color.Gray)
      .scrollBarWidth(30)


      Text('HorizontalScroll')
        .fontSize(25)
        .fontWeight(FontWeight.Bold)
      Stack({ alignContent: Alignment.Center }) {
        Scroll(this.scroller) {
          Row() {
            ForEach(this.arr, (item: number) => {
              Text(item.toString())
                .width('20%')
                .height('90%')
                .backgroundColor(0xDCDCDC)
                .fontSize(80)
                .textAlign(TextAlign.Center)
                .margin({ top: 10 })
            }, (item: string) => item)
          }
        }
        .id('horizontalScroll')
        .width('100%')
        .height('100%')
        .scrollable(ScrollDirection.Horizontal)
        .scrollBar(BarState.On)
        .scrollBarColor(Color.Gray)
        .scrollBarWidth(30)

        Text('Offset Start')
          .fontSize(10)
          .fontWeight(FontWeight.Bold)
          .width('20%')
          .height('100%')
          .position({left: 0})
          .backgroundColor(Color.Gray)

        Text('Offset End')
          .fontSize(10)
          .fontWeight(FontWeight.Bold)
          .width('20%')
          .height('100%')
          .position({right: 0})
          .backgroundColor(Color.Gray)
      }
      .width('80%')
      .height('50%')
    }
    .width('100%')
    .height('100%')
    .justifyContent(FlexAlign.Center)
  }
}