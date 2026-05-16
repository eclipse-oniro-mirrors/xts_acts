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
  DialogAlignment,
  DialogButtonDirection,
  AlertDialogParamWithConfirm,
} from '@ohos.arkui.component';
import { State, AppStorage } from '@ohos.arkui.stateManagement';
import { ClickEvent } from '@ohos.arkui.component';
import { UIContext } from '@ohos.arkui.UIContext';

@Entry
@Component
struct AlertDialogExampleA {
  uiContext: UIContext = this.getUIContext()

  build() {
    Column({ space: 5 } as ColumnOptions,) {
      Button('AlertDialog按esc弹窗逐层退出').key('Alert_Dialog_A')
        .onClick((e: ClickEvent) => {
          this.uiContext.showAlertDialog(
            {
              title: 'title',
              subtitle: 'subtitle',
              message: 'text',
              autoCancel: true,
              alignment: DialogAlignment.Bottom,
              // buttonDirection: DialogButtonDirection.HORIZONTAL,  // 此项为非必输,无法判断真实类型，注释处理使编译通过
              cancel: () => {
                console.info('Closed callbacks')
              }
            } as AlertDialogParamWithConfirm
          )
          this.uiContext.showAlertDialog(
            {
              title: 'title',
              subtitle: 'subtitle',
              message: 'text',
              autoCancel: true,
              alignment: DialogAlignment.Bottom,
              // buttonDirection: DialogButtonDirection.HORIZONTAL, // 此项为非必输,无法判断真实类型
              cancel: () => {
                console.info('Closed callbacks')
              }
            } as AlertDialogParamWithConfirm
          )
        }).backgroundColor(0x317aff)
    }.width('100%').margin({ top: 200 } as Margin)
  }
}