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
  Entry,
  Column,
  Component,
  Button,
  Text,
  Row,
  Color,
  $r,
  Margin,
  ColumnOptions,
  Flex,
  AlertDialogParamWithConfirm,
  AlertDialogParamWithButtons,
  DialogAlignment,
  AlertDialogParamWithOptions,
  DialogButtonDirection
} from '@ohos.arkui.component';
import { State, AppStorage } from '@ohos.arkui.stateManagement';
import { ClickEvent } from '@ohos.arkui.component';
import { UIContext } from '@ohos.arkui.UIContext';

@Entry
@Component
struct AlertDialogParam1 {
  uiContext: UIContext = this.getUIContext()

  build() {
    Column({ space: 5 } as ColumnOptions,) {
      Button('one button dialog')
        .onClick((e: ClickEvent) => {
          this.uiContext.showAlertDialog(
            {
              title: 'title',
              subtitle: 'subtitle',
              message: 'text',
              alignment: DialogAlignment.TopStart,
              offset: { dx: 10, dy: 100 },
              maskRect: {
                x: 0,
                y: 90,
                width: 1000,
                height: 250
              },
              // buttonDirection: DialogButtonDirection.AUTO,  // 参数冲突，注释处理使编译通过
              confirm: {
                value: 'button',
                action: () => {
                  console.info('Button-clicking callback')
                }
              },
              cancel: () => {
                console.info('Closed callbacks')
              }
            } as AlertDialogParamWithConfirm
          )
        }).id('AlertDialogJsunit_0100')

        .backgroundColor(0x317aff)
      Button('two button dialog')
        .onClick((e: ClickEvent) => {
          this.uiContext.showAlertDialog(
            {
              title: 'title',
              subtitle: 'subtitle',
              message: 'text',
              primaryButton: {
                value: 'cancel',
                action: () => {
                  console.info('Callback when the first button is clicked')
                }
              },
              secondaryButton: {
                value: 'ok',
                action: () => {
                  console.info('Callback when the second button is clicked')
                }
              },
              cancel: () => {
                console.info('Closed callbacks')
              }
            } as AlertDialogParamWithButtons
          )
        }).key('AlertDialog2')
        .backgroundColor(0x317aff)
    }.width('100%').margin({ top: 5 } as Margin)
  }
}