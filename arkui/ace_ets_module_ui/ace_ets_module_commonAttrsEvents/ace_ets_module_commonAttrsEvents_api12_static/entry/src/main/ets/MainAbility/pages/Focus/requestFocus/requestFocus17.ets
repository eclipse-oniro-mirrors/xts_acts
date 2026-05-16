'use static';
/*
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

import { AppStorage, State } from '@ohos.arkui.stateManagement'
import { Router, UIContext } from '@ohos.arkui.UIContext';
import router from '@ohos.router';
import {
  Builder,
  Button,
  ClickEvent,
  Color,
  Column,
  ColumnOptions,
  Component,
  CustomDialog,
  CustomDialogController,
  CustomPopupOptions,
  DialogAlignment,
  Divider,
  DragEvent,
  Entry,
  FocusPriority,
  FontWeight,
  Margin,
  NavDestination,
  Navigation,
  NavigationMode,
  NavPathStack,
  Padding,
  Placement,
  PopupStateChangeParam,
  PreDragStatus,
  ResourceColor,
  Row,
  RowOptions,
  Scroll,
  Text,
  TextInput,
  TouchEvent,
  Visibility
} from '@ohos.arkui.component'

@CustomDialog
struct CustomDialogExample2 {
  controllerTwo?: CustomDialogController
  @State text2: string = 'TextInput'
  cancel: () => void = () => {

  }
  confirm: () => void = () => {

  }

  build() {
    Column({space: 5} as ColumnOptions) {
      TextInput({ text: this.text2 })
        .id('requestFocus17_textInput1')
        .onFocus(() => {
          this.text2 = 'TextInput_1'
        })
        .onBlur(() => {
          this.text2 = 'TextInput'
        })
    }.width(200).height(50)
  }
}

@Entry
@Component
struct requestFocus17 {
  dialogController: CustomDialogController | null = new CustomDialogController({
    builder: CustomDialogExample2({
      cancel: this.onCancel,
      confirm: this.onAccept
    }),
    autoCancel: true,
    alignment: DialogAlignment.Center,
    offset: { dx: 0, dy: 0 },
    customStyle: false
  })
  @State text1: string = ''

  onCancel() {
  }

  onAccept() {
  }

  build() {
    Column({ space: 20 } as ColumnOptions) {
      Text('' + this.text1).id('requestFocus17_text1')
      Button('Focus-textInput1').onClick((e: ClickEvent) => {
        try {
          this.getUIContext().getFocusController().requestFocus('requestFocus17_textInput1')
        } catch (error: Error) {
          this.text1 = '' + error.code
        }
      }).id('requestFocus17_btn2')


      Button('openDialog').onClick((e: ClickEvent) => {
        this.dialogController?.open()
      }).id('requestFocus17_btn1')

    }.width('100%').margin({ top: 20 } as Margin)
  }
}

