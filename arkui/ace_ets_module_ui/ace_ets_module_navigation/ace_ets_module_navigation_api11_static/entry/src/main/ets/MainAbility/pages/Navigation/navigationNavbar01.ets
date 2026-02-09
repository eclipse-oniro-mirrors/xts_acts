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
import {MessageManager,Callback,Message } from '../../common/MessageManager';
@Component
struct PageOne {
  build(){
    NavDestination() {
      Text(`我是NavDestination第1页内容`).width('100%').id('navigationText01')
    }.backgroundColor(Color.Red)
    .title(`NavDestination1`)
  }
}
@Component
struct PageTwo {

  build(){
    NavDestination() {
      Text(`我是NavDestination第2页内容`).width('100%').id('navigationText02')
    }.backgroundColor(Color.Red)
    .title(`NavDestination2`)
  }
}
@Component
struct PageThree {

  build(){
    NavDestination() {
      Text(`我是NavDestination第3页内容`).width('100%').id('navigationText03')
    }.backgroundColor(Color.Red)
    .title(`NavDestination3`)
  }
}
@Component
struct PageFour {

  build(){
    NavDestination() {
      Text(`我是NavDestination第4页内容`).width('100%').id('navigationText04')
    }.backgroundColor(Color.Red)
    .title(`NavDestination4`)
  }
}

@Entry
@Component
struct navigationNavbar01 {
  private arr: number[] = new Array<number>(0, 1, 2, 3)
  @State isActive: boolean = false
  @State navBarWidth: number = 100
  messageManager: MessageManager<number|boolean> = new MessageManager<number|boolean>()
  @State navMode: NavigationMode[] = new Array<NavigationMode>(NavigationMode.Split, NavigationMode.Stack, NavigationMode.Auto)
  @State navModeIndex: number = 0
  @State hideNavBar: boolean = false
  @State minContentWidth: number = 360
  @State navBarPosition: NavBarPosition[] = new Array<NavBarPosition>(NavBarPosition.Start, NavBarPosition.End)
  @State navBarPositionIndex: number = 0
  @State NavigationWidth: number = 250
  pageInfos: NavPathStack = new NavPathStack()
  onPageShow() {
    console.info('navigationNavbar01  onPageShow');
    AppStorage.setOrCreate<MessageManager<number|boolean>>("messageManager",  this.messageManager );
    let callback: Callback<number|boolean> = (message: Message<number|boolean>) => {
      console.error('message = ' + message.name + "--" + message.value);
      if (message.name == 'navBarWidth') {
        this.navBarWidth = (message as Message<number>).value;
      }
      if (message.name == 'navModeIndex') {
        this.navModeIndex = (message as Message<number>).value;
      }
      if (message.name == 'hideNavBar') {
        this.hideNavBar = (message as Message<boolean>).value;
      }
      if (message.name == 'minContentWidth') {
        this.minContentWidth = (message as Message<number>).value;
      }
      if (message.name == 'navBarPositionIndex') {
        this.navBarPositionIndex = (message as Message<number>).value;
      }
      if (message.name == 'NavigationWidth') {
        this.NavigationWidth = (message as Message<number>).value;
      }
    }
    this.messageManager.registerCallback(callback);
  }
  @Builder
  PageBuilder(name: string, param: Object|null|undefined) {
    if (name == "page0") {
      PageOne()

    } else if (name == "page1") {
      PageTwo()
    } else if (name == "page2") {
      PageThree()
    }else if (name == "page3") {
      PageFour()
    }
  }
  build() {
    Column() {
      Navigation(this.pageInfos) {
        List({ space: 12, initialIndex: 0 }) {
          ForEach(this.arr, (item: number) => {
            ListItem() {
              Column(){
                Row() {
                  Image($r('app.media.icon')).width(30).height(30).borderRadius(30).margin({ left: 3, right: 10 } as Margin)
                  Text(`NavRouter${item + 1}`)
                    .fontSize(22)
                    .fontWeight(500)
                    .textAlign(TextAlign.Center)
                }
                .width(180)
                .height(72)
                .backgroundColor(Color.Red)
                .borderRadius(24)
                .id(`NavRouter${item}`)
                .onClick((e: ClickEvent)=>{
                  let pageName = "page" + String(item);
                  this.pageInfos.pushPathByName(pageName, null);
                })
              }

            }
          }, (item: number) => String(item))
        }
        .height('100%')
        .margin({ top: 12, left: 12 } as Margin)
      }
      .navDestination(this.PageBuilder)
      .width(this.NavigationWidth)
      .minContentWidth(this.minContentWidth)
      .navBarWidth(this.navBarWidth)
    }.height('100%')
  }
}