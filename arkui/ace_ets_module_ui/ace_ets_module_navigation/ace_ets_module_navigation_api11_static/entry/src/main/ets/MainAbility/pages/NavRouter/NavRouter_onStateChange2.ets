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
  NavigationTitleMode,Image,NavigationMode,Column,Navigation,ButtonType,NavDestination,Stack,ColumnOptions,TextInput,Padding,
  Position,EffectType,EffectComponent,Text,Color,Flex,FlexDirection,ItemAlign,Row,Button,ClickEvent,NavDestinationMode,Dimension,
  FontWeight,Axis,Margin,Swiper,ForEach,PickerTextStyle, CalendarAlign, Visibility,NavigationCommonTitle,NavDestinationCommonTitle
,NavPathStack} from '@ohos.arkui.component';
import {
  State,
  Link,
  PropRef,Provide
} from '@ohos.arkui.stateManagement';
import { AppStorage } from '@ohos.arkui.stateManagement';
@Entry
@Component
struct NavRouter_onStateChange2 {
  @State isActiveWLAN: boolean = false
  @State pageInfos: NavPathStack = new NavPathStack()
  build() {
    Column(){
      Text('' + this.isActiveWLAN).key('NavRouter_onStateChange2_text1')
      Navigation(this.pageInfos) {
        Column() {
          Row() {
            Text(`push`)
              .fontSize(22)
              .fontWeight(500)
              .textAlign(TextAlign.Center)
              .id('NavRouter_onStateChange2_btn1')
          }
          .width('90%')
          .height(60)

          NavDestination() {
            Flex({ direction: FlexDirection.Row }) {
              Text('NavDestination').fontSize(30).padding({ left: 15 } as Padding)
            }
          }.title("NavDestination")
        }
        .margin({ top: 10, bottom: 10 } as Margin)
        .borderRadius(20)
      }
      .height('100%')
      .width('100%')
      .title('NavRouter')
      .backgroundColor("#F2F3F5")
      .titleMode(NavigationTitleMode.Free)
      .mode(NavigationMode.Stack)
    }
    .width('100%')
    .height('100%')

  }
}