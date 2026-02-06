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
import { FrameNode, NodeController, typeNode } from '@ohos.arkui.node';
import { AppStorage, State } from '@ohos.arkui.stateManagement'
import { Router, UIContext } from '@ohos.arkui.UIContext';
import router from '@ohos.router';
import {
  Button,
  ClickEvent,
  Color,
  Column,
  ColumnOptions,
  Component,
  Entry,
  GestureEvent,
  HorizontalAlign,
  Margin,
  Padding,
  Row,
  SourceTool,
  SwipeGesture,
  Text
} from '@ohos.arkui.component'

@Entry
@Component
struct SwipeGestureEvent {
  @State value: string = ''

  build() {
    Column() {
      Column() {
        Text(this.value).key('value')
      }
      .key('SwipeGesture1')
      .height(150)
      .width(200)
      .padding(20)
      .border({ width: 3 })
      .gesture(
        SwipeGesture()
          .onAction((event: GestureEvent) => {
            console.log('test action start' + event.targetDisplayId)
            this.value = '' + event.targetDisplayId
          })
      )
    }.width('100%')
  }
}