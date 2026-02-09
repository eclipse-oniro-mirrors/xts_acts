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

import router from '@ohos.router';
import { Entry, Component, NavPathStack, Builder, Navigation, Column, Button, ColumnOptions, ClickEvent, NavigationTitleMode,
  NavigationMode, NavDestination,
} from '@ohos.arkui.component'
import { State, Provide, Consume, AppStorage } from '@ohos.arkui.stateManagement'
@Entry
@Component
struct EnableSwipeBackRouter {
  build() {
    Navigation(new NavPathStack()) {
      Column({ space: '5vp' } as ColumnOptions) {
        Button('push').id('pushOneId').onClick((e: ClickEvent) => {
          console.log('+++++++++++++++++++++++++1')
          this.getUIContext().getRouter().pushUrl({
            url: 'MainAbility/pages/router/EnableSwipeBackRouterPageOne',
          })
          console.log('+++++++++++++++++++++++++2')
        })
        .height('10%')
        .id('pushId')
      }
      .width('100%')
      .height('100%')
    }
    .title('Title')
    .titleMode(NavigationTitleMode.Mini)
  }
}