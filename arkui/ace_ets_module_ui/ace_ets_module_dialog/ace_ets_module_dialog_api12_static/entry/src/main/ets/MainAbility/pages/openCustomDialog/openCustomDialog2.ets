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
  Text, Button, ClickEvent, Margin, Row, Builder,  Blank, DismissReason,
  Flex, FlexDirection, ItemAlign, FlexAlign, DismissDialogAction,
} from '@ohos.arkui.component'
import { State, AppStorage} from '@ohos.arkui.stateManagement';
import { PromptAction, UIContext} from '@ohos.arkui.UIContext';
import promptAction from '@ohos.promptAction'
let customDialogId: int = 0
@Builder
function customDialogBuilder2() {
  Column() {
    Text('Custom dialog Message').fontSize(10)
    Row() {
      Button("确认").onClick((e:ClickEvent) => {
        const uiContext = AppStorage.get<UIContext>('uiContext')
        let promptAction: PromptAction = uiContext!.getPromptAction();
        promptAction.closeCustomDialog(customDialogId)
      })
      Blank().width(50)
      Button("取消").onClick((e:ClickEvent) => {
        const uiContext = AppStorage.get<UIContext>('uiContext')
        let promptAction: PromptAction = uiContext!.getPromptAction();
        promptAction.closeCustomDialog(customDialogId)
      })
    }
  }.height(200).padding(5)
}

@Entry
@Component
struct openCustomDialog2 {
  @State text: string = 'openCustomDialog2';
  promptAction: PromptAction = this.getUIContext().getPromptAction();
  build() {
    Row() {
      Column() {
        Button(this.text)
          .id("openCustomDialog2")
          .onClick((e:ClickEvent) => {
            this.promptAction.openCustomDialog({
              isModal: true,
              showInSubWindow: true,
              builder: customDialogBuilder2,
              onWillDismiss:(dismissDialog: DismissDialogAction)=> {
                console.info("reason=" + JSON.stringify(dismissDialog.reason))
                this.text = "reason=" + JSON.stringify(dismissDialog.reason)
                console.log("dialog onWillDismiss")
                if (dismissDialog.reason == DismissReason.PRESS_BACK) {

                }
                if (dismissDialog.reason == DismissReason.TOUCH_OUTSIDE) {

                }
              }
            } as promptAction.CustomDialogOptions).then((dialogId) => {
              customDialogId = dialogId
            })
          })

      }
      .width('100%')
    }
    .height('100%')
  }
}