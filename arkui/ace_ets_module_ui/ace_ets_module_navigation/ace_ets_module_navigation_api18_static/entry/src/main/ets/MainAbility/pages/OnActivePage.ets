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
  FontWeight,Axis,Margin,Swiper,ForEach,PickerTextStyle,SheetMode,NavDestinationActiveReason, CalendarAlign, Visibility,NavigationCommonTitle,NavDestinationCommonTitle,Alignment,BarStyle,LaunchMode
,NavPathStack} from '@ohos.arkui.component';
import {
  State,
  Link,
  PropRef,Provide,Consume,StorageLink
} from '@ohos.arkui.stateManagement';
import { AppStorage } from '@ohos.arkui.stateManagement';
import { BusinessError } from '@ohos.base';
import { CommonNavigation } from './CommonNavigation';
@Entry
@Component
struct OnActivePage {
  build() {
    Flex({ direction:FlexDirection.Column, alignItems:ItemAlign.Center, justifyContent: FlexAlign.Center }){
       Button('Overlay').onClick((e:ClickEvent) => {
           this.getUIContext().getRouter().pushUrl({url: 'MainAbility/pages/OverlayTest'})
       }).id('overLayBtnId').height('10%')

      Button('基础场景').onClick((e:ClickEvent) => {
        this.getUIContext().getRouter().pushUrl({url: 'MainAbility/pages/Basic'})
      }).id('baseBtnId').height('10%')

      Button('CustomDialog').onClick((e:ClickEvent) => {
        this.getUIContext().getRouter().pushUrl({url: 'MainAbility/pages/CustomDialogTest'})
      }).id('dialogBtnId').height('10%')

      Button('半模态场景').onClick((e:ClickEvent) => {
        this.getUIContext().getRouter().pushUrl({url: 'MainAbility/pages/BasicSheet01'})
      }).id('halfBtnId').height('10%')

      Button('全模态场景').onClick((e:ClickEvent) => {
        this.getUIContext().getRouter().pushUrl({url: 'MainAbility/pages/BasicSheet02'})
      }).id('allBtnId').height('10%')
    }
  }
}