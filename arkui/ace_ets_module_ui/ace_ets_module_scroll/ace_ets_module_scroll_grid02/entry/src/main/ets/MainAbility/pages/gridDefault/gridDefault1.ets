/**
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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
struct GridNullUndefined1 {
  @State numbers: string[] = []

  aboutToAppear() {
    for (let i = 1;i <= 30; i++) {
      this.numbers.push(i + '')
    }
  }

  build() {
    Column() {
      // ========== columnsTemplate tests (string) ==========
      Text('columnsTemplate')
      Row() {
        // Test columnsTemplate default value
        Grid() {
          ForEach([1, 2, 3], (item: number) => {
            GridItem() {
              Text('' + item)
                .width(40)
                .height(40)
                .fontSize(14)
                .textAlign(TextAlign.Center)
                .backgroundColor(0xF9CF93)
            }
          }, (item: number) => item.toString())
        }
        .width('25%')
        .height('100%')
        .id('grid_columnsTemplate_default')
        .backgroundColor(0xF0F0F0)

        // Test columnsTemplate with empty string
        Grid() {
          ForEach([1, 2, 3], (item: number) => {
            GridItem() {
              Text('' + item)
                .width(40)
                .height(40)
                .fontSize(14)
                .textAlign(TextAlign.Center)
                .backgroundColor(0xF9CF93)
            }
          }, (item: number) => item.toString())
        }
        .width('25%')
        .height('100%')
        .id('grid_columnsTemplate_emptyString')
        .backgroundColor(0xF0F0F0)
        .columnsTemplate('')

        // Test columnsTemplate with null
        Grid() {
          ForEach([1, 2, 3], (item: number) => {
            GridItem() {
              Text('' + item)
                .width(40)
                .height(40)
                .fontSize(14)
                .textAlign(TextAlign.Center)
                .backgroundColor(0xF9CF93)
            }
          }, (item: number) => item.toString())
        }
        .width('25%')
        .height('100%')
        .id('grid_columnsTemplate_null')
        .backgroundColor(0xF0F0F0)
        .columnsTemplate(null)

        // Test columnsTemplate with undefined
        Grid() {
          ForEach([1, 2, 3], (item: number) => {
            GridItem() {
              Text('' + item)
                .width(40)
                .height(40)
                .fontSize(14)
                .textAlign(TextAlign.Center)
                .backgroundColor(0xF9CF93)
            }
          }, (item: number) => item.toString())
        }
        .width('25%')
        .height('100%')
        .id('grid_columnsTemplate_undefined')
        .backgroundColor(0xF0F0F0)
        .columnsTemplate(undefined)
      }
      .width('100%')
      .height('10%')
      .justifyContent(FlexAlign.SpaceEvenly)
      .margin({ bottom: 2 })

      // ========== rowsTemplate tests (string) ==========
      Text('rowsTemplate')
      Row() {
        // Test rowsTemplate default value
        Grid() {
          ForEach([1, 2, 3], (item: number) => {
            GridItem() {
              Text('' + item)
                .width(40)
                .height(40)
                .fontSize(14)
                .textAlign(TextAlign.Center)
                .backgroundColor(0xF9CF93)
            }
          }, (item: number) => item.toString())
        }
        .width('25%')
        .height('100%')
        .id('grid_rowsTemplate_default')
        .backgroundColor(0xF0F0F0)

        // Test rowsTemplate with empty string
        Grid() {
          ForEach([1, 2, 3], (item: number) => {
            GridItem() {
              Text('' + item)
                .width(40)
                .height(40)
                .fontSize(14)
                .textAlign(TextAlign.Center)
                .backgroundColor(0xF9CF93)
            }
          }, (item: number) => item.toString())
        }
        .width('25%')
        .height('100%')
        .id('grid_rowsTemplate_emptyString')
        .backgroundColor(0xF0F0F0)
        .rowsTemplate('')

        // Test rowsTemplate with null
        Grid() {
          ForEach([1, 2, 3], (item: number) => {
            GridItem() {
              Text('' + item)
                .width(40)
                .height(40)
                .fontSize(14)
                .textAlign(TextAlign.Center)
                .backgroundColor(0xF9CF93)
            }
          }, (item: number) => item.toString())
        }
        .width('25%')
        .height('100%')
        .id('grid_rowsTemplate_null')
        .backgroundColor(0xF0F0F0)
        .rowsTemplate(null)

        // Test rowsTemplate with undefined
        Grid() {
          ForEach([1, 2, 3], (item: number) => {
            GridItem() {
              Text('' + item)
                .width(40)
                .height(40)
                .fontSize(14)
                .textAlign(TextAlign.Center)
                .backgroundColor(0xF9CF93)
            }
          }, (item: number) => item.toString())
        }
        .width('25%')
        .height('100%')
        .id('grid_rowsTemplate_undefined')
        .backgroundColor(0xF0F0F0)
        .rowsTemplate(undefined)
      }
      .width('100%')
      .height('10%')
      .justifyContent(FlexAlign.SpaceEvenly)
      .margin({ bottom: 2 })

      // ========== columnsGap tests ==========
      Text('columnsGap')
      Row() {
        // Test columnsGap default value
        Grid() {
          ForEach([1, 2, 3], (item: number) => {
            GridItem() {
              Text('' + item)
                .width('100%')
                .height('100%')
                .fontSize(14)
                .textAlign(TextAlign.Center)
                .backgroundColor(0xF9CF93)
            }
          }, (item: number) => item.toString())
        }
        .columnsTemplate('1fr 1fr 1fr')
        .width('30%')
        .height('100%')
        .id('grid_columnsGap_default')
        .backgroundColor(0xF0F0F0)

        // Test columnsGap with null
        Grid() {
          ForEach([1, 2, 3], (item: number) => {
            GridItem() {
              Text('' + item)
                .width('100%')
                .height('100%')
                .fontSize(14)
                .textAlign(TextAlign.Center)
                .backgroundColor(0xF9CF93)
            }
          }, (item: number) => item.toString())
        }
        .columnsTemplate('1fr 1fr 1fr')
        .width('30%')
        .height('100%')
        .id('grid_columnsGap_null')
        .backgroundColor(0xF0F0F0)
        .columnsGap(null)

        // Test columnsGap with undefined
        Grid() {
          ForEach([1, 2, 3], (item: number) => {
            GridItem() {
              Text('' + item)
                .width('100%')
                .height('100%')
                .fontSize(14)
                .textAlign(TextAlign.Center)
                .backgroundColor(0xF9CF93)
            }
          }, (item: number) => item.toString())
        }
        .columnsTemplate('1fr 1fr 1fr')
        .width('30%')
        .height('100%')
        .id('grid_columnsGap_undefined')
        .backgroundColor(0xF0F0F0)
        .columnsGap(undefined)
      }
      .width('100%')
      .height('10%')
      .justifyContent(FlexAlign.SpaceEvenly)
      .margin({ bottom: 2 })

      // ========== rowsGap tests ==========
      Text('rowsGap')
      Row() {
        // Test rowsGap default value
        Grid() {
          ForEach([1, 2, 3, 4, 5, 6], (item: number) => {
            GridItem() {
              Text('' + item)
                .width('100%')
                .height('50%')
                .fontSize(14)
                .textAlign(TextAlign.Center)
                .backgroundColor(0xF9CF93)
            }
          }, (item: number) => item.toString())
        }
        .columnsTemplate('1fr 1fr')
        .width('30%')
        .height('100%')
        .id('grid_rowsGap_default')
        .backgroundColor(0xF0F0F0)

        // Test rowsGap with null
        Grid() {
          ForEach([1, 2, 3, 4, 5, 6], (item: number) => {
            GridItem() {
              Text('' + item)
                .width('100%')
                .height('50%')
                .fontSize(14)
                .textAlign(TextAlign.Center)
                .backgroundColor(0xF9CF93)
            }
          }, (item: number) => item.toString())
        }
        .columnsTemplate('1fr 1fr')
        .width('30%')
        .height('100%')
        .id('grid_rowsGap_null')
        .backgroundColor(0xF0F0F0)
        .rowsGap(null)

        // Test rowsGap with undefined
        Grid() {
          ForEach([1, 2, 3, 4, 5, 6], (item: number) => {
            GridItem() {
              Text('' + item)
                .width('100%')
                .height('50%')
                .fontSize(14)
                .textAlign(TextAlign.Center)
                .backgroundColor(0xF9CF93)
            }
          }, (item: number) => item.toString())
        }
        .columnsTemplate('1fr 1fr')
        .width('30%')
        .height('100%')
        .id('grid_rowsGap_undefined')
        .backgroundColor(0xF0F0F0)
        .rowsGap(undefined)
      }
      .width('100%')
      .height('10%')
      .justifyContent(FlexAlign.SpaceEvenly)
      .margin({ bottom: 2 })

      // ========== scrollBarWidth tests (number|string) ==========
      Text('scrollBarWidth')
      Row() {
        // Test scrollBarWidth default value
        Grid() {
          ForEach(this.numbers, (item: string) => {
            GridItem() {
              Text('' + item)
                .width('100%')
                .height('30%')
                .fontSize(14)
                .textAlign(TextAlign.Center)
                .backgroundColor(0xF9CF93)
            }
          }, (item: string) => item)
        }
        .scrollBar(BarState.On)
        .columnsTemplate('1fr 1fr')
        .width('25%')
        .height('100%')
        .id('grid_scrollBarWidth_default')
        .backgroundColor(0xF0F0F0)

        // Test scrollBarWidth with empty string
        Grid() {
          ForEach(this.numbers, (item: string) => {
            GridItem() {
              Text('' + item)
                .width('100%')
                .height('30%')
                .fontSize(14)
                .textAlign(TextAlign.Center)
                .backgroundColor(0xF9CF93)
            }
          }, (item: string) => item)
        }
        .scrollBar(BarState.On)
        .scrollBarWidth('')
        .columnsTemplate('1fr 1fr')
        .width('25%')
        .height('100%')
        .id('grid_scrollBarWidth_emptyString')
        .backgroundColor(0xF0F0F0)

        // Test scrollBarWidth with null
        Grid() {
          ForEach(this.numbers, (item: string) => {
            GridItem() {
              Text('' + item)
                .width('100%')
                .height('30%')
                .fontSize(14)
                .textAlign(TextAlign.Center)
                .backgroundColor(0xF9CF93)
            }
          }, (item: string) => item)
        }
        .scrollBar(BarState.On)
        .scrollBarWidth(null)
        .columnsTemplate('1fr 1fr')
        .width('25%')
        .height('100%')
        .id('grid_scrollBarWidth_null')
        .backgroundColor(0xF0F0F0)

        // Test scrollBarWidth with undefined
        Grid() {
          ForEach(this.numbers, (item: string) => {
            GridItem() {
              Text('' + item)
                .width('100%')
                .height('30%')
                .fontSize(14)
                .textAlign(TextAlign.Center)
                .backgroundColor(0xF9CF93)
            }
          }, (item: string) => item)
        }
        .scrollBar(BarState.On)
        .scrollBarWidth(undefined)
        .columnsTemplate('1fr 1fr')
        .width('25%')
        .height('100%')
        .id('grid_scrollBarWidth_undefined')
        .backgroundColor(0xF0F0F0)
      }
      .width('100%')
      .height('10%')
      .justifyContent(FlexAlign.SpaceEvenly)
      .margin({ bottom: 2 })

      // ========== scrollBarColor tests (Color|number|string) ==========
      Text('scrollBarColor')
      Row() {
        // Test scrollBarColor default value
        Grid() {
          ForEach(this.numbers, (item: string) => {
            GridItem() {
              Text('' + item)
                .width('100%')
                .height('30%')
                .fontSize(14)
                .textAlign(TextAlign.Center)
                .backgroundColor(0xF9CF93)
            }
          }, (item: string) => item)
        }
        .scrollBar(BarState.On)
        .scrollBarWidth(10)
        .columnsTemplate('1fr 1fr')
        .width('20%')
        .height('100%')
        .id('grid_scrollBarColor_default')
        .backgroundColor(0xF0F0F0)

        // Test scrollBarColor with empty string
        Grid() {
          ForEach(this.numbers, (item: string) => {
            GridItem() {
              Text('' + item)
                .width('100%')
                .height('30%')
                .fontSize(14)
                .textAlign(TextAlign.Center)
                .backgroundColor(0xF9CF93)
            }
          }, (item: string) => item)
        }
        .scrollBar(BarState.On)
        .scrollBarWidth(10)
        .scrollBarColor('')
        .columnsTemplate('1fr 1fr')
        .width('20%')
        .height('100%')
        .id('grid_scrollBarColor_emptyString')
        .backgroundColor(0xF0F0F0)

        // Test scrollBarColor with null
        Grid() {
          ForEach(this.numbers, (item: string) => {
            GridItem() {
              Text('' + item)
                .width('100%')
                .height('30%')
                .fontSize(14)
                .textAlign(TextAlign.Center)
                .backgroundColor(0xF9CF93)
            }
          }, (item: string) => item)
        }
        .scrollBar(BarState.On)
        .scrollBarWidth(10)
        .scrollBarColor(null)
        .columnsTemplate('1fr 1fr')
        .width('20%')
        .height('100%')
        .id('grid_scrollBarColor_null')
        .backgroundColor(0xF0F0F0)

        // Test scrollBarColor with undefined
        Grid() {
          ForEach(this.numbers, (item: string) => {
            GridItem() {
              Text('' + item)
                .width('100%')
                .height('30%')
                .fontSize(14)
                .textAlign(TextAlign.Center)
                .backgroundColor(0xF9CF93)
            }
          }, (item: string) => item)
        }
        .scrollBar(BarState.On)
        .scrollBarWidth(10)
        .scrollBarColor(undefined)
        .columnsTemplate('1fr 1fr')
        .width('20%')
        .height('100%')
        .id('grid_scrollBarColor_undefined')
        .backgroundColor(0xF0F0F0)

        // Test scrollBarColor with number
        Grid() {
          ForEach(this.numbers, (item: string) => {
            GridItem() {
              Text('' + item)
                .width('100%')
                .height('30%')
                .fontSize(14)
                .textAlign(TextAlign.Center)
                .backgroundColor(0xF9CF93)
            }
          }, (item: string) => item)
        }
        .scrollBar(BarState.On)
        .scrollBarWidth(10)
        .scrollBarColor(0xFFF000)
        .columnsTemplate('1fr 1fr')
        .width('20%')
        .height('100%')
        .id('grid_scrollBarColor_number')
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
        Grid() {
          ForEach(this.numbers, (item: string) => {
            GridItem() {
              Text('' + item)
                .width('100%')
                .height('30%')
                .fontSize(14)
                .textAlign(TextAlign.Center)
                .backgroundColor(0xF9CF93)
            }
          }, (item: string) => item)
        }
        .columnsTemplate('1fr 1fr')
        .width('30%')
        .height('100%')
        .id('grid_scrollBar_default')
        .backgroundColor(0xF0F0F0)

        // Test scrollBar with null
        Grid() {
          ForEach(this.numbers, (item: string) => {
            GridItem() {
              Text('' + item)
                .width('100%')
                .height('30%')
                .fontSize(14)
                .textAlign(TextAlign.Center)
                .backgroundColor(0xF9CF93)
            }
          }, (item: string) => item)
        }
        .columnsTemplate('1fr 1fr')
        .width('30%')
        .height('100%')
        .id('grid_scrollBar_null')
        .backgroundColor(0xF0F0F0)
        .scrollBar(null)

        // Test scrollBar with undefined
        Grid() {
          ForEach(this.numbers, (item: string) => {
            GridItem() {
              Text('' + item)
                .width('100%')
                .height('30%')
                .fontSize(14)
                .textAlign(TextAlign.Center)
                .backgroundColor(0xF9CF93)
            }
          }, (item: string) => item)
        }
        .columnsTemplate('1fr 1fr')
        .width('30%')
        .height('100%')
        .id('grid_scrollBar_undefined')
        .backgroundColor(0xF0F0F0)
        .scrollBar(undefined)
      }
      .width('100%')
      .height('10%')
      .justifyContent(FlexAlign.SpaceEvenly)
      .margin({ bottom: 2 })

      // ========== cachedCount tests ==========
      Text('cachedCount')
      Row() {
        // Test cachedCount default value
        Grid() {
          ForEach(this.numbers, (item: string) => {
            GridItem() {
              Text('' + item)
                .width('100%')
                .height('30%')
                .fontSize(14)
                .textAlign(TextAlign.Center)
                .backgroundColor(0xF9CF93)
            }
          }, (item: string) => item)
        }
        .columnsTemplate('1fr 1fr')
        .width('23%')
        .height('80%')
        .id('grid_cachedCount_default')
        .backgroundColor(0xF0F0F0)

        // Test cachedCount with null
        Grid() {
          ForEach(this.numbers, (item: string) => {
            GridItem() {
              Text('' + item)
                .width('100%')
                .height('30%')
                .fontSize(14)
                .textAlign(TextAlign.Center)
                .backgroundColor(0xF9CF93)
            }
          }, (item: string) => item)
        }
        .columnsTemplate('1fr 1fr')
        .width('23%')
        .height('80%')
        .id('grid_cachedCount_null')
        .backgroundColor(0xF0F0F0)
        .cachedCount(null)

        // Test cachedCount with undefined
        Grid() {
          ForEach(this.numbers, (item: string) => {
            GridItem() {
              Text('' + item)
                .width('100%')
                .height('30%')
                .fontSize(14)
                .textAlign(TextAlign.Center)
                .backgroundColor(0xF9CF93)
            }
          }, (item: string) => item)
        }
        .columnsTemplate('1fr 1fr')
        .width('23%')
        .height('80%')
        .id('grid_cachedCount_undefined')
        .backgroundColor(0xF0F0F0)
        .cachedCount(undefined)

        // Test cachedCount show with false
        Grid() {
          ForEach(this.numbers, (item: string) => {
            GridItem() {
              Text('' + item)
                .width('100%')
                .height('30%')
                .fontSize(14)
                .textAlign(TextAlign.Center)
                .backgroundColor(0xF9CF93)
            }
          }, (item: string) => item)
        }
        .columnsTemplate('1fr 1fr')
        .width('23%')
        .height('80%')
        .id('grid_cachedCount_show_false')
        .backgroundColor(0xF0F0F0)
        .cachedCount(2, false)
      }
      .width('100%')
      .height('10%')
      .justifyContent(FlexAlign.SpaceEvenly)
    }
    .width('100%')
    .height('100%')
    .backgroundColor(0xDCDCDC)
    .padding({ top: 5 })
  }
}