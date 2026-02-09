'use static';
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
import {
  Entry, Component,
  Column, ColumnOptions, Color,
  Text, Button, ClickEvent, Margin, Builder, TextInput, KeyboardAvoidMode, DismissReason,
  Flex, FlexDirection, ItemAlign, FlexAlign, DismissDialogAction,
} from '@ohos.arkui.component'
import { State } from '@ohos.arkui.stateManagement';
import { UIContext, PromptAction } from '@ohos.arkui.UIContext';
import promptAction from '@ohos.promptAction'
@Entry
@Component
struct Index {
  promptAction: PromptAction = this.getUIContext().getPromptAction()
  private customDialogComponentId: int = 0
  @State mText1: string = ''
  @State mText2: string = ''
  @State keyboardAvoidMode1: number | undefined = 0
  @State keyboardAvoidMode2: number | undefined = 1
  @Builder
  customDialogComponent() {
    Column({ space: 5 } as ColumnOptions) {
      Text('可展示在主窗口外的弹窗')
      TextInput()
        .id('TextInput')
      Button('点我关闭弹窗')
        .onClick((e:ClickEvent) => {
          this.promptAction.closeCustomDialog(this.customDialogComponentId)
        })
        .id('close')
        .backgroundColor(Color.Red)

      TextInput()
      TextInput()
      Text('可展示在主窗口外的弹窗')
      TextInput()

      Button('点我关闭弹窗')
        .onClick((e:ClickEvent) => {
          this.promptAction.closeCustomDialog(this.customDialogComponentId)
        })

      TextInput()
      Text('可展示在主窗口外的弹窗')
      TextInput()
      Button('点我关闭弹窗')
        .onClick((e:ClickEvent) => {
          this.promptAction.closeCustomDialog(this.customDialogComponentId)
        })

      TextInput()
      Text('可展示在主窗口外的弹窗')
      TextInput()
    }
  }

  build() {

    Column() {
      Text(this.mText1)
        .id('text1')
      Button('DEFAULT')
        .id('btn1')
        .onClick((e:ClickEvent) => {
          this.promptAction.openCustomDialog({
            builder: () => {
              this.customDialogComponent()
            },
            keyboardAvoidMode: KeyboardAvoidMode.DEFAULT,
            onWillDismiss: (dismissDialogAction: DismissDialogAction) => {
              console.info("reason" + JSON.stringify(dismissDialogAction.reason))
              console.log("dialog onWillDismiss")
              if (dismissDialogAction.reason == DismissReason.PRESS_BACK) {
                dismissDialogAction.dismiss()
              }
              if (dismissDialogAction.reason == DismissReason.TOUCH_OUTSIDE) {
                dismissDialogAction.dismiss()
              }
            }
          } as promptAction.CustomDialogOptions).then((dialogId: int) => {
            this.customDialogComponentId = dialogId
          })
          this.mText1 = this.keyboardAvoidMode1 + ''
          setTimeout(() => {
            this.promptAction.closeCustomDialog(this.customDialogComponentId)
          }, 1500)
        })

      Text(this.mText2)
        .id('text2')
      Button('NONE')
        .id('btn2')
        .onClick((e:ClickEvent) => {
          this.promptAction.openCustomDialog({
            builder: () => {
              this.customDialogComponent()
            },
            keyboardAvoidMode: KeyboardAvoidMode.NONE,
            onWillDismiss: (dismissDialogAction: DismissDialogAction) => {
              console.info("reason" + JSON.stringify(dismissDialogAction.reason))
              console.log("dialog onWillDismiss")
              if (dismissDialogAction.reason == DismissReason.PRESS_BACK) {
                dismissDialogAction.dismiss()
              }
              if (dismissDialogAction.reason == DismissReason.TOUCH_OUTSIDE) {
                dismissDialogAction.dismiss()
              }
            }
          } as promptAction.CustomDialogOptions).then((dialogId: int) => {
            this.customDialogComponentId = dialogId
          })
          this.mText2 = this.keyboardAvoidMode2 + ''
          setTimeout(() => {
            this.promptAction.closeCustomDialog(this.customDialogComponentId)
          }, 1500)
        })
    }
    .width('100%')
    .height('100%')
  }
}