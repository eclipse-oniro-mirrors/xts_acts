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
import promptAction from '@ohos.promptAction';
import { AppStorage, State } from '@ohos.arkui.stateManagement'
import { Router, UIContext } from '@ohos.arkui.UIContext';
import router from '@ohos.router';
import {
  Button,
  ClickEvent,
  Color,
  Column,
  Component,
  Entry,
  ForEach,
  KeyEvent,
  ListItem,
  Rect,
  RectOptions,
  Row,
  RowOptions,
  Text,
  TouchEvent,
  TouchType
} from '@ohos.arkui.component'

function Rect1(x: number, y: number, z: number): RectOptions {
  return { width: x, height: y, radius: z }
}

@Entry
@Component
struct ClickExample {
  @State displayX: string = 'displayX'
  @State displayY: string = 'displayY'
  @State windowX: string = 'windowX'
  @State windowY: string = 'windowY'
  @State intentionCode: string = 'intentionCode'

  build() {
    Column() {
      Rect(Rect1(200, 80, 1)).margin(10)

      Text(this.displayX).id("displayX")
      Text(this.displayY).id("displayY")
      Text(this.windowX).id("windowX")
      Text(this.windowY).id("windowY")
      Text(this.intentionCode).id("intentionCode")

      Row({ space: 20 } as RowOptions) {
        Button('Click')
          .width(100)
          .height(40)
          .id("Button_click")
          .onClick((event: ClickEvent) => {
            this.displayX = "onClick: " + event.displayX
            this.displayY = "onClick: " + event.displayY
            this.windowX = "onClick: " + event.windowX
            this.windowY = "onClick: " + event.windowY
          })
          .onTouch((event: TouchEvent) => {
            this.displayX = "onTouch: " + event!.getHistoricalPoints()![0].touchObject.displayX
            this.displayY = "onTouch: " + event!.getHistoricalPoints()![0].touchObject.displayY
            this.windowX = "onTouch: " + event!.getHistoricalPoints()![0].touchObject.windowX
            this.windowY = "onTouch: " + event!.getHistoricalPoints()![0].touchObject.windowY
          })
          .onKeyEvent((event: KeyEvent) => {
            this.intentionCode = "KeyEvent: " + event.intentionCode
            return false;
          })

        Button('Mouse').width(100).height(40).id("Mouse_click")
          .onClick((event: ClickEvent) => {
            this.displayX = "MouseEvent: " + event.displayX
            this.displayY = "MouseEvent: " + event.displayY
            this.windowX = "MouseEvent: " + event.windowX
            this.windowY = "MouseEvent: " + event.windowY
          })
      }.margin(20)
    }.width('100%')
  }
}