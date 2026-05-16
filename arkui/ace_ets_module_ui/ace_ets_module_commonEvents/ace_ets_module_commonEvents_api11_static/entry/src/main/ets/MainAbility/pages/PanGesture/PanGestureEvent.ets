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
  PanGestureOptions,
  PanGesture,
  GestureEvent,
  PanDirection
} from '@ohos.arkui.component'
import { State, AppStorage } from '@ohos.arkui.stateManagement'
import { UIContext, Router } from '@ohos.arkui.UIContext';
@Entry
@Component
struct PanGestureEvent {
  @State velocityX: number = 0
  @State velocityY: number = 0
  @State velocity: number = 0
  private panOption: PanGestureOptions = new PanGestureOptions({ direction: (PanDirection.Left | PanDirection.Right) as PanDirection})

  build() {
    Column() {
      Column() {
        Text(String(this.velocityX)).id("velocityX")
        Text(String(this.velocityY)).id("velocityY")
        Text(String(this.velocity)).id("velocity")
      }
      .id("PanGestureEvent_column_id")
      .height("90%")
      .width("90%")
      .padding(20)
      .border({ width: 3 })
      .margin(50)
      // 左右拖动触发该手势事件
      .gesture(
      PanGesture(this.panOption)
        .onActionUpdate((event: GestureEvent) => {
          this.velocityX = event.velocityX
          this.velocityY = event.velocityY
          this.velocity = event.velocity
        })
      )
    }
  }
}