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
import { ColorMetrics, LengthMetrics } from '@ohos.arkui.node'
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
  Divider,
  DragEvent,
  Entry,
  FocusPriority,
  FontWeight,
  NavDestination,
  Navigation,
  NavigationMode,
  NavPathStack,
  PreDragStatus,
  Row,
  RowOptions,
  Scroll,
  Text,
  Visibility
} from '@ohos.arkui.component'

@Entry
@Component
struct FocusScopeId11 {
  build() {
    Column({ space: 5 } as ColumnOptions) {
      Text('焦点组1 tabIndex(2)')
      Column({ space: 5 } as ColumnOptions) {
        Button('btn1').focusOnTouch(true).id('FocusScopeId1_btn1_1')
          .onClick((e: ClickEvent) => {
            this.getUIContext().getFocusController().clearFocus()
          })
        Button('btn2').focusOnTouch(true)
        Button('btn3').focusOnTouch(true)
      }
      .focusScopeId('FocusScopeId11_focusGroup1', true)
      .tabIndex(2)
      .borderWidth(1)


      Text('焦点组2 tabIndex(1)')
      Column({ space: 5 } as ColumnOptions) {
        Button('btn1').focusOnTouch(true).id('FocusScopeId1_btn1_2')
        Button('btn2').focusOnTouch(true)
        Button('btn3').focusOnTouch(true)
      }
      .focusScopeId('FocusScopeId11_focusGroup2', true)
      .tabIndex(1)
      .borderWidth(1)


      Text('焦点组3 tabIndex(3)')
      Column({ space: 5 } as ColumnOptions) {
        Button('btn1').focusOnTouch(true).id('FocusScopeId1_btn1_3')
        Button('btn2').focusOnTouch(true).id('FocusScopeId1_btn2_3')
        Button('btn3').focusOnTouch(true)
      }
      .focusScopeId('FocusScopeId11_focusGroup3', true)
      .tabIndex(3)
      .borderWidth(1)

    }.width('100%')
  }
}