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
  Component,
  $r,
  Column,
  ColumnOptions,
  Text,
  TabsController,
  Margin,
  ClickEvent,
  Color,
  Button,
  Tabs,
  TabContent,
  SubTabBarStyle,
  BarMode,
  Alignment,
  BarPosition,
} from '@ohos.arkui.component';
import { State, Link, PropRef, } from '@ohos.arkui.stateManagement';
import { AppStorage } from '@ohos.arkui.stateManagement';
import { UIContext, Router } from '@ohos.arkui.UIContext';
import inspector from '@ohos.arkui.inspector';
import { CommonModifier } from '@ohos.arkui.modifier'

@Entry
@Component
struct TabsBarModifierExample {
  @State tabBarModifier: CommonModifier = new CommonModifier()
  private controller: TabsController = new TabsController()
  @State text1: string = '111'

  build() {
    Column() {
      Text('align: ' + this.text1)
        .id('tabs_barModifier_t')
      Button('Alignment.Start ')
        .id('tabs_barModifier_start')
        .width('30%')
        .height('8%')
        .margin({ top: 5 } as Margin)
        .onClick((event?: ClickEvent) => {
          this.text1 = 'Alignment.Start'
          this.tabBarModifier.align(Alignment.Start)
        })
      Button('Alignment.End')
        .id('tabs_barModifier_end')
        .width('30%')
        .height('8%')
        .margin({ top: 5 } as Margin)
        .onClick((event?: ClickEvent) => {
          this.text1 = 'Alignment.End'
          this.tabBarModifier.align(Alignment.End)
        })
      Button('Alignment.Center')
        .id('tabs_barModifier_center')
        .width('30%')
        .height('8%')
        .margin({ top: 5 } as Margin)
        .onClick((event?: ClickEvent) => {
          this.text1 = 'Alignment.Center'
          this.tabBarModifier.align(Alignment.Center)
        })

      Tabs({ barPosition: BarPosition.Start, controller: this.controller, /*barModifier: this.tabBarModifier*/ }) {
        TabContent() {
          Column().width('100%').height('100%').backgroundColor(Color.Pink).id('tabBar_pTest_001')
        }.tabBar(SubTabBarStyle.of('Pink'))

        TabContent() {
          Column().width('100%').height('100%').backgroundColor(Color.Green).id('tabBar_pTest_002')
        }.tabBar(SubTabBarStyle.of('Green'))

        TabContent() {
          Column().width('100%').height('100%').backgroundColor(Color.Blue).id('tabBar_pTest_003')
        }.tabBar(SubTabBarStyle.of('Blue'))
      }
      .id('tabBar_pTest_01')
      .barWidth(300)
      .barHeight(60)
      .width(300)
      .height('60%')
      .backgroundColor('0xf1f3f5')
      .barMode(BarMode.Scrollable)
    }
    .width('100%')
    .height('100%')
  }
}