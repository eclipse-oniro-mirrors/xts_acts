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
struct Slider13 {
  @State outSetValueOne: number = 150

  build() {
    Column() {
      Text('Slider value is : ' + this.outSetValueOne)
        .id('SliderText12')
        .fontSize(18)

      Slider({
        value: this.outSetValueOne,
        min: 0,
        step: 10,
        max: 100
      })
        .id('Slider13')
        .width(300)
        .showTips(true)
        .onChange((value: number, mode: SliderChangeMode) => {
          this.outSetValueOne = value
          console.info('value:' + value + 'mode:' + mode.toString())
        })
    }
    .width(350)
    .height(200)
    .position({ y: 60 } as Position)
  }
}