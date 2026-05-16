'use static'
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
  Button,
  ClickEvent,
  Column,
  TabsController,
  Tabs,
  TabContent,
  BarPosition,
  BarMode,
  TabsAnimationEvent,
  Text
} from '@ohos.arkui.component'
import { State } from '@ohos.arkui.stateManagement'

@Entry
@Component
struct tabsOnAnimationEndPage {
  @State isState: boolean = false;
  @State textLabel: string = 'undefined onAnimationEnd';
  private controller: TabsController = new TabsController();

  build() {
    Column() {
      Text(this.textLabel)
        .id('textOnAnimationEnd')
      Tabs({ barPosition: BarPosition.End, controller: this.controller }) {
        TabContent() {
          Column().width('100%').height('100%').backgroundColor('#E67C92')
        }.tabBar('pink')

        TabContent() {
          Column().width('100%').height('100%').backgroundColor('#FFBF00')
        }.tabBar('yellow')
      }
      .vertical(false)
      .barMode(BarMode.Scrollable)
      .barWidth(360)
      .barHeight(56)
      .animationDuration(500)
      .onAnimationEnd(this.isState ? (index: int, extraInfo: TabsAnimationEvent) => {
        this.textLabel = 'onAnimationEnd successfully';
      } : undefined)

      Button('onAnimationEnd: ' + this.isState)
        .id('buttonOnAnimationEnd')
        .onClick((e: ClickEvent) => {
          this.isState = !this.isState
        })
    }.width(300)
    .height(300)
  }
}