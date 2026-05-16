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



export function callBackFunc(info: uiObserver.RouterPageInfo) {
  console.info('RouterPage state updated, called by ' + `${info.name}`);
  if (info.name == 'MainAbility/pages/UIObserver/RouterPageUpdatePage'){
    let count: int = AppStorage.get<int>('RouterPageUpdatePage_callBackFuncOnCount')!;
    count = count+ 1;
    AppStorage.setOrCreate<int>('RouterPageUpdatePage_callBackFuncOnCount', count)
  }
}

@Entry
@Component
struct RouterPageUpdatePage {
static{AppStorage.setOrCreate<int>('RouterPageUpdatePage_callBackFuncOnCount', 0)}
  aboutToAppear(): void {
    let observer:UIObserver = this.getUIContext().getUIObserver();
    observer.onRouterPageUpdate(callBackFunc);
  }

  build() {
    Column(){
      Row(){
        Button('Push').onClick((e: ClickEvent)=>{
          this.getUIContext().getRouter().pushUrl({
            url:'pages/index/index'
          })
        }).id('RouterPageUpdate_btn_push')
        Button('off observer').onClick((e: ClickEvent) => {
          let observer:UIObserver = this.getUIContext().getUIObserver();
          observer.offRouterPageUpdate(callBackFunc);
        }).id('RouterPageUpdate_btn_off')
      }.height(44).width('100%').margin({bottom:20} as Margin)
    }.alignItems(HorizontalAlign.Center).width('100%')
  }
}