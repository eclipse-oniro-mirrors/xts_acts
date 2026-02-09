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
  Entry, Component,
  Column, ColumnOptions, Shape, Path, $r,
  Flex, FlexDirection, ItemAlign, FlexAlign, ImageAIOptions, LineJoinStyle,
  Text, Button, FontWeight, ClickEvent, Margin, Color, Row, RenderingContextSettings, CanvasRenderingContext2D, Canvas,
} from '@ohos.arkui.component'
@Entry
@Component
struct ShapeResource {
  build() {
    Column({ space: 2 } as ColumnOptions) {
      Shape() {
        Path().width(150).height(60).commands('M0 0 L400 0 L400 150 Z')
      }
      .width(100)
      .height(100)
      .viewPort({
        x: -20,
        y: -5,
        width: 100,
        height: 90
      })
      .fill(0x317AF7)
      .stroke(0xEE8443)
      .strokeWidth(10)
      .strokeLineJoin(LineJoinStyle.Miter)
      .strokeMiterLimit(5)
      .id('ShapeResource1')

      Shape() {
        Path().width(150).height(60).commands('M0 0 L400 0 L400 150 Z')
      }
      .width(100)
      .height(100)
      // .viewPort({
      //   x: $r('app.string.x_20'),
      //   y: $r('app.string.y_5'),
      //   width: $r('app.string.w_100'),
      //   height: $r('app.string.h_90')
      // })
      .viewPort({
        x: -20,
        y: -5,
        width: 100,
        height: 90
      })
      .fill($r('app.color.color_fill'))
      .stroke($r('app.color.color_stroke'))
      .strokeWidth("10")
      .strokeLineJoin(LineJoinStyle.Miter)
      // .strokeMiterLimit($r('app.string.sml_5'))
      .strokeMiterLimit(5)
      .id('ShapeResource2')

    }.width('100%')
  }
}