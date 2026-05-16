'use static';
/*
 * Copyright (c) 2025-2026 Huawei Device Co., Ltd.
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
  TouchEvent,
  Visibility
} from '@ohos.arkui.component'

@Entry
@Component
struct requestFocus6 {
  @State backgroundColor1: Color = Color.Blue
  @State text1: string = ''

  build() {
    Column({ space: 20 } as ColumnOptions) {
      Text('' + this.text1).id('requestFocus6_text1')
      Button('btn1')
        .id('requestFocus6_btn1')
        .backgroundColor(this.backgroundColor1)
        .onFocus(() => {
          this.backgroundColor1 = Color.Green
        })
        .onBlur(() => {
          this.backgroundColor1 = Color.Red
        })
        .focusable(false)

      Button('Focus-btn1').onClick((e: ClickEvent) => {
        try {
          this.getUIContext().getFocusController().requestFocus('requestFocus6_btn1')
        } catch (error) {
          this.text1 = '' + error.code
        }
      }).id('requestFocus6_btn2')

    }.width('100%').margin({ top: 20 } as Margin)
  }
}

