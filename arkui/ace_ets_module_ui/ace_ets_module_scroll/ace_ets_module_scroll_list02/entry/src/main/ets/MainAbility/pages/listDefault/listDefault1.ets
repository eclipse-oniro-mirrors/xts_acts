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
struct ListNullUndefined1 {
  @State numbers: string[] = []

  aboutToAppear() {
    for (let i = 1; i <= 20; i++) {
      this.numbers.push(i + '')
    }
  }

  build() {
    Scroll() {
      Column() {
        // ========== lanes tests (value: number | LengthConstrain, gutter?: Dimension) ==========
        Text('lanes')
        Row() {
          // Test lanes with null
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
          .id('list_lanes_null')
          .lanes(null)
          .width('23%')
          .height('100%')
          .backgroundColor(0xF0F0F0)

          // Test lanes with undefined
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
          .id('list_lanes_undefined')
          .lanes(undefined)
          .width('23%')
          .height('100%')
          .backgroundColor(0xF0F0F0)

          // Test lanes gutter with null
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
          .id('list_lanes_gutter_null')
          .lanes(2, null)
          .width('23%')
          .height('100%')
          .backgroundColor(0xF0F0F0)

          // Test lanes gutter with undefined
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
          .id('list_lanes_gutter_undefined')
          .lanes(2, undefined)
          .width('23%')
          .height('100%')
          .backgroundColor(0xF0F0F0)
        }
        .width('100%')
        .height('10%')
        .justifyContent(FlexAlign.SpaceEvenly)
        .margin({ bottom: 2 })

        // ========== alignListItem tests (ListItemAlign) ==========
        Text('alignListItem')
        Row(){
          // Test alignListItem with End
          List() {
            ForEach(this.numbers, (item: number) => {
              ListItem() {
                Text('' + item)
                  .width(40)
                  .height(40)
                  .fontSize(14)
                  .textAlign(TextAlign.Center)
                  .backgroundColor(0xF9CF93)
              }
            }, (item: number) => item.toString())
          }
          .id('list_alignListItem_end')
          .alignListItem(ListItemAlign.End)
          .width('30%')
          .height('100%')
          .backgroundColor(0xF0F0F0)

          // Test alignListItem with null
          List() {
            ForEach(this.numbers, (item: number) => {
              ListItem() {
                Text('' + item)
                  .width(40)
                  .height(40)
                  .fontSize(14)
                  .textAlign(TextAlign.Center)
                  .backgroundColor(0xF9CF93)
              }
            }, (item: number) => item.toString())
          }
          .id('list_alignListItem_null')
          .alignListItem(null)
          .width('30%')
          .height('100%')
          .backgroundColor(0xF0F0F0)

          // Test alignListItem with undefined
          List() {
            ForEach(this.numbers, (item: number) => {
              ListItem() {
                Text('' + item)
                  .width(40)
                  .height(40)
                  .fontSize(14)
                  .textAlign(TextAlign.Center)
                  .backgroundColor(0xF9CF93)
              }
            }, (item: number) => item.toString())
          }
          .id('list_alignListItem_undefined')
          .alignListItem(undefined)
          .width('30%')
          .height('100%')
          .backgroundColor(0xF0F0F0)
        }
        .width('100%')
        .height('10%')
        .justifyContent(FlexAlign.SpaceEvenly)
        .margin({ bottom: 2 })

        // ========== listDirection tests (Axis) ==========
        Text('listDirection')
        Row() {
          // Test listDirection default value
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
          .id('list_listDirection_default')
          .width('30%')
          .height('100%')
          .backgroundColor(0xF0F0F0)

          // Test listDirection with null
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
          .id('list_listDirection_null')
          .listDirection(null)
          .width('30%')
          .height('100%')
          .backgroundColor(0xF0F0F0)

          // Test listDirection with undefined
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
          .id('list_listDirection_undefined')
          .listDirection(undefined)
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
          .id('list_scrollBar_default')
          .width('30%')
          .height('100%')
          .backgroundColor(0xF0F0F0)

          // Test scrollBar with null
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
          .id('list_scrollBar_null')
          .scrollBar(null)
          .width('30%')
          .height('100%')
          .backgroundColor(0xF0F0F0)

          // Test scrollBar with undefined
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
          .id('list_scrollBar_undefined')
          .scrollBar(undefined)
          .width('30%')
          .height('100%')
          .backgroundColor(0xF0F0F0)
        }
        .width('100%')
        .height('10%')
        .justifyContent(FlexAlign.SpaceEvenly)
        .margin({ bottom: 2 })

        // ========== edgeEffect tests ==========
        Text('edgeEffect')
        Row() {
          // Test edgeEffect default value
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
          .id('list_edgeEffect_default')
          .width('20%')
          .height('100%')
          .backgroundColor(0xF0F0F0)

          // Test edgeEffect with null
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
          .id('list_edgeEffect_null')
          .edgeEffect(null)
          .width('20%')
          .height('100%')
          .backgroundColor(0xF0F0F0)

          // Test edgeEffect with undefined
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
          .id('list_edgeEffect_undefined')
          .edgeEffect(undefined)
          .width('20%')
          .height('100%')
          .backgroundColor(0xF0F0F0)

          // Test edgeEffect options with null
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
          .id('list_edgeEffect_options_null')
          .edgeEffect(EdgeEffect.Spring, null)
          .width('20%')
          .height('100%')
          .backgroundColor(0xF0F0F0)

          // Test edgeEffect options with undefined
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
          .id('list_edgeEffect_options_undefined')
          .edgeEffect(EdgeEffect.Spring, undefined)
          .width('20%')
          .height('100%')
          .backgroundColor(0xF0F0F0)
        }
        .width('100%')
        .height('10%')
        .justifyContent(FlexAlign.SpaceEvenly)
        .margin({ bottom: 2 })

        // ========== contentStartOffset tests ==========
        Text('contentStartOffset')
        Row() {
          // Test contentStartOffset default value
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
          .id('list_contentStartOffset_default')
          .width('30%')
          .height('100%')
          .backgroundColor(0xF0F0F0)

          // Test contentStartOffset with null
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
          .id('list_contentStartOffset_null')
          .contentStartOffset(null)
          .width('30%')
          .height('100%')
          .backgroundColor(0xF0F0F0)

          // Test contentStartOffset with undefined
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
          .id('list_contentStartOffset_undefined')
          .contentStartOffset(undefined)
          .width('30%')
          .height('100%')
          .backgroundColor(0xF0F0F0)
        }
        .width('100%')
        .height('10%')
        .justifyContent(FlexAlign.SpaceEvenly)
        .margin({ bottom: 2 })

        // ========== contentEndOffset tests (boolean) ==========
        Text('contentEndOffset')
        Row() {
          // Test contentEndOffset default value
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
          .id('list_contentEndOffset_default')
          .width('30%')
          .height('100%')
          .backgroundColor(0xF0F0F0)

          // Test contentEndOffset with null
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
          .id('list_contentEndOffset_null')
          .contentEndOffset(null)
          .width('30%')
          .height('100%')
          .backgroundColor(0xF0F0F0)

          // Test contentEndOffset with undefined
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
          .id('list_contentEndOffset_undefined')
          .contentEndOffset(undefined)
          .width('30%')
          .height('100%')
          .backgroundColor(0xF0F0F0)
        }
        .width('100%')
        .height('10%')
        .justifyContent(FlexAlign.SpaceEvenly)
        .margin({ bottom: 2 })

        // ========== divider tests ==========
        Text('divider')
        Row() {
          // Test divider default value
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
          .id('list_divider_default')
          .width('30%')
          .height('100%')
          .backgroundColor(0xF0F0F0)

          // Test divider with null
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
          .id('list_divider_null')
          .divider(null)
          .width('30%')
          .height('100%')
          .backgroundColor(0xF0F0F0)

          // Test divider with undefined
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
          .id('list_divider_undefined')
          .divider(undefined)
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