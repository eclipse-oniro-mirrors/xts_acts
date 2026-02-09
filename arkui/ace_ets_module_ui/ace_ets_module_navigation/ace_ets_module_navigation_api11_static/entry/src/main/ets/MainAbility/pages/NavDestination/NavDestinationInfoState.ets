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
import { Entry,NavPathStack,Component,$r,ListItemOptions,List,RowOptions,ResourceStr,ListItem,Builder,Resource,NavigationTitleMode,NavigationMode,Column,Navigation,ButtonType,NavDestination,Stack,ColumnOptions,Position,EffectType,EffectComponent,Text,Color,Flex,FlexDirection,ItemAlign,Row,Button,ClickEvent,Week,FontWeight,Axis,Margin,Swiper,ForEach,PickerTextStyle, CalendarAlign, CalendarPicker,EdgeEffect,Curve,SwiperDisplayMode,ArrowPosition, Select,BlurStyle,MenuAlignType,TextInputController,TextAlign,AlphabetIndexer} from '@ohos.arkui.component';
import {
  State,
  Link,
  PropRef,Provide
} from '@ohos.arkui.stateManagement';
import { AppStorage } from '@ohos.arkui.stateManagement';
import observer from '@ohos.arkui.observer'

@Component
struct PageOne {

  build(){
    NavDestination() {
      Text('NavDestination').fontSize(26).fontWeight(700).fontColor(Color.Red)
    }.backgroundColor('#0c182431').id('backgroundColor1')
  }
}
@Component
struct PageTwo {

  build(){
    NavDestination() {
      Text('NavDestination').fontSize(26).fontWeight(700).fontColor(Color.Red)
    }.backgroundColor('#0c182431').id('backgroundColor2')
  }
}
@Entry
@Component
struct NavDestinationInfoState {
  private arr: number[] = [1,2,3]
   pageInfos: NavPathStack = new NavPathStack()
  @State isShow:boolean = false
  @State isShow2:boolean = false
  @State bool: boolean = false
  @State text: string = 'start'
  @State flagBlur: string = 'BlurStart'
  @State flagFocus: string = 'FocusStart'
  @State getText: string = ''
  @State tState: string|Resource|ResourceStr = 'tState'

  infoStat:observer.NavDestinationState = observer.NavDestinationState.ON_SHOWN
  infoSta1t:observer.NavDestinationState = observer.NavDestinationState.ON_HIDDEN

  onPageShow() {
    observer.onNavDestinationUpdate((info) => {
      console.info('infoinfoinfoinfo',info.state)
      if (info.state == this.infoStat) {
        this.tState = "ON_SHOWN"
      }
      
      if (info.state == this.infoSta1t) {
        this.tState = "ON_HIDDEN"
      }
    });
  }

  @Builder
  PageBuilder(name: string, param: Object|null|undefined) {
    if (name == "page0") {
      PageOne()

    } else if (name == "page1") {
      PageTwo()
    }
  }


  build() {
    Column(){
      Navigation(this.pageInfos) {
        List({ space: 12, initialIndex: 0 }) {
          ForEach(['1','2'], (item: string, index: int) => {
            ListItem() {
              Row() {
                Row().width(30).height(30).borderRadius(30).margin({ left: 3, right: 10 } as Margin).backgroundColor(Color.Pink)
                Text(`WLAN`).key('NavDestinationInfoStateText01')
                  .fontSize(22)
                  .fontWeight(500)
                  .textAlign(TextAlign.Center)
                  .onClick((e: ClickEvent)=>{
                    let pageName = "page" + String(item);
                    this.pageInfos.pushPathByName(pageName, null);
                  })
              }
              .width('90%')
              .height(72)
            }})}

      }
      .id('dfjaslgjsdfkljlsdfjakldfsdf')
      .navDestination(this.PageBuilder)
      .height('60%')
      .title('NavIndex')
      .titleMode(NavigationTitleMode.Mini)
      .mode(NavigationMode.Stack)
      .hideNavBar(this.bool)
      .navBarWidth(260)
      .minContentWidth(300)
      .navBarWidthRange([200,400])
      .border({width: 1})
      .height('70%')
      .width('100%')
      .backgroundColor(Color.Pink)

      Text(this.tState).key('NavDestinationInfoStateText02').fontWeight(700)
      Button('pop path').key('NavDestinationInfoStateButton')
        .onClick(() => {
          this.pageInfos.pop()
        })
    }
    .border({width:1})
    .height('100%')
    .width('100%')
  }
}