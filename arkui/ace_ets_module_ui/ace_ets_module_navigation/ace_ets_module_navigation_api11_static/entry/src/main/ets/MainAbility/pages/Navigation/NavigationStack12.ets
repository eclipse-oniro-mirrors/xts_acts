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
struct NavigationStack12 {
  private arr: number[] = new Array<number>(1, 2,3)
  @Provide pageInfos: NavPathStack = new NavPathStack()
  @State bool: boolean = false
  @State text: string = 'start'
  @State flagBlur: string = 'BlurStart'
  @State flagFocus: string = 'FocusStart'
  build() {
    Column(){
      Navigation(this.pageInfos) {
        Column() {
          List({space:12}){
            ForEach(this.arr, (item: number) => {
              ListItem() {
                Column(){
                  Text("NavRouter" + item).key(`NavigationStack12ListItemText${item}`)
                    .width('100%')
                    .height(60)
                    .backgroundColor('#FFFFFF')
                    .borderRadius(24)
                    .fontSize(16)
                    .fontWeight(1000)
                    .textAlign(TextAlign.Center)
                  NavDestination() {
                    Text(`${this.text+item}`).key('NavigationStack12TextCont')
                    Button('button').key('NavigationStack12ButtonContent')
                      .onClick((e: ClickEvent) => {
                        this.text = 'clicked'
                      })
                  }.key('NavigationStack12NavDestination')
                  .onBlur(()=>{
                    this.flagBlur = 'BlurDone'
                  })
                  .onFocus(()=>{
                    this.flagFocus = 'FocusDone'
                  })
                  .backgroundColor(Color.Orange)
                  .title("NavDestinationTitle"+ item)
                }
              }.key(`NavigationStack12ListItem${item}`)
            },(item: number) => String(item))
          }
          .width('100%')
          .margin({top:12} as Margin)
        }
      }
      .height('60%')
      .title('NavIndex')
      .titleMode(NavigationTitleMode.Mini)
      .mode(NavigationMode.Auto)
      .hideNavBar(this.bool)
      .navBarWidth(260)
      .minContentWidth(300)
      .navBarWidthRange([200,400])
      .border({width: 1})
      .height('70%')
      .width('100%')
      .backgroundColor(Color.Pink)
      Text(this.flagBlur).key('NavigationStack12Blur').fontWeight(700)
      Text(this.flagFocus).key('NavigationStack12Focus').fontWeight(700)
      Button('YCDHL')
        .key('NavigationStack12True')
        .onClick((e: ClickEvent) => {
          this.bool = true
        })
      Button('CZ').key('NavigationStack12CZ')
        .onClick((e: ClickEvent) => {
          this.bool = false
          this.text = 'start'
          this.flagBlur = 'BlurStart'
          this.flagFocus = 'FocusStart'
          this.pageInfos.clear()
        })
      Button('clear').key('NavigationStack12clear')
        .onClick((e: ClickEvent) => {
          this.pageInfos.clear()
        })
    }
    .border({width:1})
    .height('100%')
    .width(300)
  }
}