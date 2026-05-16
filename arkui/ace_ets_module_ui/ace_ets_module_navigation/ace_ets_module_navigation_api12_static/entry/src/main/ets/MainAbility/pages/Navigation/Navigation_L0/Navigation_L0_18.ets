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
  Entry,Component,$r,Scroll,Builder,List,ListItem,Resource,AnimateParam,Search,TextAlign,Axis,NavBarPosition,FlexAlign,NavPathInfo,
  NavigationTitleMode,Image,NavigationMode,Column,Navigation,ButtonType,NavDestination,Stack,ColumnOptions,TextInput,SearchController,
  Position,EffectType,Text,Color,Flex,FlexDirection,ItemAlign,Row,Button,ClickEvent,NavDestinationMode,Dimension,TextOverflow,
  FontWeight,Axis,Margin,Swiper,ForEach,PickerTextStyle, PopInfo,NavDestinationContext, Visibility,NavigationCommonTitle,NavDestinationCommonTitle,Alignment
,NavPathStack} from '@ohos.arkui.component';
import {
  State,
  Link,
  PropRef,Provide,Consume
} from '@ohos.arkui.stateManagement';
import { AppStorage } from '@ohos.arkui.stateManagement';
@Entry
@Component
struct Navigation_L0_18 {
  @Provide pageInfos: NavPathStack = new NavPathStack();
  @State text1:string = ''

  @Builder PageMap(name:string){
    if (name === 'pageOne'){
      Navigation_L0_18_pageOne({text1:this.text1})
    }
  }

  build() {
    Navigation(this.pageInfos) {
      Button('pushPath pageOne').onClick((event: ClickEvent) => {
        this.pageInfos.pushPath(new NavPathInfo('pageOne',null),true)
      }).id('Navigation_L0_18_btn1')
      Text(this.text1).id('Navigation_L0_18_text1')
    }
    .navDestination(this.PageMap)
    .height('100%')
    .width('100%')
    .title('navigation')
    .mode(NavigationMode.Split)
    .navBarWidth('30%')
  }
}


@Component
struct Navigation_L0_18_pageOne{
  @Consume('pageInfos') pageInfos: NavPathStack;
  @Link text1:string;
  @State navDestinationId:string = '';
  build() {
    NavDestination(){
      Button('pushPath pageOne').onClick((event: ClickEvent) => {

        this.pageInfos.pushPath(new NavPathInfo('pageOne',null),true)
      }).id('Navigation_L0_18_pageOne_btn1')

      Button('removeByNavDestinationId').onClick((event: ClickEvent) => {
        this.text1 = '' + this.pageInfos.removeByNavDestinationId(this.navDestinationId);
      }).id('Navigation_L0_18_pageOne_btn2')

    }.title('pageOne')
    .onReady((context: NavDestinationContext) => {
      this.navDestinationId = context.navDestinationId ?? ''
    })
  }
}

