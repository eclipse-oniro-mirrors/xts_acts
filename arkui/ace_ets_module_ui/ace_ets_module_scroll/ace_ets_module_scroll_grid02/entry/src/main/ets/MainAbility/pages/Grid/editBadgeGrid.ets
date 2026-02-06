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
struct editModeOptionsBadgeGrid {
  @State arr: number[] = []
  @State numberBadge: number = 0;
  @State isSelectedGrid: boolean[] = [];

  @Styles
  normalStyles(): void {
    .opacity(1.0)
  }
  @Styles
  selectStyles(): void {
    .opacity(0.4)
  }

  onPageShow(): void {
    let i: number = 0;
    for (i = 0; i <= 20; i++) {
      this.arr.push(i);
      this.isSelectedGrid.push(false);
    }
  }

  @Builder
  MenuBuilder() {
    Flex({ direction: FlexDirection.Column, justifyContent: FlexAlign.Center, alignItems: ItemAlign.Center }) {
      Text('menu item1')
        .id('grid_editBadge_menu')
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
      Text('numberBadge: '+ this.numberBadge)
        .id('grid_editBadge_text')
        .margin({ top: 5 })
      Grid() {
        ForEach(this.arr, (idx: number) => {
          GridItem() {
            Text('item' + idx)
              .id('grid_editBadge_' + idx)
              .fontSize(16)
              .backgroundColor(0xF9CF93)
              .width('100%')
              .height('100%')
              .textAlign(TextAlign.Center)
          }
          .selected(true)
          .bindContextMenu(this.MenuBuilder, ResponseType.LongPress,
            {
              preview: MenuPreviewMode.IMAGE,
              hapticFeedbackMode: HapticFeedbackMode.ENABLED
            })
          .selectable(true)
          .selected(this.isSelectedGrid[idx])
          // 设置多选显示效果
          .stateStyles({
            normal: this.normalStyles,
            selected: this.selectStyles
          })
          .onClick(() => {
            this.isSelectedGrid[idx] = !this.isSelectedGrid[idx]
            if (this.isSelectedGrid[idx]) {
              this.numberBadge++;
            } else {
              this.numberBadge--;
            }
          })
        }, (idx: string) => idx)
      }
      .id('grid_editBadge')
      .editModeOptions({ enableGatherSelectedItemsAnimation: true,
        onGetPreviewBadge: () => {
          console.log('numberBadge: '+ this.numberBadge)
          return this.numberBadge;
        }
      })
      .columnsTemplate('1fr 1fr 1fr')
      .rowsTemplate('1fr 1fr 1fr')
      .columnsGap(10)
      .rowsGap(10)
      .width('90%')
      .height('40%')
      .borderWidth(1)
      .margin(5)
      .backgroundColor(0xFAEEE0)

      Grid() {
        ForEach(this.arr, (day: string) => {
          GridItem() {
            Text('item' + day)
              .id('grid_editBadge_false_' + day)
              .fontSize(16)
              .backgroundColor(0xF9CF93)
              .width('100%')
              .height('100%')
              .textAlign(TextAlign.Center)
          }
          .selected(true)
          .bindContextMenu(this.MenuBuilder, ResponseType.LongPress,
            { preview: MenuPreviewMode.IMAGE, hapticFeedbackMode: HapticFeedbackMode.ENABLED })
        }, (day: string) => day)
      }
      .editModeOptions({ enableGatherSelectedItemsAnimation: true,
        onGetPreviewBadge: () => {
          return false
        }
      })
      .id('grid_editBadge_false')
      .columnsTemplate('1fr 1fr')
      .rowsTemplate('1fr 1fr')
      .columnsGap(10)
      .rowsGap(10)
      .width('90%')
      .backgroundColor(0xFAEEE0)
      .height('40%')
    }
    .width('100%')
    .height('100%')
  }
}