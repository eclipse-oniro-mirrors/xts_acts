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
struct GridNullUndefined3 {
  @State numbers: string[] = []

  aboutToAppear() {
    for (let i = 1; i <= 20; i++) {
      this.numbers.push(i + '')
    }
  }

  build() {
    Scroll() {
      Column() {
        // ========== nestedScroll tests ==========
        Text('nestedScroll')
        Row() {
          // Test nestedScroll default value
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
          .columnsTemplate('1fr 1fr')
          .width('30%')
          .height('100%')
          .id('grid_nestedScroll_default')
          .backgroundColor(0xF0F0F0)

          // Test nestedScroll with null
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
          .columnsTemplate('1fr 1fr')
          .width('30%')
          .height('100%')
          .id('grid_nestedScroll_null')
          .backgroundColor(0xF0F0F0)
          .nestedScroll(null)

          // Test nestedScroll with undefined
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
          .columnsTemplate('1fr 1fr')
          .width('30%')
          .height('100%')
          .id('grid_nestedScroll_undefined')
          .backgroundColor(0xF0F0F0)
          .nestedScroll(undefined)
        }
        .width('100%')
        .height('10%')
        .justifyContent(FlexAlign.SpaceEvenly)
        .margin({ bottom: 2 })

        // ========== enableScrollInteraction tests (boolean) ==========
        Text('enableScrollInteraction')
        Row() {
          // Test enableScrollInteraction default value
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
          .columnsTemplate('1fr 1fr')
          .width('23%')
          .height('100%')
          .id('grid_enableScrollInteraction_default')
          .backgroundColor(0xF0F0F0)

          // Test enableScrollInteraction with null
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
          .columnsTemplate('1fr 1fr')
          .width('23%')
          .height('100%')
          .id('grid_enableScrollInteraction_null')
          .backgroundColor(0xF0F0F0)
          .enableScrollInteraction(null)

          // Test enableScrollInteraction with undefined
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
          .columnsTemplate('1fr 1fr')
          .width('23%')
          .height('100%')
          .id('grid_enableScrollInteraction_undefined')
          .backgroundColor(0xF0F0F0)
          .enableScrollInteraction(undefined)

          // Test enableScrollInteraction with false
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
          .columnsTemplate('1fr 1fr')
          .width('23%')
          .height('100%')
          .id('grid_enableScrollInteraction_false')
          .backgroundColor(0xF0F0F0)
          .enableScrollInteraction(false)
        }
        .width('100%')
        .height('10%')
        .justifyContent(FlexAlign.SpaceEvenly)
        .margin({ bottom: 2 })

        // ========== friction tests ==========
        Text('friction')
        Row() {
          // Test friction default value
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
          .columnsTemplate('1fr 1fr')
          .width('30%')
          .height('100%')
          .id('grid_friction_default')
          .backgroundColor(0xF0F0F0)

          // Test friction with null
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
          .columnsTemplate('1fr 1fr')
          .width('30%')
          .height('100%')
          .id('grid_friction_null')
          .backgroundColor(0xF0F0F0)
          .friction(null)

          // Test friction with undefined
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
          .columnsTemplate('1fr 1fr')
          .width('30%')
          .height('100%')
          .id('grid_friction_undefined')
          .backgroundColor(0xF0F0F0)
          .friction(undefined)
        }
        .width('100%')
        .height('10%')
        .justifyContent(FlexAlign.SpaceEvenly)
        .margin({ bottom: 2 })

        // ========== alignItems tests ==========
        Text('alignItems')
        Row() {
          // Test alignItems default value
          Grid() {
            ForEach([1, 2, 3, 4, 5, 6], (item: number) => {
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
          .columnsTemplate('1fr 1fr')
          .rowsTemplate('1fr 1fr 1fr')
          .width('30%')
          .height('100%')
          .id('grid_alignItems_default')
          .backgroundColor(0xF0F0F0)

          // Test alignItems with null
          Grid() {
            ForEach([1, 2, 3, 4, 5, 6], (item: number) => {
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
          .columnsTemplate('1fr 1fr')
          .rowsTemplate('1fr 1fr 1fr')
          .width('30%')
          .height('100%')
          .id('grid_alignItems_null')
          .backgroundColor(0xF0F0F0)
          .alignItems(null)

          // Test alignItems with undefined
          Grid() {
            ForEach([1, 2, 3, 4, 5, 6], (item: number) => {
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
          .columnsTemplate('1fr 1fr')
          .rowsTemplate('1fr 1fr 1fr')
          .width('30%')
          .height('100%')
          .id('grid_alignItems_undefined')
          .backgroundColor(0xF0F0F0)
          .alignItems(undefined)
        }
        .width('100%')
        .height('10%')
        .justifyContent(FlexAlign.SpaceEvenly)
        .margin({ bottom: 2 })

        // ========== focusWrapMode tests ==========
        Text('focusWrapMode')
        Row() {
          // Test focusWrapMode default value
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
          .columnsTemplate('1fr 1fr')
          .width('30%')
          .height('100%')
          .id('grid_focusWrapMode_default')
          .backgroundColor(0xF0F0F0)

          // Test focusWrapMode with null
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
          .columnsTemplate('1fr 1fr')
          .width('30%')
          .height('100%')
          .id('grid_focusWrapMode_null')
          .backgroundColor(0xF0F0F0)
          .focusWrapMode(null)

          // Test focusWrapMode with undefined
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
          .columnsTemplate('1fr 1fr')
          .width('30%')
          .height('100%')
          .id('grid_focusWrapMode_undefined')
          .backgroundColor(0xF0F0F0)
          .focusWrapMode(undefined)
        }
        .width('100%')
        .height('10%')
        .justifyContent(FlexAlign.SpaceEvenly)
        .margin({ bottom: 2 })

        // ========== syncLoad tests (boolean) ==========
        Text('syncLoad')
        Row() {
          // Test syncLoad default value
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
          .columnsTemplate('1fr 1fr')
          .width('30%')
          .height('100%')
          .id('grid_syncLoad_default')
          .backgroundColor(0xF0F0F0)

          // Test syncLoad with null
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
          .columnsTemplate('1fr 1fr')
          .width('30%')
          .height('100%')
          .id('grid_syncLoad_null')
          .backgroundColor(0xF0F0F0)
          .syncLoad(null)

          // Test syncLoad with undefined
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
          .columnsTemplate('1fr 1fr')
          .width('30%')
          .height('100%')
          .id('grid_syncLoad_undefined')
          .backgroundColor(0xF0F0F0)
          .syncLoad(undefined)
        }
        .width('100%')
        .height('10%')
        .justifyContent(FlexAlign.SpaceEvenly)
        .margin({ bottom: 2 })

        // ========== editModeOptions tests ==========
        Text('editModeOptions')
        Row() {
          // Test editModeOptions default value
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
          .columnsTemplate('1fr 1fr')
          .width('30%')
          .height('100%')
          .id('grid_editModeOptions_default')
          .backgroundColor(0xF0F0F0)

          // Test editModeOptions with null
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
          .columnsTemplate('1fr 1fr')
          .width('30%')
          .height('100%')
          .id('grid_editModeOptions_null')
          .backgroundColor(0xF0F0F0)
          .editModeOptions(null)

          // Test editModeOptions with undefined
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
          .columnsTemplate('1fr 1fr')
          .width('30%')
          .height('100%')
          .id('grid_editModeOptions_undefined')
          .backgroundColor(0xF0F0F0)
          .editModeOptions(undefined)
        }
        .width('100%')
        .height('10%')
        .justifyContent(FlexAlign.SpaceEvenly)
      }
    }
    .width('100%')
    .height('100%')
    .backgroundColor(0xDCDCDC)
    .padding({ top: 5 })
  }
}
