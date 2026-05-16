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
struct ScrollNullUndefinedTest1 {
  @State numbers: string[] = []

  aboutToAppear() {
    for (let i = 1; i <= 20; i++) {
      this.numbers.push(i + '')
    }
  }

  build() {
    Column() {
      // ========== scrollable tests ==========
      Text('scrollable')
      Row() {
        // Test scrollable default value
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
        .id('scroll_scrollable_default')
        .width('30%')
        .height('100%')
        .backgroundColor(0xF0F0F0)

        // Test scrollable with null
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
        .id('scroll_scrollable_null')
        .scrollable(null)
        .width('30%')
        .height('100%')
        .backgroundColor(0xF0F0F0)

        // Test scrollable with undefined
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
        .id('scroll_scrollable_undefined')
        .scrollable(undefined)
        .width('30%')
        .height('100%')
        .backgroundColor(0xF0F0F0)
      }
      .width('100%')
      .height('10%')
      .justifyContent(FlexAlign.SpaceEvenly)
      .margin({ bottom: 2 })

      // ========== maxZoomScale tests ==========
      Text('maxZoomScale')
      Row() {
        // Test maxZoomScale default value
        Scroll() {
          Image($r('app.media.icon'))
            .id('img_nullZoom')
            .width('90%')
            .height('100%')
        }
        .id('scroll_maxZoomScale_default')
        .width('30%')
        .height('100%')
        .backgroundColor(0xF0F0F0)

        // Test maxZoomScale with null
        Scroll() {
          Image($r('app.media.icon'))
            .id('img_nullZoom')
            .width('90%')
            .height('100%')
        }
        .id('scroll_maxZoomScale_null')
        .maxZoomScale(null)
        .width('30%')
        .height('100%')
        .backgroundColor(0xF0F0F0)

        // Test maxZoomScale with undefined
        Scroll() {
          Image($r('app.media.icon'))
            .id('img_nullZoom')
            .width('90%')
            .height('100%')
        }
        .id('scroll_maxZoomScale_undefined')
        .maxZoomScale(undefined)
        .width('30%')
        .height('100%')
        .backgroundColor(0xF0F0F0)
      }
      .width('100%')
      .height('10%')
      .justifyContent(FlexAlign.SpaceEvenly)
      .margin({ bottom: 2 })

      // ========== minZoomScale tests ==========
      Text('minZoomScale')
      Row() {
        // Test minZoomScale default value
        Scroll() {
          Image($r('app.media.icon'))
            .id('img_nullZoom')
            .width('90%')
            .height('100%')
        }
        .id('scroll_minZoomScale_default')
        .width('30%')
        .height('100%')
        .backgroundColor(0xF0F0F0)

        // Test minZoomScale with null
        Scroll() {
          Image($r('app.media.icon'))
            .id('img_nullZoom')
            .width('90%')
            .height('100%')
        }
        .id('scroll_minZoomScale_null')
        .minZoomScale(null)
        .width('30%')
        .height('100%')
        .backgroundColor(0xF0F0F0)

        // Test minZoomScale with undefined
        Scroll() {
          Image($r('app.media.icon'))
            .id('img_nullZoom')
            .width('90%')
            .height('100%')
        }
        .id('scroll_minZoomScale_undefined')
        .minZoomScale(undefined)
        .width('30%')
        .height('100%')
        .backgroundColor(0xF0F0F0)
      }
      .width('100%')
      .height('10%')
      .justifyContent(FlexAlign.SpaceEvenly)
      .margin({ bottom: 2 })

      // ========== zoomScale tests ==========
      Text('zoomScale')
      Row() {
        // Test zoomScale default value
        Scroll() {
          Image($r('app.media.icon'))
            .id('img_nullZoom')
            .width('90%')
            .height('100%')
        }
        .id('scroll_zoomScale_default')
        .width('30%')
        .height('100%')
        .backgroundColor(0xF0F0F0)

        // Test zoomScale with null
        Scroll() {
          Image($r('app.media.icon'))
            .id('img_nullZoom')
            .width('90%')
            .height('100%')
        }
        .id('scroll_zoomScale_null')
        .zoomScale(null)
        .width('30%')
        .height('100%')
        .backgroundColor(0xF0F0F0)

        // Test zoomScale with undefined
        Scroll() {
          Image($r('app.media.icon'))
            .id('img_nullZoom')
            .width('90%')
            .height('100%')
        }
        .id('scroll_zoomScale_undefined')
        .zoomScale(undefined)
        .width('30%')
        .height('100%')
        .backgroundColor(0xF0F0F0)
      }
      .width('100%')
      .height('10%')
      .justifyContent(FlexAlign.SpaceEvenly)
      .margin({ bottom: 2 })

      // ========== enableBouncesZoom tests ==========
      Text('enableBouncesZoom')
      Row() {
        // Test enableBouncesZoom default value
        Scroll() {
          Image($r('app.media.icon'))
            .id('img_nullZoom')
            .width('90%')
            .height('100%')
        }
        .id('scroll_enableBouncesZoom_default')
        .width('30%')
        .height('100%')
        .backgroundColor(0xF0F0F0)

        // Test enableBouncesZoom with null
        Scroll() {
          Image($r('app.media.icon'))
            .id('img_nullZoom')
            .width('90%')
            .height('100%')
        }
        .id('scroll_enableBouncesZoom_null')
        .enableBouncesZoom(null)
        .width('30%')
        .height('100%')
        .backgroundColor(0xF0F0F0)

        // Test enableBouncesZoom with undefined
        Scroll() {
          Image($r('app.media.icon'))
            .id('img_nullZoom')
            .width('90%')
            .height('100%')
        }
        .id('scroll_enableBouncesZoom_undefined')
        .enableBouncesZoom(undefined)
        .width('30%')
        .height('100%')
        .backgroundColor(0xF0F0F0)
      }
      .width('100%')
      .height('10%')
      .justifyContent(FlexAlign.SpaceEvenly)
      .margin({ bottom: 2 })

      // ========== scrollBar tests ==========
      Text('scrollBar')
      Row() {
        // Test scrollBar default value
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
        .id('scroll_scrollBar_default')
        .width('30%')
        .height('100%')
        .backgroundColor(0xF0F0F0)

        // Test scrollBar with null
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
        .id('scroll_scrollBar_null')
        .scrollBar(null)
        .width('30%')
        .height('100%')
        .backgroundColor(0xF0F0F0)

        // Test scrollBar with undefined
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
        .id('scroll_scrollBar_undefined')
        .scrollBar(undefined)
        .width('30%')
        .height('100%')
        .backgroundColor(0xF0F0F0)
      }
      .width('100%')
      .height('10%')
      .justifyContent(FlexAlign.SpaceEvenly)
      .margin({ bottom: 2 })

      // ========== scrollBarColor tests ==========
      Text('scrollBarColor')
      Row() {
        // Test scrollBarColor default value
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
        .id('scroll_scrollBarColor_default')
        .scrollBar(BarState.On)
        .scrollBarWidth(10)
        .width('20%')
        .height('100%')
        .backgroundColor(0xF0F0F0)

        // Test scrollBarColor with null
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
        .id('scroll_scrollBarColor_null')
        .scrollBarColor(null)
        .scrollBar(BarState.On)
        .scrollBarWidth(10)
        .width('20%')
        .height('100%')
        .backgroundColor(0xF0F0F0)

        // Test scrollBarColor with undefined
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
        .id('scroll_scrollBarColor_undefined')
        .scrollBarColor(undefined)
        .scrollBar(BarState.On)
        .scrollBarWidth(10)
        .width('20%')
        .height('100%')
        .backgroundColor(0xF0F0F0)

        // Test scrollBarColor with empty string
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
        .id('scroll_scrollBarColor_emptyString')
        .scrollBarColor('')
        .scrollBar(BarState.On)
        .scrollBarWidth(10)
        .width('20%')
        .height('100%')
        .backgroundColor(0xF0F0F0)

        // Test scrollBarColor with number
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
        .id('scroll_scrollBarColor_number')
        .scrollBarColor(0xFFF000)
        .scrollBar(BarState.On)
        .scrollBarWidth(10)
        .width('20%')
        .height('100%')
        .backgroundColor(0xF0F0F0)
      }
      .width('100%')
      .height('10%')
      .justifyContent(FlexAlign.SpaceEvenly)
      .margin({ bottom: 2 })

      // ========== scrollBarWidth tests ==========
      Text('scrollBarWidth')
      Row() {
        // Test scrollBarWidth default value
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
        .id('scroll_scrollBarWidth_default')
        .scrollBar(BarState.On)
        .width('23%')
        .height('100%')
        .backgroundColor(0xF0F0F0)

        // Test scrollBarWidth with null
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
        .id('scroll_scrollBarWidth_null')
        .scrollBarWidth(null)
        .scrollBar(BarState.On)
        .width('23%')
        .height('100%')
        .backgroundColor(0xF0F0F0)

        // Test scrollBarWidth with undefined
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
        .id('scroll_scrollBarWidth_undefined')
        .scrollBarWidth(undefined)
        .scrollBar(BarState.On)
        .width('23%')
        .height('100%')
        .backgroundColor(0xF0F0F0)

        // Test scrollBarWidth with empty string
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
        .id('scroll_scrollBarWidth_emptyString')
        .scrollBarWidth('')
        .scrollBar(BarState.On)
        .width('23%')
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