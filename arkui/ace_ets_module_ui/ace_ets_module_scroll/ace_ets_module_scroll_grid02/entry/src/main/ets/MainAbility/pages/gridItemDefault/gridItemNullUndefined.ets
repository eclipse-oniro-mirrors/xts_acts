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
struct GridItemNullUndefinedExample {
  @State numbers: string[] = []

  aboutToAppear() {
    for (let i = 1; i <= 9; i++) {
      this.numbers.push(i + '')
    }
  }

  build() {
    Column() {
      // ========== rowStart tests (number) ==========
      Text('rowStart')
      Row() {
        // Test rowStart default value
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
            .id('gridItem_rowStart_default')
          }, (item: number) => item.toString())
        }
        .width('25%')
        .height('100%')
        .backgroundColor(0xF0F0F0)
        .columnsTemplate('1fr 1fr 1fr')
        .rowsTemplate('1fr 1fr 1fr')

        // Test rowStart with null
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
            .rowStart(null)
            .id('gridItem_rowStart_null')
          }, (item: number) => item.toString())
        }
        .width('25%')
        .height('100%')
        .backgroundColor(0xF0F0F0)
        .columnsTemplate('1fr 1fr 1fr')
        .rowsTemplate('1fr 1fr 1fr')

        // Test rowStart with undefined
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
            .rowStart(undefined)
            .id('gridItem_rowStart_undefined')
          }, (item: number) => item.toString())
        }
        .width('25%')
        .height('100%')
        .backgroundColor(0xF0F0F0)
        .columnsTemplate('1fr 1fr 1fr')
        .rowsTemplate('1fr 1fr 1fr')
      }
      .width('100%')
      .height('10%')
      .justifyContent(FlexAlign.SpaceEvenly)
      .margin({ bottom: 2 })

      // ========== rowEnd tests (number) ==========
      Text('rowEnd')
      Row() {
        // Test rowEnd default value
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
            .id('gridItem_rowEnd_default')
          }, (item: number) => item.toString())
        }
        .width('25%')
        .height('100%')
        .backgroundColor(0xF0F0F0)
        .columnsTemplate('1fr 1fr 1fr')
        .rowsTemplate('1fr 1fr 1fr')

        // Test rowEnd with null
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
            .rowEnd(null)
            .id('gridItem_rowEnd_null')
          }, (item: number) => item.toString())
        }
        .width('25%')
        .height('100%')
        .backgroundColor(0xF0F0F0)
        .columnsTemplate('1fr 1fr 1fr')
        .rowsTemplate('1fr 1fr 1fr')

        // Test rowEnd with undefined
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
            .rowEnd(undefined)
            .id('gridItem_rowEnd_undefined')
          }, (item: number) => item.toString())
        }
        .width('25%')
        .height('100%')
        .backgroundColor(0xF0F0F0)
        .columnsTemplate('1fr 1fr 1fr')
        .rowsTemplate('1fr 1fr 1fr')
      }
      .width('100%')
      .height('10%')
      .justifyContent(FlexAlign.SpaceEvenly)
      .margin({ bottom: 2 })

      // ========== columnStart tests (number) ==========
      Text('columnStart')
      Row() {
        // Test columnStart default value
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
            .id('gridItem_columnStart_default')
          }, (item: number) => item.toString())
        }
        .width('25%')
        .height('100%')
        .backgroundColor(0xF0F0F0)
        .columnsTemplate('1fr 1fr 1fr')
        .rowsTemplate('1fr 1fr 1fr')

        // Test columnStart with null
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
            .columnStart(null)
            .id('gridItem_columnStart_null')
          }, (item: number) => item.toString())
        }
        .width('25%')
        .height('100%')
        .backgroundColor(0xF0F0F0)
        .columnsTemplate('1fr 1fr 1fr')
        .rowsTemplate('1fr 1fr 1fr')

        // Test columnStart with undefined
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
            .columnStart(undefined)
            .id('gridItem_columnStart_undefined')
          }, (item: number) => item.toString())
        }
        .width('25%')
        .height('100%')
        .backgroundColor(0xF0F0F0)
        .columnsTemplate('1fr 1fr 1fr')
        .rowsTemplate('1fr 1fr 1fr')
      }
      .width('100%')
      .height('10%')
      .justifyContent(FlexAlign.SpaceEvenly)
      .margin({ bottom: 2 })

      // ========== columnEnd tests (number) ==========
      Text('columnEnd')
      Row() {
        // Test columnEnd default value
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
            .id('gridItem_columnEnd_default')
          }, (item: number) => item.toString())
        }
        .width('25%')
        .height('100%')
        .backgroundColor(0xF0F0F0)
        .columnsTemplate('1fr 1fr 1fr')
        .rowsTemplate('1fr 1fr 1fr')

        // Test columnEnd with null
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
            .columnEnd(null)
            .id('gridItem_columnEnd_null')
          }, (item: number) => item.toString())
        }
        .width('25%')
        .height('100%')
        .backgroundColor(0xF0F0F0)
        .columnsTemplate('1fr 1fr 1fr')
        .rowsTemplate('1fr 1fr 1fr')

        // Test columnEnd with undefined
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
            .columnEnd(undefined)
            .id('gridItem_columnEnd_undefined')
          }, (item: number) => item.toString())
        }
        .width('25%')
        .height('100%')
        .backgroundColor(0xF0F0F0)
        .columnsTemplate('1fr 1fr 1fr')
        .rowsTemplate('1fr 1fr 1fr')
      }
      .width('100%')
      .height('10%')
      .justifyContent(FlexAlign.SpaceEvenly)
      .margin({ bottom: 2 })

      // ========== selectable tests (boolean) ==========
      Text('selectable')
      Row() {
        // Test selectable default value
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
            .id('gridItem_selectable_default')
          }, (item: number) => item.toString())
        }
        .width('25%')
        .height('100%')
        .backgroundColor(0xF0F0F0)
        .columnsTemplate('1fr 1fr 1fr')
        .rowsTemplate('1fr 1fr 1fr')

        // Test selectable with null
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
            .selectable(null)
            .id('gridItem_selectable_null')
          }, (item: number) => item.toString())
        }
        .width('25%')
        .height('100%')
        .backgroundColor(0xF0F0F0)
        .columnsTemplate('1fr 1fr 1fr')
        .rowsTemplate('1fr 1fr 1fr')

        // Test selectable with undefined
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
            .selectable(undefined)
            .id('gridItem_selectable_undefined')
          }, (item: number) => item.toString())
        }
        .width('25%')
        .height('100%')
        .backgroundColor(0xF0F0F0)
        .columnsTemplate('1fr 1fr 1fr')
        .rowsTemplate('1fr 1fr 1fr')
      }
      .width('100%')
      .height('10%')
      .justifyContent(FlexAlign.SpaceEvenly)
      .margin({ bottom: 2 })

      // ========== selected tests (boolean) ==========
      Text('selected')
      Row() {
        // Test selected default value
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
            .id('gridItem_selected_default')
          }, (item: number) => item.toString())
        }
        .width('25%')
        .height('100%')
        .backgroundColor(0xF0F0F0)
        .columnsTemplate('1fr 1fr 1fr')
        .rowsTemplate('1fr 1fr 1fr')

        // Test selected with null
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
            .selected(null)
            .id('gridItem_selected_null')
          }, (item: number) => item.toString())
        }
        .width('25%')
        .height('100%')
        .backgroundColor(0xF0F0F0)
        .columnsTemplate('1fr 1fr 1fr')
        .rowsTemplate('1fr 1fr 1fr')

        // Test selected with undefined
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
            .selected(undefined)
            .id('gridItem_selected_undefined')
          }, (item: number) => item.toString())
        }
        .width('25%')
        .height('100%')
        .backgroundColor(0xF0F0F0)
        .columnsTemplate('1fr 1fr 1fr')
        .rowsTemplate('1fr 1fr 1fr')
      }
      .width('100%')
      .height('10%')
      .justifyContent(FlexAlign.SpaceEvenly)
      .margin({ bottom: 2 })

      // ========== GridItemOptions (style) tests ==========
      Text('GridItemOptions')
      Row() {
        // Test GridItemOptions default value
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
            .id('gridItem_options_default')
          }, (item: number) => item.toString())
        }
        .width('25%')
        .height('100%')
        .backgroundColor(0xF0F0F0)
        .columnsTemplate('1fr 1fr 1fr')
        .rowsTemplate('1fr 1fr 1fr')

        // Test GridItemOptions with null
        Grid() {
          ForEach([1, 2, 3], (item: number) => {
            GridItem({style:null}) {
              Text('' + item)
                .width(40)
                .height(40)
                .fontSize(14)
                .textAlign(TextAlign.Center)
                .backgroundColor(0xF9CF93)
            }
            .id('gridItem_options_null')
          }, (item: number) => item.toString())
        }
        .width('25%')
        .height('100%')
        .backgroundColor(0xF0F0F0)
        .columnsTemplate('1fr 1fr 1fr')
        .rowsTemplate('1fr 1fr 1fr')

        // Test GridItemOptions with undefined
        Grid() {
          ForEach([1, 2, 3], (item: number) => {
            GridItem({style:undefined}) {
              Text('' + item)
                .width(40)
                .height(40)
                .fontSize(14)
                .textAlign(TextAlign.Center)
                .backgroundColor(0xF9CF93)
            }
            .id('gridItem_options_undefined')
          }, (item: number) => item.toString())
        }
        .width('25%')
        .height('100%')
        .backgroundColor(0xF0F0F0)
        .columnsTemplate('1fr 1fr 1fr')
        .rowsTemplate('1fr 1fr 1fr')
      }
      .width('100%')
      .height('10%')
      .justifyContent(FlexAlign.SpaceEvenly)
      .margin({ bottom: 2 })
    }
    .width('100%')
    .height('100%')
    .backgroundColor(0xDCDCDC)
    .padding({ top: 5 })
  }
}