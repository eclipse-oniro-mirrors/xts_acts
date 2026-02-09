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
  Entry,Component,$r,Scroll,Builder,List,ListItem,Resource,AnimateParam,Search,TextAlign,Axis,NavBarPosition,FlexAlign,
  NavigationTitleMode,Image,NavigationMode,Column,Navigation,ButtonType,NavDestination,Stack,ColumnOptions,TextInput,SearchController,NavPathInfo,
  Position,EffectType,Text,Color,Flex,NavDestinationContext,ItemAlign,Row,Button,ClickEvent,NavDestinationMode,Dimension,TextOverflow,
  FontWeight,Axis,Margin,Swiper,ForEach,ColumnOptions, LayoutSafeAreaEdge, LayoutSafeAreaType,NavigationCommonTitle,NavDestinationCommonTitle,Alignment
,NavPathStack} from '@ohos.arkui.component';
import {
  State,
  Link,
  PropRef,Provide
} from '@ohos.arkui.stateManagement';
import { AppStorage } from '@ohos.arkui.stateManagement';
@Entry
@Component
struct NavigationLevelTest4 {
  @State message:string = ''
  @State pageInfos: NavPathStack = new NavPathStack();

  @Builder
  pageOneTmp() {
    NavDestination() {
      Column({ space: 10 } as ColumnOptions) {
        Button('popToName pageTwo')
          .onClick((e: ClickEvent) => {
            this.message = 'popToName:' + this.pageInfos.popToName('pageTwo')
          })
          .id('NavigationLevelTest4_btn2')
      }
    }.title('pageOne')
  }

  @Builder
  pageTwoTmp() {
    NavDestination() {
      Column({ space: 10 } as ColumnOptions) {
        Text('pageTwo')
      }
    }.title('pageTwo')
  }

  @Builder
  PageMap(name: string) {
    if (name === 'pageOne') {
      this.pageOneTmp()
    } else if (name === 'pageTwo') {
      this.pageTwoTmp()
    }
  }

  build() {
    Column({space:5} as ColumnOptions){
      console.log('++++++++++++++++++++++++++++++++++')
      Text(this.message).id('NavigationLevelTest4_text1')

      Navigation(this.pageInfos) {
        Column({space:10} as ColumnOptions) {
          Button('pushPath pageOne')
            .onClick((e: ClickEvent) => {
             this.pageInfos.pushPath(new NavPathInfo('pageOne','mes'))
            })
            .id('NavigationLevelTest4_btn1')
        }
        .width('100%') // Navigation显式占满父容器宽度
        .height('80%') // 分配高度（剩余高度给Text），避免挤压
      }
      .mode(NavigationMode.Stack)
      .title('NavIndex')
      .navDestination(this.PageMap)
    }
    .width('100%') // 根Column占满屏幕宽度
    .height('100%') // 根Column占满屏幕高度

  }
}

