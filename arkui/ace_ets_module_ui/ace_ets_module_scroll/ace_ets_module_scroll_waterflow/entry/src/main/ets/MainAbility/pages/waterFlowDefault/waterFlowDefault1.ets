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
struct WaterFlowNullUndefined1 {
  @State numbers: string[] = []

  aboutToAppear() {
    for (let i = 1; i <= 20; i++) {
      this.numbers.push(i + '')
    }
  }

  build() {
    Column() {
      // ========== columnsTemplate tests (string) ==========
      Text('columnsTemplate')
      Row() {
        // Test columnsTemplate default value
        WaterFlow() {
          ForEach([1, 2, 3], (item: number) => {
            FlowItem() {
              Text('' + item)
                .width(40)
                .height(40)
                .fontSize(14)
                .textAlign(TextAlign.Center)
                .backgroundColor(0xF9CF93)
            }
          }, (item: number) => item.toString())
        }
        .id('waterFlow_columnsTemplate_default')
        .width('25%')
        .height('100%')
        .backgroundColor(0xF0F0F0)

        // Test columnsTemplate with empty string
        WaterFlow() {
          ForEach([1, 2, 3], (item: number) => {
            FlowItem() {
              Text('' + item)
                .width(40)
                .height(40)
                .fontSize(14)
                .textAlign(TextAlign.Center)
                .backgroundColor(0xF9CF93)
            }
          }, (item: number) => item.toString())
        }
        .id('waterFlow_columnsTemplate_emptyString')
        .columnsTemplate('')
        .width('25%')
        .height('100%')
        .backgroundColor(0xF0F0F0)

        // Test columnsTemplate with null
        WaterFlow() {
          ForEach([1, 2, 3], (item: number) => {
            FlowItem() {
              Text('' + item)
                .width(40)
                .height(40)
                .fontSize(14)
                .textAlign(TextAlign.Center)
                .backgroundColor(0xF9CF93)
            }
          }, (item: number) => item.toString())
        }
        .id('waterFlow_columnsTemplate_null')
        .columnsTemplate(null)
        .width('25%')
        .height('100%')
        .backgroundColor(0xF0F0F0)

        // Test columnsTemplate with undefined
        WaterFlow() {
          ForEach([1, 2, 3], (item: number) => {
            FlowItem() {
              Text('' + item)
                .width(40)
                .height(40)
                .fontSize(14)
                .textAlign(TextAlign.Center)
                .backgroundColor(0xF9CF93)
            }
          }, (item: number) => item.toString())
        }
        .id('waterFlow_columnsTemplate_undefined')
        .columnsTemplate(undefined)
        .width('25%')
        .height('100%')
        .backgroundColor(0xF0F0F0)
      }
      .width('100%')
      .height('10%')
      .justifyContent(FlexAlign.SpaceEvenly)
      .margin({ bottom: 2 })

      // ========== rowsTemplate tests (string) ==========
      Text('rowsTemplate')
      Row() {
        // Test rowsTemplate default value
        WaterFlow() {
          ForEach([1, 2, 3], (item: number) => {
            FlowItem() {
              Text('' + item)
                .width(40)
                .height(40)
                .fontSize(14)
                .textAlign(TextAlign.Center)
                .backgroundColor(0xF9CF93)
            }
          }, (item: number) => item.toString())
        }
        .id('waterFlow_rowsTemplate_default')
        .width('25%')
        .height('100%')
        .backgroundColor(0xF0F0F0)

        // Test rowsTemplate with empty string
        WaterFlow() {
          ForEach([1, 2, 3], (item: number) => {
            FlowItem() {
              Text('' + item)
                .width(40)
                .height(40)
                .fontSize(14)
                .textAlign(TextAlign.Center)
                .backgroundColor(0xF9CF93)
            }
          }, (item: number) => item.toString())
        }
        .id('waterFlow_rowsTemplate_emptyString')
        .rowsTemplate('')
        .width('25%')
        .height('100%')
        .backgroundColor(0xF0F0F0)

        // Test rowsTemplate with null
        WaterFlow() {
          ForEach([1, 2, 3], (item: number) => {
            FlowItem() {
              Text('' + item)
                .width(40)
                .height(40)
                .fontSize(14)
                .textAlign(TextAlign.Center)
                .backgroundColor(0xF9CF93)
            }
          }, (item: number) => item.toString())
        }
        .id('waterFlow_rowsTemplate_null')
        .rowsTemplate(null)
        .width('25%')
        .height('100%')
        .backgroundColor(0xF0F0F0)

        // Test rowsTemplate with undefined
        WaterFlow() {
          ForEach([1, 2, 3], (item: number) => {
            FlowItem() {
              Text('' + item)
                .width(40)
                .height(40)
                .fontSize(14)
                .textAlign(TextAlign.Center)
                .backgroundColor(0xF9CF93)
            }
          }, (item: number) => item.toString())
        }
        .id('waterFlow_rowsTemplate_undefined')
        .rowsTemplate(undefined)
        .width('25%')
        .height('100%')
        .backgroundColor(0xF0F0F0)
      }
      .width('100%')
      .height('10%')
      .justifyContent(FlexAlign.SpaceEvenly)
      .margin({ bottom: 2 })

      // ========== itemConstraintSize tests ==========
      Text('itemConstraintSize')
      Row() {
        // Test itemConstraintSize default value
        WaterFlow() {
          FlowItem() {
            Text('item')
              .width(40)
              .height(40)
              .fontSize(14)
              .textAlign(TextAlign.Center)
              .backgroundColor(0xF9CF93)
          }
        }
        .id('waterFlow_itemConstraintSize_default')
        .columnsTemplate('1fr 1fr 1fr')
        .width('30%')
        .height('100%')
        .backgroundColor(0xF0F0F0)

        // Test itemConstraintSize with null
        WaterFlow() {
          FlowItem() {
            Text('item')
              .width(40)
              .height(40)
              .fontSize(14)
              .textAlign(TextAlign.Center)
              .backgroundColor(0xF9CF93)
          }
        }
        .id('waterFlow_itemConstraintSize_null')
        .itemConstraintSize(null)
        .columnsTemplate('1fr 1fr 1fr')
        .width('30%')
        .height('100%')
        .backgroundColor(0xF0F0F0)

        // Test itemConstraintSize with undefined
        WaterFlow() {
          FlowItem() {
            Text('item')
              .width(40)
              .height(40)
              .fontSize(14)
              .textAlign(TextAlign.Center)
              .backgroundColor(0xF9CF93)
          }
        }
        .id('waterFlow_itemConstraintSize_undefined')
        .itemConstraintSize(undefined)
        .columnsTemplate('1fr 1fr 1fr')
        .width('30%')
        .height('100%')
        .backgroundColor(0xF0F0F0)
      }
      .width('100%')
      .height('10%')
      .justifyContent(FlexAlign.SpaceEvenly)
      .margin({ bottom: 2 })

      // ========== columnsGap tests ==========
      Text('columnsGap')
      Row() {
        // Test columnsGap default value
        WaterFlow() {
          ForEach([1, 2, 3, 4, 5], (item: number) => {
            FlowItem() {
              Text('' + item)
                .width(40)
                .height(40)
                .fontSize(14)
                .textAlign(TextAlign.Center)
                .backgroundColor(0xF9CF93)
            }
          }, (item: number) => item.toString())
        }
        .id('waterFlow_columnsGap_default')
        .columnsTemplate('1fr 1fr 1fr')
        .width('30%')
        .height('100%')
        .backgroundColor(0xF0F0F0)

        // Test columnsGap with null
        WaterFlow() {
          ForEach([1, 2, 3, 4, 5], (item: number) => {
            FlowItem() {
              Text('' + item)
                .width(40)
                .height(40)
                .fontSize(14)
                .textAlign(TextAlign.Center)
                .backgroundColor(0xF9CF93)
            }
          }, (item: number) => item.toString())
        }
        .id('waterFlow_columnsGap_null')
        .columnsGap(null)
        .columnsTemplate('1fr 1fr 1fr')
        .width('30%')
        .height('100%')
        .backgroundColor(0xF0F0F0)

        // Test columnsGap with undefined
        WaterFlow() {
          ForEach([1, 2, 3, 4, 5], (item: number) => {
            FlowItem() {
              Text('' + item)
                .width(40)
                .height(40)
                .fontSize(14)
                .textAlign(TextAlign.Center)
                .backgroundColor(0xF9CF93)
            }
          }, (item: number) => item.toString())
        }
        .id('waterFlow_columnsGap_undefined')
        .columnsGap(undefined)
        .columnsTemplate('1fr 1fr 1fr')
        .width('30%')
        .height('100%')
        .backgroundColor(0xF0F0F0)
      }
      .width('100%')
      .height('10%')
      .justifyContent(FlexAlign.SpaceEvenly)
      .margin({ bottom: 2 })

      // ========== rowsGap tests ==========
      Text('rowsGap')
      Row() {
        // Test rowsGap default value
        WaterFlow() {
          ForEach([1, 2, 3, 4, 5], (item: number) => {
            FlowItem() {
              Text('' + item)
                .width(40)
                .height(40)
                .fontSize(14)
                .textAlign(TextAlign.Center)
                .backgroundColor(0xF9CF93)
            }
          }, (item: number) => item.toString())
        }
        .id('waterFlow_rowsGap_default')
        .columnsTemplate('1fr 1fr')
        .width('30%')
        .height('100%')
        .backgroundColor(0xF0F0F0)

        // Test rowsGap with null
        WaterFlow() {
          ForEach([1, 2, 3, 4, 5], (item: number) => {
            FlowItem() {
              Text('' + item)
                .width(40)
                .height(40)
                .fontSize(14)
                .textAlign(TextAlign.Center)
                .backgroundColor(0xF9CF93)
            }
          }, (item: number) => item.toString())
        }
        .id('waterFlow_rowsGap_null')
        .rowsGap(null)
        .columnsTemplate('1fr 1fr')
        .width('30%')
        .height('100%')
        .backgroundColor(0xF0F0F0)

        // Test rowsGap with undefined
        WaterFlow() {
          ForEach([1, 2, 3, 4, 5], (item: number) => {
            FlowItem() {
              Text('' + item)
                .width(40)
                .height(40)
                .fontSize(14)
                .textAlign(TextAlign.Center)
                .backgroundColor(0xF9CF93)
            }
          }, (item: number) => item.toString())
        }
        .id('waterFlow_rowsGap_undefined')
        .rowsGap(undefined)
        .columnsTemplate('1fr 1fr')
        .width('30%')
        .height('100%')
        .backgroundColor(0xF0F0F0)
      }
      .width('100%')
      .height('10%')
      .justifyContent(FlexAlign.SpaceEvenly)
      .margin({ bottom: 2 })

      // ========== layoutDirection tests (FlexDirection) ==========
      Text('layoutDirection')
      Row() {
        // Test layoutDirection default value
        WaterFlow() {
          ForEach(this.numbers, (item: string) => {
            FlowItem() {
              Text('' + item)
                .width(40)
                .height(40)
                .fontSize(14)
                .textAlign(TextAlign.Center)
                .backgroundColor(0xF9CF93)
            }
          }, (item: string) => item)
        }
        .id('waterFlow_layoutDirection_default')
        .columnsTemplate('1fr 1fr')
        .width('25%')
        .height('100%')
        .backgroundColor(0xF0F0F0)

        // Test layoutDirection with null
        WaterFlow() {
          ForEach(this.numbers, (item: string) => {
            FlowItem() {
              Text('' + item)
                .width(40)
                .height(40)
                .fontSize(14)
                .textAlign(TextAlign.Center)
                .backgroundColor(0xF9CF93)
            }
          }, (item: string) => item)
        }
        .id('waterFlow_layoutDirection_null')
        .layoutDirection(null)
        .columnsTemplate('1fr 1fr')
        .width('25%')
        .height('100%')
        .backgroundColor(0xF0F0F0)

        // Test layoutDirection with undefined
        WaterFlow() {
          ForEach(this.numbers, (item: string) => {
            FlowItem() {
              Text('' + item)
                .width(40)
                .height(40)
                .fontSize(14)
                .textAlign(TextAlign.Center)
                .backgroundColor(0xF9CF93)
            }
          }, (item: string) => item)
        }
        .id('waterFlow_layoutDirection_undefined')
        .layoutDirection(undefined)
        .columnsTemplate('1fr 1fr')
        .width('25%')
        .height('100%')
        .backgroundColor(0xF0F0F0)
      }
      .width('100%')
      .height('10%')
      .justifyContent(FlexAlign.SpaceEvenly)
      .margin({ bottom: 2 })

      // ========== nestedScroll tests ==========
      Text('nestedScroll')
      Row() {
        // Test nestedScroll default value
        WaterFlow() {
          ForEach(this.numbers, (item: string) => {
            FlowItem() {
              Text('' + item)
                .width(40)
                .height(40)
                .fontSize(14)
                .textAlign(TextAlign.Center)
                .backgroundColor(0xF9CF93)
            }
          }, (item: string) => item)
        }
        .id('waterFlow_nestedScroll_default')
        .columnsTemplate('1fr 1fr')
        .width('30%')
        .height('100%')
        .backgroundColor(0xF0F0F0)

        // Test nestedScroll with null
        WaterFlow() {
          ForEach(this.numbers, (item: string) => {
            FlowItem() {
              Text('' + item)
                .width(40)
                .height(40)
                .fontSize(14)
                .textAlign(TextAlign.Center)
                .backgroundColor(0xF9CF93)
            }
          }, (item: string) => item)
        }
        .id('waterFlow_nestedScroll_null')
        .nestedScroll(null)
        .columnsTemplate('1fr 1fr')
        .width('30%')
        .height('100%')
        .backgroundColor(0xF0F0F0)

        // Test nestedScroll with undefined
        WaterFlow() {
          ForEach(this.numbers, (item: string) => {
            FlowItem() {
              Text('' + item)
                .width(40)
                .height(40)
                .fontSize(14)
                .textAlign(TextAlign.Center)
                .backgroundColor(0xF9CF93)
            }
          }, (item: string) => item)
        }
        .id('waterFlow_nestedScroll_undefined')
        .nestedScroll(undefined)
        .columnsTemplate('1fr 1fr')
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
    .padding({ top: 5 })
  }
}