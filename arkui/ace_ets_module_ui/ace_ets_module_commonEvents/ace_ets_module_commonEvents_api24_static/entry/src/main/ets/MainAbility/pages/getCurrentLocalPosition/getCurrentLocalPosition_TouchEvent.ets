'use static'
/**
 * Copyright (c) 2026 Huawei Device Co., Ltd.
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
  Text,
  Column,
  Component,
  Button,
  TabsController,
  Tabs,
  TabContent,
  TouchEvent,
  TabsOptions,
  TouchType,
  AxisEvent,
  Coordinate2D,
  FlexAlign,
  BarPosition,
  ClickEvent,
  GestureEvent,
  TapGesture
} from '@ohos.arkui.component'
import { State } from '@ohos.arkui.stateManagement'
import hilog from '@ohos.hilog'

@Entry
@Component
struct GetCurrentLocalPosition_TouchEvent {
  private tabsController: TabsController = new TabsController();
  @State positionText: string = 'getCurrentLocalPosition获取的坐标';
  @State textOffsetX: number = 0;
  @State textOffsetY: number = 0;

  build() {
    Column() {
      Tabs({ controller: this.tabsController, barPosition: BarPosition.Start }as TabsOptions) {

        TabContent() {
          Column() {
            Text(this.positionText)
              .id('text01')
            Button()
              .id('Button01')
              .width('32vp')
              .height('32vp')
              .translate({ x: this.textOffsetX, y: this.textOffsetY })
              .backgroundColor('#ff6e6e6e')
              .onTouch((event?: TouchEvent) => {
                if (event && event.type === TouchType.Down) {
                  this.textOffsetX = 5;
                  this.textOffsetY = 5;
                }
                if (event) {
                  let localPos: Coordinate2D | undefined = event?.touches[0]?.getCurrentLocalPosition?.();
                  this.positionText =
                    `getCurrentLocalPosition获取的坐标:x:${Math.round(localPos?.x??0)},y:${Math.round(localPos?.y??0)}`;
                }
              })
          }.width('100%').height('100%').justifyContent(FlexAlign.Center)

        }.id('tabs01')

      }
    }.width('100%').height('100%').justifyContent(FlexAlign.Center)

  }
}