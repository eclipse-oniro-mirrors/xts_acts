'use static';
/*
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

import observer from '@ohos.arkui.observer';
import { UIContext } from '@ohos.arkui.UIContext';
import {
  Entry, Component, Flex, FlexDirection,Padding, TextAlign, NavigationTitleMode, NavigationMode,NavPathInfo,
  Column, ColumnOptions, Row, Builder, TouchEvent,Color, WrappedBuilder, NodeContainer, ResourceStr,NavDestination,NavPathStack,
  Text, Button, FontWeight, ClickEvent, Margin, WidthBreakpoint, HeightBreakpoint, CustomBuilderT, Navigation,NavDestinationActiveReason
} from '@ohos.arkui.component'
import { State, Consume, Provide } from '@ohos.arkui.stateManagement';

@Entry
@Component
struct NavRouterExample {
  @Provide({alias: 'stack' }) stack: NavPathStack = new NavPathStack()
  @State isActiveWLAN: boolean = false
  @State isActiveBluetooth: boolean = false
  @State showFlag: ResourceStr = ''

  @Builder
  pageMap(name: string) {
    if (name == 'pageOne') {
      PageOne()
    }
  }

  aboutToAppear() {
    let context:UIContext | undefined = this.getUIContext()
    if(context!=undefined){
      console.log("=================================== 1");
      let contextObserver = context.getUIObserver();
      console.log("=================================== 2");
      contextObserver.onNavDestinationUpdate((e)=>{
        console.log("=================================== 3");
        this.showFlag = '30'
      });
    }
  }

  build() {
    Column() {
      Navigation(this.stack) {
        NavDestination() {
          Row() {
            Row().width(30).height(30).borderRadius(30).margin({ left: 3, right: 10 } as Margin).backgroundColor(Color.Pink)
            Text(`WLAN`).fontSize(22).fontWeight(500).textAlign(TextAlign.Center)
          }
          .width('90%')
          .height(72)
          NavDestination() {
            Flex({ direction: FlexDirection.Row }) {
              Text('wifi').fontSize(30).padding({ left: 35 } as Padding)
            }
          }
          .hideTitleBar(false)
          .backgroundColor('#0c182431')
        }.backgroundColor(this.isActiveWLAN ? '#ccc' : '#fff')
        .borderRadius(24)
        .onActive((reason: NavDestinationActiveReason) => {
          this.isActiveWLAN = true
        })
        .onInactive((reason: NavDestinationActiveReason) => {
          this.isActiveWLAN = false
        })
        .onClick((e:ClickEvent) => {
          this.stack.pushPath(new NavPathInfo('pageOne',undefined),true ) //点击后页面没跳转
        })
        .id("Wlan_Id")
      }
      .title("Navigation")
      .title('设置')
      .titleMode(NavigationTitleMode.Free)
      .mode(NavigationMode.Auto)
      .hideTitleBar(false)
      .hideToolBar(true)
      .navDestination(this.pageMap)
    }
    .width('100%')
    .height('100%')
  }



}

@Component
struct PageOne {
  @Consume('stack') pageInfos: NavPathStack;
  @State isActiveWLAN: boolean = false
  @State isActiveBluetooth: boolean = false
  @State showFlag: ResourceStr = ''

  build(){
    NavDestination() {
      Row() {
        Row().width(30).height(30).borderRadius(30).margin({ left: 3, right: 10 } as Margin).backgroundColor(Color.Pink)
        Text(`蓝牙`)
          .fontSize(22)
          .fontWeight(500)
          .textAlign(TextAlign.Center)
      }
      .id('lanYa_id')
      .width('90%')
      .height(72)
      NavDestination() {
        Flex({ direction: FlexDirection.Row }) {
          Text(this.showFlag.toString())
            .fontSize(30)
            .padding({ left: 35 } as Padding)
            .key('showFlag_id')
        }
      }.hideTitleBar(false).backgroundColor('#0c182431')
    }
    .backgroundColor(this.isActiveBluetooth ? '#ccc' : '#fff')
    .borderRadius(24)
    .onActive((reason: NavDestinationActiveReason) => {
      this.isActiveBluetooth = true
    })
    .onInactive((reason: NavDestinationActiveReason) => {
      this.isActiveBluetooth = false
    })

  }
}

