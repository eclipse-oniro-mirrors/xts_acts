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
  Entry,
  NavPathStack,
  Component,
  $r,
  ResourceStr,
  Builder,
  List,
  ListItem,
  Resource,
  NavigationTitleMode,
  NavigationMode,
  Column,
  Navigation,
  ButtonType,
  NavDestination,
  Stack,
  ColumnOptions,
  Position,
  EffectType,
  EffectComponent,
  Text,
  Color,
  Flex,
  FlexDirection,
  ItemAlign,
  Row,
  Button,
  ClickEvent,
  Week,
  FontWeight,
  Axis,
  Margin,
  Swiper,
  ForEach,
  PickerTextStyle,
  CalendarAlign,
  CalendarPicker,
  EdgeEffect,
  Curve,
  SwiperDisplayMode,
  ArrowPosition,
  Select,
  BlurStyle,
  MenuAlignType,
  TextInputController,
  TextAlign,
  AlphabetIndexer
} from '@ohos.arkui.component';
import { State, Link, PropRef, Provide } from '@ohos.arkui.stateManagement';
import { MessageManager, Callback, Message } from '../../common/MessageManager';
import { AppStorage } from '@ohos.arkui.stateManagement';
import observer from '@ohos.arkui.observer'
let tt : string|Resource|ResourceStr = 'TTTTTT'
@Entry
@Component
struct QueryNavDestinationInfoNavDestination {
  @State isActiveWLAN: boolean = false
  @State isActiveBluetooth: boolean = false
  @State tState: string | Resource | ResourceStr = 'YYYYY'
  pageInfos: NavPathStack = new NavPathStack()
  // 可删
  // aboutToAppear() {
  //   observer.onNavDestinationUpdate((info) => {
  //     this.tState = info !== undefined ? JSON.stringify(info?.navigationId) : 'observer'
  //   });
  //   if (typeof this.queryNavDestinationInfo === 'function') {
  //     observer.onNavDestinationUpdate((info) => {
  //       this.tState = info !== undefined ? JSON.stringify(info?.navigationId) : 'observer'
  //     });
  //     let info1: observer.NavDestinationInfo | undefined = this.queryNavDestinationInfo();
  //     tt = info1 !== undefined ? JSON.stringify(info1?.state) : 'queryNavDestinationInfo'
  //   }
  // }

  onPageShow() {

    observer.onNavDestinationUpdate((info) => {
      this.tState = info !== undefined ? JSON.stringify(info?.navigationId) : 'observer'
    });
  }
  @Builder
  PageBuilder(name: string, param: Object|null|undefined) {
    if(name == 'pageOne'){
      XX()
    }
  }
  build() {
    Column({ space: 20 } as ColumnOptions) {
      Text(this.tState)
        .fontSize(26)
        .fontWeight(700)
        .key('QueryNavDestinationInfoNavDestinationTextObserver')
        .fontColor(Color.Red)
      Navigation(this.pageInfos) {
        Column() {
        Row() {
          Row().width(30).height(30).borderRadius(30).margin({ left: 3, right: 10 } as Margin).backgroundColor(Color.Pink)
          Text(`WLAN`)
            .fontSize(22)
            .fontWeight(500)
            .textAlign(TextAlign.Center)
        }
        .width('90%')
        .height(72)
        .key('QueryNavDestinationInfoNavDestinationText01')
        .onClick((e: ClickEvent)=>{
          let pageName = "pageOne";
          this.pageInfos.pushPathByName('pageOne', null);
        })
        }
        .backgroundColor('#ccc')
        .borderRadius(24)
      }
      .title('设置')
      .titleMode(NavigationTitleMode.Free)
      .mode(NavigationMode.Auto)
      .hideTitleBar(false)
      .hideToolBar(true)
      .id('QueryNavDestinationInfoNavDestination123')
    }.height('60%')
  }
}


@Component
struct XX {
  aboutToAppear() {
    // if (this.queryNavDestinationInfo instanceOf Function  === 'function') {
    //   let info1: observer.NavDestinationInfo | undefined = this.queryNavDestinationInfo();
    //   tt = info1 !== undefined ? JSON.stringify(info1?.state) : 'queryNavDestinationInfo'
    // }
  }

  build() {
    NavDestination() {
      Column({ space: 20 } as ColumnOptions) {
        Text(tt).fontSize(26).fontWeight(700).key('XXqueryNavDestinationInfoNavDestinationText01').fontColor(Color.Blue)
      }
    }
    .hideTitleBar(false)
    .backgroundColor('#0c182431').id('111')

  }
}