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
  Column, ColumnOptions, Color, DialogAlignment, DialogButtonStyle, DismissReason,
  Text, Button, ClickEvent, Margin, AlertDialogParamWithButtons,
  Flex, FlexDirection, ItemAlign, FlexAlign, DismissDialogAction,
} from '@ohos.arkui.component'
import { State } from '@ohos.arkui.stateManagement';
import { UIContext } from '@ohos.arkui.UIContext';
@Entry
@Component
struct AlertDialog3Example {
  uiContext: UIContext = this.getUIContext()
  @State text: string = 'AlertDialog3';

  build() {
    Column({ space: 5 } as ColumnOptions) {
      Button("Reset")
        .id("AlertDialog3Text")
        .backgroundColor("#ff0000")
        .margin(30)
        .onClick((e:ClickEvent) => {
          this.text = "AlertDialog3"
        })
      Button(this.text)
        .id("AlertDialog3")
        .onClick((e:ClickEvent) => {
          this.uiContext.showAlertDialog(
            {
              title: 'title',
              subtitle: 'subtitle',
              message: 'text',
              autoCancel: false,
              alignment: DialogAlignment.Center,
              showInSubWindow: true,
              gridCount: 4,
              offset: { dx: 0, dy: -20 },
              primaryButton: {
                value: 'cancel',
                action: () => {
                  console.info('Callback when the first button is clicked')
                }
              },
              secondaryButton: {
                enabled: true,
                defaultFocus: true,
                style: DialogButtonStyle.HIGHLIGHT,
                value: 'confirm',
                action: () => {
                  console.info('Callback when the second button is clicked')
                }
              },
              cancel: () => {
                console.info('Closed callbacks')
              },
              onWillDismiss:(dismissDialog: DismissDialogAction)=> {
                console.info("reason=" + JSON.stringify(dismissDialog.reason))
                this.text = "reason=" + JSON.stringify(dismissDialog.reason)
                console.log("dialog onWillDismiss")
                if (dismissDialog.reason == DismissReason.PRESS_BACK) {
                  dismissDialog.dismiss()
                }
                if (dismissDialog.reason == DismissReason.TOUCH_OUTSIDE) {
                  dismissDialog.dismiss()
                }
              }
            } as AlertDialogParamWithButtons
          )
        }).backgroundColor(0x317aff)
    }.width('100%').margin({ top: 5 } as Margin)
  }
}