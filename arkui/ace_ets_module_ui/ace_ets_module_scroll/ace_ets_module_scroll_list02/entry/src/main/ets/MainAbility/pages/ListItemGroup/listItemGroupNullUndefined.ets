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
struct ListItemGroupNullUndefinedExample {
  @State numbers: string[] = []

  aboutToAppear() {
    for (let i = 1; i <= 9; i++) {
      this.numbers.push(i + '')
    }
  }

  @Builder
  itemHead(text: string) {
    Text(text)
      .fontSize(16)
      .backgroundColor(0xAABBCC)
      .width('100%')
      .padding(5)
  }

  @Builder
  itemFoot(num: number) {
    Text('共' + num + '个')
      .fontSize(14)
      .backgroundColor(0xAABBCC)
      .width('100%')
      .padding(5)
  }

  build() {
    Column() {
      // ========== divider tests (ListDividerOptions | null) ==========
      Text('divider')
      Row() {
        // Test divider default value
        List() {
          ListItemGroup() {
            ForEach([1, 2, 3], (item: number) => {
              ListItem() {
                Text('' + item)
                  .width('100%')
                  .height(30)
                  .fontSize(14)
                  .textAlign(TextAlign.Center)
                  .backgroundColor(0xF9CF93)
              }
            }, (item: number) => item.toString())
          }
          .id('listItemGroup_divider_default')
        }
        .width('25%')
        .height('100%')
        .backgroundColor(0xF0F0F0)

        // Test divider with null
        List() {
          ListItemGroup() {
            ForEach([1, 2, 3], (item: number) => {
              ListItem() {
                Text('' + item)
                  .width('100%')
                  .height(30)
                  .fontSize(14)
                  .textAlign(TextAlign.Center)
                  .backgroundColor(0xF9CF93)
              }
            }, (item: number) => item.toString())
          }
          .divider(null)
          .id('listItemGroup_divider_null')
        }
        .width('25%')
        .height('100%')
        .backgroundColor(0xF0F0F0)

        // Test divider with undefined
        List() {
          ListItemGroup() {
            ForEach([1, 2, 3], (item: number) => {
              ListItem() {
                Text('' + item)
                  .width('100%')
                  .height(30)
                  .fontSize(14)
                  .textAlign(TextAlign.Center)
                  .backgroundColor(0xF9CF93)
              }
            }, (item: number) => item.toString())
          }
          .divider(undefined)
          .id('listItemGroup_divider_undefined')
        }
        .width('25%')
        .height('100%')
        .backgroundColor(0xF0F0F0)
      }
      .width('100%')
      .height('10%')
      .justifyContent(FlexAlign.SpaceEvenly)
      .margin({ bottom: 2 })

      // ========== childrenMainSize tests (ChildrenMainSize) ==========
      Text('childrenMainSize')
      Row() {
        // Test childrenMainSize default value
        List() {
          ListItemGroup() {
            ForEach([1, 2, 3], (item: number) => {
              ListItem() {
                Text('' + item)
                  .width('100%')
                  .height(30)
                  .fontSize(14)
                  .textAlign(TextAlign.Center)
                  .backgroundColor(0xF9CF93)
              }
            }, (item: number) => item.toString())
          }
          .id('listItemGroup_childrenMainSize_default')
        }
        .width('25%')
        .height('100%')
        .backgroundColor(0xF0F0F0)

        // Test childrenMainSize with null
        List() {
          ListItemGroup() {
            ForEach([1, 2, 3], (item: number) => {
              ListItem() {
                Text('' + item)
                  .width('100%')
                  .height(30)
                  .fontSize(14)
                  .textAlign(TextAlign.Center)
                  .backgroundColor(0xF9CF93)
              }
            }, (item: number) => item.toString())
          }
          .childrenMainSize(null)
          .id('listItemGroup_childrenMainSize_null')
        }
        .width('25%')
        .height('100%')
        .backgroundColor(0xF0F0F0)

        // Test childrenMainSize with undefined
        List() {
          ListItemGroup() {
            ForEach([1, 2, 3], (item: number) => {
              ListItem() {
                Text('' + item)
                  .width('100%')
                  .height(30)
                  .fontSize(14)
                  .textAlign(TextAlign.Center)
                  .backgroundColor(0xF9CF93)
              }
            }, (item: number) => item.toString())
          }
          .childrenMainSize(undefined)
          .id('listItemGroup_childrenMainSize_undefined')
        }
        .width('25%')
        .height('100%')
        .backgroundColor(0xF0F0F0)
      }
      .width('100%')
      .height('10%')
      .justifyContent(FlexAlign.SpaceEvenly)
      .margin({ bottom: 2 })

      // ========== ListItemGroupOptions header tests ==========
      Text('ListItemGroupOptions header')
      Row() {
        // Test ListItemGroupOptions default value
        List() {
          ListItemGroup() {
            ForEach([1, 2, 3], (item: number) => {
              ListItem() {
                Text('' + item)
                  .width('100%')
                  .height(30)
                  .fontSize(14)
                  .textAlign(TextAlign.Center)
                  .backgroundColor(0xF9CF93)
              }
            }, (item: number) => item.toString())
          }
          .id('listItemGroup_options_header_default')
        }
        .width('25%')
        .height('100%')
        .backgroundColor(0xF0F0F0)

        // Test ListItemGroupOptions with null header
        List() {
          ListItemGroup({ header: null }) {
            ForEach([1, 2, 3], (item: number) => {
              ListItem() {
                Text('' + item)
                  .width('100%')
                  .height(30)
                  .fontSize(14)
                  .textAlign(TextAlign.Center)
                  .backgroundColor(0xF9CF93)
              }
            }, (item: number) => item.toString())
          }
          .id('listItemGroup_options_header_null')
        }
        .width('25%')
        .height('100%')
        .backgroundColor(0xF0F0F0)

        // Test ListItemGroupOptions with undefined header
        List() {
          ListItemGroup({ header: undefined }) {
            ForEach([1, 2, 3], (item: number) => {
              ListItem() {
                Text('' + item)
                  .width('100%')
                  .height(30)
                  .fontSize(14)
                  .textAlign(TextAlign.Center)
                  .backgroundColor(0xF9CF93)
              }
            }, (item: number) => item.toString())
          }
          .id('listItemGroup_options_header_undefined')
        }
        .width('25%')
        .height('100%')
        .backgroundColor(0xF0F0F0)
      }
      .width('100%')
      .height('10%')
      .justifyContent(FlexAlign.SpaceEvenly)
      .margin({ bottom: 2 })

      // ========== ListItemGroupOptions footer tests ==========
      Text('ListItemGroupOptions footer')
      Row() {
        // Test ListItemGroupOptions default value
        List() {
          ListItemGroup() {
            ForEach([1, 2, 3], (item: number) => {
              ListItem() {
                Text('' + item)
                  .width('100%')
                  .height(30)
                  .fontSize(14)
                  .textAlign(TextAlign.Center)
                  .backgroundColor(0xF9CF93)
              }
            }, (item: number) => item.toString())
          }
          .id('listItemGroup_options_footer_default')
        }
        .width('25%')
        .height('100%')
        .backgroundColor(0xF0F0F0)

        // Test ListItemGroupOptions with null footer
        List() {
          ListItemGroup({ footer: null }) {
            ForEach([1, 2, 3], (item: number) => {
              ListItem() {
                Text('' + item)
                  .width('100%')
                  .height(30)
                  .fontSize(14)
                  .textAlign(TextAlign.Center)
                  .backgroundColor(0xF9CF93)
              }
            }, (item: number) => item.toString())
          }
          .id('listItemGroup_options_footer_null')
        }
        .width('25%')
        .height('100%')
        .backgroundColor(0xF0F0F0)

        // Test ListItemGroupOptions with undefined footer
        List() {
          ListItemGroup({ footer: undefined }) {
            ForEach([1, 2, 3], (item: number) => {
              ListItem() {
                Text('' + item)
                  .width('100%')
                  .height(30)
                  .fontSize(14)
                  .textAlign(TextAlign.Center)
                  .backgroundColor(0xF9CF93)
              }
            }, (item: number) => item.toString())
          }
          .id('listItemGroup_options_footer_undefined')
        }
        .width('25%')
        .height('100%')
        .backgroundColor(0xF0F0F0)
      }
      .width('100%')
      .height('10%')
      .justifyContent(FlexAlign.SpaceEvenly)
      .margin({ bottom: 2 })

      // ========== ListItemGroupOptions space tests (number|string) ==========
      Text('ListItemGroupOptions space')
      Row() {
        // Test ListItemGroupOptions default value
        List() {
          ListItemGroup() {
            ForEach([1, 2, 3], (item: number) => {
              ListItem() {
                Text('' + item)
                  .width('100%')
                  .height(30)
                  .fontSize(14)
                  .textAlign(TextAlign.Center)
                  .backgroundColor(0xF9CF93)
              }
            }, (item: number) => item.toString())
          }
          .id('listItemGroup_options_space_default')
        }
        .width('25%')
        .height('100%')
        .backgroundColor(0xF0F0F0)

        // Test ListItemGroupOptions with empty string space
        List() {
          ListItemGroup({ space: '' }) {
            ForEach([1, 2, 3], (item: number) => {
              ListItem() {
                Text('' + item)
                  .width('100%')
                  .height(30)
                  .fontSize(14)
                  .textAlign(TextAlign.Center)
                  .backgroundColor(0xF9CF93)
              }
            }, (item: number) => item.toString())
          }
          .id('listItemGroup_options_space_emptyString')
        }
        .width('25%')
        .height('100%')
        .backgroundColor(0xF0F0F0)

        // Test ListItemGroupOptions with null space
        List() {
          ListItemGroup({ space: null }) {
            ForEach([1, 2, 3], (item: number) => {
              ListItem() {
                Text('' + item)
                  .width('100%')
                  .height(30)
                  .fontSize(14)
                  .textAlign(TextAlign.Center)
                  .backgroundColor(0xF9CF93)
              }
            }, (item: number) => item.toString())
          }
          .id('listItemGroup_options_space_null')
        }
        .width('25%')
        .height('100%')
        .backgroundColor(0xF0F0F0)

        // Test ListItemGroupOptions with undefined space
        List() {
          ListItemGroup({ space: undefined }) {
            ForEach([1, 2, 3], (item: number) => {
              ListItem() {
                Text('' + item)
                  .width('100%')
                  .height(30)
                  .fontSize(14)
                  .textAlign(TextAlign.Center)
                  .backgroundColor(0xF9CF93)
              }
            }, (item: number) => item.toString())
          }
          .id('listItemGroup_options_space_undefined')
        }
        .width('25%')
        .height('100%')
        .backgroundColor(0xF0F0F0)
      }
      .width('100%')
      .height('10%')
      .justifyContent(FlexAlign.SpaceEvenly)
      .margin({ bottom: 2 })

      // ========== ListItemGroupOptions style tests ==========
      Text('ListItemGroupOptions style')
      Row() {
        // Test ListItemGroupOptions default value
        List() {
          ListItemGroup() {
            ForEach([1, 2, 3], (item: number) => {
              ListItem() {
                Text('' + item)
                  .width('100%')
                  .height(30)
                  .fontSize(14)
                  .textAlign(TextAlign.Center)
                  .backgroundColor(0xF9CF93)
              }
            }, (item: number) => item.toString())
          }
          .id('listItemGroup_options_style_default')
        }
        .width('25%')
        .height('100%')
        .backgroundColor(0xF0F0F0)

        // Test ListItemGroupOptions with null style
        List() {
          ListItemGroup({ style: null }) {
            ForEach([1, 2, 3], (item: number) => {
              ListItem() {
                Text('' + item)
                  .width('100%')
                  .height(30)
                  .fontSize(14)
                  .textAlign(TextAlign.Center)
                  .backgroundColor(0xF9CF93)
              }
            }, (item: number) => item.toString())
          }
          .id('listItemGroup_options_style_null')
        }
        .width('25%')
        .height('100%')
        .backgroundColor(0xF0F0F0)

        // Test ListItemGroupOptions with undefined style
        List() {
          ListItemGroup({ style: undefined }) {
            ForEach([1, 2, 3], (item: number) => {
              ListItem() {
                Text('' + item)
                  .width('100%')
                  .height(30)
                  .fontSize(14)
                  .textAlign(TextAlign.Center)
                  .backgroundColor(0xF9CF93)
              }
            }, (item: number) => item.toString())
          }
          .id('listItemGroup_options_style_undefined')
        }
        .width('25%')
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