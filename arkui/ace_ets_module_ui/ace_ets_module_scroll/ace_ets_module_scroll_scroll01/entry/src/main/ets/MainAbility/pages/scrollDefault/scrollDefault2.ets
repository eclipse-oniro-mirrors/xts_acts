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
struct ScrollNullUndefinedTest2 {
  @State numbers: string[] = []

  aboutToAppear() {
    for (let i = 1; i <= 20; i++) {
      this.numbers.push(i + '')
    }
  }

  build() {
    Column() {
      // ========== edgeEffect tests ==========
      Text('edgeEffect')
      Row() {
        // Test edgeEffect default value
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
        .id('scroll_edgeEffect_default')
        .width('20%')
        .height('100%')
        .backgroundColor(0xF0F0F0)

        // Test edgeEffect with null
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
        .id('scroll_edgeEffect_null')
        .edgeEffect(null)
        .width('20%')
        .height('100%')
        .backgroundColor(0xF0F0F0)

        // Test edgeEffect with undefined
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
        .id('scroll_edgeEffect_undefined')
        .edgeEffect(undefined)
        .width('20%')
        .height('100%')
        .backgroundColor(0xF0F0F0)

        // Test edgeEffect options with null
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
        .id('scroll_edgeEffect_options_null')
        .edgeEffect(EdgeEffect.Spring, null)
        .width('20%')
        .height('100%')
        .backgroundColor(0xF0F0F0)

        // Test edgeEffect options with undefined
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
        .id('scroll_edgeEffect_options_undefined')
        .edgeEffect(EdgeEffect.Spring, undefined)
        .width('20%')
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
        .id('scroll_nestedScroll_default')
        .width('30%')
        .height('100%')
        .backgroundColor(0xF0F0F0)

        // Test nestedScroll with null
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
        .id('scroll_nestedScroll_null')
        .nestedScroll(null)
        .width('30%')
        .height('100%')
        .backgroundColor(0xF0F0F0)

        // Test nestedScroll with undefined
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
        .id('scroll_nestedScroll_undefined')
        .nestedScroll(undefined)
        .width('30%')
        .height('100%')
        .backgroundColor(0xF0F0F0)
      }
      .width('100%')
      .height('10%')
      .justifyContent(FlexAlign.SpaceEvenly)
      .margin({ bottom: 2 })

      // ========== enableScrollInteraction tests ==========
      Text('enableScrollInteraction')
      Row() {
        // Test enableScrollInteraction with null
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
        .id('scroll_enableScrollInteraction_null')
        .enableScrollInteraction(null)
        .width('30%')
        .height('100%')
        .backgroundColor(0xF0F0F0)

        // Test enableScrollInteraction with undefined
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
        .id('scroll_enableScrollInteraction_undefined')
        .enableScrollInteraction(undefined)
        .width('30%')
        .height('100%')
        .backgroundColor(0xF0F0F0)

        // Test enableScrollInteraction with false
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
        .id('scroll_enableScrollInteraction_false')
        .enableScrollInteraction(false)
        .width('30%')
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
        .id('scroll_friction_default')
        .width('30%')
        .height('100%')
        .backgroundColor(0xF0F0F0)

        // Test friction with null
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
        .id('scroll_friction_null')
        .friction(null)
        .width('30%')
        .height('100%')
        .backgroundColor(0xF0F0F0)

        // Test friction with undefined
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
        .id('scroll_friction_undefined')
        .friction(undefined)
        .width('30%')
        .height('100%')
        .backgroundColor(0xF0F0F0)
      }
      .width('100%')
      .height('10%')
      .justifyContent(FlexAlign.SpaceEvenly)
      .margin({ bottom: 2 })

      // ========== scrollSnap tests ==========
      Text('scrollSnap')
      Row() {
        // Test scrollSnap default value
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
        .id('scroll_scrollSnap_default')
        .width('30%')
        .height('100%')
        .backgroundColor(0xF0F0F0)

        // Test scrollSnap with null
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
        .id('scroll_scrollSnap_null')
        .scrollSnap(null)
        .width('30%')
        .height('100%')
        .backgroundColor(0xF0F0F0)

        // Test scrollSnap with undefined
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
        .id('scroll_scrollSnap_undefined')
        .scrollSnap(undefined)
        .width('30%')
        .height('100%')
        .backgroundColor(0xF0F0F0)
      }
      .width('100%')
      .height('10%')
      .justifyContent(FlexAlign.SpaceEvenly)
      .margin({ bottom: 2 })

      // ========== enablePaging tests ==========
      Text('enablePaging')
      Row() {
        // Test enablePaging default value
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
        .id('scroll_enablePaging_default')
        .width('23%')
        .height('100%')
        .backgroundColor(0xF0F0F0)

        // Test enablePaging with null
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
        .id('scroll_enablePaging_null')
        .enablePaging(null)
        .width('23%')
        .height('100%')
        .backgroundColor(0xF0F0F0)

        // Test enablePaging with undefined
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
        .id('scroll_enablePaging_undefined')
        .enablePaging(undefined)
        .width('23%')
        .height('100%')
        .backgroundColor(0xF0F0F0)

        // Test enablePaging with false
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
        .id('scroll_enablePaging_false')
        .enablePaging(false)
        .width('23%')
        .height('100%')
        .backgroundColor(0xF0F0F0)
      }
      .width('100%')
      .height('10%')
      .justifyContent(FlexAlign.SpaceEvenly)
      .margin({ bottom: 2 })

      // ========== initialOffset tests ==========
      Text('initialOffset')
      Row() {
        // Test initialOffset default value
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
        .id('scroll_initialOffset_default')
        .width('30%')
        .height('100%')
        .backgroundColor(0xF0F0F0)

        // Test initialOffset with null
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
        .id('scroll_initialOffset_null')
        .initialOffset(null)
        .width('30%')
        .height('100%')
        .backgroundColor(0xF0F0F0)

        // Test initialOffset with undefined
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
        .id('scroll_initialOffset_undefined')
        .initialOffset(undefined)
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