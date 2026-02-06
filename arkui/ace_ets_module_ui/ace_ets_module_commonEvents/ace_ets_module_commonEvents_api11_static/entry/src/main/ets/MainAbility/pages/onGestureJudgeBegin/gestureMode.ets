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
  BorderStyle,
  GestureMode,
  GestureGroup,
  GestureEvent,
  LongPressGesture,
  PanGesture,
  TapGesture,
  LongPressGesture,
  SwipeGesture,
  PanGesture,
  PinchGesture,
  RotationGesture,
  GestureControl,
  GestureJudgeResult,
  FlexOptions
} from '@ohos.arkui.component'
import { State, AppStorage } from '@ohos.arkui.stateManagement'
import { UIContext, Router } from '@ohos.arkui.UIContext';
@Entry
@Component
struct GestureGroupExample {
  @State count: number = 0;
  @State offsetX: number = 0;
  @State offsetY: number = 0;
  @State borderStyle1: BorderStyle = BorderStyle.Solid;
  @State mode: GestureMode = GestureMode.Sequence;

  build() {
    Flex({
      direction: FlexDirection.Column,
      alignItems: ItemAlign.Center,
      justifyContent: FlexAlign.SpaceBetween
    }) {
      Text('sequence gesture\n' + 'LongPress onAction:' + this.count + '\nPanGesture offset:\nX: ' + this.offsetX + '\n' + 'Y: ' + this.offsetY)
    }
    .key('gestureMode')
    .translate({ x: this.offsetX, y: this.offsetY, z: 5 })
    .height(100)
    .width(200)
    .padding(10)
    .margin(80)
    .border({ width: 1, style: this.borderStyle1 })
    .gesture(
      GestureGroup(GestureMode.Sequence,
        LongPressGesture({ repeat: true })
          .onAction((event: GestureEvent) => {
            if (event.repeat) {
              this.count++
            }
            console.log('LongPress onAction')
          })
          .onActionEnd(() => {
            console.log('LongPress end')
          }),
        PanGesture()
          .onActionStart(() => {
            this.borderStyle1 = BorderStyle.Dashed
            console.log('pan start')
          })
          .onActionUpdate((event: GestureEvent) => {
            this.offsetX = event.offsetX
            this.offsetY = event.offsetY
            console.log('pan update')
          })
      )
        .onCancel(() => {
          console.log('sequence gesture canceled')
        })
    )
  }
}