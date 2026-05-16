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
  NavPathInfo,
  NavPathStack,
  Placement,
  PopupStateChangeParam,
  PreDragStatus,
  Row,
  RowOptions,
  Scroll,
  Text,
  TouchEvent,
  Visibility
} from '@ohos.arkui.component'

@Entry
@Component
struct FocusScopeId17 {
  @State text1: string = 'text1'
  @State modeValue: NavigationMode = NavigationMode.Stack
  @State pageInfos: NavPathStack = new NavPathStack()

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
        }.focusScopeId('FocusScopeId17_focusGroup7', true)
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

            Text('焦点组5')
            Column({ space: 5 } as ColumnOptions) {
              Button('单栏')
                .id('FocusScopeId17_btn1_5')
                .onClick((e: ClickEvent) => {
                  this.modeValue = NavigationMode.Stack
                })
                .focusOnTouch(true)

              Button('双栏')
                .id('FocusScopeId17_btn2_5')
                .onClick((e: ClickEvent) => {
                  this.modeValue = NavigationMode.Split
                })
                .focusOnTouch(true)

              Button('pushPageOne')
                .id('FocusScopeId17_btn3_5')
                .onClick((e: ClickEvent) => {
                  const pathInfo = new NavPathInfo('pageOne', null);
                  this.pageInfos.pushPath(pathInfo);
                })
                .focusOnTouch(true)
            }
            .focusScopeId('FocusScopeId17_focusGroup5', true)
            .borderWidth(1)


            Text('焦点组6，第三个按钮设置默认获焦')
            Column({ space: 5 } as ColumnOptions) {
              Button('btn1').focusOnTouch(true)
                .id('FocusScopeId17_btn1_6')
              Button('btn2').focusOnTouch(true)
                .id('FocusScopeId17_btn2_6')
              Button('defaultFocus:true').focusOnTouch(true).defaultFocus(true)
                .id('FocusScopeId17_btn3_6')
            }
            .focusScopeId('FocusScopeId17_focusGroup6', true)
            .borderWidth(1)

            Button('clearFocus')
              .id('FocusScopeId17_clearFocus')
              .onClick((e: ClickEvent) => {
                this.getUIContext().getFocusController().clearFocus()
              })

          }
        }
      }
      .id('FocusScopeId17_nav')
      .mode(this.modeValue)
      .title('navigation')
      .navDestination(this.PageMap)
      .height('100%')

    }.width('100%')
    .id('FocusScopeId17_col')
  }
}