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
  FontWeight,Axis,Margin,Swiper,ForEach,PickerTextStyle,CalendarAlign,ToolbarItemStatus,NavigationMenuItem,SymbolRenderingStrategy,ToolbarItem, SafeAreaType,SafeAreaEdge,Visibility,NavigationCommonTitle,NavDestinationCommonTitle,Alignment,BarStyle,LaunchMode
  ,NavPathStack} from '@ohos.arkui.component';
import {
  State,
  Link,
  PropRef,Provide,Consume
} from '@ohos.arkui.stateManagement';
import { AppStorage } from '@ohos.arkui.stateManagement';
import hilog from '@ohos.hilog';
import router from '@ohos.router';
import { Router, UIContext } from '@ohos.arkui.UIContext';
import {RouterParams} from './RouterPushOne'

@Entry
@Component
struct RouterPushTwo {
  aboutToAppear() {
    hilog.info(0x0000, 'testTag', '%{public}s', 'TestAbility index aboutToAppear');
  }

  @State params: string = ''

  onPageShow() {
    try{
      let routerParamOptions = this.getUIContext().getRouter().getParams() as RouterParams
      this.params = routerParamOptions ? routerParamOptions.view : ''
    }catch(e){}
  }


  build() {
    Scroll() {
      Column() {
        Text("RouterPushTwo " + this.params)
          .fontSize(50)
          .fontWeight(FontWeight.Bold)
          .id("Text_RouterPushTwo")

        Button("turn_RouterPushUrlOne_RouterMode_Standard")
          .type(ButtonType.Capsule)
          .margin({
            top: 20
          } as Margin)
          .id("turn_RouterPushUrlOne_RouterMode_Standard")
          .onClick((e: ClickEvent) => {
            AppStorage.get<Router>("router")!.pushUrl({
              url: 'MainAbility/pages/State/RouterPushOne',
            }, router.RouterMode.Standard)
          })

        Button("turn_RouterPushUrlOne_RouterMode_Single")
          .type(ButtonType.Capsule)
          .margin({
            top: 20
          } as Margin)
          .id("turn_RouterPushUrlOne_RouterMode_Single")
          .onClick((e: ClickEvent) => {
            AppStorage.get<Router>("router")!.pushUrl({
              url: 'MainAbility/pages/State/RouterPushOne',
            }, router.RouterMode.Single)
          })

        Text("UIRouterPushTwo " + this.params)
          .fontSize(50)
          .fontWeight(FontWeight.Bold)
          .id("Text_UIRouterPushTwo")

        Button("turn_UIRouterPushUrlOne_RouterMode_Standard")
          .type(ButtonType.Capsule)
          .margin({
            top: 20
          } as Margin)
          .id("turn_UIRouterPushUrlOne_RouterMode_Standard")
          .onClick((e: ClickEvent) => {
            AppStorage.get<Router>("router")!.pushUrl({
              url: 'MainAbility/pages/State/RouterPushOne',
            }, router.RouterMode.Standard)
          })

        Button("turn_UIRouterPushUrlOne_RouterMode_Single")
          .type(ButtonType.Capsule)
          .margin({
            top: 20
          } as Margin)
          .id("turn_UIRouterPushUrlOne_RouterMode_Single")
          .onClick((e: ClickEvent) => {
            AppStorage.get<Router>("router")!.pushUrl({
              url: 'MainAbility/pages/State/RouterPushOne',
            }, router.RouterMode.Single)
          })
      }
    }
  }
}
