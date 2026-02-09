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
  Position,EffectType,Text,Color,Flex,FlexDirection,ItemAlign,Row,Button,ClickEvent,NavDestinationMode,Dimension,TextOverflow,
  FontWeight,Axis,Margin,Swiper,ForEach,PickerTextStyle, CalendarAlign, Visibility,NavigationCommonTitle,NavDestinationCommonTitle,Alignment
,NavPathStack} from '@ohos.arkui.component';
import {
  State,
  Link,
  PropRef,Provide,Consume
} from '@ohos.arkui.stateManagement';
import { AppStorage } from '@ohos.arkui.stateManagement';
import {MultiNavigation,MultiNavPathStack, SplitPolicy}  from './mainpage/MultiNavigation';
@Entry
@Component
struct MultiNavigation1 {
  @Provide pageStack: MultiNavPathStack = new MultiNavPathStack();

  @Builder
  PageMap(name: string, param?: object) {
    if (name === 'PageDetail1') {
      PageDetail1();
    } else if (name === 'PageDetail2') {
      PageDetail2();
    }
  }

  build() {
    Column() {
      MultiNavigation({
        navDestination: this.PageMap,
        multiStack: this.pageStack,
        onHomeShowInTop: (name: string) => {}
      })
        .width(350).height(400).border({width:1})

      Button('pushPath PageDetail1')
        .onClick((event: ClickEvent) => {
          this.pageStack.pushPath(new NavPathInfo('PageDetail1',"paramTest",(popInfo) => {}), false, SplitPolicy.HOME_PAGE);
      })
        .id('MultiNavigation1_btn1')

    }
  }
}

@Component
export struct PageDetail1 {
  @Consume('pageStack') pageStack:MultiNavPathStack;

  build() {
    NavDestination(){
      Column(){
        Text('PageDetail1').id('MultiNavigation1_PageDetail1_text1')
        Button('pushPath pageDetail2').onClick((e: ClickEvent) => {
          if (this.pageStack !== undefined && this.pageStack !== null){
            this.pageStack.pushPath(new NavPathInfo('PageDetail2', 'a'),true, SplitPolicy.DETAIL_PAGE)
          }
        }).id('MultiNavigation1_PageDetail1_btn1')
      }
    }

  }
}

@Component
export struct PageDetail2 {
  @Consume('pageStack') pageStack:MultiNavPathStack;

  build() {
    NavDestination(){
      Column(){
        Text('PageDetail2').id('MultiNavigation1_PageDetail2_text1')
        Button('pop').onClick((e: ClickEvent) => {
          if (this.pageStack !== undefined && this.pageStack !== null){
            this.pageStack.pop()
          }
        }).id('MultiNavigation1_PageDetail2_btn1')
      }
    }

  }
}