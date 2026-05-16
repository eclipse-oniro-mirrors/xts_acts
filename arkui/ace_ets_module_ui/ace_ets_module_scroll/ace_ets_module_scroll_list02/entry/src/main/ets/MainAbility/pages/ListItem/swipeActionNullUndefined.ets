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
struct ListItemSwipeActionNullUndefined {
  @Builder
  itemAction(str: string) {
    Row() {
      Button(str).margin('4vp')
    }.padding('4vp').justifyContent(FlexAlign.SpaceEvenly)
  }

  build() {
    Column() {
      // ========== expand tests ==========
      Text('expand node')
      Row() {
        // Test expand node with null
        Button('expand null')
          .id('expand_nullUndefined_1')
          .onClick(() => {
            try {
              ListItemSwipeActionManager.expand(null, ListItemSwipeActionDirection.START)
            } catch (error) {
              console.error('Error expand item:', (error as BusinessError).code, (error as BusinessError).message);
            }
          })

        // Test expand node undefined
        Button('expand undefined')
          .id('expand_nullUndefined_2')
          .onClick(() => {
            try {
              ListItemSwipeActionManager.expand(undefined, ListItemSwipeActionDirection.END)
            } catch (error) {
              console.error('Error expand item:', (error as BusinessError).code, (error as BusinessError).message);
            }
          })
      }.height('5%')
      // ========== expand tests ==========
      Text('expand direction')
      Row() {
        // Test expand direction with null
        Button('direction null')
          .id('expand_nullUndefined_3')
          .onClick(() => {
            try {
              let node: FrameNode | null = this.getUIContext().getAttachedFrameNodeById('listItem_swipeAction_nullUndefined');
              ListItemSwipeActionManager.expand(node, null)
            } catch (error) {
              console.error('Error expand item:', (error as BusinessError).code, (error as BusinessError).message);
            }
          })

        // Test expand direction undefined
        Button('direction undefined')
          .id('expand_nullUndefined_4')
          .onClick(() => {
            try {
              let node: FrameNode | null = this.getUIContext().getAttachedFrameNodeById('listItem_swipeAction_nullUndefined');
              ListItemSwipeActionManager.expand(node, undefined)
            } catch (error) {
              console.error('Error expand item:', (error as BusinessError).code, (error as BusinessError).message);
            }
          })
      }.height('5%')

      // ========== collapse tests ==========
      Text('collapse')
      Row() {
        // Test collapse node with null
        Button('collapse null')
          .id('collapse_nullUndefined_1')
          .onClick(() => {
            try {
              ListItemSwipeActionManager.collapse(null)
            } catch (error) {
              console.error('Error expand item:', (error as BusinessError).code, (error as BusinessError).message);
            }
          })

        // Test collapse node undefined
        Button('collapse undefined')
          .id('collapse_nullUndefined_2')
          .onClick(() => {
            try {
              ListItemSwipeActionManager.collapse(undefined)
            } catch (error) {
              console.error('Error expand item:', (error as BusinessError).code, (error as BusinessError).message);
            }
          })
      }.height('5%')

      List() {
        ListItem() {
          Text('item')
            .width('100%')
            .height('100%')
            .fontSize(16)
            .textAlign(TextAlign.Center)
            .borderRadius(10)
            .backgroundColor(0xF9CF93)
        }
        .id('listItem_swipeAction_nullUndefined')
        .transition(TransitionEffect.OPACITY)
        .swipeAction({
          start: {
            builder: () => {
              this.itemAction('start')
            },
          },
          end: {
            builder: () => {
              this.itemAction('end')
            },
          }
        })
      }
      .width('90%')
      .height('30%')
      .backgroundColor(0xF0F0F0)

    }
    .width('100%')
    .height('100%')
    .backgroundColor(0xDCDCDC)
    .padding({ top: 5 })
  }
}