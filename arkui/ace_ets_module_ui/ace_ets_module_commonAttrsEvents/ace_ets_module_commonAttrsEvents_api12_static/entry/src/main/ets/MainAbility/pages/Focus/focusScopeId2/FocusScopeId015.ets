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
  CustomDialogController,
  CustomPopupOptions,
  DialogAlignment,
  Divider,
  DragEvent,
  Entry,
  FontWeight,
  Menu,
  MenuItem,
  MenuItemGroup,
  MenuItemOptions,
  NavDestination,
  Navigation,
  NavigationMode,
  NavPathStack,
  Placement,
  PopupStateChangeParam,
  PreDragStatus,
  Row,
  RowOptions,
  Scroll,
  Text,
  TouchEvent,
  Visibility,CustomDialog,TextInput
} from '@ohos.arkui.component'

@CustomDialog
struct CustomDialogExampleFocusScopeId015 {
  controller?: CustomDialogController
  cancel: () => void = () => {
  }
  confirm: () => void = () => {
  }

build() {
    Column({space:5} as ColumnOptions) {
      Text('焦点组')
      Column({space:5} as ColumnOptions){
        Button('btn1').focusOnTouch(true).id('FocusScopeId015_btn1_1')
        Button('btn2').focusOnTouch(true)
        Button('btn3').focusOnTouch(true)
      }.focusScopeId('FocusScopeId015_focusGroup1',true)
      .borderWidth(1)

      TextInput({text:'TextInput'})
        .id('FocusScopeId015_TextInput')
        .enableKeyboardOnFocus(false)
        .height(50)

      Button('close')
        .id('FocusScopeId015_close')
        .focusOnTouch(true)
        .onClick((e: ClickEvent) => {
          if (this.controller != undefined) {
            this.controller!.close()
          }
        })

    }
  }
}

@Entry
@Component
struct FocusScopeId015 {
  onCancel() {
    console.info('Callback when the first button is clicked')
  }

  onAccept() {
    console.info('Callback when the second button is clicked')
  }

  dialogController: CustomDialogController | null = new CustomDialogController({
    builder: CustomDialogExampleFocusScopeId015({
      cancel: ()=> { this.onCancel() },
      confirm: ()=> { this.onAccept() },
    }),
    autoCancel: true,
    alignment: DialogAlignment.Top,
    customStyle: false,
  })

  build() {
    Column({ space: 5 } as ColumnOptions) {
      Button('CustomDialog')
        .id('FocusScopeId015_open')
        .onClick((e: ClickEvent) => {
          this.dialogController?.open()
        })
    }.width('100%')
  }
}