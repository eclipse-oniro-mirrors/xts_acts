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
struct ListItemNullUndefinedExample {
  @State numbers: string[] = []

  aboutToAppear() {
    for (let i = 1; i <= 9; i++) {
      this.numbers.push(i + '')
    }
  }

  build() {
    Column() {
      // ========== sticky tests (Sticky) ==========
      Text('sticky')
      Row() {
        // Test sticky default value
        List() {
          ListItem() {
            Text('Item 1')
              .width('100%')
              .height(40)
              .fontSize(14)
              .textAlign(TextAlign.Center)
              .backgroundColor(0xF9CF93)
          }
          .id('listItem_sticky_default')
        }
        .width('25%')
        .height('100%')
        .backgroundColor(0xF0F0F0)

        // Test sticky with null
        List() {
          ListItem() {
            Text('Item 2')
              .width('100%')
              .height(40)
              .fontSize(14)
              .textAlign(TextAlign.Center)
              .backgroundColor(0xF9CF93)
          }
          .sticky(null)
          .id('listItem_sticky_null')
        }
        .width('25%')
        .height('100%')
        .backgroundColor(0xF0F0F0)

        // Test sticky with undefined
        List() {
          ListItem() {
            Text('Item 3')
              .width('100%')
              .height(40)
              .fontSize(14)
              .textAlign(TextAlign.Center)
              .backgroundColor(0xF9CF93)
          }
          .sticky(undefined)
          .id('listItem_sticky_undefined')
        }
        .width('25%')
        .height('100%')
        .backgroundColor(0xF0F0F0)
      }
      .width('100%')
      .height('10%')
      .justifyContent(FlexAlign.SpaceEvenly)
      .margin({ bottom: 2 })

      // ========== editable tests (boolean | EditMode) ==========
      Text('editable')
      Row() {
        // Test editable default value
        List() {
          ListItem() {
            Text('Item 1')
              .width('100%')
              .height(40)
              .fontSize(14)
              .textAlign(TextAlign.Center)
              .backgroundColor(0xF9CF93)
          }
          .id('listItem_editable_default')
        }
        .width('25%')
        .height('100%')
        .backgroundColor(0xF0F0F0)

        // Test editable with null
        List() {
          ListItem() {
            Text('Item 2')
              .width('100%')
              .height(40)
              .fontSize(14)
              .textAlign(TextAlign.Center)
              .backgroundColor(0xF9CF93)
          }
          .editable(null)
          .id('listItem_editable_null')
        }
        .width('25%')
        .height('100%')
        .backgroundColor(0xF0F0F0)

        // Test editable with undefined
        List() {
          ListItem() {
            Text('Item 3')
              .width('100%')
              .height(40)
              .fontSize(14)
              .textAlign(TextAlign.Center)
              .backgroundColor(0xF9CF93)
          }
          .editable(undefined)
          .id('listItem_editable_undefined')
        }
        .width('25%')
        .height('100%')
        .backgroundColor(0xF0F0F0)

        // Test editable with false
        List() {
          ListItem() {
            Text('Item 4')
              .width('100%')
              .height(40)
              .fontSize(14)
              .textAlign(TextAlign.Center)
              .backgroundColor(0xF9CF93)
          }
          .editable(false)
          .id('listItem_editable_false')
        }
        .width('25%')
        .height('100%')
        .backgroundColor(0xF0F0F0)
      }
      .width('100%')
      .height('10%')
      .justifyContent(FlexAlign.SpaceEvenly)
      .margin({ bottom: 2 })

      // ========== selectable tests (boolean) ==========
      Text('selectable')
      Row() {
        // Test selectable default value
        List() {
          ListItem() {
            Text('Item 1')
              .width('100%')
              .height(40)
              .fontSize(14)
              .textAlign(TextAlign.Center)
              .backgroundColor(0xF9CF93)
          }
          .id('listItem_selectable_default')
        }
        .width('25%')
        .height('100%')
        .backgroundColor(0xF0F0F0)

        // Test selectable with null
        List() {
          ListItem() {
            Text('Item 2')
              .width('100%')
              .height(40)
              .fontSize(14)
              .textAlign(TextAlign.Center)
              .backgroundColor(0xF9CF93)
          }
          .selectable(null)
          .id('listItem_selectable_null')
        }
        .width('25%')
        .height('100%')
        .backgroundColor(0xF0F0F0)

        // Test selectable with undefined
        List() {
          ListItem() {
            Text('Item 3')
              .width('100%')
              .height(40)
              .fontSize(14)
              .textAlign(TextAlign.Center)
              .backgroundColor(0xF9CF93)
          }
          .selectable(undefined)
          .id('listItem_selectable_undefined')
        }
        .width('25%')
        .height('100%')
        .backgroundColor(0xF0F0F0)
      }
      .width('100%')
      .height('10%')
      .justifyContent(FlexAlign.SpaceEvenly)
      .margin({ bottom: 2 })

      // ========== selected tests (boolean) ==========
      Text('selected')
      Row() {
        // Test selected default value
        List() {
          ListItem() {
            Text('Item 1')
              .width('100%')
              .height(40)
              .fontSize(14)
              .textAlign(TextAlign.Center)
              .backgroundColor(0xF9CF93)
          }
          .id('listItem_selected_default')
        }
        .width('25%')
        .height('100%')
        .backgroundColor(0xF0F0F0)

        // Test selected with null
        List() {
          ListItem() {
            Text('Item 2')
              .width('100%')
              .height(40)
              .fontSize(14)
              .textAlign(TextAlign.Center)
              .backgroundColor(0xF9CF93)
          }
          .selected(null)
          .id('listItem_selected_null')
        }
        .width('25%')
        .height('100%')
        .backgroundColor(0xF0F0F0)

        // Test selected with undefined
        List() {
          ListItem() {
            Text('Item 3')
              .width('100%')
              .height(40)
              .fontSize(14)
              .textAlign(TextAlign.Center)
              .backgroundColor(0xF9CF93)
          }
          .selected(undefined)
          .id('listItem_selected_undefined')
        }
        .width('25%')
        .height('100%')
        .backgroundColor(0xF0F0F0)

        // Test selected with false
        List() {
          ListItem() {
            Text('Item 4')
              .width('100%')
              .height(40)
              .fontSize(14)
              .textAlign(TextAlign.Center)
              .backgroundColor(0xF9CF93)
          }
          .selected(false)
          .id('listItem_selected_false')
        }
        .width('25%')
        .height('100%')
        .backgroundColor(0xF0F0F0)
      }
      .width('100%')
      .height('10%')
      .justifyContent(FlexAlign.SpaceEvenly)
      .margin({ bottom: 2 })

      // ========== swipeAction tests (SwipeActionOptions) ==========
      Text('swipeAction')
      Row() {
        // Test swipeAction default value
        List() {
          ListItem() {
            Text('Item 1')
              .width('100%')
              .height(40)
              .fontSize(14)
              .textAlign(TextAlign.Center)
              .backgroundColor(0xF9CF93)
          }
          .id('listItem_swipeAction_default')
        }
        .width('25%')
        .height('100%')
        .backgroundColor(0xF0F0F0)

        // Test swipeAction with null
        List() {
          ListItem() {
            Text('Item 2')
              .width('100%')
              .height(40)
              .fontSize(14)
              .textAlign(TextAlign.Center)
              .backgroundColor(0xF9CF93)
          }
          .swipeAction(null)
          .id('listItem_swipeAction_null')
        }
        .width('25%')
        .height('100%')
        .backgroundColor(0xF0F0F0)

        // Test swipeAction with undefined
        List() {
          ListItem() {
            Text('Item 3')
              .width('100%')
              .height(40)
              .fontSize(14)
              .textAlign(TextAlign.Center)
              .backgroundColor(0xF9CF93)
          }
          .swipeAction(undefined)
          .id('listItem_swipeAction_undefined')
        }
        .width('25%')
        .height('100%')
        .backgroundColor(0xF0F0F0)
      }
      .width('100%')
      .height('10%')
      .justifyContent(FlexAlign.SpaceEvenly)
      .margin({ bottom: 2 })

      // ========== ListItemOptions (style) tests ==========
      Text('ListItemOptions')
      Row() {
        // Test ListItemOptions default value
        List() {
          ListItem() {
            Text('Item 1')
              .width('100%')
              .height(40)
              .fontSize(14)
              .textAlign(TextAlign.Center)
              .backgroundColor(0xF9CF93)
          }
          .id('listItem_options_default')
        }
        .width('25%')
        .height('100%')
        .backgroundColor(0xF0F0F0)

        // Test ListItemOptions with null
        List() {
          ListItem({style:null}) {
            Text('Item 2')
              .width('100%')
              .height(40)
              .fontSize(14)
              .textAlign(TextAlign.Center)
              .backgroundColor(0xF9CF93)
          }
          .id('listItem_options_null')
        }
        .width('25%')
        .height('100%')
        .backgroundColor(0xF0F0F0)

        // Test ListItemOptions with undefined
        List() {
          ListItem({style:undefined}) {
            Text('Item 3')
              .width('100%')
              .height(40)
              .fontSize(14)
              .textAlign(TextAlign.Center)
              .backgroundColor(0xF9CF93)
          }
          .id('listItem_options_undefined')
        }
        .width('25%')
        .height('100%')
        .backgroundColor(0xF0F0F0)
      }
      .width('100%')
      .height('10%')
      .justifyContent(FlexAlign.SpaceEvenly)
      .margin({ bottom: 2 })

      // ========== onSelect tests ==========
      Text('onSelect')
      Row() {
        // Test onSelect default value
        List() {
          ListItem() {
            Text('Item 1')
              .width('100%')
              .height(40)
              .fontSize(14)
              .textAlign(TextAlign.Center)
              .backgroundColor(0xF9CF93)
          }
          .id('listItem_onSelect_default')
        }
        .width('25%')
        .height('100%')
        .backgroundColor(0xF0F0F0)

        // Test onSelect with null
        List() {
          ListItem() {
            Text('Item 2')
              .width('100%')
              .height(40)
              .fontSize(14)
              .textAlign(TextAlign.Center)
              .backgroundColor(0xF9CF93)
          }
          .onSelect(null)
          .id('listItem_onSelect_null')
        }
        .width('25%')
        .height('100%')
        .backgroundColor(0xF0F0F0)

        // Test onSelect with undefined
        List() {
          ListItem() {
            Text('Item 3')
              .width('100%')
              .height(40)
              .fontSize(14)
              .textAlign(TextAlign.Center)
              .backgroundColor(0xF9CF93)
          }
          .onSelect(undefined)
          .id('listItem_onSelect_undefined')
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