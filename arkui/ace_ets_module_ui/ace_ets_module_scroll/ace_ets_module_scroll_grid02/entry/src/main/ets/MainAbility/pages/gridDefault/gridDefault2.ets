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
struct GridNullUndefined2 {
  @State numbers: string[] = []

  aboutToAppear() {
    for (let i = 1; i <= 20; i++) {
      this.numbers.push(i + '')
    }
  }

  build() {
    Scroll() {
      Column() {
        // ========== editMode tests (boolean) ==========
        Text('editMode')
        Row() {
          // Test editMode default value
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
          .id('grid_editMode_default')
          .backgroundColor(0xF0F0F0)

          // Test editMode with null
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
          .id('grid_editMode_null')
          .backgroundColor(0xF0F0F0)
          .editMode(null)

          // Test editMode with undefined
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
          .id('grid_editMode_undefined')
          .backgroundColor(0xF0F0F0)
          .editMode(undefined)

          // Test editMode with true (对照)
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
          .id('grid_editMode_true')
          .backgroundColor(0xF0F0F0)
          .editMode(true)
        }
        .width('100%')
        .height('10%')
        .justifyContent(FlexAlign.SpaceEvenly)
        .margin({ bottom: 2 })

        // ========== multiSelectable tests (boolean) ==========
        Text('multiSelectable')
        Row() {
          // Test multiSelectable default value
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
          .id('grid_multiSelectable_default')
          .backgroundColor(0xF0F0F0)

          // Test multiSelectable with null
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
          .id('grid_multiSelectable_null')
          .backgroundColor(0xF0F0F0)
          .multiSelectable(null)

          // Test multiSelectable with undefined
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
          .id('grid_multiSelectable_undefined')
          .backgroundColor(0xF0F0F0)
          .multiSelectable(undefined)
        }
        .width('100%')
        .height('10%')
        .justifyContent(FlexAlign.SpaceEvenly)
        .margin({ bottom: 2 })

        // ========== maxCount tests ==========
        Text('maxCount')
        Row() {
          // Test maxCount default value
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
          .width('30%')
          .height('100%')
          .id('grid_maxCount_default')
          .backgroundColor(0xF0F0F0)

          // Test maxCount with null
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
          .width('30%')
          .height('100%')
          .id('grid_maxCount_null')
          .backgroundColor(0xF0F0F0)
          .maxCount(null)

          // Test maxCount with undefined
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
          .width('30%')
          .height('100%')
          .id('grid_maxCount_undefined')
          .backgroundColor(0xF0F0F0)
          .maxCount(undefined)
        }
        .width('100%')
        .height('10%')
        .justifyContent(FlexAlign.SpaceEvenly)
        .margin({ bottom: 2 })

        // ========== minCount tests ==========
        Text('minCount')
        Row() {
          // Test minCount default value
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
          .width('30%')
          .height('100%')
          .id('grid_minCount_default')
          .backgroundColor(0xF0F0F0)

          // Test minCount with null
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
          .width('30%')
          .height('100%')
          .id('grid_minCount_null')
          .backgroundColor(0xF0F0F0)
          .minCount(null)

          // Test minCount with undefined
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
          .width('30%')
          .height('100%')
          .id('grid_minCount_undefined')
          .backgroundColor(0xF0F0F0)
          .minCount(undefined)
        }
        .width('100%')
        .height('10%')
        .justifyContent(FlexAlign.SpaceEvenly)
        .margin({ bottom: 5 })

        // ========== cellLength tests ==========
        Text('cellLength')
        Row() {
          // Test cellLength default value
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
          .width('30%')
          .height('100%')
          .id('grid_cellLength_default')
          .backgroundColor(0xF0F0F0)

          // Test cellLength with null
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
          .width('30%')
          .height('100%')
          .id('grid_cellLength_null')
          .backgroundColor(0xF0F0F0)
          .cellLength(null)

          // Test cellLength with undefined
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
          .width('30%')
          .height('100%')
          .id('grid_cellLength_undefined')
          .backgroundColor(0xF0F0F0)
          .cellLength(undefined)
        }
        .width('100%')
        .height('10%')
        .justifyContent(FlexAlign.SpaceEvenly)
        .margin({ bottom: 2 })

        // ========== supportAnimation tests (boolean) ==========
        Text('supportAnimation')
        Row() {
          // Test supportAnimation default value
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
          .id('grid_supportAnimation_default')
          .backgroundColor(0xF0F0F0)

          // Test supportAnimation with null
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
          .id('grid_supportAnimation_null')
          .backgroundColor(0xF0F0F0)
          .supportAnimation(null)

          // Test supportAnimation with undefined
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
          .id('grid_supportAnimation_undefined')
          .backgroundColor(0xF0F0F0)
          .supportAnimation(undefined)
        }
        .width('100%')
        .height('10%')
        .justifyContent(FlexAlign.SpaceEvenly)
        .margin({ bottom: 2 })

        // ========== edgeEffect tests ==========
        Text('edgeEffect')
        Row() {
          // Test edgeEffect default value
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
          .id('grid_edgeEffect_default')
          .backgroundColor(0xF0F0F0)

          // Test edgeEffect with null
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
          .id('grid_edgeEffect_null')
          .backgroundColor(0xF0F0F0)
          .edgeEffect(null)

          // Test edgeEffect with undefined
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
          .id('grid_edgeEffect_undefined')
          .backgroundColor(0xF0F0F0)
          .edgeEffect(undefined)
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
