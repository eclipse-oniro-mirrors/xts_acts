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
  NavigationTitleMode,Image,NavigationMode,Column,Navigation,ButtonType,NavDestination,Stack,ColumnOptions,NavPathInfo,
  Position,EffectType,EffectComponent,Text,Color,Flex,FlexDirection,ItemAlign,Row,Button,ClickEvent,NavDestinationMode,
  FontWeight,Axis,Margin,Swiper,ForEach,PickerTextStyle, CalendarAlign,NavigationCommonTitle,NavDestinationCommonTitle
,NavPathStack} from '@ohos.arkui.component';
import {
  State,
  Link,
  PropRef,Provide
} from '@ohos.arkui.stateManagement';
import { AppStorage } from '@ohos.arkui.stateManagement';
@Entry
@Component
struct NavigationApi3 {
  @Provide pageInfos: NavPathStack = new NavPathStack()

  @State text1: string = '11'
  @State text2: string = '22'
  @State text3: string = '33'

  @Builder pageOneTmp3() {
    NavDestination() {
      Column({space:10} as ColumnOptions) {
        Text('pageOne')

        Button('Next')
          .width('80%')
          .height(40)
          .onClick((e: ClickEvent) => {
            this.pageInfos.pushPath(new NavPathInfo('pageTwo',null))
          })
          .id('NavigationApi3_pushPathPageTwo')


      }.width('100%').height('100%')
    }.title('pageOne')
    .mode(NavDestinationMode.STANDARD)
    .onShown((): void=>{
      console.log('pageOnw onShown','pageOnw onShown')
      this.text1 = 'pageOnw onShown'
    })
    .onHidden((): void=>{
      console.log('pageOnw onHidden','pageOnw onHidden')
      this.text1 = 'pageOne onHidden'
    })
    .onBackPressed((): boolean => {
      this.pageInfos.pop()
      return true
    })
  }

  @Builder pageTwoTmp3() {
  NavDestination() {
    Column({space:5} as ColumnOptions) {

      Text('pageTwo')

      Button('Next')
        .width('80%')
        .height(40)
        .onClick((e: ClickEvent) => {
          this.pageInfos.pushPath(new NavPathInfo('pageThree', null))
        })
        .id('NavigationApi3_pushPathPageThree')


    }.width('100%').height('100%')
  }.title('pageTwo')
  .mode(NavDestinationMode.STANDARD)
  .onShown((): void=>{
    console.info("[NavigationApi3_static_001] onShown before: " + 111111);
    this.text2 = 'pageTwo onShown'
    console.info("[NavigationApi3_static_001] onShown after: " + 111111);
  })
  .onHidden((): void=>{
    console.info("[NavigationApi3_static_001] onHidden before: " + 111111);
    this.text2 = 'pageTwo onHidden'
    console.info("[NavigationApi3_static_001] onHidden after: " + 111111);
  })
  .onBackPressed((): boolean => {
    this.pageInfos.pop()
    return true
  })
}

  @Builder pageThreeTmp3() {
    NavDestination() {
      Column({space:5} as ColumnOptions) {

        Text('pageThree')

      }.width('100%').height('100%')
    }.title('pageThree')
    .mode(NavDestinationMode.DIALOG)
    .onShown((): void=>{
      this.text3 = 'pageThree onShown'
    })
    .onHidden((): void=>{
      this.text3 = 'pageThree onHidden'
    })
    .onBackPressed((): boolean => {
      this.pageInfos.pop()
      return true
    })
  }


  @Builder
  PageMap(name: string) {
    if (name === 'pageOne') {
      this.pageOneTmp3()
    } else if (name === 'pageTwo') {
      this.pageTwoTmp3()
    } else if (name === 'pageThree') {
      this.pageThreeTmp3()
    }
  }

  build() {
    Column({space:20} as ColumnOptions){
      Column({space:10} as ColumnOptions){
        Text(this.text1).id('NavigationApi3_text1')
        Text(this.text2).id('NavigationApi3_text2')
        Text(this.text3).id('NavigationApi3_text3')
      }.width('80%').borderWidth(1).margin({top:20} as Margin)

      Navigation(this.pageInfos) {
        Column() {
          Button('pushPath', { stateEffect: true, type: ButtonType.Capsule })
            .width('80%')
            .height(40)
            .onClick((e: ClickEvent) => {
              this.pageInfos.pushPath(new NavPathInfo('pageOne',null))
            })
            .id('NavigationApi3_pushPathPageOne')
        }
      }.title('NavIndex').navDestination(this.PageMap)
    }.width('100%')

  }
}
