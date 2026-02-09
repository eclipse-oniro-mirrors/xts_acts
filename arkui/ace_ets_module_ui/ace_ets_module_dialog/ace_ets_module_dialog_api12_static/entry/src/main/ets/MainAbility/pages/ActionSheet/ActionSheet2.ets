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
  Text, Button, ClickEvent, Margin, DismissReason, DialogAlignment,
  Flex, FlexDirection, ItemAlign, FlexAlign, DismissDialogAction,
} from '@ohos.arkui.component'
import { State } from '@ohos.arkui.stateManagement';
import { UIContext } from '@ohos.arkui.UIContext';

@Entry
@Component
struct ActionSheet2Example {
  uiContext: UIContext = this.getUIContext()
  @State text: string = 'ActionSheet2';

  build() {
    Flex({ direction: FlexDirection.Column, alignItems: ItemAlign.Center, justifyContent: FlexAlign.Center }) {
      Button("Reset")
        .id("ActionSheet2Text")
        .backgroundColor("#ff0000")
        .margin(30)
        .onClick((e:ClickEvent) => {
          this.text = "ActionSheet2"
        })
      Button(this.text)
        .id("ActionSheet2")
        .onClick((e:ClickEvent) => {
          this.getUIContext().showActionSheet({
            title: 'ActionSheet title',
            subtitle: 'ActionSheet subtitle',
            message: 'message',
            autoCancel: true,
            showInSubWindow: true,
            confirm: {
              defaultFocus: true,
              value: 'Confirm',
              action: () => {
                console.log('Get Alert Dialog handled')
              }
            },
            cancel: () => {
              console.log('actionSheet canceled')
            },
            onWillDismiss:(dismissDialog: DismissDialogAction)=> {
              console.info("reason=" + JSON.stringify(dismissDialog.reason))
              this.text = "reason=" + JSON.stringify(dismissDialog.reason)
              console.log("dialog onWillDismiss")
              if (dismissDialog.reason == DismissReason.PRESS_BACK) {

              }
              if (dismissDialog.reason == DismissReason.TOUCH_OUTSIDE) {

              }
            },
            alignment: DialogAlignment.Center,
            offset: { dx: 0, dy: -10 },
            sheets: [
              {
                title: 'apples',
                action: () => {
                  console.log('apples')
                }
              },
              {
                title: 'bananas',
                action: () => {
                  console.log('bananas')
                }
              },
              {
                title: 'pears',
                action: () => {
                  console.log('pears')
                }
              }
            ]
          })
        })
    }.width('100%')
    .height('100%')
  }
}