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
  Curve, NavDestinationMode, NavPathInfo
} from '@ohos.arkui.component'
import { State, Provide, Consume, AppStorage} from '@ohos.arkui.stateManagement'
@Entry
@Component
struct OnResultPage {
  @Provide({alias: 'pageInfos' }) pageInfos: NavPathStack = new NavPathStack()

  @Builder
  pageMap(name: string) {
    if (name == 'pageOne') {
      PageOne1()
    } else if (name == 'pageTwo') {
      PageTwo1()
    } else if (name == 'pageDialog') {
      PageThree1()
    }
  }

  build() {
    Navigation(this.pageInfos) {
      Column({space: '5vp'} as ColumnOptions) {
        Button('push pageOne').id('pushId').onClick((e: ClickEvent) => {
          this.pageInfos.pushPath(new NavPathInfo('pageOne',undefined),true )
        }).height('10%')
      }
      .width('100%')
      .height('100%')
    }
    .title('Title')
    .titleMode(NavigationTitleMode.Mini)
    .navDestination(this.pageMap)
  }
}

@Component
struct PageOne1 {
  @Consume('pageInfos') pageInfos: NavPathStack;
  @State info: string = '';
  build() {
    NavDestination() {
      Text(this.info).id('infoId').height('5%')
      Button('push pageTwo').id('pushTwoId').onClick((e: ClickEvent) => {
        this.pageInfos.pushPath(new NavPathInfo('pageTwo',undefined),true )
      }).height('10%')
      Button('push pageDialog').id('pushDialogId').onClick((e: ClickEvent) => {
        this.pageInfos.pushPath(new NavPathInfo('pageDialog',undefined),true)
      }).height('10%')
    }
    .title('pageOne')
    .onResult((result: Object|null|undefined) => {
      this.info = result + '';
    })
  }
}

@Component
struct PageTwo1 {
  @Consume('pageInfos') pageInfos: NavPathStack;
  build() {
    NavDestination() {
      Button('pop').id('popId').onClick((e: ClickEvent) => {
        this.pageInfos.pop('test')
      }).height('10%')
      Button('popToIndex').id('popIndexId').onClick((e: ClickEvent) => {
        this.pageInfos.popToIndex(0, 2)
      }).height('10%')
      Button('popToName').id('popNameId').onClick((e: ClickEvent) => {
        this.pageInfos.popToName('pageOne', 'popToName')
      }).height('10%')
      Button('popToNameUndefined').id('popUndefinedId').onClick((e: ClickEvent) => {
        this.pageInfos.popToName('pageOne', undefined)
      }).height('10%')
      Button('popToIndexNull').id('popNullId').onClick((e: ClickEvent) => {
        this.pageInfos.popToIndex(0, undefined)
      }).height('10%')
    }
    .title('pageTwo')
  }
}

@Component
struct PageThree1 {
  @Consume('pageInfos') pageInfos: NavPathStack;
  build() {
    NavDestination() {
      Button('pop').id('dialogPopId').onClick((e: ClickEvent) => {
        this.pageInfos.pop('test')
      }).height('10%')
      Button('popToIndex').id('dialogPopIndexId').onClick((e: ClickEvent) => {
        this.pageInfos.popToIndex(0, 'popToIndex')
      }).height('10%')
      Button('popToName').id('dialogPopNameId').onClick((e: ClickEvent) => {
        this.pageInfos.popToName('pageOne', 'popToName')
      }).height('10%')
    }
    .title('pageDialog')
    .mode(NavDestinationMode.DIALOG)
  }
}