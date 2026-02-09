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
import { BusinessError } from '@ohos.base';
import { Entry, Component, Column, Button, ColumnOptions, ClickEvent, Text, Color, Builder, Scroll, Margin, Row, $r,
  NavDestination, FontWeight, ButtonType, NavDestinationMode, LaunchMode, TextInputController, Stack, StackOptions,
  Alignment, NavPathStack, Navigation, NavigationSystemTransitionType, NavPathInfo
} from '@ohos.arkui.component'
import { State, Provide, Consume, AppStorage,  } from '@ohos.arkui.stateManagement'
@Entry
@Component
struct SystemTransition2 {
  @Provide({alias: 'pageInfos' }) pageInfos: NavPathStack = new NavPathStack()

  @Builder
  pageMap(name: string) {
    if (name == 'pageOne2') {
      PageOne2()
    } else if (name == 'pageTwo2') {
      PageTwo2()
    }
  }

  build() {
    Navigation(this.pageInfos) {
      Column({space: '5vp'} as ColumnOptions) {
        Button('push pageOne').id('pageOneId').onClick((e: ClickEvent) => {
          this.pageInfos.pushPath(new NavPathInfo('pageOne2',undefined),true)
        })
        .id('pushOneId')
        .height('10%')
        Button('push pageTwo').id('pageTwoId').onClick((e: ClickEvent) => {
          this.pageInfos.pushPath(new NavPathInfo('pageTwo2',undefined),true)
        })
        .id('pushTwoId')
        .height('10%')
      }
      .width('100%')
      .height('100%')
    }
    .title('Title')
    .navDestination(this.pageMap)
  }
}

@Component
struct PageOne2 {
  @Consume('pageInfos') pageInfos: NavPathStack;

  build() {
    NavDestination() {
      Text('This is page one').id('pageOne')
      Button('pop').onClick((e: ClickEvent) => {
        this.pageInfos.pop();
      })
      .id('popId')
      .height('10%')
    }
    .id('pageOneId')
    .title('pageOne')
    .systemTransition(NavigationSystemTransitionType.DEFAULT)
  }
}

@Component
struct PageTwo2 {
  @Consume('pageInfos') pageInfos: NavPathStack;

  build() {
    NavDestination() {
      Text('This is page two').id('pageTwo')
    }
    .id('pageTwoId')
    .title('pageTwo')
    .systemTransition(NavigationSystemTransitionType.NONE)
  }
}
