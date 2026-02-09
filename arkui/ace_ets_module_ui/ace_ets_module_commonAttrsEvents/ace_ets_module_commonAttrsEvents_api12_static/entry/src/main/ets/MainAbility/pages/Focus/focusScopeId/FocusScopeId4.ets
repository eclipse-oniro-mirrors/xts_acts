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
import i18n from '@ohos.i18n'
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
  DragEvent,
  Entry,
  FontWeight,
  NavDestination,
  Navigation,
  NavigationMode,
  NavPathInfo,
  NavPathStack,
  PreDragStatus,
  Row,
  RowOptions,
  Scroll,
  Text
} from '@ohos.arkui.component'


@Entry
@Component
struct FocusScopeId4 {
  @State text1: string = 'text1'
  @State modeValue: NavigationMode = NavigationMode.Stack
  @State pageInfos: NavPathStack = new NavPathStack()
  @State languageValue: string = ''

  aboutToAppear() {
    this.languageValue = i18n.System.getAppPreferredLanguage()
  }

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
        }.focusScopeId('FocusScopeId4_focusGroup7', true)
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
            Text('当前语言' + this.languageValue)

            Row({ space: 5 } as RowOptions) {
              Button('ug(维吾尔语)')
                .id('FocusScopeId4_ug')
                .onClick((e: ClickEvent) => {
                  console.log('getAppPreferredLanguage last ' + i18n.System.getAppPreferredLanguage())
                  try {
                    i18n.System.setAppPreferredLanguage('ug')
                    let val: string = i18n.System.getAppPreferredLanguage()
                    this.languageValue = val
                    console.log('getAppPreferredLanguage new ' + val)
                  } catch (exception: Error) {
                    console.error(`Call System.setAppPreferredLanguage failed. Cause code: ${exception.code}, message: ${exception.message}`);
                    ;
                  }
                })

              Button('zh-Hans(汉语)')
                .id('FocusScopeId4_zh')
                .onClick((e: ClickEvent) => {
                  console.log('getAppPreferredLanguage last ' + i18n.System.getAppPreferredLanguage())
                  try {
                    i18n.System.setAppPreferredLanguage('zh-Hans')
                    let val: string = i18n.System.getAppPreferredLanguage()
                    this.languageValue = val
                    console.log('getAppPreferredLanguage new ' + val)
                  } catch (exception: Error) {
                    console.error(`Call System.setAppPreferredLanguage failed. Cause code: ${exception.code}, message: ${exception.message}`);
                    ;
                  }
                })
            }

            Text('焦点组5')
            Column({ space: 5 } as ColumnOptions) {
              Button('单栏')
                .id('FocusScopeId4_btn1_5')
                .onClick((e: ClickEvent) => {
                  this.modeValue = NavigationMode.Stack
                })
                .focusOnTouch(true)

              Button('双栏')
                .id('FocusScopeId4_btn2_5')
                .onClick((e: ClickEvent) => {
                  this.modeValue = NavigationMode.Split
                })
                .focusOnTouch(true)

              Button('pushPageOne')
                .id('FocusScopeId4_btn3_5')
                .onClick((e: ClickEvent) => {
                  const pathInfo = new NavPathInfo('pageOne', null);
                  this.pageInfos.pushPath(pathInfo);
                })
                .focusOnTouch(true)
            }
            .focusScopeId('FocusScopeId4_focusGroup5', true)
            .borderWidth(1)


            Text('焦点组6，第三个按钮设置默认获焦')
            Column({ space: 5 } as ColumnOptions) {
              Button('btn1').focusOnTouch(true)
                .id('FocusScopeId4_btn1_6')
              Button('btn2').focusOnTouch(true)
                .id('FocusScopeId4_btn2_6')
              Button('defaultFocus:true').focusOnTouch(true).defaultFocus(true)
                .id('FocusScopeId4_btn3_6')
            }
            .focusScopeId('FocusScopeId4_focusGroup6', true)
            .borderWidth(1)

            Button('clearFocus')
              .id('FocusScopeId4_clearFocus')
              .onClick((e: ClickEvent) => {
                this.getUIContext().getFocusController().clearFocus()
              })

            Button('btn').focusOnTouch(true)

          }
        }
      }
      .id('FocusScopeId4_nav')
      .mode(this.modeValue)
      .title('navigation')
      .navDestination(this.PageMap)
      .height('100%')

    }.width('100%')
    .id('FocusScopeId4_col')
  }
}