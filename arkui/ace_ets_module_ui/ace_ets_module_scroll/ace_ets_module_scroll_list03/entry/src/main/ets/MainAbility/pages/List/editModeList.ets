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
struct editModeOptionsListExample {
  @State arr: number[] = []
  @State enable:boolean = true

  aboutToAppear() {
    for (let i = 1; i <= 20; i++) {
      this.arr.push(i)
    }
  }

  @Builder
  MenuBuilder() {
    Flex({ direction: FlexDirection.Column, justifyContent: FlexAlign.Center, alignItems: ItemAlign.Center }) {
      Text('menu item1')
        .id('list_editMode_menu')
        .width(100)
        .height(50)
        .textAlign(TextAlign.Center)
      Divider().height(5)
      Text('menu item2')
        .width(100)
        .height(50)
        .textAlign(TextAlign.Center)
    }.width(100)
  }

  build() {
    Column() {
      Button('editModeOptions')
        .id('list_editMode_false')
        .onClick(() => {
          this.enable = false
        })
      List({space: 5}) {
        ForEach(this.arr, (day: string) => {
          ListItem() {
            Text('item' + day)
              .id('list_editMode_' + day)
              .fontSize(16)
              .backgroundColor(0xF9CF93)
              .width('100%')
              .height('30%')
              .textAlign(TextAlign.Center)
          }
          .selected(true)
          .bindContextMenu(this.MenuBuilder, ResponseType.LongPress,
            { preview: MenuPreviewMode.IMAGE, hapticFeedbackMode: HapticFeedbackMode.ENABLED })
        }, (day: string) => day)
      }
      .id('list_editMode')
      .editModeOptions({ enableGatherSelectedItemsAnimation: this.enable,
        onGetPreviewBadge: () => {
          return true
        }
      })
      .width('70%')
      .backgroundColor(0xFAEEE0)
      .height('60%')
    }
    .width('100%')
    .margin({ top: 5 })
  }
}