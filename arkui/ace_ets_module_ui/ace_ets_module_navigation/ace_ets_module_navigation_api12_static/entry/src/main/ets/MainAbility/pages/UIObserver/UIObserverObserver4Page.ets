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
  Entry,Component,$r,Scroll,Builder,List,ListItem,Resource,PopInfo,HorizontalAlign,AnimateParam,Search,TextAlign,Axis,NavBarPosition,FlexAlign,NavPathInfo,NavDestinationContext,
  NavigationTitleMode,Image,NavigationMode,Column,Navigation,ButtonType,NavDestination,Stack,ColumnOptions,TextInput,SearchController,NavigationOperation,PanGesture,
  Position,EffectType,Text,Color,Flex,FlexDirection,ItemAlign,Row,Button,ClickEvent,NavDestinationMode,Dimension,TextOverflow,GestureEvent,
  FontWeight,Axis,Margin,Swiper,ForEach,PickerTextStyle, CalendarAlign, Visibility,NavigationCommonTitle,NavDestinationCommonTitle,Alignment,BarStyle,LaunchMode
,NavPathStack} from '@ohos.arkui.component';
import {
  State,
  Link,
  PropRef,Provide
} from '@ohos.arkui.stateManagement';
import { AppStorage } from '@ohos.arkui.stateManagement';
import { Router,UIContext,UIObserver } from '@ohos.arkui.UIContext';
import router from '@ohos.router';
import uiObserver from '@ohos.arkui.observer';

AppStorage.setOrCreate<int>('UIObserverObserver4Page_callBackFuncOnCount', 0)

@Component
struct PageOne {
  build() {
    NavDestination() {
      Text('pageOne')
    }.title('pageOne')
  }
}

export function callBackFuncOn(info: uiObserver.NavDestinationSwitchInfo) {
  console.info(`testTag navDestinationSwitchOn from: ${JSON.stringify(info.from)} to: ${JSON.stringify(info.to)}`)
  let count: int = AppStorage.get<int>('UIObserverObserver4Page_callBackFuncOnCount') ?? 0;
  count = count + 1;
  AppStorage.setOrCreate<int>('UIObserverObserver4Page_callBackFuncOnCount', count)
}

@Entry
@Component
struct UIObserverObserver4Page {
  private stack: NavPathStack = new NavPathStack();
  @State firstTime:boolean = false

  @Builder
  PageBuilder(name: string) {
    PageOne()
  }

  aboutToAppear() {
    if (this.firstTime == false) {
      uiObserver.onNavDestinationSwitch( this.getUIContext(), { navigationId: 'myNavId' }, callBackFuncOn) //页面加载失败 sdk11.5
      this.firstTime = true
    }
  }

  build() {
    Column() {
      Navigation(this.stack) {
        Button('push').onClick((e: ClickEvent) => {
          console.log('+++++++++++++++++++++++push1')
          this.stack.pushPath(new NavPathInfo('pageOne',null))  //跳转pageOne后appDied  SDK11.17
          console.log('+++++++++++++++++++++++push2')
        })
          .id('UIObserverObserver4_btn_push')
        Button('off observer').onClick((e: ClickEvent) => {
          console.log('+++++++++++++++++++++++1')
          uiObserver.offNavDestinationSwitch( this.getUIContext(), { navigationId: 'myNavId' }, callBackFuncOn) //appDied
          console.log('+++++++++++++++++++++++2')
        })
          .id('UIObserverObserver4_btn_off')
      }
      .id('myNavId')
      .title('Navigation')
      .navDestination(this.PageBuilder)
      .mode(NavigationMode.Stack)
    }
    .width('100%')
    .height('100%')
  }
}