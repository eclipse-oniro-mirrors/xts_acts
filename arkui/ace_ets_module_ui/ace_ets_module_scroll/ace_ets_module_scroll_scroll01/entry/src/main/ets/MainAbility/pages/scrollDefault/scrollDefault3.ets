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
struct ScrollNullUndefinedTest3 {
  @State numbers: string[] = []

  aboutToAppear() {
    for (let i = 1; i <= 20; i++) {
      this.numbers.push(i + '')
    }
  }

  build() {
    Column() {
      // ========== scrollBarMargin tests ==========
      Text('scrollBarMargin')
      Row() {
        // Test scrollBarMargin default value
        Scroll() {
          Column() {
            ForEach([1, 2, 3], (item: number) => {
              Text('' + item)
                .width('90%')
                .height('30%')
                .fontSize(14)
                .textAlign(TextAlign.Center)
                .backgroundColor(0xF9CF93)
            }, (item: number) => item.toString())
          }
        }
        .id('scroll_scrollBarMargin_default')
        .scrollBar(BarState.On)
        .scrollBarWidth(10)
        .width('30%')
        .height('100%')
        .backgroundColor(0xF0F0F0)

        // Test scrollBarMargin with null
        Scroll() {
          Column() {
            ForEach([1, 2, 3], (item: number) => {
              Text('' + item)
                .width('90%')
                .height('30%')
                .fontSize(14)
                .textAlign(TextAlign.Center)
                .backgroundColor(0xF9CF93)
            }, (item: number) => item.toString())
          }
        }
        .id('scroll_scrollBarMargin_null')
        .scrollBarMargin(null)
        .scrollBar(BarState.On)
        .scrollBarWidth(10)
        .width('30%')
        .height('100%')
        .backgroundColor(0xF0F0F0)

        // Test scrollBarMargin with undefined
        Scroll() {
          Column() {
            ForEach([1, 2, 3], (item: number) => {
              Text('' + item)
                .width('90%')
                .height('30%')
                .fontSize(14)
                .textAlign(TextAlign.Center)
                .backgroundColor(0xF9CF93)
            }, (item: number) => item.toString())
          }
        }
        .id('scroll_scrollBarMargin_undefined')
        .scrollBarMargin(undefined)
        .scrollBar(BarState.On)
        .scrollBarWidth(10)
        .width('30%')
        .height('100%')
        .backgroundColor(0xF0F0F0)
      }
      .width('100%')
      .height('10%')
      .justifyContent(FlexAlign.SpaceEvenly)
      .margin({ bottom: 2 })

      // ========== fadingEdge tests ==========
      Text('fadingEdge')
      Row() {
        // Test fadingEdge default value
        Scroll() {
          Column() {
            ForEach([1, 2, 3], (item: number) => {
              Text('' + item)
                .width('90%')
                .height('30%')
                .fontSize(14)
                .textAlign(TextAlign.Center)
                .backgroundColor(0xF9CF93)
            }, (item: number) => item.toString())
          }
        }
        .id('scroll_fadingEdge_default')
        .width('20%')
        .height('100%')
        .backgroundColor(0xF0F0F0)

        // Test fadingEdge with null
        Scroll() {
          Column() {
            ForEach([1, 2, 3], (item: number) => {
              Text('' + item)
                .width('90%')
                .height('30%')
                .fontSize(14)
                .textAlign(TextAlign.Center)
                .backgroundColor(0xF9CF93)
            }, (item: number) => item.toString())
          }
        }
        .id('scroll_fadingEdge_null')
        .fadingEdge(null)
        .width('20%')
        .height('100%')
        .backgroundColor(0xF0F0F0)

        // Test fadingEdge with undefined
        Scroll() {
          Column() {
            ForEach([1, 2, 3], (item: number) => {
              Text('' + item)
                .width('90%')
                .height('30%')
                .fontSize(14)
                .textAlign(TextAlign.Center)
                .backgroundColor(0xF9CF93)
            }, (item: number) => item.toString())
          }
        }
        .id('scroll_fadingEdge_undefined')
        .fadingEdge(undefined)
        .width('20%')
        .height('100%')
        .backgroundColor(0xF0F0F0)

        // Test fadingEdge options with null
        Scroll() {
          Column() {
            ForEach([1, 2, 3], (item: number) => {
              Text('' + item)
                .width('90%')
                .height('30%')
                .fontSize(14)
                .textAlign(TextAlign.Center)
                .backgroundColor(0xF9CF93)
            }, (item: number) => item.toString())
          }
        }
        .id('scroll_fadingEdge_options_null')
        .fadingEdge(true, null)
        .width('20%')
        .height('100%')
        .backgroundColor(0xF0F0F0)

        // Test fadingEdge options with undefined
        Scroll() {
          Column() {
            ForEach([1, 2, 3], (item: number) => {
              Text('' + item)
                .width('90%')
                .height('30%')
                .fontSize(14)
                .textAlign(TextAlign.Center)
                .backgroundColor(0xF9CF93)
            }, (item: number) => item.toString())
          }
        }
        .id('scroll_fadingEdge_options_undefined')
        .fadingEdge(true, undefined)
        .width('20%')
        .height('100%')
        .backgroundColor(0xF0F0F0)
      }
      .width('100%')
      .height('10%')
      .justifyContent(FlexAlign.SpaceEvenly)
      .margin({ bottom: 2 })

      // ========== flingSpeedLimit tests ==========
      Text('flingSpeedLimit')
      Row() {
        // Test flingSpeedLimit default value
        Scroll() {
          Column() {
            ForEach([1, 2, 3], (item: number) => {
              Text('' + item)
                .width('90%')
                .height('30%')
                .fontSize(14)
                .textAlign(TextAlign.Center)
                .backgroundColor(0xF9CF93)
            }, (item: number) => item.toString())
          }
        }
        .id('scroll_flingSpeedLimit_default')
        .width('30%')
        .height('100%')
        .backgroundColor(0xF0F0F0)

        // Test flingSpeedLimit with null
        Scroll() {
          Column() {
            ForEach([1, 2, 3], (item: number) => {
              Text('' + item)
                .width('90%')
                .height('30%')
                .fontSize(14)
                .textAlign(TextAlign.Center)
                .backgroundColor(0xF9CF93)
            }, (item: number) => item.toString())
          }
        }
        .id('scroll_flingSpeedLimit_null')
        .flingSpeedLimit(null)
        .width('30%')
        .height('100%')
        .backgroundColor(0xF0F0F0)

        // Test flingSpeedLimit with undefined
        Scroll() {
          Column() {
            ForEach([1, 2, 3], (item: number) => {
              Text('' + item)
                .width('90%')
                .height('30%')
                .fontSize(14)
                .textAlign(TextAlign.Center)
                .backgroundColor(0xF9CF93)
            }, (item: number) => item.toString())
          }
        }
        .id('scroll_flingSpeedLimit_undefined')
        .flingSpeedLimit(undefined)
        .width('30%')
        .height('100%')
        .backgroundColor(0xF0F0F0)
      }
      .width('100%')
      .height('10%')
      .justifyContent(FlexAlign.SpaceEvenly)
      .margin({ bottom: 2 })

      // ========== clipContent tests ==========
      Text('clipContent')
      Row() {
        // Test clipContent default value
        Scroll() {
          Column() {
            ForEach([1, 2, 3], (item: number) => {
              Text('' + item)
                .width('90%')
                .height('30%')
                .fontSize(14)
                .textAlign(TextAlign.Center)
                .backgroundColor(0xF9CF93)
            }, (item: number) => item.toString())
          }
        }
        .id('scroll_clipContent_default')
        .width('30%')
        .height('100%')
        .backgroundColor(0xF0F0F0)

        // Test clipContent with null
        Scroll() {
          Column() {
            ForEach([1, 2, 3], (item: number) => {
              Text('' + item)
                .width('90%')
                .height('30%')
                .fontSize(14)
                .textAlign(TextAlign.Center)
                .backgroundColor(0xF9CF93)
            }, (item: number) => item.toString())
          }
        }
        .id('scroll_clipContent_null')
        .clipContent(null)
        .width('30%')
        .height('100%')
        .backgroundColor(0xF0F0F0)

        // Test clipContent with undefined
        Scroll() {
          Column() {
            ForEach([1, 2, 3], (item: number) => {
              Text('' + item)
                .width('90%')
                .height('30%')
                .fontSize(14)
                .textAlign(TextAlign.Center)
                .backgroundColor(0xF9CF93)
            }, (item: number) => item.toString())
          }
        }
        .id('scroll_clipContent_undefined')
        .clipContent(undefined)
        .width('30%')
        .height('100%')
        .backgroundColor(0xF0F0F0)
      }
      .width('100%')
      .height('10%')
      .justifyContent(FlexAlign.SpaceEvenly)

    }
    .width('100%')
    .height('100%')
    .backgroundColor(0xDCDCDC)
    .padding({ top: 2 })
  }
}