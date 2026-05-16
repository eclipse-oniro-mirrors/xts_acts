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
  FontWeight,Axis,Margin,Swiper,ForEach,PickerTextStyle, CalendarAlign, Visibility,NavigationCommonTitle,NavDestinationCommonTitle,Alignment
,NavPathStack} from '@ohos.arkui.component';
import {
  State,
  Link,
  PropRef,Provide
} from '@ohos.arkui.stateManagement';
import { AppStorage } from '@ohos.arkui.stateManagement';
@Entry
@Component
struct NavigationLevelTest14 {
  @State message: string = 'NavBar'
  @State pageInfos: NavPathStack = new NavPathStack();

  @Builder
  pageOneTmp() {
    NavDestination() {
      Column({ space: 10 } as ColumnOptions ) {
        Text('pageOne').id('NavigationLevelTest14_text2')
        Button('replacePath pageTwo')
          .onClick((e: ClickEvent) => {
            this.pageInfos.replacePath(new NavPathInfo('pageTwo','mes'),true)
          })
          .id('NavigationLevelTest14_btn3')
      }
    }.title('pageOne')
  }

  @Builder
  pageTwoTmp() {
    NavDestination() {
      Column({ space: 10 } as ColumnOptions ) {
        Text('pageTwo').id('NavigationLevelTest14_text3')
        Button('pop')
          .onClick((e: ClickEvent) => {
            this.pageInfos.pop()
          })
          .id('NavigationLevelTest14_btn4')
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
      Navigation(this.pageInfos) {
        Column({space:10} as ColumnOptions) {
          Text(this.message).id('NavigationLevelTest14_text1')

          Button('disableAnimation:true')
            .onClick((e: ClickEvent) => {
              this.pageInfos.disableAnimation(true)
            })
            .id('NavigationLevelTest14_btn1')

          Button('pushPath pageOne')
            .onClick((e: ClickEvent) => {
this.pageInfos.pushPath(new NavPathInfo('pageOne','mes'))
            })
            .id('NavigationLevelTest14_btn2')
        }
      }
      .mode(NavigationMode.Stack)
      .title('NavIndex')
      .navDestination(this.PageMap)
    }

  }
}

