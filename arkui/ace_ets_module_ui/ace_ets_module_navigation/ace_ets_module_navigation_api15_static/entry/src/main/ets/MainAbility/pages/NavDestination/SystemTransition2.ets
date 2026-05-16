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

import { BusinessError } from '@kit.BasicServicesKit';
import { Entry, Component, NavPathStack, Navigation, Column, Button, ColumnOptions, ClickEvent, BarStyle, Stack,
  StackOptions, BlurStyle, Text, Color, Builder, Scroller, NavigationTitleMode, Scroll, ForEach, List, ListItem, Margin,
  ScrollDirection, BarState, EdgeEffect, NavDestination, Row, $r, NavigationMode, NavigationOperation, NavDestinationTransition,
  Curve, NavigationSystemTransitionType, NavPathInfo
} from '@ohos.arkui.component'
import { State, Provide, Consume, AppStorage} from '@ohos.arkui.stateManagement'
@Entry
@Component
struct SystemTransition2 {
  @Provide({alias: 'pageInfos' }) pageInfos: NavPathStack = new NavPathStack()

  @Builder
  pageMap(name: string) {
    if (name == 'pageOne') {
      PageOne()
    } else if (name == 'pageTwo') {
      PageTwo()
    } else if (name == 'pageThree') {
      PageThree()
    } else if (name == 'pageFour') {
      PageFour()
    }
  }

  build() {
    Navigation(this.pageInfos) {
      Column({space: '5vp'} as ColumnOptions) {
        Button('push pageOne').id('btnOneId').onClick((e: ClickEvent) => {
          this.pageInfos.pushPath(new NavPathInfo('pageOne',undefined),true)
        }).height('10%')
        Button('push pageTwo').id('btnTwoId').onClick((e: ClickEvent) => {
          this.pageInfos.pushPath(new NavPathInfo('pageTwo',undefined),true)
        }).height('10%')
        Button('push pageThree').id('btnThreeId').onClick((e: ClickEvent) => {
          this.pageInfos.pushPath(new NavPathInfo('pageThree',undefined),true)
        }).height('10%')
        Button('push pageFour').id('btnFourId').onClick((e: ClickEvent) => {
          this.pageInfos.pushPath(new NavPathInfo('pageFour',undefined),true)
        }).height('10%')
      }
      .width('100%')
      .height('100%')
    }
    .title('Title')
    .navDestination(this.pageMap)
  }
}

@Component
struct PageOne {
  @Consume('pageInfos') pageInfos: NavPathStack;

  build() {
    NavDestination() {
      Text('one').id('text1Id').height('10%')
      Button('pop').id('pop1Id').onClick((e: ClickEvent) => {
        this.pageInfos.pop()
      }).height('10%')
    }
    .title('pageOne')
    .systemTransition(NavigationSystemTransitionType.FADE)
    .id('pageOneId')
  }
}

@Component
struct PageTwo {
  @Consume('pageInfos') pageInfos: NavPathStack;

  build() {
    NavDestination() {
      Text('two').id('text2Id').height('10%')
      Button('pop').id('pop2Id').onClick((e: ClickEvent) => {
        this.pageInfos.pop()
      }).height('10%')
    }
    .title('pageTwo')
    .systemTransition(NavigationSystemTransitionType.EXPLODE)
    .id('pageTwoId')
  }
}


@Component
struct PageThree {
  @Consume('pageInfos') pageInfos: NavPathStack;

  build() {
    NavDestination() {
      Text('three').id('text3Id').height('10%')
      Button('pop').id('pop3Id').onClick((e: ClickEvent) => {
        this.pageInfos.pop()
      }).height('10%')
    }
    .title('pageThree')
    .systemTransition(NavigationSystemTransitionType.SLIDE_RIGHT)
    .id('pageThreeId')
  }
}


@Component
struct PageFour {
  @Consume('pageInfos') pageInfos: NavPathStack;

  build() {
    NavDestination() {
      Text('four').id('text4Id').height('10%')
    }
    .title('pageFour')
    .systemTransition(NavigationSystemTransitionType.SLIDE_BOTTOM)
    .id('pageFourId')
  }
}