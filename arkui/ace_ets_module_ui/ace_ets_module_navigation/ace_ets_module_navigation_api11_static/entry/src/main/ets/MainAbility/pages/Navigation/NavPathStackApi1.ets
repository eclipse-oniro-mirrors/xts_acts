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
  Entry,Component,$r,Scroll,Builder,List,ListItem,Resource,AnimateParam,Search,TextAlign,Axis,NavBarPosition,NavPathInfo,
  NavigationTitleMode,Image,NavigationMode,Column,Navigation,ButtonType,NavDestination,Stack,ColumnOptions,TextInput,
  Position,EffectType,EffectComponent,Text,Color,Flex,FlexDirection,ItemAlign,Row,Button,ClickEvent,NavDestinationMode,Dimension,
  FontWeight,Axis,Margin,Swiper,ForEach,PickerTextStyle, CalendarAlign,NavigationCommonTitle,NavDestinationCommonTitle
,NavPathStack} from '@ohos.arkui.component';
import {
  State,
  Link,
  PropRef,Provide
} from '@ohos.arkui.stateManagement';
import { AppStorage } from '@ohos.arkui.stateManagement';
import { BusinessError } from '@ohos.base';


@Entry
@Component
struct Navigation_NavPathStackTest1 {
  @Provide pageInfos: NavPathStack = new NavPathStack()

  @Builder pageOneTmp() {
    NavDestination() {
      Column({space:10} as ColumnOptions) {
        Text('pageOne').id('NavPathStackApi1_text_pageOne')

      }.width('100%').height('100%')
    }.title('pageOne')
    .onBackPressed((): boolean => {
      this.pageInfos.pop()
      return true
    })
  }



  @Builder
  PageMap(name: string) {
    if (name === 'pageOne') {
      this.pageOneTmp()
    }
  }

  build() {
    Navigation(this.pageInfos) {
      Column() {

        Text('Navigation')

        Button('pushDestination', { stateEffect: true, type: ButtonType.Capsule })
          .width('80%')
          .height(40)
          .onClick((e: ClickEvent) => {
            console.info("[NavPathStackApi1_static_001] before onClick")
            this.pageInfos.pushDestination(new NavPathInfo('pageOne',null), true)
            console.info("[NavPathStackApi1_static_001] after onClick")
          })
          .id('NavPathStackApi1_pushDestination')

      }
    }.title('NavIndex').navDestination(this.PageMap)
  }
}
