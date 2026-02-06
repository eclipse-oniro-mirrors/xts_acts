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
import { PromptAction } from '@kit.ArkUI'


@Entry
@Component
struct subwindowDialogExample {
  promptAction: PromptAction = this.getUIContext().getPromptAction()
  private customDialogComponentId: number = 0
  private iconStr: ResourceStr = $r('app.media.icon')
  @State mText1: string = ''
  @State mText2: string = ''
  @State keyboardAvoidMode1: number | undefined = 0
  @State keyboardAvoidMode2: number | undefined = 1
  @State dialogSubwindowTag: boolean = false

  @Builder
  MyMenu() {
    Menu() {
      MenuItem({ startIcon: this.iconStr, content: '菜单选项' })
      MenuItem({ startIcon: this.iconStr, content: '菜单选项' })
      MenuItem({ startIcon: this.iconStr, content: '菜单选项' })
    }
  }

  @Builder
  customDialogComponent() {
    Column({ space: 5 }) {
      Text('长按触发Menu弹出')
        .id('subwindowDialogLongClickMenu')
        .width(200)
        .height(100)
        .textAlign(TextAlign.Center)
        .margin(100)
        .fontSize(30)
        .bindContextMenu(this.MyMenu, ResponseType.LongPress,
          {
            preview: MenuPreviewMode.IMAGE,
          })
        .backgroundColor('#ff3df2f5')
      Button('关闭弹窗').onClick(() => {
        this.promptAction.closeCustomDialog(this.customDialogComponentId)
      }).id('subwindowDialogClickClose')

    }
  }

  build() {

    Column() {
      Button('showInSubwindow: false').onClick(() => {
        this.dialogSubwindowTag = false
      }).margin({top: 50}).id('subwindowDialogClickFalse')
      Button('showInSubwindow: true').onClick(() => {
        this.dialogSubwindowTag = true
      }).margin({top: 50, bottom: 50}).id('subwindowDialogClickTrue')
      Button('弹出弹窗')
        .id('subwindowDialogClickOpen')
        .onClick(() => {
          this.promptAction.openCustomDialog({
            builder: () => {
              this.customDialogComponent()
            },
            showInSubWindow: this.dialogSubwindowTag,
          }).then((dialogId: number) => {
            this.customDialogComponentId = dialogId
          })
        })
    }
    .width('100%')
    .height('100%')
  }
}