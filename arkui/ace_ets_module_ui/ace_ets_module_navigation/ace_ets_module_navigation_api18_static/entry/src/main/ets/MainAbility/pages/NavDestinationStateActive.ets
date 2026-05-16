'use static';
/*
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
  FontWeight,Axis,Margin,Swiper,ForEach,PickerTextStyle,SheetMode,NavDestinationActiveReason, CalendarAlign, Visibility,NavigationCommonTitle,NavDestinationCommonTitle,Alignment,BarStyle,LaunchMode
,NavPathStack} from '@ohos.arkui.component';
import uiObserver from '@ohos.arkui.observer'
import {
  State,
  Link,
  PropRef,Provide,Consume,StorageLink
} from '@ohos.arkui.stateManagement';
import { AppStorage } from '@ohos.arkui.stateManagement';
import { BusinessError } from '@ohos.base';
import { CommonNavigation } from './CommonNavigation';

@Component
struct PageOne {
  @Consume('stack') stack:NavPathStack = new NavPathStack();
  build() {
    NavDestination() {
      Text('pageOne')
      Button('back').onClick((e:ClickEvent) => {
        this.stack.pop();
      })
      .height('5%')
      .id('backId')
    }.title('pageOne')
  }
}

@Entry
@Component
struct NavDestinationStateActive {
  @Provide stack: NavPathStack = new NavPathStack();
  @Builder
  PageBuilder(name: string) {
    PageOne()
  }

  aboutToAppear() {
    try{
      uiObserver.onNavDestinationUpdate((info:uiObserver.NavDestinationInfo) => {
        console.info('NavDestination state update', info.state);
        if (info.state == uiObserver.NavDestinationState.ON_ACTIVE) {
          AppStorage.setOrCreate<int>('ON_ACTIVE', info.state);
        }
        if (info.state == uiObserver.NavDestinationState.ON_INACTIVE) {
          AppStorage.setOrCreate<int>('ON_INACTIVE', info.state);
        }
      });
    }catch(error){
      console.log("===============================erro " + error );
    }

  }

  aboutToDisappear() {
    uiObserver.offNavDestinationUpdate();
  }

  build() {
    Column() {
      Navigation(this.stack) {
        Button('push').onClick((e:ClickEvent) => {
          console.log("======================================Button('push').onClick start");
          this.stack.pushPath(new NavPathInfo('pageOne',null));
          console.log("======================================Button('push').onClick end");
        })
        .height('5%')
        .id('pushId')
      }
      .title('Navigation')
      .navDestination(this.PageBuilder)
      .mode(NavigationMode.Stack)
    }
    .width('100%')
    .height('100%')
  }
}