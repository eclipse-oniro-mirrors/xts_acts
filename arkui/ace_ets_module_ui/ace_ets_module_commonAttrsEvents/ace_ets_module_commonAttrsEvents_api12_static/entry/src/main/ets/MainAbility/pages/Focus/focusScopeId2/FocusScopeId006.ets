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
struct FocusScopeId006 {
  @State text1: string = 'text1'
  @State modeValue: NavigationMode = NavigationMode.Stack
  @State pageInfos: NavPathStack = new NavPathStack()
  @State flag: boolean = true
  @State visibilityValue: Visibility = Visibility.Visible
  @State focusId: (string | undefined) [] =
    new Array<string | undefined>('FocusScopeId006_focusGroup1', undefined, 'FocusScopeId006_focusGroup2')
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
        }.focusScopeId('FocusScopeId006_focusGroup7', true)
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

            Text('焦点组1，可删除')
            if (this.flag) {
              Column({ space: 5 } as ColumnOptions) {
                Button('btn1').focusOnTouch(true).id('FocusScopeId006_btn1_1')
                Button('btn2').focusOnTouch(true).id('FocusScopeId006_btn2_1')
                Button('btn3').focusOnTouch(true).id('FocusScopeId006_btn3_1')
              }.focusScopeId(this.focusId[this.focusIdIndex], this.isGroupValue)
              .borderWidth(1)
            }

            Button('del').focusOnTouch(true)
              .id('FocusScopeId006_btn_del')
              .onClick((e: ClickEvent) => {
                this.flag = !this.flag
              })


            Text('焦点组2')
            Column({ space: 5 } as ColumnOptions) {
              Button('btn1').focusOnTouch(true).id('FocusScopeId006_btn1_2')
              Button('btn2').focusOnTouch(true).id('FocusScopeId006_btn2_2')
              Button('btn3').focusOnTouch(true)
            }
            .focusScopeId('FocusScopeId006_focusGroup2', true)
            .borderWidth(1)

            Button('button').focusOnTouch(true).id('FocusScopeId006_btn_btn')


            Text('焦点组3内无可获焦子组件，父容器可获焦')
            Column({ space: 5 } as ColumnOptions) {
              Text('132')
            }
            .focusScopeId('FocusScopeId006_focusGroup3', true).focusable(true).backgroundColor(Color.Pink)
            .borderWidth(1)


            Text('焦点组4，可设置不可见')
            Column({ space: 5 } as ColumnOptions) {
              Button('btn1').focusOnTouch(true)
              Button('btn2').focusOnTouch(true)
            }
            .focusScopeId('FocusScopeId006_focusGroup4', true)
            .borderWidth(1)
            .visibility(this.visibilityValue)

            Button('隐藏')
              .id('FocusScopeId006_btn_hide')
              .focusOnTouch(true)
              .onClick((e: ClickEvent) => {
                this.visibilityValue =
                  (this.visibilityValue == Visibility.Visible) ? Visibility.Hidden : Visibility.Visible
              })


            Text('焦点组5')
            Column({ space: 5 } as ColumnOptions) {
              Button('单栏')
                .id('FocusScopeId006_btn1_5')
                .onClick((e: ClickEvent) => {
                  this.modeValue = NavigationMode.Stack
                })
                .focusOnTouch(true)

              Button('双栏')
                .id('FocusScopeId006_btn2_5')
                .onClick((e: ClickEvent) => {
                  this.modeValue = NavigationMode.Split
                })
                .focusOnTouch(true)

              Button('pushPageOne')
                .id('FocusScopeId006_btn3_5')
                .onClick((e: ClickEvent) => {
                  const pathInfo = new NavPathInfo('pageOne', null);
                  this.pageInfos.pushPath(pathInfo);
                })
                .focusOnTouch(true)
            }
            .focusScopeId('FocusScopeId006_focusGroup5', true)
            .borderWidth(1)


            Text('焦点组6，第三个按钮设置默认获焦')
            Column({ space: 5 } as ColumnOptions) {
              Button('btn1').focusOnTouch(true)
                .id('FocusScopeId006_btn1_6')
              Button('btn2').focusOnTouch(true)
                .id('FocusScopeId006_btn2_6')
              Button('defaultFocus:true').focusOnTouch(true).defaultFocus(true)
                .id('FocusScopeId006_btn3_6')
            }
            .focusScopeId('FocusScopeId006_focusGroup6', true)
            .borderWidth(1)

            Divider().strokeWidth(2)

            Column({ space: 2 } as ColumnOptions) {
              Button('clearFocus')
                .id('FocusScopeId006_clearFocus')
                .onClick((e: ClickEvent) => {
                  this.getUIContext().getFocusController().clearFocus()
                })

              Button('更改第一个焦点组的id:' + String(this.focusId[this.focusIdIndex]))
                .id('FocusScopeId006_changFocusId')
                .focusOnTouch(true)
                .onClick((e: ClickEvent) => {
                  this.focusIdIndex++
                  if (this.focusIdIndex > this.focusId.length - 1) {
                    this.focusIdIndex = 0
                  }
                })

              Button('更改第一个焦点组的isGroup:' + this.isGroupValue)
                .id('FocusScopeId006_changIsGroup')
                .focusOnTouch(true)
                .onClick((e: ClickEvent) => {
                  this.isGroupValue = !this.isGroupValue
                })

            }
          }
        }
        .id('FocusScopeId006_scroll')
      }
      .id('FocusScopeId006_nav')
      .mode(this.modeValue)
      .title('navigation')
      .navDestination(this.PageMap)
      .height('100%')

    }.width('100%')
    .id('FocusScopeId006_col')
  }
}