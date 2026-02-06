'use static';
/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
import {
  Entry,
  Component,
  $r,
  Column,
  ColumnOptions,
  Text,
  Color,
  Flex,
  FlexDirection,
  ItemAlign,
  Row,
  Button,
  ClickEvent,
  Week,
  FontWeight,
  Axis,
  Margin,
  PickerTextStyle,
  CalendarAlign,
  CalendarPicker,
  Slider,
  SliderChangeMode,
  SliderStyle,
  ArrowPosition,
  Select,
  BlurStyle,
  MenuAlignType,
  TextInputController,
  FlexAlign,
  Rating,
  Position
} from '@ohos.arkui.component';
import {
  State,
  Link,
  PropRef
} from '@ohos.arkui.stateManagement';
@Entry
@Component
struct Slider23 {
  @State outSetValueOne: number = 0
  @State sliderMode:SliderChangeMode | int = 0

  build() {
    Column() {
      Slider({
        value: this.outSetValueOne,
        min: 0,
        step: 10,
        max: 100
      })
        .id('Slider23')
        .width(300)
        .blockSize({ width: 10, height: 30 })
        .trackThickness(60)
        .showTips(true)
        .onChange((value: number, mode: SliderChangeMode) => {
          this.outSetValueOne = value
          this.sliderMode = mode
          console.info('value:' + value + 'mode:' + mode.toString())
        })
    }
    .width(350)
    .height(350)
    .position({ y: 60 } as Position)
  }
}