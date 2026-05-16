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
struct WaterFlowNullUndefined2 {
  @State numbers: string[] = []

  aboutToAppear() {
    for (let i = 1; i <= 20; i++) {
      this.numbers.push(i + '')
    }
  }

  build() {
    Column() {
      // ========== enableScrollInteraction tests (boolean) ==========
      Text('enableScrollInteraction')
      Row() {
        // Test enableScrollInteraction default value
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
        .id('WaterFlow_enableScrollInteraction_default')
        .columnsTemplate('1fr 1fr')
        .width('23%')
        .height('100%')
        .backgroundColor(0xF0F0F0)

        // Test enableScrollInteraction with null
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
        .id('WaterFlow_enableScrollInteraction_null')
        .enableScrollInteraction(null)
        .columnsTemplate('1fr 1fr')
        .width('23%')
        .height('100%')
        .backgroundColor(0xF0F0F0)

        // Test enableScrollInteraction with undefined
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
        .id('WaterFlow_enableScrollInteraction_undefined')
        .enableScrollInteraction(undefined)
        .columnsTemplate('1fr 1fr')
        .width('23%')
        .height('100%')
        .backgroundColor(0xF0F0F0)

        // Test enableScrollInteraction with false
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
        .id('WaterFlow_enableScrollInteraction_false')
        .enableScrollInteraction(false)
        .columnsTemplate('1fr 1fr')
        .width('23%')
        .height('100%')
        .backgroundColor(0xF0F0F0)
      }
      .width('100%')
      .height('10%')
      .justifyContent(FlexAlign.SpaceEvenly)
      .margin({ bottom: 2 })

      // ========== friction tests ==========
      Text('friction')
      Row() {
        // Test friction default value
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
        .id('WaterFlow_friction_default')
        .columnsTemplate('1fr 1fr')
        .width('30%')
        .height('100%')
        .backgroundColor(0xF0F0F0)

        // Test friction with null
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
        .id('WaterFlow_friction_null')
        .friction(null)
        .columnsTemplate('1fr 1fr')
        .width('30%')
        .height('100%')
        .backgroundColor(0xF0F0F0)

        // Test friction with undefined
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
        .id('WaterFlow_friction_undefined')
        .friction(undefined)
        .columnsTemplate('1fr 1fr')
        .width('30%')
        .height('100%')
        .backgroundColor(0xF0F0F0)
      }
      .width('100%')
      .height('10%')
      .justifyContent(FlexAlign.SpaceEvenly)
      .margin({ bottom: 2 })

      // ========== cachedCount tests ==========
      Text('cachedCount')
      Row() {
        // Test cachedCount default value
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
        .id('WaterFlow_cachedCount_default')
        .columnsTemplate('1fr 1fr')
        .width('23%')
        .height('100%')
        .backgroundColor(0xF0F0F0)

        // Test cachedCount with null
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
        .id('WaterFlow_cachedCount_null')
        .cachedCount(null)
        .columnsTemplate('1fr 1fr')
        .width('23%')
        .height('100%')
        .backgroundColor(0xF0F0F0)

        // Test cachedCount with undefined
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
        .id('WaterFlow_cachedCount_undefined')
        .cachedCount(undefined)
        .columnsTemplate('1fr 1fr')
        .width('23%')
        .height('100%')
        .backgroundColor(0xF0F0F0)

        // Test cachedCount show with false
        WaterFlow() {
          ForEach(this.numbers, (item: number) => {
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
        .id('WaterFlow_cachedCount_show_false')
        .cachedCount(1, false)
        .columnsTemplate('1fr 1fr')
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
    .padding({ top: 5 })
  }
}