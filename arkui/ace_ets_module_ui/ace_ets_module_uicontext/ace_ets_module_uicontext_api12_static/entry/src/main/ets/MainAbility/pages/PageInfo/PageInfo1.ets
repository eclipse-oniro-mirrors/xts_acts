'use static';
/**
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

import { UIContext, PageInfo } from '@ohos.arkui.UIContext';
import {
  Entry, Component,
  Column, ColumnOptions, Row, NavPathStack, NavDestination, Navigation, Builder, NavPathInfo,
  Text, Button, FontWeight, ClickEvent, Margin, WidthBreakpoint, HeightBreakpoint, NavigationMode,
} from '@ohos.arkui.component'
import { State, Provide } from '@ohos.arkui.stateManagement';

@Entry
@Component
struct PageInfo1 {
  // @Provide('pageInfos') pageInfos: NavPathStack = new NavPathStack();  // 这是原代码，去掉了('pageInfos')
  @Provide pageInfos: NavPathStack = new NavPathStack();


  @Builder
  pageOneTmp() {
    NavDestination() {
      Column({ space: 10 } as ColumnOptions) {
        MyComponent()
      }
    }.title('pageOne')
  }

  @Builder
  PageMap(name: string, param:Object|null|undefined) {
    if (name === 'pageOne') {
      this.pageOneTmp()
    }
  }

  build() {
    Column() {
      Navigation(this.pageInfos) {
        Button('pushPath pageOne')
          .onClick((e:ClickEvent)=>{
            this.pageInfos.pushPath(new NavPathInfo( 'pageOne', 'str'));
          })
          .id('PageInfo1_pageOne')
      }.id('navigation')
      .mode(NavigationMode.Stack)
      .title('NavIndex')
      .navDestination(this.PageMap)
    }
  }
}

@Component
struct MyComponent {
  @State text1:string = ''
  @State text2:string = ''

  build() {
    Column() {
      console.log('++++++++++MyComponent')
      Text('PageInfoExample')
      Text(this.text1).id('PageInfo1_text1')
      Text(this.text2).id('PageInfo1_text2')
      Button('click')
        .id('PageInfo1_get')
        .onClick((e:ClickEvent) => {
          console.log('+++++++++++1')
          const uiContext: UIContext = this.getUIContext();
          console.log('+++++++++++2')
          const uniqueId: number = this.getUniqueId();
          console.log('+++++++++++3')
          const pageInfo: PageInfo = uiContext.getPageInfoByUniqueId(uniqueId as int);
          console.log('+++++++++++4')
          this.text1 = pageInfo.routerPageInfo?.name + ''
          this.text2 = pageInfo.navDestinationInfo?.name + ''
          // console.info('pageInfo: ' + JSON.stringify(pageInfo));
          // console.info('navigationInfo: ' + JSON.stringify(uiContext.getNavigationInfoByUniqueId(uniqueId as int)));
        })
    }
    .width('100%')
  }
}