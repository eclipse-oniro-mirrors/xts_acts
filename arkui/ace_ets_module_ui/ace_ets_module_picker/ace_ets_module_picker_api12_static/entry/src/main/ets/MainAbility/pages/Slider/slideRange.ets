'use static';
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
import { Entry, Column, Component, Row, Toggle,  Text, Button, ClickEvent, ButtonRole, Checkbox, Position,XComponent,
  Slider,SliderStyle,
  ColumnOptions, Shape, Path, Flex, Builder, Rating, Circle, Color, Visibility, Margin, FlexAlign,RatingConfiguration
} from '@ohos.arkui.component'
import { State } from '@ohos.arkui.stateManagement';
@Entry
@Component
struct SliderExample {
  @State message: string = "Hello"

  build() {
    Row() {
      Column({ space: 8 } as ColumnOptions) {
        Text('同时设置from=20,to=80').fontSize(20).fontColor(0xCCCCCC).width('90%').margin(15)

        Row() {
          Slider({
            step: 10,
            style: SliderStyle.OutSet
          })
            .id("slideRangeValue")
            .showSteps(true)
            .slideRange({from:20, to:80})
        }
        .width('80%')
      }.width('100%')
    }

  }
}