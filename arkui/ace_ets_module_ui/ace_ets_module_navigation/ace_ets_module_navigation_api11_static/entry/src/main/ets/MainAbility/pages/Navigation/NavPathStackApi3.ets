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
struct Navigation_NavPathStackTest3 {
  @Provide pageInfos: NavPathStack = new NavPathStack()

  @Builder pageOneTmp() {
    NavDestination() {
      Column({space:10} as ColumnOptions) {
        Text('pageOne3').id('NavPathStackApi3_text_pageOne')

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

        Button('pushDestinationByName', { stateEffect: true, type: ButtonType.Capsule })
          .width('80%')
          .height(40)
          .onClick((e: ClickEvent) => {
            this.pageInfos.pushDestinationByName('pageOne', {}, (popInfo: PopInfo): void=>{
              console.log('[pushDestinationByName]last page is: ' + popInfo.info.name + ', result: ' + JSON.stringify(popInfo.result));
            }).catch((error: Error): void =>{
              console.error(`[pushDestinationByName]failed, error code = ${error.code}, error.message = ${error.message}.`);
            }).then(()=>{
              console.error('[pushDestinationByName]success.');
            });
          })
          .id('NavPathStackApi3_pushDestinationByName')

      }
    }.title('NavIndex').navDestination(this.PageMap)
  }
}
