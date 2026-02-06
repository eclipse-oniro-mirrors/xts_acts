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
  Entry,Component,$r,Scroll,Builder,List,ListItem,Resource,AnimateParam,Search,TextAlign,Axis,NavBarPosition,FlexAlign,
  NavigationTitleMode,Image,NavigationMode,Column,Navigation,ButtonType,NavDestination,Stack,ColumnOptions,TextInput,SearchController,NavPathInfo,
  Position,EffectType,Text,Color,Flex,FlexDirection,ItemAlign,Row,Button,ClickEvent,NavDestinationMode,Dimension,TextOverflow,
  FontWeight,Axis,Margin,Swiper,ForEach,PickerTextStyle, CalendarAlign, Visibility,NavigationCommonTitle,NavDestinationCommonTitle,Alignment
,NavPathStack} from '@ohos.arkui.component';
import {
  State,
  Link,
  PropRef,Provide
} from '@ohos.arkui.stateManagement';
import { AppStorage } from '@ohos.arkui.stateManagement';
@Entry
@Component
struct NavDestinationEvents {
  @State str1:string = ''
  @State str2:string = ''
  @State pageInfos: NavPathStack = new NavPathStack();

  @Builder
  pageOneTmp() {
    NavDestination() {
      Column({ space: 10 } as ColumnOptions) {
        Button('pop')
          .onClick((e: ClickEvent) => {
            this.pageInfos.pop()
          })
          .id('NavDestinationEvents_pop')
      }
    }.title('pageOne')
    .onWillAppear((): void =>{
      this.str1 = 'onWillAppear'
    })
    .onWillDisappear((): void=>{
      this.str2 = 'onWillDisappear'
    })
  }


  @Builder
  PageMap(name: string, param:Object|null|undefined) {
    if (name === 'pageOne') {
      this.pageOneTmp()
    }
  }

  build() {
    Column({space:5} as ColumnOptions){
      Text(this.str1).id('NavDestinationEvents_text1')
      Text(this.str2).id('NavDestinationEvents_text2')


      Navigation(this.pageInfos) {
        Column({space:10} as ColumnOptions) {
          Button('pushPath pageOne' ,)
            .onClick((e: ClickEvent) => {
              this.pageInfos.pushPath(new NavPathInfo('pageOne',undefined))
            })
            .id('NavDestinationEvents_pageOne')
        }
      }
      .title('NavIndex')
      .navDestination(this.PageMap)
    }

  }
}
