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
  Entry,Component,$r,Scroll,Builder,List,ListItem,Resource,AnimateParam,Search,TextAlign,Axis,NavBarPosition,
  NavigationTitleMode,Image,NavigationMode,Column,Navigation,ButtonType,NavDestination,Stack,ColumnOptions,TextInput,PopInfo,
  Position,EffectType,EffectComponent,Text,Color,Flex,FlexDirection,ItemAlign,Row,Button,ClickEvent,NavDestinationMode,Dimension,
  FontWeight,Axis,Margin,Swiper,ForEach,PickerTextStyle, CalendarAlign, Visibility,NavigationCommonTitle,NavDestinationCommonTitle
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
struct navigation_pushDestinationByName6 {
  @Provide pageInfos: NavPathStack = new NavPathStack()
  @State str:string = '1'
  @State code:string = '2'

  @Builder pageOneTmp() {
    NavDestination() {
      Column({space:5} as ColumnOptions) {
        Text(this.str).id('navigation_pushDestinationByName6_text_str')
        Text(this.code).id('navigation_pushDestinationByName6_text_code')
      }.width('100%').height('100%')
    }.title('pageOne')
  }

  @Builder
  PageMap(name: string) {
    if (name === 'pageOne') {
      this.pageOneTmp()
    }
  }

  build() {
    Navigation(this.pageInfos) {
      Column({space:5} as ColumnOptions) {

        Button('pushDestinationByName')
          .fontSize(14)
          .onClick((e: ClickEvent) => {
            this.pageInfos.pushDestinationByName('pageOne',{},(popInfo: PopInfo)=>{})
              .then(()=>{
                this.str = 'success'
              })
              .catch((error: Error): void =>{
                console.log('Test:'+JSON.stringify(error))
                this.code = (error.code).toString() + error.message
              })
          })
          .id('navigation_pushDestinationByName6_pushDestination')

      }
    }.title('Navigation').navDestination(this.PageMap)
  }
}
