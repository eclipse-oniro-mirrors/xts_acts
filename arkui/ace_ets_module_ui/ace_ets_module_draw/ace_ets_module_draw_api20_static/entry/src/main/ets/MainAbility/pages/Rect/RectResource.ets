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
  Column, ColumnOptions, Rect, $r,
  Flex, FlexDirection, ItemAlign, FlexAlign, ImageAIOptions, RectOptions,
  Text, Button, FontWeight, ClickEvent, Margin, Color, Row, RenderingContextSettings, CanvasRenderingContext2D, Canvas,
} from '@ohos.arkui.component'
@Entry
@Component
struct RectResource1 {
  build() {
    Column({ space: 2 } as ColumnOptions) {

      Row() {

        Column({ space: 2 } as ColumnOptions) {
          // Rect({ width: $r('app.string.Width_100'), height: $r('app.string.Height_50') } as RectOptions)
          Rect({ width: 100, height: 50 } as RectOptions)
            // .radiusHeight($r('app.string.Rect_Radius_20'))
            // .radiusWidth($r('app.string.Rect_Radius_40'))
            .radiusHeight(20)
            .radiusWidth(40)
            .fill(Color.Pink)
            .id('RectResource1')
          // Rect({ width: $r('app.string.Width_100') , height: $r('app.string.Height_50') } as RectOptions)
          Rect({ width: 100 , height: 50 } as RectOptions)
            // .radius($r('app.string.Rect_Radius_20'))
            .radius(20)
            .fill(Color.Pink)
            .stroke(Color.Transparent)
            .id('RectResource2')
          Rect({ width: 100, height: 50 } as RectOptions)
            .radiusHeight(20)
            .radiusWidth(40)
            .fill(Color.Pink)
            .id('RectResource3')
          Rect({ width: 100, height: 50 } as RectOptions)
            .radius(20)
            .fill(Color.Pink)
            .stroke(Color.Transparent)
            .id('RectResource4')

        }
      }
    }.width('100%')
  }
}