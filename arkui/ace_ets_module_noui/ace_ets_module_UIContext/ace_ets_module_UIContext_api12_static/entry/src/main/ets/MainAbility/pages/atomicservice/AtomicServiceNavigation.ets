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
  Entry, Component,
  Column, ColumnOptions, Row, RowOptions, Color, TabBarOptions, NavPathInfo,
  Text, Button, FontWeight, ClickEvent, Margin, Builder, NavPathStack, NavDestination, NavDestinationContext,
  // AtomicServiceNavigation, AtomicServiceTabs, TabBarPosition,
} from '@ohos.arkui.component'
import { State } from '@ohos.arkui.stateManagement';

@Entry
@Component
struct Index {
  @State message: string = '主题';
  childNavStack: NavPathStack = new NavPathStack();
  @Builder
  tabContent1() {
    Text('first page')
      .onClick((e:ClickEvent) => {
        // this.childNavStack.pushPath({ name: 'page one' })
        this.childNavStack.pushPath(new NavPathInfo( 'page one' , ''));
      })
  }

  @Builder
  tabContent2() {
    Text('second page')
  }

  @Builder
  tabContent3() {
    Text('third page')
  }

  @Builder
  navigationContent() {
    // AtomicServiceTabs({
    //   tabContents: [
    //     () => {
    //       this.tabContent1()
    //     },
    //     () => {
    //       this.tabContent2()
    //     },
    //     () => {
    //       this.tabContent3()
    //     }
    //   ],
    //   tabBarOptionsArray: [
    //     new TabBarOptions($r('sys.media.ohos_ic_public_phone'), '功能1'),
    //     new TabBarOptions($r('sys.media.ohos_ic_public_location'), '功能2', Color.Green, Color.Red),
    //     new TabBarOptions($r('sys.media.ohos_ic_public_more'), '功能3')
    //   ],
    //   tabBarPosition: TabBarPosition.BOTTOM,
    //   barBackgroundColor: $r('sys.color.ohos_id_color_bottom_tab_bg'),
    //   onTabBarClick: (index: Number) => {
    //     if (index == 0) {
    //       this.message = '功能1';
    //     } else if (index == 1) {
    //       this.message = '功能2';
    //     } else {
    //       this.message = '功能3';
    //     }
    //   }
    // })
  }

  @Builder
  pageMap(name: string) {
    if (name === 'page one') {
      PageOne()
    } else if (name === 'page two') {
      PageTwo()
    }
  }

  build() {
    Row() {
      Column() {
        // AtomicServiceNavigation({
        //   navigationContent: () => {
        //     this.navigationContent()
        //   },
        //   title: this.message,
        //   titleOptions: {
        //     backgroundColor: 'rgb(61, 157, 180)',
        //     isBlurEnabled: false
        //   },
        //   navDestinationBuilder: this.pageMap,
        //   navPathStack: this.childNavStack,
        //   mode: NavigationMode.Stack
        // })
      }
      .width('100%')
    }
    .height('100%')
  }
}

@Component
export struct PageOne {
  pageInfo: NavPathStack = new NavPathStack();

  build() {
    NavDestination() {
      Button('Next')
        .onClick((e:ClickEvent) => {
          // this.pageInfo.pushPath({ name: 'page two'})
          this.pageInfo.pushPath(new NavPathInfo( 'page two', ''));
        })
    }
    .title('PageOne')
    .onReady((context: NavDestinationContext) => {
      this.pageInfo = context.pathStack;
    })
  }
}

@Component
export struct PageTwo {
  pageInfo: NavPathStack = new NavPathStack();

  build() {
    NavDestination() {
      Button('End')
    }
    .title('PageTwo')
    .onReady((context: NavDestinationContext) => {
      this.pageInfo = context.pathStack;
    })
  }
}