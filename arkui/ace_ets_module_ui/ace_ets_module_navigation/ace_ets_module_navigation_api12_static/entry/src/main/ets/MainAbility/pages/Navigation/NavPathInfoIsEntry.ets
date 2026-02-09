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
  Entry,Component,$r,Scroll,Builder,List,ListItem,Resource,HorizontalAlign,ToolbarItemStatus,AnimateParam,Search,TextAlign,Axis,NavBarPosition,FlexAlign,NavPathInfo,NavDestinationContext,
  NavigationTitleMode,Image,NavigationMode,Column,Navigation,ButtonType,NavDestination,Stack,ColumnOptions,TextInput,SearchController,NavigationOperation,PanGesture,
  Position,EffectType,Text,Color,Flex,FlexDirection,ItemAlign,Row,Button,ClickEvent,NavDestinationMode,Dimension,TextOverflow,GestureEvent,PopInfo,
  FontWeight,Axis,Margin,Swiper,ForEach,PickerTextStyle, CalendarAlign, Visibility,NavigationCommonTitle,NavDestinationCommonTitle,Alignment,BarStyle,LaunchMode
,NavPathStack} from '@ohos.arkui.component';
import {
  State,
  Link,
  PropRef,Provide
} from '@ohos.arkui.stateManagement';
import { AppStorage } from '@ohos.arkui.stateManagement';
interface Res {
  res: string
}
@Entry
@Component
struct NavPathInfoIsEntry {
  @State message:string = 'hello'
  @State pageInfos: NavPathStack = new NavPathStack();

  @Builder
  pageOneTmp() {
    NavDestination() {
      Column({ space: 10 } as ColumnOptions) {
        Button('pop')
          .onClick((e: ClickEvent) => {
            this.pageInfos.pop({res:'success'} as Res)
          })
          .id('NavPathInfoIsEntry_btn2')
      }
    }.title('pageOne')
  }

  @Builder
  PageMap(name: string) {
    if (name === 'pageOne') {
      this.pageOneTmp()
    }
  }

  build() {
    Column({ space: 5 } as ColumnOptions) {
      Navigation(this.pageInfos) {
        Column({ space: 10 } as ColumnOptions) {
          Text(this.message).id('NavPathInfoIsEntry_text1')

          Button('pushPath pageOne')
            .onClick((e: ClickEvent) => {
              this.pageInfos.pushDestination(new NavPathInfo('pageOne',"mes",  (popInfo: PopInfo) => {
                this.message = 'isEntry is: ' + JSON.stringify(popInfo.info.isEntry);
              }, true))
            })
            .id('NavPathInfoIsEntry_btn1')
        }
      }
      .title('Navigation')
      .mode(NavigationMode.Stack)
      .navDestination(this.PageMap)
    }
  }
}