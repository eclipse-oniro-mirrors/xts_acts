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
import { BusinessError } from '@ohos.base';
@Entry
@Component
struct Navigation_L0_21_2 {
  @Provide pageInfos: NavPathStack = new NavPathStack();
  @State text1:string = ''

  @Builder PageMap(name:string){
    if (name === 'pageTwo'){
      Navigation_L0_21_2_pageTwo()
    }
  }

  build() {
    Navigation(this.pageInfos) {
      Button('pushDestinationByName pageTwo').onClick((event: ClickEvent) => {

        this.pageInfos.pushDestination(new NavPathInfo('pageTwo','aaaa')).catch((error: Error): void=>{
          console.error(`[pushDestinationByName]failed, error code = ${error.code}, error.message = ${error.message}.`);
          this.text1 = '' + error.code
        }).then(()=>{
          console.error('[pushDestinationByName]success.');
        });
      }).id('Navigation_L0_21_2_btn1')

      Text(this.text1).id('Navigation_L0_21_2_text1')
    }
    .height('100%')
    .width('100%')
    .title('navigation')
    .mode(NavigationMode.Split)
  }
}


@Component
struct Navigation_L0_21_2_pageTwo{
  build() {
    Column(){

    }
  }
}
