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
  LongPressGesture,
  TapGesture,
  ClickEvent,
  FlexAlign
} from '@ohos.arkui.component'
import { State, AppStorage } from '@ohos.arkui.stateManagement'
import { UIContext, Router } from '@ohos.arkui.UIContext';

@Entry
@Component
struct ButtonLongPress {
  @State monopolize: boolean = false
  @State message: string = 'set monopolizeEvents false'
  @State logMsg1: string = ''
  @State logMsg2: string = ''

  build() {
    Column({space:20} as ColumnOptions) {
      Text(this.logMsg1)
        .id('button1Text')
        .fontSize(20)
        .fontColor(Color.Pink)
        .margin(10)
      Text(this.logMsg2)
        .fontSize(20)
        .fontColor(Color.Blue)
        .margin(10)
      Button("button1")
        .id('button1')
        .width(100)
        .height(80)
        .monopolizeEvents(this.monopolize)
        .gesture(
          LongPressGesture()
            .onAction((event: GestureEvent) => {
              if (event) {
                this.logMsg1 = 'LongPressGesture start'
              }
            })
        )
      Button("button2")
        .id('button2')
        .width(100)
        .height(80)
        .gesture(
          TapGesture({ count: 1 })
            .onAction((event: GestureEvent) => {
              if (event) {
                this.logMsg2 = 'TapGesture start'
              }
            })
        )
      Text(this.message)
        .fontSize(16)
        .margin(10)
    }.height('100%').width('100%').justifyContent(FlexAlign.Center)
  }
}