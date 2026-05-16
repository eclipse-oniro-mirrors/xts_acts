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

import {
  Entry,
  Column,
  Component,
  Button,
  ClickEvent,
  ForEach,
  Text,
  Row,
  Flex,
  FlexDirection,
  ItemAlign,
  FlexAlign,
  Builder,
  NavPathStack,
  FontWeight,
  Navigation,
  NavDestination,
  NavigationMode,
  ButtonType,NavPathInfo
} from '@ohos.arkui.component'
import {
  State,
  Watch,
  Link,
  Provide,
  PropRef,
  ObjectLink,
  Observed,
  Consume,
  StoragePropRef,
  StorageLink,
  LocalStorage,
  LocalStoragePropRef,
  LocalStorageLink
} from '@ohos.arkui.stateManagement'
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
let localStorageA = new LocalStorage();
localStorageA.setOrCreate<string>('PropA', 'PropA');

let localStorageB: LocalStorage = new LocalStorage();
localStorageB.setOrCreate<string>('PropB', 'PropB');

let localStorageC: LocalStorage = new LocalStorage();
localStorageC.setOrCreate<string>('PropC', 'PropC');

@Entry
@Component
struct MyNavigationTestStack {
  @Provide({ alias:'pageInfo' }) pageInfo: NavPathStack = new NavPathStack();
  @Builder
  PageMap(name: string) {
    if (name === 'pageOne') {
      // 传递不同的LocalStorage实例
      pageOneStack({}, localStorageA)
    } else if (name === 'pageTwo') {
      pageTwoStack({}, localStorageB)
    } else if (name === 'pageThree') {
      pageThreeStack({}, localStorageC)
    }
  }

  build() {
    Column() {
      Navigation(this.pageInfo) {
        Column() {
          Button('Next Page', { stateEffect: true, type: ButtonType.Capsule })
            .width('80%')
            .height('3%')

            .onClick((e: ClickEvent) => {
              this.pageInfo.pushPath(new NavPathInfo('pageOne',undefined)); //将name指定的NavDestination页面信息入栈
            })
            .id('navButton')
        }
      }.title('NavIndex')
      .navDestination(this.PageMap)
      .mode(NavigationMode.Stack)
      .borderWidth(1)
    }
  }
}

@Component
struct pageOneStack {
  @Consume('pageInfo') pageInfo: NavPathStack;
  @LocalStorageLink('PropA') propA: string = 'Hello World';

  build() {
    NavDestination() {
      Column() {
        NavigationContentMsgStack()
        // 显示绑定的LocalStorage中PropA的值'PropA'
        Text(`${this.propA}`).onClick((e: ClickEvent) => {
          this.propA = 'PropA1'
        }).id('navText').height('5%')
        Button('Next Page', { stateEffect: true, type: ButtonType.Capsule })
          .width('80%')
          .height('3%')

          .onClick((e: ClickEvent) => {
            this.pageInfo.pushPathByName('pageTwo', null);
          })
          .id('navButton1')
      }.width('100%').height('100%')
    }.title('pageOne')
    .onBackPressed(() => {
      this.pageInfo.pop();
      return true;
    })
  }
}

@Component
struct pageTwoStack {
  @Consume('pageInfo') pageInfo: NavPathStack;
  @LocalStorageLink('PropA') propB: string = 'Hello World';

  build() {
    NavDestination() {
      Column() {
        NavigationContentMsgStack()
        // 绑定的LocalStorage中没有PropA,显示本地初始化的值 'Hello World'
        Text(`${this.propB}`).id('navText2').height('5%')
        Button('Next Page', { stateEffect: true, type: ButtonType.Capsule })
          .width('80%')
          .height('3%')

          .onClick((e: ClickEvent) => {
            this.pageInfo.pushPathByName('pageThree', null);
          })
          .id('navButton2')

      }.width('100%').height('100%')
    }.title('pageTwo')
    .onBackPressed(() => {
      this.pageInfo.pop();
      return true;
    })
  }
}

@Component
struct pageThreeStack {
  @Consume('pageInfo') pageInfo: NavPathStack;
  @LocalStorageLink('PropA') propC: string = 'pageThreeStack';

  build() {
    NavDestination() {
      Column() {
        NavigationContentMsgStack()

        // 绑定的LocalStorage中没有PropA,显示本地初始化的值 'pageThreeStack'
        Text(`${this.propC}`).id('navText3').height('5%')
        Button('Next Page', { stateEffect: true, type: ButtonType.Capsule })
          .width('80%')
          .height('3%')

          .onClick((e: ClickEvent) => {
            this.pageInfo.pushPathByName('pageOne', null);
          })
          .id('navButton3')

      }.width('100%').height('100%')
    }.title('pageThree')
    .onBackPressed(() => {
      this.pageInfo.pop();
      return true;
    })
  }
}

@Component
struct NavigationContentMsgStack {
  @LocalStorageLink('PropA') propA: string = 'Hello';

  build() {
    Column() {
      Text(`${this.propA}`)
        .height('5%')
        .fontSize(9)
        .fontWeight(FontWeight.Bold)
        .id('navText4')
    }
  }
}