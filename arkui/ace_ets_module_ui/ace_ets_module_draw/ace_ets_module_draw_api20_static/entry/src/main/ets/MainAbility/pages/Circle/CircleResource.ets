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
  Column, ColumnOptions, Circle, $r,Text,
  Flex, FlexDirection, ItemAlign, FlexAlign, ImageAIOptions,
  Text, Button, FontWeight, ClickEvent, Margin, Color, Row, RenderingContextSettings, CanvasRenderingContext2D, Canvas,
} from '@ohos.arkui.component'

@Entry
@Component
struct CircleResource {
  build() {
    Column({ space: 10 } as ColumnOptions) {
      Text('111111111111111111')
      Circle({ width: 50, height: 50 })
        .id('CircleResource1')

      // Circle({ width: $r('app.string.Width_50'), height: $r('app.string.Height_50') }).id('CircleResource2')
      Circle({ width: 50, height: 50 }).id('CircleResource2')

      Circle()
        .id('CircleResource3')
        .width($r('app.string.Width_50'))
        .height($r('app.string.Height_50'))
      //   .fillOpacity(0)
      //   .strokeWidth(3)
      //   .stroke(Color.Red)
      //   .strokeDashArray([1, 2])

    }.width('100%')
  }
}