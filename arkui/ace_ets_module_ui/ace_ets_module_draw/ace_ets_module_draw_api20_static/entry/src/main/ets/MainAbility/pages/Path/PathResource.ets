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
  Column, ColumnOptions, Path, $r,
  Flex, FlexDirection, ItemAlign, FlexAlign, ImageAIOptions,
  Text, Button, FontWeight, ClickEvent, Margin, Color, Row, RenderingContextSettings, CanvasRenderingContext2D, Canvas,
} from '@ohos.arkui.component'
@Entry
@Component
struct PathResource {
  build() {
    Column({space:5} as ColumnOptions) {

      Path({
        commands: 'M0 300 S100 0 240 300 Z',
        width: 100,
        height: 50
      })
        .id('PathResource1')

      Path({
        // commands: $r('app.string.Path_commands'),
        // width: $r('app.string.Width_100'),
        // height: $r('app.string.Height_50')
        commands: "M0 300 S100 0 240 300 Z",
        width: 100,
        height: 50
      }).id('PathResource2')

      Path()
        // .commands($r('app.string.Path_commands'))   // "M0 300 S100 0 240 300 Z"
        .commands("M0 300 S100 0 240 300 Z")
        .width($r('app.string.Width_100'))
        .height($r('app.string.Height_50'))
        .id('PathResource3')

    }.width('100%')
  }
}