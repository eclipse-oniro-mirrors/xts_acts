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
  Entry,Component,$r,Scroll,Builder,List,ListItem,Resource,AnimateParam,Search,TextAlign,Axis,NavBarPosition,FlexAlign,NavPathInfo,NavDestinationContext,
  NavigationTitleMode,Image,NavigationMode,Column,Navigation,ButtonType,NavDestination,Stack,ColumnOptions,TextInput,SearchController,NavigationOperation,
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
struct NavigationLevelTest22 {
  @State message1: string = ''
  @State message2: string = ''
  @State message3: string = ''
  @State message4: string = ''
  @State pageInfos: NavPathStack = new NavPathStack();

  @Builder
  pageOneTmp() {
    NavDestination() {
      Column({ space: 10 } as ColumnOptions) {
        Button('pushPath pageTwo')
          .onClick((e: ClickEvent) => {
            this.pageInfos.pushPath(new NavPathInfo('pageTwo','mes'))
          })
          .id('NavigationLevelTest22_btn3')
      }
    }.title('pageOne')
  }

  @Builder
  pageTwoTmp() {
    NavDestination() {
      Column({ space: 10 } as ColumnOptions) {
        Button('replacePath pageThree')
          .onClick((e: ClickEvent) => {
            this.pageInfos.replacePath(new NavPathInfo('pageThree','mes'))
          })
          .id('NavigationLevelTest22_btn4')
      }
    }.title('pageTwo')
  }

  @Builder
  pageThreeTmp() {
    NavDestination() {
      Column({ space: 10 } as ColumnOptions) {
        Text('pageThree')
      }
    }.title('pageThree')
  }

  @Builder
  PageMap(name: string) {
    if (name === 'pageOne') {
      this.pageOneTmp()
    } else if (name === 'pageTwo') {
      this.pageTwoTmp()
    } else if (name === 'pageThree') {
      this.pageThreeTmp()
    }
  }

  build() {
    Column({ space: 5 } as ColumnOptions){
      Text(this.message1).id('NavigationLevelTest22_text1')
      Text(this.message2).id('NavigationLevelTest22_text2')
      Text(this.message3).id('NavigationLevelTest22_text3')
      Text(this.message4).id('NavigationLevelTest22_text4')
      Navigation(this.pageInfos) {
        Column({ space: 10 } as ColumnOptions) {
          Button('pushPath pageOne')
            .onClick((e: ClickEvent) => {
this.pageInfos.pushPath(new NavPathInfo('pageOne','mes'))
            })
            .id('NavigationLevelTest22_btn2')

          Button('use interception')
            .id('NavigationLevelTest22_btn1')
            .onClick((e: ClickEvent) => {
              this.pageInfos.setInterception({
                willShow: (from: NavDestinationContext | "navBar", to: NavDestinationContext | "navBar",
                           operation: NavigationOperation, isAnimated: boolean) => {
                  if (typeof from === "string") {
                    console.log("current transition is from navigation home");
                    return;
                  }
                  let fromMes: NavDestinationContext = from as NavDestinationContext;
                  let target: NavDestinationContext = to as NavDestinationContext;
                  if (target.pathInfo.name === 'pageTwo') {
                    this.message1 = 'from:' + fromMes.pathInfo.name + ';to:' + target.pathInfo.name
                      + ';operation:' + operation + ';animated:' + isAnimated
                  } else if (target.pathInfo.name === 'pageThree') {
                    this.message3 = 'from:' + fromMes.pathInfo.name + ';to:' + target.pathInfo.name
                      + ';operation:' + operation + ';animated:' + isAnimated
                  }
                },
                didShow: (from: NavDestinationContext | "navBar", to: NavDestinationContext | "navBar",
                          operation: NavigationOperation, isAnimated: boolean) => {
                  if (typeof from === "string") {
                    console.log("current transition is from navigation home");
                    return;
                  }
                  let fromMes: NavDestinationContext = from as NavDestinationContext;
                  let target: NavDestinationContext = to as NavDestinationContext;
                  if (target.pathInfo.name === 'pageTwo') {
                    this.message2 = 'from:' + fromMes.pathInfo.name + ';to:' + target.pathInfo.name
                      + ';operation:' + operation + ';animated:' + isAnimated
                  } else if (target.pathInfo.name === 'pageThree') {
                    this.message4 = 'from:' + fromMes.pathInfo.name + ';to:' + target.pathInfo.name
                      + ';operation:' + operation + ';animated:' + isAnimated
                  }
                },
              })
            })
        }
      }
      .mode(NavigationMode.Stack)
      .title('NavIndex')
      .navDestination(this.PageMap)
    }
  }
}

