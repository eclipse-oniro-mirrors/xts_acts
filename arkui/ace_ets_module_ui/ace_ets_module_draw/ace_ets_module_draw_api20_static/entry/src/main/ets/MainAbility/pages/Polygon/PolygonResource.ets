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
  Column, ColumnOptions, Polygon, $r,
  Flex, FlexDirection, ItemAlign, FlexAlign, ImageAIOptions,
  Text, Button, FontWeight, ClickEvent, Margin, Color, Row, RenderingContextSettings, CanvasRenderingContext2D, Canvas,
} from '@ohos.arkui.component'
@Entry
@Component
struct PolygonResource {
  build() {
    Column({ space: 10 } as ColumnOptions) {

      Polygon({ width: 100, height: 50})
        .points([[0, 0], [50, 50], [50, 0]])
        .fill(Color.Green)
        .id('PolygonResource1')

      // Polygon({ width: $r('app.string.Width_100'), height: $r('app.string.Height_50') })
      Polygon({ width: 100, height: 50 })
        .points([[0, 0], [50, 50], [50, 0]])
        .fill(Color.Green)
        .id('PolygonResource2')

      Polygon()
        .width($r('app.string.Width_100'))
        .height($r('app.string.Height_50'))
        .points([[0, 0], [50, 50], [50, 0]])
        .fillOpacity(0)
        .strokeWidth(5)
        .stroke(Color.Blue)
        .id('PolygonResource3')
    }.width('100%').margin({ top: 10 } as Margin)
  }
}