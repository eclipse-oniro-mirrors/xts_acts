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
  CustomDialogController,
  CustomDialog,
  FlexAlign,
  DialogAlignment
} from '@ohos.arkui.component';
import { State, AppStorage, Link } from '@ohos.arkui.stateManagement';
import { ClickEvent } from '@ohos.arkui.component';

@CustomDialog
struct CustomDialogExampleA {
  @Link inputValue: string
  controller?: CustomDialogController
  cancel: () => void = () => {
  }
  confirm: () => void = () => {
  }

  build() {
    Column() {
      Text('Change text').fontSize(20).margin({ top: 10, bottom: 10 } as Margin)
      Flex({ justifyContent: FlexAlign.SpaceAround }) {
        Button('confirm').key('Custom_Dialog_A')
          .onClick((e: ClickEvent) => {
            if (this.controller != undefined) {
              this.controller!.close()
              this.confirm()
            }
          }).backgroundColor(0xffffff).fontColor(Color.Red)
      }.margin({ bottom: 10 } as Margin)
    }.borderRadius(10)
  }
}


@Entry
@Component
struct CustomDialogUserA {
  @State inputValue: string = 'CustomDialog按esc弹窗逐层退出'
  dialogController: CustomDialogController | null = new CustomDialogController({
    builder: CustomDialogExampleA({
      // inputValue: $inputValue
      inputValue: this.inputValue
    }),
    autoCancel: true,
    alignment: DialogAlignment.Bottom,
  })

  build() {
    Column() {
      Button(this.inputValue).key('Custom_Dialog_B')
        .onClick((e: ClickEvent) => {
          this.dialogController?.open()
          this.dialogController?.open()
          this.dialogController?.open()
        }).backgroundColor(0x317aff)
    }.width('100%').margin({ top: 200 } as Margin)
  }
}