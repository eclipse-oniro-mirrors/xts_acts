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
  Column,
  Row,
  Flex,
  Text,
  ColumnOptions,
  TouchType,
  CustomBuilder,
  DragItemInfo,
  Color,
  TextArea,
  CopyOptions,
  Visibility,

  TextAlign,
  FlexAlign,
  ItemAlign,
  FlexDirection,
  Padding,
  Margin,
  $rawfile,
  LongPressGesture,
  GestureEvent
} from '@ohos.arkui.component'
import { State, AppStorage } from '@ohos.arkui.stateManagement'
import { UIContext, Router } from '@ohos.arkui.UIContext';
@Entry
@Component
struct LongPressGesture2 {
  @State offsetX: number = 20
  @State offsetY: number = 10
  @State count: number = 0

  build() {
    Column() {
      Column() {
        Text('PanGesture offset:X:' + this.offsetX + 'Y:' + this.offsetY).key('LongPress3')
        Text('LongPress onAction:' + this.count).key('LongPress4')
      }
      .key('LongPressGesture2')
      .height(150)
      .width(200)
      .backgroundColor(Color.Green)
      .translate({x: this.offsetX, y: this.offsetY})
      .gesture(
        LongPressGesture({ repeat: true })
          .onAction((event?: GestureEvent) => {
            if (event && event.repeat) {
              this.count = 2
            }
          })
      )
    }
    .height(150)
    .width(200)
    .backgroundColor(Color.Orange)
  }
}