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
struct ListNullUndefined2 {
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
          List() {
            ForEach(this.numbers, (item: number) => {
              ListItem() {
                Text('' + item)
                  .width('100%')
                  .height('30%')
                  .fontSize(14)
                  .textAlign(TextAlign.Center)
                  .backgroundColor(0xF9CF93)
              }
            }, (item: number) => item.toString())
          }
          .id('list_editMode_default')
          .width('30%')
          .height('100%')
          .backgroundColor(0xF0F0F0)

          // Test editMode with null
          List() {
            ForEach(this.numbers, (item: number) => {
              ListItem() {
                Text('' + item)
                  .width('100%')
                  .height('30%')
                  .fontSize(14)
                  .textAlign(TextAlign.Center)
                  .backgroundColor(0xF9CF93)
              }
            }, (item: number) => item.toString())
          }
          .id('list_editMode_null')
          .editMode(null)
          .width('30%')
          .height('100%')
          .backgroundColor(0xF0F0F0)

          // Test editMode with undefined
          List() {
            ForEach(this.numbers, (item: number) => {
              ListItem() {
                Text('' + item)
                  .width('100%')
                  .height('30%')
                  .fontSize(14)
                  .textAlign(TextAlign.Center)
                  .backgroundColor(0xF9CF93)
              }
            }, (item: number) => item.toString())
          }
          .id('list_editMode_undefined')
          .editMode(undefined)
          .width('30%')
          .height('100%')
          .backgroundColor(0xF0F0F0)
        }
        .width('100%')
        .height('10%')
        .justifyContent(FlexAlign.SpaceEvenly)
        .margin({ bottom: 2 })

        // ========== multiSelectable tests (boolean) ==========
        Text('multiSelectable')
        Row(){
          // Test multiSelectable with false
          List() {
            ForEach(this.numbers, (item: number) => {
              ListItem() {
                Text('' + item)
                  .width('100%')
                  .height('30%')
                  .fontSize(14)
                  .textAlign(TextAlign.Center)
                  .backgroundColor(0xF9CF93)
              }
            }, (item: number) => item.toString())
          }
          .id('list_multiSelectable_false')
          .multiSelectable(false)
          .width('30%')
          .height('100%')
          .backgroundColor(0xF0F0F0)

          // Test multiSelectable with null
          List() {
            ForEach(this.numbers, (item: number) => {
              ListItem() {
                Text('' + item)
                  .width('100%')
                  .height('30%')
                  .fontSize(14)
                  .textAlign(TextAlign.Center)
                  .backgroundColor(0xF9CF93)
              }
            }, (item: number) => item.toString())
          }
          .id('list_multiSelectable_null')
          .multiSelectable(null)
          .width('30%')
          .height('100%')
          .backgroundColor(0xF0F0F0)

          // Test multiSelectable with undefined
          List() {
            ForEach(this.numbers, (item: number) => {
              ListItem() {
                Text('' + item)
                  .width('100%')
                  .height('30%')
                  .fontSize(14)
                  .textAlign(TextAlign.Center)
                  .backgroundColor(0xF9CF93)
              }
            }, (item: number) => item.toString())
          }
          .id('list_multiSelectable_undefined')
          .multiSelectable(undefined)
          .width('30%')
          .height('100%')
          .backgroundColor(0xF0F0F0)
        }
        .width('100%')
        .height('10%')
        .justifyContent(FlexAlign.SpaceEvenly)
        .margin({ bottom: 2 })

        // ========== cachedCount tests (Axis) ==========
        Text('cachedCount')
        Row() {
          // Test cachedCount with null
          List() {
            ForEach(this.numbers, (item: number) => {
              ListItem() {
                Text('' + item)
                  .width('100%')
                  .height('30%')
                  .fontSize(14)
                  .textAlign(TextAlign.Center)
                  .backgroundColor(0xF9CF93)
              }
            }, (item: number) => item.toString())
          }
          .id('list_cachedCount_null')
          .cachedCount(null)
          .width('30%')
          .height('100%')
          .backgroundColor(0xF0F0F0)

          // Test cachedCount with undefined
          List() {
            ForEach(this.numbers, (item: number) => {
              ListItem() {
                Text('' + item)
                  .width('100%')
                  .height('30%')
                  .fontSize(14)
                  .textAlign(TextAlign.Center)
                  .backgroundColor(0xF9CF93)
              }
            }, (item: number) => item.toString())
          }
          .id('list_cachedCount_undefined')
          .cachedCount(undefined)
          .width('30%')
          .height('100%')
          .backgroundColor(0xF0F0F0)

          // Test cachedCount show with false
          List() {
            ForEach(this.numbers, (item: number) => {
              ListItem() {
                Text('' + item)
                  .width('100%')
                  .height('30%')
                  .fontSize(14)
                  .textAlign(TextAlign.Center)
                  .backgroundColor(0xF9CF93)
              }
            }, (item: number) => item.toString())
          }
          .id('list_cachedCount_show_false')
          .cachedCount(2, false)
          .width('30%')
          .height('100%')
          .backgroundColor(0xF0F0F0)
        }
        .width('100%')
        .height('10%')
        .justifyContent(FlexAlign.SpaceEvenly)
        .margin({ bottom: 2 })

        // ========== chainAnimation tests ==========
        Text('chainAnimation')
        Row() {
          // Test chainAnimation default value
          List() {
            ForEach(this.numbers, (item: number) => {
              ListItem() {
                Text('' + item)
                  .width('100%')
                  .height('30%')
                  .fontSize(14)
                  .textAlign(TextAlign.Center)
                  .backgroundColor(0xF9CF93)
              }
            }, (item: number) => item.toString())
          }
          .id('list_chainAnimation_default')
          .width('30%')
          .height('100%')
          .backgroundColor(0xF0F0F0)

          // Test chainAnimation with null
          List() {
            ForEach(this.numbers, (item: number) => {
              ListItem() {
                Text('' + item)
                  .width('100%')
                  .height('30%')
                  .fontSize(14)
                  .textAlign(TextAlign.Center)
                  .backgroundColor(0xF9CF93)
              }
            }, (item: number) => item.toString())
          }
          .id('list_chainAnimation_null')
          .chainAnimation(null)
          .width('30%')
          .height('100%')
          .backgroundColor(0xF0F0F0)

          // Test chainAnimation with undefined
          List() {
            ForEach(this.numbers, (item: number) => {
              ListItem() {
                Text('' + item)
                  .width('100%')
                  .height('30%')
                  .fontSize(14)
                  .textAlign(TextAlign.Center)
                  .backgroundColor(0xF9CF93)
              }
            }, (item: number) => item.toString())
          }
          .id('list_chainAnimation_undefined')
          .chainAnimation(undefined)
          .width('30%')
          .height('100%')
          .backgroundColor(0xF0F0F0)
        }
        .width('100%')
        .height('10%')
        .justifyContent(FlexAlign.SpaceEvenly)
        .margin({ bottom: 2 })

        // ========== sticky tests ==========
        Text('sticky')
        Row() {
          // Test sticky default value
          List() {
            ForEach(this.numbers, (item: number) => {
              ListItem() {
                Text('' + item)
                  .width('100%')
                  .height('30%')
                  .fontSize(14)
                  .textAlign(TextAlign.Center)
                  .backgroundColor(0xF9CF93)
              }
            }, (item: number) => item.toString())
          }
          .id('list_sticky_default')
          .width('30%')
          .height('100%')
          .backgroundColor(0xF0F0F0)

          // Test sticky with null
          List() {
            ForEach(this.numbers, (item: number) => {
              ListItem() {
                Text('' + item)
                  .width('100%')
                  .height('30%')
                  .fontSize(14)
                  .textAlign(TextAlign.Center)
                  .backgroundColor(0xF9CF93)
              }
            }, (item: number) => item.toString())
          }
          .id('list_sticky_null')
          .sticky(null)
          .width('30%')
          .height('100%')
          .backgroundColor(0xF0F0F0)

          // Test sticky with undefined
          List() {
            ForEach(this.numbers, (item: number) => {
              ListItem() {
                Text('' + item)
                  .width('100%')
                  .height('30%')
                  .fontSize(14)
                  .textAlign(TextAlign.Center)
                  .backgroundColor(0xF9CF93)
              }
            }, (item: number) => item.toString())
          }
          .id('list_sticky_undefined')
          .sticky(undefined)
          .width('30%')
          .height('100%')
          .backgroundColor(0xF0F0F0)
        }
        .width('100%')
        .height('10%')
        .justifyContent(FlexAlign.SpaceEvenly)
        .margin({ bottom: 2 })

        // ========== scrollSnapAlign tests ==========
        Text('scrollSnapAlign')
        Row() {
          // Test scrollSnapAlign default value
          List() {
            ForEach(this.numbers, (item: number) => {
              ListItem() {
                Text('' + item)
                  .width('100%')
                  .height('30%')
                  .fontSize(14)
                  .textAlign(TextAlign.Center)
                  .backgroundColor(0xF9CF93)
              }
            }, (item: number) => item.toString())
          }
          .id('list_scrollSnapAlign_default')
          .width('30%')
          .height('100%')
          .backgroundColor(0xF0F0F0)

          // Test scrollSnapAlign with null
          List() {
            ForEach(this.numbers, (item: number) => {
              ListItem() {
                Text('' + item)
                  .width('100%')
                  .height('30%')
                  .fontSize(14)
                  .textAlign(TextAlign.Center)
                  .backgroundColor(0xF9CF93)
              }
            }, (item: number) => item.toString())
          }
          .id('list_scrollSnapAlign_null')
          .scrollSnapAlign(null)
          .width('30%')
          .height('100%')
          .backgroundColor(0xF0F0F0)

          // Test scrollSnapAlign with undefined
          List() {
            ForEach(this.numbers, (item: number) => {
              ListItem() {
                Text('' + item)
                  .width('100%')
                  .height('30%')
                  .fontSize(14)
                  .textAlign(TextAlign.Center)
                  .backgroundColor(0xF9CF93)
              }
            }, (item: number) => item.toString())
          }
          .id('list_scrollSnapAlign_undefined')
          .scrollSnapAlign(undefined)
          .width('30%')
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
          List() {
            ForEach(this.numbers, (item: number) => {
              ListItem() {
                Text('' + item)
                  .width('100%')
                  .height('30%')
                  .fontSize(14)
                  .textAlign(TextAlign.Center)
                  .backgroundColor(0xF9CF93)
              }
            }, (item: number) => item.toString())
          }
          .id('list_nestedScroll_default')
          .width('30%')
          .height('100%')
          .backgroundColor(0xF0F0F0)

          // Test nestedScroll with null
          List() {
            ForEach(this.numbers, (item: number) => {
              ListItem() {
                Text('' + item)
                  .width('100%')
                  .height('30%')
                  .fontSize(14)
                  .textAlign(TextAlign.Center)
                  .backgroundColor(0xF9CF93)
              }
            }, (item: number) => item.toString())
          }
          .id('list_nestedScroll_null')
          .nestedScroll(null)
          .width('30%')
          .height('100%')
          .backgroundColor(0xF0F0F0)

          // Test nestedScroll with undefined
          List() {
            ForEach(this.numbers, (item: number) => {
              ListItem() {
                Text('' + item)
                  .width('100%')
                  .height('30%')
                  .fontSize(14)
                  .textAlign(TextAlign.Center)
                  .backgroundColor(0xF9CF93)
              }
            }, (item: number) => item.toString())
          }
          .id('list_nestedScroll_undefined')
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
          // Test enableScrollInteraction with false
          List() {
            ForEach(this.numbers, (item: number) => {
              ListItem() {
                Text('' + item)
                  .width('100%')
                  .height('30%')
                  .fontSize(14)
                  .textAlign(TextAlign.Center)
                  .backgroundColor(0xF9CF93)
              }
            }, (item: number) => item.toString())
          }
          .id('list_enableScrollInteraction_false')
          .enableScrollInteraction(false)
          .width('30%')
          .height('100%')
          .backgroundColor(0xF0F0F0)

          // Test enableScrollInteraction with null
          List() {
            ForEach(this.numbers, (item: number) => {
              ListItem() {
                Text('' + item)
                  .width('100%')
                  .height('30%')
                  .fontSize(14)
                  .textAlign(TextAlign.Center)
                  .backgroundColor(0xF9CF93)
              }
            }, (item: number) => item.toString())
          }
          .id('list_enableScrollInteraction_null')
          .enableScrollInteraction(null)
          .width('30%')
          .height('100%')
          .backgroundColor(0xF0F0F0)

          // Test enableScrollInteraction with undefined
          List() {
            ForEach(this.numbers, (item: number) => {
              ListItem() {
                Text('' + item)
                  .width('100%')
                  .height('30%')
                  .fontSize(14)
                  .textAlign(TextAlign.Center)
                  .backgroundColor(0xF9CF93)
              }
            }, (item: number) => item.toString())
          }
          .id('list_enableScrollInteraction_undefined')
          .enableScrollInteraction(undefined)
          .width('30%')
          .height('100%')
          .backgroundColor(0xF0F0F0)
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