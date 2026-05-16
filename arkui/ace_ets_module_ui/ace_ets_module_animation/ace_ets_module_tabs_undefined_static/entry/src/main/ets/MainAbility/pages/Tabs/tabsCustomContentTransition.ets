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
  TabContentAnimatedTransition,
  TabContentTransitionProxy,
  Text
} from '@ohos.arkui.component'
import { State } from '@ohos.arkui.stateManagement'

@Entry
@Component
struct tabsCustomContentTransitionPage {
  @State isState: boolean = false;
  @State currentIndex: int = 0;
  @State textLabel: string = 'undefined customContentTransition';
  private controller: TabsController = new TabsController();

  build() {
    Column() {
      Text(this.textLabel)
        .id('customContentTransitionText')
      Tabs({ index: this.currentIndex, controller: this.controller }) {
        TabContent() {
          Column().width('100%').height('100%').backgroundColor('#00CB87')
        }.tabBar('green')

        TabContent() {
          Column().width('100%').height('100%').backgroundColor('#007DFF')
        }.tabBar('blue')

        TabContent() {
          Column().width('100%').height('100%').backgroundColor('#FFBF00')
        }.tabBar('yellow')

        TabContent() {
          Column().width('100%').height('100%').backgroundColor('#E67C92')
        }.tabBar('brown')
      }
      .customContentTransition(this.isState ? (from: int, to: int): TabContentAnimatedTransition => {
        this.textLabel = 'customContentTransition successfully';
        return {
          timeout: 0, // 动画超时时间
          transition: (proxy: TabContentTransitionProxy) => {
            console.log(`触发了从标签${from}切换到标签${to}`);
            // 模拟简单的淡入淡出动画（实际可扩展为复杂动画）
            setTimeout(() => {
              proxy.finishTransition(); // 必须调用，通知动画结束
            }, 300);
          }
        };
      } : undefined)

      Button('customContentTransition: ' + this.isState)
        .id('buttonCustomContentTransition')
        .onClick((e: ClickEvent) => {
          this.isState = !this.isState
        })
    }.width(300)
    .height(300)
  }
}