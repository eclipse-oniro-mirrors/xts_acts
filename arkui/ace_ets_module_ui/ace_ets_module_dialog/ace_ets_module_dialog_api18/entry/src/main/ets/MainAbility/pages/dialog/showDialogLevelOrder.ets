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
import { LevelOrder, PromptAction } from '@kit.ArkUI'

@Entry
@Component
struct showDialogLevelOrder {
  uiContext: UIContext = this.getUIContext()
  promptAction: PromptAction = this.uiContext.getPromptAction()

  build() {
    Column({ space: 5 }) {
      Row({ space: 5 }) {
        Button('100')
          .id('100')
          .height('8%')
          .onClick(() => {
            this.promptAction.showDialog({
              title: 'showDialog Title Info',
              message: 'showDialog',
              levelOrder: LevelOrder.clamp(100),
              alignment: DialogAlignment.Bottom,
              isModal: false,
              buttons: [
                {
                  text: 'button1',
                  color: '#000000'
                }
              ]
            })
          })
        Button('undefined')
          .id('undefined')
          .height('8%')
          .onClick(() => {
            this.promptAction.showDialog({
              title: 'showDialog Title Info',
              message: 'showDialog',
              levelOrder: LevelOrder.clamp(undefined),
              alignment: DialogAlignment.Bottom,
              isModal: false,
              buttons: [
                {
                  text: 'button1',
                  color: '#000000'
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
            this.promptAction.showDialog({
              title: 'showDialog Title Info',
              message: 'showDialog',
              levelOrder: LevelOrder.clamp(100001),
              alignment: DialogAlignment.Bottom,
              isModal: false,
              buttons: [
                {
                  text: 'button1',
                  color: '#000000'
                }
              ]
            })
          })
        Button('-100001')
          .id('-100001')
          .height('8%')
          .onClick(() => {
            this.promptAction.showDialog({
              title: 'showDialog Title Info',
              message: 'showDialog',
              levelOrder: LevelOrder.clamp(-100001),
              alignment: DialogAlignment.Bottom,
              isModal: false,
              buttons: [
                {
                  text: 'button1',
                  color: '#000000'
                }
              ]
            })
          })
      }


      Button('get showDialogOrder')
        .id('myOrder')
        .onClick(() => {
          let showDialogOrder = this.getUIContext().getPromptAction().getTopOrder()
          if (showDialogOrder !== undefined) {
            AppStorage.setOrCreate('showDialogOrder', showDialogOrder.getOrder())
          }
        })
    }
    .justifyContent(FlexAlign.Start)
    .height('100%')
    .width('100%')
  }
}