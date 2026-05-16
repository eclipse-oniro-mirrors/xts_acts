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
struct FocusScopeId16 {
  @State text1: string = 'text1'
  @State modeValue: NavigationMode = NavigationMode.Split
  @State pageInfos: NavPathStack = new NavPathStack()
  @State color1: ResourceColor = Color.Pink
  @State color2: ResourceColor = Color.Pink

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
        Button('button1')
          .id('FocusScopeId16_button1')
          .backgroundColor(this.color1)
          .focusOnTouch(true)
          .onTouch((event: TouchEvent): void => {
            event.stopPropagation()
          })
          .onFocus(() => {
            this.color1 = Color.Green
          })
          .onBlur(() => {
            this.color1 = Color.Red
          })

        Button('pop')
          .id('FocusScopeId16_pop')
          .backgroundColor(this.color2)
          .focusOnTouch(true)
          .onTouch((event: TouchEvent): void => {
            event.stopPropagation()
            this.pageInfos.pop()
          })
          .onFocus(() => {
            this.color2 = Color.Green
          })
          .onBlur(() => {
            this.color2 = Color.Red
          })

      }.width('100%').height('100%')
    }.title('pageOne')
  }

  build() {
    Column({space: 5} as ColumnOptions) {
      Navigation(this.pageInfos) {
        Column({ space: 5 } as ColumnOptions) {

          Button('pushPageOne')
            .id('FocusScopeId16_push')
            .onClick((e: ClickEvent) => {
              const pathInfo = new NavPathInfo('pageOne', null);
              this.pageInfos.pushPath(pathInfo);
            })

          Button('Stack模式')
            .id('FocusScopeId1_stack')
            .onClick((e: ClickEvent) => {
              this.modeValue = NavigationMode.Stack
            })

        }
      }
      .id('FocusScopeId16_nav')
      .mode(this.modeValue)
      .title('navigation')
      .navDestination(this.PageMap)
      .height('100%')
      .onTouch((): void => {
        this.getUIContext().getFocusController().clearFocus()
      })

    }.width('100%')
    .id('FocusScopeId16_col')
  }
}