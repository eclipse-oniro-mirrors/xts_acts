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
import matrix4 from '@ohos.matrix4'
import {
  $r,
  Builder,
  Button,
  Color,
  Column,
  ColumnOptions,
  Component,
  DragEvent,
  Entry,
  FlexAlign,
  FlowItem,
  Image,
  LazyForEach,
  PlaybackSpeed,
  Position,
  Rect,
  Resource,
  Scroll,
  Shape,
  Slider,
  Stack,
  Text,
  TimePicker,
  Toggle,
  ToggleType,
  Video,
  VideoController,
  WaterFlow
} from '@ohos.arkui.component';
import { AppStorage, Link, PropRef, State, } from '@ohos.arkui.stateManagement';
import { ComponentUtils, Router, UIContext } from '@ohos.arkui.UIContext';
import inspector from '@ohos.arkui.inspector';

let matrix = matrix4.init([1.0, 0.0, 0.0, 0.0, 0.0, 1.0, 0.0, 0.0, 0.0, 0.0, 1.0, 0.0, 0.0, 0.0, 0.0, 1.0])

@Entry
@Component
struct comSizeAbilityTest_27 {
  @State currentIndex: Int = 0

  build() {
    Scroll() {
      Column({ space: 20 } as ColumnOptions) {
        Column() {
          Shape() {
            Rect().width(300).height(50)
          }
          .viewPort({
            x: 0,
            y: 0,
            width: 320,
            height: 70
          })
          .fill('0x317AF7')
          .stroke(Color.Black)
          .strokeWidth(10)
          .key("Shape_Size")
          .size({ width: 214, height: 140 })
          .translate({ x: 1, y: 1, z: 1 })
          .scale({
            x: 1,
            y: 1,
            z: 1,
            centerX: 1,
            centerY: 1
          })
          .rotate({
            x: 1,
            y: 1,
            z: 1,
            angle: 0,
            centerX: 1,
            centerY: 1
          })
          .transform(matrix)
        }.key('Shape_Father')
      }.width('100%')
    }.height('100%')
  }
}


