'use static';
/*
 * Copyright (C) 2025 Huawei Device Co., Ltd.
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
import { Entry, Component, Column, AttributeModifier, NavigationAttribute, NavBarPosition, NavigationMode, NavigationTitleMode,
  Navigation, NavPathStack, Row, NavDestination, Text, Flex, Margin, Color, TextAlign, FlexDirection, Padding } from '@ohos.arkui.component'
import { State } from '@ohos.arkui.stateManagement';

class NavigationModifier1 implements AttributeModifier<NavigationAttribute> {
  applyNormalAttribute(instance: NavigationAttribute): void {
    instance
      .minContentWidth('10px')
      .navBarWidthRange(['300vp', '800vp'])
      .navBarWidth(120)
      .navBarPosition(NavBarPosition.Start)
      .mode(NavigationMode.Split)
      .backButtonIcon('resources/base/media/icon.png')
      .hideNavBar(false)
      .hideTitleBar(false)
      .title('test')
      .hideBackButton(false)
      .titleMode(NavigationTitleMode.Free)
      .hideToolBar(false)
  }
}
@Entry
@Component
struct NavigationPage {
  @State myModifier: NavigationModifier1 = new NavigationModifier1()
  @State isActiveWLAN: boolean = false
  @State isActiveBluetooth: boolean = false

  build() {
    Column() {
      Navigation(new NavPathStack()) {
        // NavRouter() {
        Column() {
          Row() {
            Row()
              .width(30)
              .height(30)
              .borderRadius(30)
              .margin({ left: 3, right: 10 } as Margin)
              .backgroundColor(Color.Pink)
            Text(`WLAN`)
              .fontSize(22)
              .fontWeight(500)
              .textAlign(TextAlign.Center)
          }
          .width('90%')
          .height(72)

          NavDestination() {
            Flex({ direction: FlexDirection.Row }) {
              Text('未找到可用WLAN').fontSize(30).padding({ left: 15 } as Padding)
            }
          }
          .hideTitleBar(false)
          .backgroundColor('#0c182431')

        }.backgroundColor(this.isActiveWLAN ? '#ccc' : '#fff')
        .borderRadius(24)
        // .onStateChange((isActivated: boolean) => {
        //   this.isActiveWLAN = isActivated
        // })

        // NavRouter() {
        Column() {
          Row() {
            Row()
              .width(30)
              .height(30)
              .borderRadius(30)
              .margin({ left: 3, right: 10 } as Margin)
              .backgroundColor(Color.Pink)
            Text(`蓝牙`)
              .fontSize(22)
              .fontWeight(500)
              .textAlign(TextAlign.Center)
          }
          .width('90%')
          .height(72)

          NavDestination() {
            Flex({ direction: FlexDirection.Row }) {
              Text('未找到可用蓝牙').fontSize(30).padding({ left: 15 } as Padding)
            }
          }
          .hideTitleBar(false)
          .backgroundColor('#0c182431')
        }.backgroundColor(this.isActiveBluetooth ? '#ccc' : '#fff')
        .borderRadius(24)
        // .onStateChange((isActivated: boolean) => {
        //   this.isActiveBluetooth = isActivated
        // })
      }
      .key('navigation1')
      .backButtonIcon('resources/base/media/icon.png')
      .attributeModifier(this.myModifier)
    }.height('100%')
  }
}