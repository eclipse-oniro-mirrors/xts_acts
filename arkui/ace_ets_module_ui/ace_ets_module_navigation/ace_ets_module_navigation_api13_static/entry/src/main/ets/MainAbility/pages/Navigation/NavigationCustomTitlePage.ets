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
import { Entry, Component, NavPathStack, Builder, Navigation, Column, Button, ColumnOptions, ClickEvent, NavigationTitleMode, Text, Color,
  NavigationMode, NavDestination, NavPathInfo, BarStyle, Stack, StackOptions, BlurStyle, Row, Image, Margin, Alignment, $r, Resource,
  NavigationCustomTitle, NavDestinationCustomTitle
} from '@ohos.arkui.component'
import { State, Provide, Consume, AppStorage } from '@ohos.arkui.stateManagement'

@Entry
@Component
struct NavigationCustomTitlePage {
  @Provide({alias: 'navPathStack' }) navPathStack: NavPathStack = new NavPathStack();
  @Builder
  pageMap(name: string) {
    if (name == 'navDes') {
      PageNavDestination()
    }
  }

  @Builder
  NavigationTitle() {
    Column() {
      Text('title').fontColor(Color.Red).fontSize(30).id('customTitleId')  //master22 页面有显示，但找不到这个组件
    }
    .margin({left: '10%', top: '10%'} as Margin)
    .onClick((e: ClickEvent) => {
       AppStorage.setOrCreate<Double>('customTitle', 14);
    })
  }

  build() {
    Navigation(this.navPathStack){
      Column() {
        Button('push').onClick((e: ClickEvent) => {
          this.navPathStack.pushPathByName('navDes', null);
        })
      }
    }
    .title({builder: this.NavigationTitle, height: '50%'} as NavigationCustomTitle)
    .titleMode(NavigationTitleMode.Mini)
    .mode(NavigationMode.Stack)
    .navDestination(this.pageMap)
  }
}

@Component
struct PageNavDestination {
  @State num:number = 0;

  @Builder
  NavDesTitle() {
    Column() {
      Text('title').fontColor(Color.Red).fontSize(30).id('customNavTitleId') //master22 页面有显示，但找不到这个组件
    }
    .margin({left: '10%', top: '10%'} as Margin)
    .onClick((e: ClickEvent) => {
       this.num = 15;
       AppStorage.setOrCreate<Double>('customNavTitle', 15);
    })
  }

  build() {
    NavDestination(){
      Text(this.num + '');
    }
    .title({builder: this.NavDesTitle, height: '50%'} as NavDestinationCustomTitle)
  }
}