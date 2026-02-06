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
import { LevelOrder } from '@kit.ArkUI'

@Entry
@Component
struct showActionSheetOrder {
  uiContext: UIContext = this.getUIContext()

  build() {
    Column({ space: 5 }) {
      Row({ space: 5 }) {
        Button('100')
          .id('100')
          .height('8%')
          .onClick(() => {
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
          .onClick(() => {
            this.uiContext.showActionSheet({
              title: 'ActionSheet title',
              message: 'message',
              autoCancel: true,
              isModal: false,
              levelOrder: LevelOrder.clamp(undefined),
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

      Row({ space: 5 }) {
        Button('100001')
          .id('100001')
          .height('8%')
          .onClick(() => {
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
          .onClick(() => {
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
        .onClick(() => {
          let showActionSheetOrder = this.getUIContext().getPromptAction().getTopOrder()
          if (showActionSheetOrder !== undefined) {
            AppStorage.setOrCreate('showActionSheetOrder', showActionSheetOrder.getOrder())
          }
        })
    }
    .justifyContent(FlexAlign.Start)
    .height('100%')
    .width('100%')
  }
}