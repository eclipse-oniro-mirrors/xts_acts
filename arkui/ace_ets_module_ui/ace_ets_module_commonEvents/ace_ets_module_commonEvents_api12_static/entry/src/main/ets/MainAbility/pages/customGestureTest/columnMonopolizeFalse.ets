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

import {
  Entry,
  Component,
  Column,
  Row,
  Text,
  ColumnOptions,
  TouchType,
  CustomBuilder,
  DragItemInfo,
  Color,
  Button,
  TouchEvent,
  Margin,
  Scroll,
  GestureEvent,
  ClickEvent,
  LongPressGesture,
  TapGesture,
  FlexAlign
} from '@ohos.arkui.component'
import { State, AppStorage } from '@ohos.arkui.stateManagement'
import { UIContext, Router } from '@ohos.arkui.UIContext';

@Entry
@Component
struct ColumnGesture2 {
  @State monopolize: boolean = false
  @State logMsg1: string = ''
  @State logMsg2: string = ''

  build() {
    Column({ space: 20 } as ColumnOptions) {
        Text("monopolize--" + this.monopolize)
          .fontSize(20)
          .margin(10)
        Text(this.logMsg1 + ";" + this.logMsg2)
          .id('columnTextFalse')
          .fontSize(20)
          .fontColor(Color.Pink)
          .margin(10)
        Column() {
        }
        .id('columnLongPress1')
        .width(100)
        .height(80)
        .backgroundColor(Color.Pink)
        .monopolizeEvents(this.monopolize)
        .gesture(
          LongPressGesture()
            .onAction((event: GestureEvent) => {
              if (event) {
                this.logMsg1 = 'LongPressGesture onAction success'
              }
            })
        )

        Column() {
        }
        .id('columnClick2')
        .backgroundColor(Color.Blue)
        .width(100)
        .height(80)
        .gesture(
          TapGesture({ count: 1 })
            .onAction((event: GestureEvent) => {
              if (event) {
                this.logMsg2 = "TapGesture success"
              }
            })
        )

        Button('change monopolize')
          .id('buttonFalse1')
          .width(200)
          .height(80)
          .margin(10)
          .onClick((e: ClickEvent) => {
            this.logMsg1 = ''
            this.logMsg2 = ''
            this.monopolize = !this.monopolize
          })
      }.height('100%').width('100%').justifyContent(FlexAlign.Center)
  }
}