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
  NavigationMode, NavDestination, NavPathInfo,
} from '@ohos.arkui.component'
import { State, Provide, Consume, AppStorage } from '@ohos.arkui.stateManagement'

@Entry
@Component
struct EnableSwipeBackPage {
  @Provide({alias:'pageInfos'}) pageInfos: NavPathStack = new NavPathStack()

  @Builder
  pageMap(name: string) {
    if (name == 'pageOne') {
      EnableSwipeBackPageOne()
    }
  }

  build() {
    Navigation(this.pageInfos) {
      Column({space: '5vp'} as ColumnOptions) {
        Button('push pageOne').id('pushOneId').onClick((e: ClickEvent) => {
          this.pageInfos.pushPath(new NavPathInfo("pageOne",null))
        })
        .height('10%')
        .id('pushId')
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
struct EnableSwipeBackPageOne {
  @Consume('pageInfos') pageInfos: NavPathStack=new NavPathStack();
  @State isEnable: boolean = true;

  build() {
    NavDestination() {
      Button(`enable swipe back: ${this.isEnable}`).onClick((e: ClickEvent) => {
        console.log('++++++++++++++++++enableId1')
        this.isEnable = !this.isEnable;
        console.log('++++++++++++++++++enableId2',this.isEnable)
        this.getUIContext().enableSwipeBack(this.isEnable); //master22 在这里appDied  Cannot find method 'enableSwipeBack
        console.log('++++++++++++++++++enableId3')
      })
      .height('10%')
      .id('enableId')
    }
    .title('pageOne')
    .hideBackButton(true)
    .id('navId')
  }
}