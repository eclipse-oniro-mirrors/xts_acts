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
  $rawfile,
  BaseGestureEvent,
  Button,
  ClickEvent,
  Color,
  Column,
  ColumnOptions,
  Component,
  CopyOptions,
  CustomBuilder,
  DragEvent,
  DragItemInfo,
  Entry,
  Flex,
  FlexAlign,
  FlexDirection,
  GestureControl,
  GestureEvent,
  GestureInfo,
  GestureJudgeResult,
  ItemAlign,
  LongPressGesture,
  LongPressGestureEvent,
  Margin,
  Padding,
  PanGesture,
  PanGestureEvent,
  PinchGesture,
  RotationGesture,
  Row,
  RowOptions,
  SwipeGesture,
  SwipeGestureEvent,
  TapGesture,
  Text,
  TextAlign,
  TextArea,
  TouchType,
  Visibility
} from '@ohos.arkui.component'
import { AppStorage, State } from '@ohos.arkui.stateManagement'
import { Router, UIContext } from '@ohos.arkui.UIContext';

@Entry
@Component
struct GestureTapGesture {
  @State message: string = '';

  build() {
    Column() {
      Row({ space: 20 } as RowOptions) {
        Button('Gesture is ' + this.message)
          .height(200)
          .width(800)
          .fontSize(40)
          .id("GestureTapGesture")
          .borderWidth(2)
          .onDragStart((event: DragEvent, extraParams?: String | undefined): DragItemInfo => {
            console.log("Drag start.")
            return {} as DragItemInfo
          })
          .gesture(
            TapGesture({ count: 1 })
              .tag("tap1")
              .onAction((event?: GestureEvent) => {
                if (event) {
                  this.message = 'TAP_GESTURE'
                }
              })
          )
          .gesture(
            LongPressGesture()
              .tag("longPress1")
              .onAction(() => {
              })
          )
          .gesture(
            SwipeGesture()
              .tag("swipe1")
          )
          .gesture(
            PanGesture()
              .tag("pan1")
          )
          .gesture(
            PinchGesture({ fingers: 2 })
              .tag("Pinch1")
          )
          .gesture(
            RotationGesture()
              .tag("Rotation1")
          )
          .onGestureJudgeBegin((gestureInfo: GestureInfo, event: BaseGestureEvent): GestureJudgeResult => {

            if (gestureInfo.type == GestureControl.GestureType.LONG_PRESS_GESTURE) {
              let longPressEvent = event as LongPressGestureEvent;
              console.log("repeat " + longPressEvent.repeat)
            }

            if (gestureInfo.type == GestureControl.GestureType.SWIPE_GESTURE) {
              let swipeEvent = event as SwipeGestureEvent;
              console.log("angle " + swipeEvent.angle)
            }
            if (gestureInfo.type == GestureControl.GestureType.PAN_GESTURE) {
              let panEvent = event as PanGestureEvent;
              console.log("velocity " + panEvent.velocity)
            }

            if (gestureInfo.type == GestureControl.GestureType.TAP_GESTURE) {

              this.message = 'TAP_GESTURE'
              console.log("TAP_GESTURE " + this.message)
              return GestureJudgeResult.CONTINUE;

            }
            return GestureJudgeResult.CONTINUE;
          })
      }.margin(20)
    }

  }
}