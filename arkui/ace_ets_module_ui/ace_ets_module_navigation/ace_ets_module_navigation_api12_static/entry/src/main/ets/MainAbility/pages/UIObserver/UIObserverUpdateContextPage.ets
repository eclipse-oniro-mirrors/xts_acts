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

AppStorage.setOrCreate<int>('UIObserverUpdateContextPage_callBackFuncOnCount', 0)
AppStorage.setOrCreate<int>('UIObserverUpdateContextPage_callBackFuncOnCount_2', 0)

@Component
struct PageOne {
  build() {
    NavDestination() {
      Text('pageOne')
    }.title('pageOne')
  }
}

function callBackFunc(info: uiObserver.NavDestinationInfo) {
  console.info(`testTag navDestinationUpdate : ${JSON.stringify(info)}`)
  let count: int = AppStorage.get<int>('UIObserverUpdateContextPage_callBackFuncOnCount') ?? 0;
  count = count + 1;
  AppStorage.setOrCreate<int>('UIObserverUpdateContextPage_callBackFuncOnCount', count)
}

@Entry
@Component
struct UIObserverUpdateContextPage {
  private stack: NavPathStack = new NavPathStack();

  @Builder
  PageBuilder(name: string) {
    PageOne()
  }

  aboutToAppear() {
    this.getUIContext().getUIObserver().onNavDestinationUpdate( { navigationId: 'testId' }, callBackFunc);
  }

  build() {
    Column() {
      Navigation(this.stack) {
        Button('push').onClick((e: ClickEvent) => {
          this.stack.pushPath(new NavPathInfo('pageOne',null))
        })
          .id('UIObserverUpdateContext_btn_push')
        Button('off observer').onClick((e: ClickEvent) => {
          let obs = this.getUIContext().getUIObserver();
          obs.offNavDestinationUpdate( { navigationId: 'testId' }, callBackFunc)

          console.info(`get UIObserverUpdateContextPage_callBackFuncOnCount is: ${AppStorage.get<int>('UIObserverUpdateContextPage_callBackFuncOnCount')}`)
          console.info(`get UIObserverUpdateContextPage_callBackFuncOnCount_2 is: ${AppStorage.get<int>('UIObserverUpdateContextPage_callBackFuncOnCount_2')}`)
          AppStorage.setOrCreate<int>('UIObserverUpdateContextPage_callBackFuncOnCount_2', AppStorage.get<int>('UIObserverUpdateContextPage_callBackFuncOnCount') ?? 0)
          console.info(`set UIObserverUpdateContextPage_callBackFuncOnCount_2 is: ${AppStorage.get<int>('UIObserverUpdateContextPage_callBackFuncOnCount')}`)
        })
          .id('UIObserverUpdateContext_btn_off')
      }
      .id('testId')
      .title('Navigation')
      .navDestination(this.PageBuilder)
      .mode(NavigationMode.Stack)
    }
    .width('100%')
    .height('100%')
  }
}