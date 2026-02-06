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
  Entry,Component,$r,Scroll,Builder,List,ListItem,Resource,Curve,PopInfo,HorizontalAlign,AnimateParam,NavDestinationTransition,Search,TextAlign,Axis,NavBarPosition,FlexAlign,NavPathInfo,NavDestinationContext,
  NavigationTitleMode,Image,NavigationMode,Column,Navigation,ButtonType,NavDestination,Stack,ColumnOptions,TextInput,SearchController,NavigationOperation,PanGesture,
  Position,EffectType,EffectComponent,Text,Color,Flex,FlexDirection,ItemAlign,Row,Button,ClickEvent,NavDestinationMode,Dimension,TextOverflow,GestureEvent,
  FontWeight,Axis,Margin,Swiper,ForEach,CustomDialog,PickerTextStyle,SheetMode,CustomDialogControllerOptions,CustomDialogController,NavDestinationActiveReason, CalendarAlign, Visibility,NavigationCommonTitle,NavDestinationCommonTitle,Alignment,BarStyle,LaunchMode
,NavPathStack} from '@ohos.arkui.component';
import {
  State,
  Link,
  PropRef,Provide,Consume,StorageLink
} from '@ohos.arkui.stateManagement';
import { AppStorage } from '@ohos.arkui.stateManagement';
import { BusinessError } from '@ohos.base';
import { Callback } from '@ohos.base'
@Entry
@Component
struct PathStackPage {
  @Provide({alias:'mainPathStack'}) stack: NavPathStack = new NavPathStack();

  @Builder
  MyPageMap(name: string) {
    if (name === 'navPathPageOne') {
      NavPathPageOne()
    } else if (name === 'navPathPageTwo') {
      NavPathPageTwo()
    }
  }


  build() {
    Navigation(this.stack) {
      Button('pushStack').onClick((e: ClickEvent) => {
        let curPathStack: Array<NavPathInfo> = new Array<NavPathInfo>();

        let popCallbackOne: Callback<PopInfo> = (popupInfo: PopInfo) => {
          console.log('pop setPathStack pageOne' + JSON.stringify(popupInfo.info))
        }
        let popCallbackTwo: Callback<PopInfo> = (popupInfo: PopInfo) => {
          console.log('pop setPathStack pageTwo' + JSON.stringify(popupInfo.info))
        }
        console.log("=========================================== push  curPathStack.push start")
        curPathStack.push(new NavPathInfo('navPathPageOne', 'setPathStack pageOne', popCallbackOne, false), new NavPathInfo('navPathPageTwo', 'setPathStack pageTwo', popCallbackTwo, true));
        console.log("=========================================== push  curPathStack.push end")
        this.stack.setPathStack(curPathStack, true);
        console.log("=========================================== this.stack.setPathStack end")
      })
        .id('pushId')

    }
    .width('100%')
    .height('100%')
    .title('MainPage')
    .navDestination(this.MyPageMap)
  }
}

@Component
struct NavPathPageOne {
  private stack: NavPathStack | undefined = undefined;
  build() {
    NavDestination() {
    }
    .width('100%').height('100%')
    .title('navPathPageOne')
  }
}

@Component
struct NavPathPageTwo {
  @Consume('mainPathStack') pathStack: NavPathStack;
  build() {
    NavDestination() {
      Button('getStack').onClick((e: ClickEvent) => {
        let allStacks = this.pathStack!.getPathStack();
        console.log('all stack is: ', allStacks?.length)
        AppStorage.setOrCreate<int>('stackLen', allStacks?.length as int)
        console.log('all stack[0] navDestinationId is', allStacks[1]?.navDestinationId)
        AppStorage.setOrCreate<number>('navDestinationId1', Number(allStacks[1]?.navDestinationId))
      })
        .id('getId')
    }
    .width('100%').height('100%')
    .title('navPathPageTwo')
  }
}