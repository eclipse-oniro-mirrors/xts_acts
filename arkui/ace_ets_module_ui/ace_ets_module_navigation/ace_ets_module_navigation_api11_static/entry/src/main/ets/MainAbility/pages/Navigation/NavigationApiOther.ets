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
interface Age {
  age: number
}
@Entry
@Component
struct NavigationApiOther {
  @Provide pageInfos: NavPathStack = new NavPathStack()
  @State peo: Age = { age: 18 } as Age

  @Builder
  pageOneTmp() {
    NavDestination() {
      Column() {
        Button('replacePath')
          .width('80%')
          .height(40)
          .onClick((e: ClickEvent) => {
            this.pageInfos.replacePath(new NavPathInfo('pageTwo', this.peo))
          })

        Button('replacePathByName')
          .width('80%')
          .height(40)
          .onClick((e: ClickEvent) => {
            this.pageInfos.replacePathByName('pageTwo', this.peo)
          })

        Button('disableAnimation')
          .width('80%')
          .height(40)
          .onClick((e: ClickEvent) => {
            this.pageInfos.disableAnimation(false)
          })

      }.width('100%').height('100%')
    }.title('pageOne')
    .onBackPressed((): boolean => {
      this.pageInfos.pop()
      return true
    })

    .mode(NavDestinationMode.STANDARD)
  }

  @Builder
  pageTwoTmp() {
    NavDestination() {
      Column({ space: 5 } as ColumnOptions) {
        Button('pushPath', { stateEffect: true, type: ButtonType.Capsule })
          .width('80%')
          .height(40)
          .onClick((e: ClickEvent) => {
            this.pageInfos.pushPath(new NavPathInfo('pageThree',null))
          })
      }.width('100%').height('100%')
    }.title('pageTwo')
    .onBackPressed((): boolean => {
      this.pageInfos.pop()
      return true
    })
  }

  @Builder
  pageThreeTmp() {
    NavDestination() {
      Column({ space: 5 } as ColumnOptions) {
        Text('123')
      }.width('100%').height('100%')
    }.title('pageThree')
    .onBackPressed((): boolean => {
      this.pageInfos.pop()
      return true
    })
  }

  @Builder
  PageMap(name: string) {
    if (name === 'pageOne') {
      this.pageOneTmp()
    } else if (name === 'pageTwo') {
      this.pageTwoTmp()
    }
  }

  build() {
    Navigation(this.pageInfos) {
      Column() {
        Button('pushPath', { stateEffect: true, type: ButtonType.Capsule })
          .width('80%')
          .height(40)
          .onClick((e: ClickEvent) => {
            this.pageInfos.pushPath(new NavPathInfo('pageOne',null))
          })
      }
    }
    .title('NavIndex')
    .navDestination(this.PageMap)
    .id('NavigationApi_Navigation')
  }
}
