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
  Color,
  Column,
  ColumnOptions,
  Component,
  CopyOptions,
  CustomBuilder,
  DragItemInfo,
  Ellipse,
  Entry,
  Flex,
  FlexAlign,
  FlexDirection,
  ItemAlign,
  LineCapStyle,
  LineJoinStyle,
  Margin,
  Padding,
  Path,
  Position,
  Rect,
  Row,
  Shape,
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
struct ShapeExample {
  build() {
    Column({ space: 5 } as ColumnOptions) {
      Shape() {
        Rect()
          .width(300)
          .height(50)
        Ellipse()
          .width(300)
          .height(50)
          .offset({ x: 0, y: 60 } as Position)
        Path()
          .width(300)
          .height(10)
          .commands('M0 0 L900 0')
          .offset({ x: 0, y: 120 } as Position)
      }
      .viewPort({
        x: -2,
        y: -2,
        width: 304,
        height: 130
      })
      // .fill(0x317Af7)
      .stroke(Color.Black)
      .strokeWidth(4)
      .strokeDashArray([20])
      .strokeDashOffset(10)
      .strokeLineCap(LineCapStyle.Butt)
      .strokeLineJoin(LineJoinStyle.Round)
      .antiAlias(true)
      .key('Butt')
    }
    .width('100%')
    .margin({ top: 15 } as Margin)
  }
}