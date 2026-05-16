'use static';
/**
 * Copyright (c) 2025 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the 'License');
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an 'AS IS' BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
import { LevelOrder } from '@ohos.promptAction'
import { Entry, Column, Component, Flex, FlexDirection, ItemAlign, FlexAlign, Text, Button, FontWeight,
  Row, ClickEvent, Margin, ButtonType, ColumnOptions, RowOptions, DialogAlignment} from '@ohos.arkui.component'
import { AppStorage } from '@ohos.arkui.stateManagement';
import { UIContext, Router } from '@ohos.arkui.UIContext';
@Entry
@Component
struct showActionSheetOrder {
  uiContext: UIContext = this.getUIContext()

  build() {
    Column({ space: 5 } as ColumnOptions) {
      Row({ space: 5 } as RowOptions) {
        Button('100')
          .id('100')
          .height('8%')
          .onClick((e:ClickEvent) => {
            this.uiContext.showActionSheet({
              title: 'ActionSheet title',
              message: 'message',
              autoCancel: true,
              isModal: false,
              levelOrder: LevelOrder.clamp(100),
              confirm: {
                value: 'Confirm',
                action: () => {
                  console.info('Get Alert Dialog handled')
                }
              },
              cancel: () => {
                console.info('actionSheet canceled')
              },
              alignment: DialogAlignment.Bottom,
              sheets: [
                {
                  title: 'apples',
                  action: () => {
                    console.info('apples')
                  }
                }
              ]
            })
          })
        Button('undefined')
          .id('undefined')
          .height('8%')
          .onClick((e:ClickEvent) => {
            this.uiContext.showActionSheet({
              title: 'ActionSheet title',
              message: 'message',
              autoCancel: true,
              isModal: false,
              // levelOrder: LevelOrder.clamp(undefined),
              confirm: {
                value: 'Confirm',
                action: () => {
                  console.info('Get Alert Dialog handled')
                }
              },
              cancel: () => {
                console.info('actionSheet canceled')
              },
              alignment: DialogAlignment.Bottom,
              sheets: [
                {
                  title: 'apples',
                  action: () => {
                    console.info('apples')
                  }
                }
              ]
            })
          })
      }

      Row({ space: 5 } as RowOptions) {
        Button('100001')
          .id('100001')
          .height('8%')
          .onClick((e:ClickEvent) => {
            this.uiContext.showActionSheet({
              title: 'ActionSheet title',
              message: 'message',
              autoCancel: true,
              isModal: false,
              levelOrder: LevelOrder.clamp(100001),
              confirm: {
                value: 'Confirm',
                action: () => {
                  console.info('Get Alert Dialog handled')
                }
              },
              cancel: () => {
                console.info('actionSheet canceled')
              },
              alignment: DialogAlignment.Bottom,
              sheets: [
                {
                  title: 'apples',
                  action: () => {
                    console.info('apples')
                  }
                }
              ]
            })
          })
        Button('-100001')
          .id('-100001')
          .height('8%')
          .onClick((e:ClickEvent) => {
            this.uiContext.showActionSheet({
              title: 'ActionSheet title',
              message: 'message',
              autoCancel: true,
              isModal: false,
              levelOrder: LevelOrder.clamp(-100001),
              confirm: {
                value: 'Confirm',
                action: () => {
                  console.info('Get Alert Dialog handled')
                }
              },
              cancel: () => {
                console.info('actionSheet canceled')
              },
              alignment: DialogAlignment.Bottom,
              sheets: [
                {
                  title: 'apples',
                  action: () => {
                    console.info('apples')
                  }
                }
              ]
            })
          })
      }

      Button('get showActionSheetOrder')
        .id('myOrder')
        .onClick((e:ClickEvent) => {
          let showActionSheetOrder = this.getUIContext().getPromptAction().getTopOrder()
          if (showActionSheetOrder !== undefined) {
            AppStorage.setOrCreate<number>('showActionSheetOrder', showActionSheetOrder.getOrder())
          }
        })
    }
    .justifyContent(FlexAlign.Start)
    .height('100%')
    .width('100%')
  }
}