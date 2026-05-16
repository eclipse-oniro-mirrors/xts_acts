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
struct NavigationModel06 {
  private arr: number[] = new Array<number>(1,2,3,4,5,6,7,8,9)
  @State text: string = 'start'
  @State minWidthBar: [string|Resource|number, string|Resource|number]|undefined = [200,300] as [string|Resource|number, string|Resource|number]
  @State currentIndex: number = 0
  @State strText: string = 'doing'
  build() {
    Column(){
      Navigation({}) {
        Column() {
          List({space:12}){
            ForEach(this.arr, (item: number) => {
              ListItem() {
                Column(){
                  Text("NavRouter" + item)
                    .width('100%')
                    .height(60)
                    .backgroundColor('#FFFFFF')
                    .borderRadius(24)
                    .fontSize(16)
                    .fontWeight(1000)
                    .textAlign(TextAlign.Center)
                  NavDestination()
                    .backgroundColor(Color.Orange)
                    .title("NavDestinationTitle"+ item)
                }
              }
            },(item: number) => String(item))
          }
          .width('80%')
          .margin({top:12} as Margin)
        }
      }
      .mode(NavigationMode.Auto)
      .navBarWidthRange(this.minWidthBar)
      .width(300)
      .height('60%')
      .minContentWidth(200)
      .border({width: 1})
      .backgroundColor(Color.Pink)
      .onNavigationModeChange((): void => {
        this.currentIndex ++
        this.strText =  'doing' + `${ this.currentIndex }`
      })
      Text(this.strText).fontWeight(700).fontSize(22).key('NavigationModel06Txt')
      Button('切换双栏').key('NavigationModel06But')
        .onClick((e: ClickEvent) => {
          this.minWidthBar = [50,300] as [string|Resource|number, string|Resource|number]
        })
    }
    .border({width:1})
    .height('100%')
    .width('100%')
  }
}