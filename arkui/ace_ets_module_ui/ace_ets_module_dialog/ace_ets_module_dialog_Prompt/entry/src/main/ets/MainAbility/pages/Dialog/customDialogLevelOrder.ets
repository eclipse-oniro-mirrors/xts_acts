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

@CustomDialog
struct CustomDialogExampleD {
  controller?: CustomDialogController
  cancel: () => void = () => {
  }
  confirm: () => void = () => {
  }

  build() {
    Column() {
      Button('set levelOrder')
        .id('myOrder')
        .onClick(() => {
          let customOrder = this.getUIContext().getPromptAction().getTopOrder()
          if (customOrder !== undefined) {
            AppStorage.setOrCreate('customLevel', customOrder.getOrder())
            console.error('topOrder: ' + customOrder.getOrder());
          }
        })
      Button('close')
        .id('close')
        .onClick(() => {
          this.controller?.close()
        })
    }
  }
}

@Entry
@Component
struct customDialogLevelOrder {
  dialogController: CustomDialogController | null = new CustomDialogController({
    builder: CustomDialogExampleD({
      cancel: ()=> {},
      confirm: ()=> {}
    }),
    levelOrder: LevelOrder.clamp(100)
  })


  build() {
    Column({ space: 5 }) {
      Button('100')
        .id('100')
        .height('10%')
        .onClick(() => {
          this.dialogController = new CustomDialogController({
            builder: CustomDialogExampleD(),
            levelOrder: LevelOrder.clamp(100),
            alignment: DialogAlignment.Center,
          })
          if (this.dialogController != null) {
            this.dialogController.open()
          }
        })
      Button('100001')
        .id('100001')
        .height('10%')
        .onClick(() => {
          this.dialogController = new CustomDialogController({
            builder: CustomDialogExampleD(),
            levelOrder: LevelOrder.clamp(100001),
            alignment: DialogAlignment.Center
          })
          if ( this.dialogController != null) {
            this.dialogController.open()
          }
        })
      Button('-100001')
        .id('-100001')
        .height('10%')
        .onClick(() => {
          this.dialogController = new CustomDialogController({
            builder: CustomDialogExampleD(),
            levelOrder: LevelOrder.clamp(-100001),
            alignment: DialogAlignment.Center
          })
          if ( this.dialogController != null) {
            this.dialogController.open()
          }
        })
      Button('undefined')
        .id('undefined')
        .height('10%')
        .onClick(() => {
          this.dialogController= new CustomDialogController({
            builder: CustomDialogExampleD(),
            levelOrder: LevelOrder.clamp(undefined),
            alignment: DialogAlignment.Center
          })
          if ( this.dialogController != null) {
            this.dialogController.open()
          }
        })
      Button('100000')
        .id('100000')
        .height('10%')
        .onClick(() => {
          this.dialogController = new CustomDialogController({
            builder: CustomDialogExampleD(),
            levelOrder: LevelOrder.clamp(100000),
            alignment: DialogAlignment.Center
          })
          if ( this.dialogController != null) {
            this.dialogController.open()
          }
        })
      Button('-100000')
        .id('-100000')
        .height('10%')
        .onClick(() => {
          this.dialogController = new CustomDialogController({
            builder: CustomDialogExampleD(),
            levelOrder: LevelOrder.clamp(-100000),
            alignment: DialogAlignment.Center
          })
          if ( this.dialogController != null) {
            this.dialogController.open()
          }
        })
    }
    .height('100%')
    .width('100%')
    .justifyContent(FlexAlign.Center)
  }
}