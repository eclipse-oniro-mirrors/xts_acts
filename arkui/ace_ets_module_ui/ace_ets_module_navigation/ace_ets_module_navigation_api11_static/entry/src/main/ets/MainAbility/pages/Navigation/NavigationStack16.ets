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
struct NavigationStack16 {
  private arr: number[] = new Array<number>(1, 2,3)
  @Provide pageInfos: NavPathStack = new NavPathStack()
  @State bool: boolean = false
  @State text: string = 'start'
  @State flagBlur: string = 'BlurStart'
  @State flagFocus: string = 'FocusStart'
  @State mode: NavigationMode = NavigationMode.Stack
  build() {
    Scroll() {
      Column(){
        Navigation(this.pageInfos) {
          Column() {
            List({space:12}){
              ForEach(this.arr, (item: number) => {
                ListItem() {
                  Column(){
                    Text("NavRouter" + item).key(`NavigationStack16ListItemText${item}`)
                      .width('100%')
                      .height(60)
                      .backgroundColor('#FFFFFF')
                      .borderRadius(24)
                      .fontSize(16)
                      .fontWeight(1000)
                      .textAlign(TextAlign.Center)
                    NavDestination() {
                      Text(`${this.text+item}`).key('NavigationStack16TextCont')
                      Button('button').key('NavigationStack16ButtonContent')
                        .onClick((e: ClickEvent) => {
                          this.text = 'clicked'
                        })
                    }.key('NavigationStack16NavDestination')
                    .onBlur(()=>{
                      this.flagBlur = 'BlurDone'
                    })
                    .onFocus(()=>{
                      this.flagFocus = 'FocusDone'
                    })
                    .backgroundColor(Color.Orange)
                    .title("NavDestinationTitle"+ item)
                  }
                }.key(`NavigationStack16ListItem${item}`)
              },(item: number) => String(item))
            }
            .width('100%')
            .margin({top:12} as Margin)
          }
        }
        .height('60%')
        .title('NavIndex')
        .titleMode(NavigationTitleMode.Mini)
        .mode(this.mode)
        .hideNavBar(this.bool)
        .navBarWidth(260)
        .minContentWidth(300)
        .navBarWidthRange([200,400])
        .border({width: 1})
        .height('70%')
        .width('100%')
        .backgroundColor(Color.Pink)
        Text(this.flagBlur).key('NavigationStack16Blur').fontWeight(700)
        Text(this.flagFocus).key('NavigationStack16Focus').fontWeight(700)
        Button('YCDHL')
          .key('NavigationStack16True')
          .onClick((e: ClickEvent) => {
            this.bool = true
          })
        Button('CZ').key('NavigationStack16CZ')
          .onClick((e: ClickEvent) => {
            this.bool = false
            this.text = 'start'
            this.flagBlur = 'BlurStart'
            this.flagFocus = 'FocusStart'
            this.pageInfos.clear()
          })
        Button('changeModel').key('NavigationStack16clear')
          .onClick((e: ClickEvent) => {
            this.mode = NavigationMode.Auto
          })
      }
      .border({width:1})
      .width('100%')
    }
  }
}