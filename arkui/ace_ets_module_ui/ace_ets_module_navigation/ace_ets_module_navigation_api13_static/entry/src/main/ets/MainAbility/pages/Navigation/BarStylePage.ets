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

import { Entry, Component, NavPathStack, Builder, Navigation, Column, Button, ColumnOptions, ClickEvent, NavigationTitleMode,
  NavigationMode, NavDestination, NavPathInfo, BarStyle, Stack, StackOptions, BlurStyle, Alignment
} from '@ohos.arkui.component'
import { State, Provide, Consume, AppStorage } from '@ohos.arkui.stateManagement'

@Entry
@Component
struct BarStylePage {
  @Provide({alias: 'navPathStack' }) navPathStack: NavPathStack = new NavPathStack();
  @State barStyle: BarStyle = BarStyle.STANDARD;

  build() {
    Navigation(this.navPathStack) {
      Stack({ alignContent: Alignment.Center } as StackOptions) {
        Column() {
          Button('BarStyle.stack')
            .height('20%')
            .id('switchId')
            .onClick((e: ClickEvent) => {
               this.barStyle = BarStyle.STACK;
            })
        }
        .width('100%')
        .height('100%')
      }
      .width('100%')
      .height('100%')
    }
    .width('100%')
    .height('100%')
    .title('MainTitle', {
      backgroundBlurStyle: BlurStyle.COMPONENT_THICK,
      barStyle: this.barStyle,
    })
    .mode(NavigationMode.Stack)
    .titleMode(NavigationTitleMode.Mini)
    .hideToolBar(true, false)
  }
}