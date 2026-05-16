/**
 * Copyright (c) 2026 Huawei Device Co., Ltd.
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
struct ScrollBarNullUndefinedTest {
  @State numbers: string[] = []
  scroller: Scroller = new Scroller();
  scroller2: Scroller = new Scroller();
  scroller3: Scroller = new Scroller();
  scroller4: Scroller = new Scroller();
  scroller5: Scroller = new Scroller();
  scroller6: Scroller = new Scroller();

  aboutToAppear() {
    for (let i = 1; i <= 20; i++) {
      this.numbers.push(i + '')
    }
  }

  build() {
    Column() {
      // ========== enableNestedScroll tests ==========
      Text('enableNestedScroll')
      Row() {
        // Test enableNestedScroll default value
        Stack() {
          Scroll(this.scroller) {
            Column() {
              ForEach(this.numbers, (item: number) => {
                Text('' + item)
                  .width('60%')
                  .height('30%')
                  .fontSize(14)
                  .textAlign(TextAlign.Center)
                  .backgroundColor(0xF9CF93)
              }, (item: number) => item.toString())
            }
          }.scrollBar(BarState.Off)

          ScrollBar({ scroller: this.scroller, state: BarState.On }) {
            Text()
              .width('100%')
              .height('60%')
              .borderRadius(10)
              .backgroundColor('#C0C0C0')
          }
          .id('scrollBar_enableNestedScroll_default')
          .width(20)
          .position({ right: 0 })
          .borderWidth(1)
        }
        .width('30%')
        .height('100%')
        .backgroundColor(0xF0F0F0)

        // Test enableNestedScroll with null
        Stack() {
          Scroll(this.scroller2) {
            Column() {
              ForEach(this.numbers, (item: number) => {
                Text('' + item)
                  .width('60%')
                  .height('30%')
                  .fontSize(14)
                  .textAlign(TextAlign.Center)
                  .backgroundColor(0xF9CF93)
              }, (item: number) => item.toString())
            }
          }.scrollBar(BarState.Off)

          ScrollBar({ scroller: this.scroller2, state: BarState.On }) {
            Text()
              .width('100%')
              .height('60%')
              .borderRadius(10)
              .backgroundColor('#C0C0C0')
          }
          .id('scrollBar_enableNestedScroll_null')
          .enableNestedScroll(null)
          .width(20)
          .position({ right: 0 })
          .borderWidth(1)
        }
        .width('30%')
        .height('100%')
        .backgroundColor(0xF0F0F0)

        // Test enableNestedScroll with undefined
        Stack() {
          Scroll(this.scroller3) {
            Column() {
              ForEach(this.numbers, (item: number) => {
                Text('' + item)
                  .width('60%')
                  .height('30%')
                  .fontSize(14)
                  .textAlign(TextAlign.Center)
                  .backgroundColor(0xF9CF93)
              }, (item: number) => item.toString())
            }
          }.scrollBar(BarState.Off)

          ScrollBar({ scroller: this.scroller3, state: BarState.On }) {
            Text()
              .width('100%')
              .height('60%')
              .borderRadius(10)
              .backgroundColor('#C0C0C0')
          }
          .id('scrollBar_enableNestedScroll_undefined')
          .enableNestedScroll(undefined)
          .width(20)
          .position({ right: 0 })
          .borderWidth(1)
        }
        .width('30%')
        .height('100%')
        .backgroundColor(0xF0F0F0)
      }
      .width('100%')
      .height('23%')
      .justifyContent(FlexAlign.SpaceEvenly)
      .margin({ bottom: 2 })

      // ========== scrollBarColor tests ==========
      Text('scrollBarColor')
      Row() {
        // Test scrollBarColor default value
        Stack() {
          Scroll(this.scroller4) {
            Column() {
              ForEach(this.numbers, (item: number) => {
                Text('' + item)
                  .width('60%')
                  .height('30%')
                  .fontSize(14)
                  .textAlign(TextAlign.Center)
                  .backgroundColor(0xF9CF93)
              }, (item: number) => item.toString())
            }
          }.scrollBar(BarState.Off)

          ScrollBar({ scroller: this.scroller4, state: BarState.On }) {
            Text()
              .width('100%')
              .height('60%')
              .borderRadius(10)
              .backgroundColor('#C0C0C0')
          }
          .id('scrollBar_scrollBarColor_default')
          .width(20)
          .position({ right: 0 })
          .borderWidth(1)
        }
        .width('30%')
        .height('100%')

        // Test scrollBarColor with null
        Stack() {
          Scroll(this.scroller5) {
            Column() {
              ForEach(this.numbers, (item: number) => {
                Text('' + item)
                  .width('60%')
                  .height('30%')
                  .fontSize(14)
                  .textAlign(TextAlign.Center)
                  .backgroundColor(0xF9CF93)
              }, (item: number) => item.toString())
            }
          }.scrollBar(BarState.Off)

          ScrollBar({ scroller: this.scroller5, state: BarState.On }) {
            Text()
              .width('100%')
              .height('60%')
              .borderRadius(10)
              .backgroundColor('#C0C0C0')
          }
          .id('scrollBar_scrollBarColor_null')
          .scrollBarColor(null)
          .width(20)
          .position({ right: 0 })
          .borderWidth(1)
        }
        .width('30%')
        .height('100%')

        // Test scrollBarColor with undefined
        Stack() {
          Scroll(this.scroller6) {
            Column() {
              ForEach(this.numbers, (item: number) => {
                Text('' + item)
                  .width('60%')
                  .height('30%')
                  .fontSize(14)
                  .textAlign(TextAlign.Center)
                  .backgroundColor(0xF9CF93)
              }, (item: number) => item.toString())
            }
          }.scrollBar(BarState.Off)

          ScrollBar({ scroller: this.scroller6, state: BarState.On }) {
            Text()
              .width('100%')
              .height('60%')
              .borderRadius(10)
              .backgroundColor('#C0C0C0')
          }
          .id('scrollBar_scrollBarColor_undefined')
          .scrollBarColor(undefined)
          .width(20)
          .position({ right: 0 })
          .borderWidth(1)
        }
        .width('30%')
        .height('100%')
      }
      .width('100%')
      .height('23%')
      .justifyContent(FlexAlign.SpaceEvenly)
    }
    .width('100%')
    .height('100%')
    .padding({ top: 2 })
  }
}