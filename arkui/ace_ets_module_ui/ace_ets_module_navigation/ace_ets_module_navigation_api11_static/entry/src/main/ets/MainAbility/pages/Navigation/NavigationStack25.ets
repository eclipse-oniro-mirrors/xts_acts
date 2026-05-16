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
  NavigationTitleMode,Image,NavigationMode,Column,Navigation,ButtonType,NavDestination,Stack,ColumnOptions,
  Position,EffectType,EffectComponent,Text,Color,Flex,FlexDirection,ItemAlign,Row,Button,ClickEvent,NavDestinationMode,Dimension,
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
struct NavigationStack25 {
  private arr: number[] = new Array<number>(1, 2,3)
  @Provide pageInfos: NavPathStack = new NavPathStack()
  @State bool: boolean = false
  @State text: string = 'start'
  @State stateChange: boolean = false
  @State flagFocus: string = 'FocusStart'
  build() {
    Column(){
      Navigation(this.pageInfos) {
        Column() {
          List({space:12}){
            ForEach(this.arr, (item: number) => {
              ListItem() {
                Column(){
                  Text("NavRouter" + item).key(`NavigationStack25ListItemText${item}`)
                    .width('100%')
                    .height(60)
                    .backgroundColor('#FFFFFF')
                    .borderRadius(24)
                    .fontSize(16)
                    .fontWeight(1000)
                    .textAlign(TextAlign.Center)
                  NavDestination() {
                    Text(`${this.text+item}`).key('NavigationStack25TextCont')
                    Button('button').key('NavigationStack25ButtonContent')
                      .onClick((e: ClickEvent) => {
                        this.text = 'clicked'
                      })
                  }.key('NavigationStack25NavDestination')
                  .backgroundColor(Color.Orange)
                  .title("NavDestinationTitle"+ item)
                }
              }.key(`NavigationStack25ListItem${item}`)
            },(item: number) => String(item))
          }
          .width('100%')
          .margin({top:12} as Margin)
        }
      }
      .onNavBarStateChange((isVisible: boolean) => {
        this.stateChange = isVisible
      })
      .key('NavigationStack25Navigation')
      .height('60%')
      .title('NavIndex')
      .titleMode(NavigationTitleMode.Mini)
      .mode(NavigationMode.Split)
      .hideNavBar(this.bool)
      .navBarWidth(260)
      .minContentWidth(300)
      .navBarWidthRange([200,400])
      .border({width: 1})
      .height('70%')
      .width('100%')
      .backgroundColor(Color.Pink)
      Text(`${this.stateChange}`).key('NavigationStack25Blur').fontWeight(700)
      Button('隐藏导航栏')
        .key('NavigationStack25True')
        .onClick((e: ClickEvent) => {
          this.bool = true
        })
      Button('展开导航栏')
        .key('NavigationStack25False')
        .onClick((e: ClickEvent) => {
          this.bool = false
        })
    }
    .border({width:1})
    .height('100%')
    .width(300)
  }
}