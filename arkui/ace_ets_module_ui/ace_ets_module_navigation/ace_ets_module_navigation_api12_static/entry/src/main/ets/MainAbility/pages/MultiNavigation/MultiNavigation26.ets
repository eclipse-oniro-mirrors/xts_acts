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
import {MultiNavigation,MultiNavPathStack, SplitPolicy}  from './mainpage/MultiNavigation';;

@Entry
@Component
struct MultiNavigation26 {
  @Provide pageStack: MultiNavPathStack = new MultiNavPathStack();
  @State text:string = ''
  @State text2:string = ''

  aboutToAppear(): void {
    this.pageStack.pushPath(new NavPathInfo('PageHome1',"paramTest",(popInfo) => {}), false, SplitPolicy.HOME_PAGE);
    this.pageStack.setKeepBottomPage(true);
  }

  @Builder
  PageMap(name: string, param?: object) {
    if (name === 'PageDetail1') {
      PageDetail1();
    } else if (name === 'PageDetail2') {
      PageDetail2();
    }  else if (name === 'PageHome2') {
      PageHome2();
    } else if (name === 'PageHome1') {
      PageHome1();
    }else if (name === 'PageFull1') {
      PageFull1();
    }
  }

  build() {
    Column() {
      MultiNavigation({
        navDestination: this.PageMap,
        multiStack: this.pageStack,
        onHomeShowInTop: (name: string) => {}
      })
        .width(350).height(250).border({width:1})


      Button('pushPathByName PageDetail1').onClick((event: ClickEvent) => {
        this.pageStack.pushPathByName('PageDetail1',"paramTest", false, SplitPolicy.DETAIL_PAGE);
      }).id('MultiNavigation26_btn1')

      Button('pushPathByName PageFull1').onClick((event: ClickEvent) => {
       this.pageStack.pushPathByName('PageFull1',"paramTest", false, SplitPolicy.FULL_PAGE);
      }).id('MultiNavigation26_btn2')

      Button('pushPathByName PageHome1').onClick((event: ClickEvent) => {
        this.pageStack.pushPathByName('PageHome1', "paramTest", false, SplitPolicy.HOME_PAGE);
      }).id('MultiNavigation26_btn3')

      Button('getAllPathName').onClick((e: ClickEvent) => {
        this.text =  JSON.stringify(this.pageStack.getAllPathName())
      }).id('MultiNavigation26_btn4')

      Button('size').onClick((e: ClickEvent) => {
        this.text2 =  JSON.stringify(this.pageStack.size())
      }).id('MultiNavigation26_btn5')

      Text(this.text).id('MultiNavigation26_text1')
      Text(this.text2).id('MultiNavigation26_text2')

    }
  }
}

@Component
export struct PageDetail1 {
  @Consume('pageStack') pageStack:MultiNavPathStack;

  build() {
    NavDestination(){
      Column(){
        Text('PageDetail1').id('MultiNavigation26_PageDetail1_text1')
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
        Text('PageDetail2').id('MultiNavigation26_PageDetail2_text1')
      }
    }

  }
}


@Component
export struct PageHome1 {
  @Consume('pageStack') pageStack:MultiNavPathStack;
  build() {
    NavDestination(){
      Column(){
        Text('PageHome1').id('MultiNavigation26_PageHome1_text1')

      }
    }
  }
}
@Component
export struct PageHome2 {
  @Consume('pageStack') pageStack:MultiNavPathStack;
  build() {
    NavDestination(){
      Column(){
        Text('PageHome2').id('MultiNavigation26_PageHome2_text1')

      }
    }
  }
}
@Component
export struct PageFull1 {
  @Consume('pageStack') pageStack:MultiNavPathStack;
  build() {
    NavDestination(){
      Column(){
        Text('PageFull1').id('MultiNavigation26_PageFull1_text1')
      }
    }
  }
}