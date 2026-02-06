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
  CustomPopupOptions,
  Divider,
  DragEvent,
  Entry,
  FontWeight,
  NavDestination,
  Navigation,
  NavigationMode,
  NavPathStack,
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
struct FocusScopeId002 {
  @State text1: string = 'text1'
  @State modeValue: NavigationMode = NavigationMode.Stack
  @State pageInfos: NavPathStack = new NavPathStack()
  @State flag: boolean = true
  @State visibilityValue: Visibility = Visibility.Visible
  @State focusId: (string | undefined) [] =
    new Array<string | undefined>('FocusScopeId002_focusGroup1', undefined, 'FocusScopeId002_focusGroup2')
  @State focusIdIndex: Int = 0
  @State isGroupValue: boolean = true

  @Builder
  PageMap(name: string) {
    if (name === 'pageOne') {
      this.pageOne()
    }
  }

  @Builder
  pageOne() {
    NavDestination() {
      Column({ space: 5 } as ColumnOptions) {
        Text('焦点组内组件设置focuxBox')
        Column({ space: 5 } as ColumnOptions) {
          Button('btn1')
            .focusOnTouch(true)
            .focusBox({
              margin: new LengthMetrics(0),
              strokeColor: ColorMetrics.rgba(255, 0, 0)
            })

          Button('btn2')
            .focusOnTouch(true)
            .focusBox({
              margin: new LengthMetrics(0),
              strokeColor: ColorMetrics.rgba(255, 0, 0)
            })
        }.focusScopeId('FocusScopeId002_focusGroup7', true)
        .borderWidth(1)

        Button('btn3')
          .focusOnTouch(true)
          .focusBox({
            margin: new LengthMetrics(0),
            strokeColor: ColorMetrics.rgba(255, 0, 0)
          })

      }
    }.title('pageOne')
  }

  build() {
    Column({space: 5} as ColumnOptions) {
      Navigation(this.pageInfos) {
        Scroll() {
          Column({ space: 5 } as ColumnOptions) {

            Text('焦点组1 ')
            Column({ space: 5 } as ColumnOptions) {
              Button('btn1').focusOnTouch(true).id('FocusScopeId002_btn1_1')
              Button('btn2').focusOnTouch(true).id('FocusScopeId002_btn2_1')
              Button('btn3').focusOnTouch(true).id('FocusScopeId002_btn3_1')
            }.focusScopeId('FocusScopeId002_focusGroup1', true)
            .borderWidth(1)

            Text('焦点组2，focusScopeId和焦点组1相同')
            Column({ space: 5 } as ColumnOptions) {
              Button('btn1').focusOnTouch(true).id('FocusScopeId002_btn1_2')
              Button('btn2').focusOnTouch(true).id('FocusScopeId002_btn2_2')
              Button('btn3').focusOnTouch(true).id('FocusScopeId002_btn3_2')
            }
            .focusScopeId('FocusScopeId002_focusGroup1', true)
            .borderWidth(1)

            Button('clearFocus')
              .id('FocusScopeId002_clearFocus')
              .onClick((e: ClickEvent) => {
                this.getUIContext().getFocusController().clearFocus()
              })

          }
        }
        .id('FocusScopeId002_scroll')
      }
      .id('FocusScopeId002_nav')
      .mode(this.modeValue)
      .title('navigation')
      .navDestination(this.PageMap)
      .height('100%')

    }.width('100%')
    .id('FocusScopeId002_col')
  }
}