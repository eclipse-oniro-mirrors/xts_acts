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
  OnTabsGestureSwipeCallback,
  TabsAnimationEvent,
  Text
} from '@ohos.arkui.component'
import { State } from '@ohos.arkui.stateManagement'

@Entry
@Component
struct tabsOnGestureSwipePage {
  @State isState: boolean = false;
  @State textLabel: string = 'undefined onGestureSwipe';
  private controller: TabsController = new TabsController();
  private onSwipe: OnTabsGestureSwipeCallback = (index: int, extraInfo: TabsAnimationEvent) => {
    this.textLabel = 'onGestureSwipe successfully';
    console.log(`✅ 触发了滑动中：当前索引=${index}`);
    // 直接访问系统类型的属性，无类型错误
    console.log(`当前位移：${extraInfo.currentOffset ?? '未知'}`);
    console.log(`目标位移：${extraInfo.targetOffset ?? '未知'}`);
    console.log(`离手速度：${extraInfo.velocity ?? '未知'}`);
  }

  build() {
    Column() {
      Text(this.textLabel)
        .id('textOnGestureSwipe')
      Tabs({ barPosition: BarPosition.End, controller: this.controller }) {
        TabContent() {
          Column().width('100%').height('20%').backgroundColor('#E67C92')
        }.tabBar('Pink')

        TabContent() {
          Column().width('100%').height('20%').backgroundColor('#FFBF00')
        }.tabBar('Yellow')
      }
      .id('tabsOnGestureSwipe')
      .vertical(false)
      .barMode(BarMode.Scrollable)
      .barWidth(360)
      .barHeight(56)
      .animationDuration(500)
      .onGestureSwipe(this.isState ? this.onSwipe : undefined)

      Button('onGestureSwipe: ' + this.isState)
        .id('buttonOnGestureSwipe')
        .onClick((e: ClickEvent) => {
          this.isState = !this.isState
        })
    }.width(300)
    .height(300)
  }
}