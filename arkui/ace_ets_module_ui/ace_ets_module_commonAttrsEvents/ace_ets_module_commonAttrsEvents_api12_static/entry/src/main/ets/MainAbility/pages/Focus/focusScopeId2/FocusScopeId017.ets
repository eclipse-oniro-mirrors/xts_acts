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
  CustomPopupOptions,
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
  Visibility,$$
} from '@ohos.arkui.component'


@Entry
@Component
struct FocusScopeId017 {
  @State isShow: boolean = false

  @Builder
  myBuilder() {
    Column({ space: 5 } as ColumnOptions) {
      Text('焦点组')
      Column({ space: 5 } as ColumnOptions) {
        Button('btn1').focusOnTouch(true).id('FocusScopeId017_btn1')
        Button('btn2').focusOnTouch(true).id('FocusScopeId017_btn2')
        Button('btn3').focusOnTouch(true)
      }.focusScopeId('FocusScopeId017_focusGroup1', true)
      .borderWidth(1)

      Button('btn4').focusOnTouch(true).id('FocusScopeId017_btn4')
        .onClick((e: ClickEvent) => {
          this.isShow = false
        })

    }.padding(5)
  }

  build() {
    Column({ space: 5 } as ColumnOptions) {

      Button('bindSheet')
        .id('FocusScopeId017_open')
        .onClick((e: ClickEvent) => {
          this.isShow = true
        })
      .bindSheet($$(this.isShow), this.myBuilder, {
        backgroundColor: Color.Pink,
        showClose:true,
        dragBar:true
      })

    }.width('100%')
  }
}