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
import { Entry, Component, NavPathStack, Navigation, Column, Button, ColumnOptions, ClickEvent, BarStyle, Stack,
  StackOptions, BlurStyle, Text, Color, Builder, Scroller, NavigationTitleMode, Scroll, ForEach, List, ListItem, Margin,
  ScrollDirection, BarState, EdgeEffect, NavDestination, Row, $r, NavigationMode, NavigationOperation, NavDestinationTransition,
  Curve, NavPathInfo
} from '@ohos.arkui.component'
import { State, Provide, Consume, AppStorage} from '@ohos.arkui.stateManagement'
@Entry
@Component
struct HideBackButtonPage {
  @Provide({alias: 'pageInfos' }) pageInfos: NavPathStack = new NavPathStack()

  @Builder
  pageMap(name: string) {
    if (name == 'pageOne') {
      PageOne2()
    } else if (name == 'pageTwo') {
      PageTwo2()
    } else if (name == 'pageThree') {
      PageThree2()
    } else if (name == 'pageFour') {
      PageFour()
    }
  }

  build() {
    Navigation(this.pageInfos) {
      Column({space: '5vp'} as ColumnOptions) {
        Button('push pageOne').id('pushOneId').onClick((e: ClickEvent) => {
          this.pageInfos.pushPath(new NavPathInfo('pageOne',undefined),true)
        }).height('10%')

        Button('push pageTwo').id('pushTwoId').onClick((e: ClickEvent) => {
          this.pageInfos.pushPath(new NavPathInfo('pageTwo',undefined),true)
        }).height('10%')

        Button('push pageThree').id('pageThreeId').onClick((e: ClickEvent) => {
          this.pageInfos.pushPath(new NavPathInfo('pageThree',undefined),true )
        }).height('10%')

        Button('push pageFour').id('pushFourId').onClick((e: ClickEvent) => {
          this.pageInfos.pushPath(new NavPathInfo('pageFour',undefined),true )
        }).height('10%')
      }
      .width('100%')
      .height('100%')
    }
    .title('Title')
    .titleMode(NavigationTitleMode.Mini)
    .navDestination(this.pageMap)
    .mode(NavigationMode.Stack)
  }
}

@Component
struct PageOne2 {
  @Consume('pageInfos') pageInfos: NavPathStack;
  build() {
    NavDestination() {
      Button('pop').id('popId').onClick((e: ClickEvent) => {
        this.pageInfos.pop()
      }).height('10%')
    }
    .title('pageOne')
    .hideBackButton(true)
  }
}

@Component
struct PageTwo2 {
  @Consume('pageInfos') pageInfos: NavPathStack;
  build() {
    NavDestination() {
      Button('pop').id('popId').onClick((e: ClickEvent) => {
        this.pageInfos.pop()
      }).height('10%')
    }
    .title('pageTwo')
    .hideBackButton(false)
  }
}

@Component
struct PageThree2 {
  @Consume('pageInfos') pageInfos: NavPathStack;
  build() {
    NavDestination() {
      Button('pop').id('popId').onClick((e: ClickEvent) => {
        this.pageInfos.pop()
      }).height('10%')
    }
    .title('pageThree')
    // .hideBackButton(null)
  }
}

@Component
struct PageFour {
  @Consume('pageInfos') pageInfos: NavPathStack;
  build() {
    NavDestination() {
      Button('pop').id('popId').onClick((e: ClickEvent) => {
        this.pageInfos.pop()
      }).height('10%')
    }
    .title('pageThree')
    .hideBackButton(undefined)
  }
}