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

import Curves from '@ohos.curves';
import {
  $r,
  AdaptiveColor,
  Alignment,
  BlurStyle,
  ClickEvent,
  Color,
  Column,
  ColumnOptions,
  Component,
  Entry,
  Flex,
  FlexDirection,
  Image,
  ImageSize,
  ItemAlign,
  Margin,
  MotionBlurAnchor,
  MotionBlurOptions,
  Padding,
  Position,
  Resource,
  Row,
  SizeOptions,
  Stack,
  Text,
  ThemeColorMode,
} from '@ohos.arkui.component';
import { AppStorage, Link, PropRef, State, } from '@ohos.arkui.stateManagement';
import { Router, UIContext } from '@ohos.arkui.UIContext';
import inspector from '@ohos.arkui.inspector';

@Entry
@Component
struct motionBlurTest1 {
  @State widthSize: number = 400
  @State heightSize: number = 320
  @State flag: boolean = true
  @State radius: Double = 0
  @State x: Double = 0
  @State y: Double = 0

  build() {
    Column() {
      Column() {
        Image($r('app.media.icon'))
          .id('motionBlur_id')
          .width(this.widthSize)
          .height(this.heightSize)
          .onClick((e: ClickEvent) => {
            this.radius = 5;
            this.x = 0.5;
            this.y = 0.5;
            if (this.flag) {
              this.widthSize = 100;
              this.heightSize = 80;
            } else {
              this.widthSize = 400;
              this.heightSize = 320;
            }
            this.flag = !this.flag;
          })
          .animation({
            duration: 2000,
            // curve: Curves.springCurve(10.0, 1.0, 228.0, 30.0),
            onFinish: () => {
              this.radius = 0;
            }
          })
        // .motionBlur({
        //   radius: this.radius,
        //   anchor: { x: this.x, y: this.y } as MotionBlurAnchor
        // } as MotionBlurOptions)
      }
    }.width('100%').margin({ top: 5 } as Margin)
  }
}