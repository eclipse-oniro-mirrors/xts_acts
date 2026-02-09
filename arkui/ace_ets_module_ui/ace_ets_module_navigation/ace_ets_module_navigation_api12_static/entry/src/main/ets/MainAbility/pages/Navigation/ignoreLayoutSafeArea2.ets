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
import {
  Entry,Component,$r,Scroll,Builder,List,ListItem,Resource,AnimateParam,Search,TextAlign,Axis,NavBarPosition,FlexAlign,NavPathInfo,
  NavigationTitleMode,Image,NavigationMode,Column,Navigation,ButtonType,NavDestination,Stack,ColumnOptions,TextInput,SearchController,
  Position,EffectType,Text,Color,Flex,FlexDirection,ItemAlign,Row,Button,ClickEvent,NavDestinationMode,Dimension,TextOverflow,
  FontWeight,Axis,Margin,Swiper,ForEach,PickerTextStyle, CalendarAlign, LayoutSafeAreaType,LayoutSafeAreaEdge,NavigationCommonTitle,NavDestinationCommonTitle,Alignment
,NavPathStack} from '@ohos.arkui.component';
import {
  State,
  Link,
  PropRef,Provide,Consume
} from '@ohos.arkui.stateManagement';
import { AppStorage } from '@ohos.arkui.stateManagement';
import { ColorMetrics, LengthMetrics } from '@ohos.arkui.node'
import window from '@ohos.window'

@Entry
@Component
struct ignoreLayoutSafeAreaTest2 {
  @State text1:string | undefined= 'pageOne'
  @State modeValue: NavigationMode = NavigationMode.Stack
  @State pageInfos: NavPathStack = new NavPathStack()

  @Builder PageMap(name:string){
    if (name === 'pageOne'){
      this.pageOne()
    }
  }

  @Builder pageOne(){
    NavDestination(){
      Column({space:5} as ColumnOptions){
        Text(this.text1)

      }.width('100%').height('100%')
      .backgroundColor(Color.Green)

    }
    .title('pageOne')
    .hideTitleBar(true,true)
    .backgroundColor(Color.Orange)
    // .systemBarStyle({statusBarContentColor:'#FF00FF00'})
    .ignoreLayoutSafeArea([LayoutSafeAreaType.SYSTEM],[LayoutSafeAreaEdge.TOP, LayoutSafeAreaEdge.BOTTOM])
  }

  build() {
    Navigation(this.pageInfos){
      Column({space:5} as ColumnOptions){
        Text(this.text1)

        Button('push')
          .onClick((e: ClickEvent)=>{
            this.pageInfos.pushPathByName('pageOne',null)
          })
          .margin({top:'200vp'} as Margin)
          .id('ignoreLayoutSafeAreaTest2_push')

      }.width('100%').height('100%').backgroundColor(Color.Yellow).id('ignoreLayoutSafeAreaTest2_column')
    }
    .id('ignoreLayoutSafeAreaTest2_nav')
    .mode(this.modeValue)
    .title('navigation')
    .hideTitleBar(true,true)
    .hideToolBar(true,true)
    .navDestination(this.PageMap)
    .backgroundColor(Color.Pink)
    // .systemBarStyle({statusBarContentColor:'#FF0000FF'})
    .ignoreLayoutSafeArea([LayoutSafeAreaType.SYSTEM],[LayoutSafeAreaEdge.TOP, LayoutSafeAreaEdge.BOTTOM])
  }
}