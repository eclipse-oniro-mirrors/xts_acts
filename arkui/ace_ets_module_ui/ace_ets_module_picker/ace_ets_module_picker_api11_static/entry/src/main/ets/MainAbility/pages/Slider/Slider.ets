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
  PickerTextStyle, CalendarAlign, CalendarPicker,Slider,SliderChangeMode,SliderStyle,
  ArrowPosition, Select,BlurStyle,MenuAlignType,TextInputController,FlexAlign,Rating
} from '@ohos.arkui.component';
import {
  State,
  Link,
  PropRef,
} from '@ohos.arkui.stateManagement';
@Entry
@Component
struct slider {
  @State inSetValue: double = 40
  @State outSetValue: double = 40
  @State Begin: SliderChangeMode = SliderChangeMode.Begin
  onPageShow() {
    console.info('Slider page show called');
  }

  onBuildDone() {
    console.info('Slider page build done called');
  }

  build() {
    Flex({ direction: FlexDirection.Column, alignItems: ItemAlign.Center, justifyContent: FlexAlign.Center }) {
      Column() {
        Text(`Slider page`)
          .fontSize(50)
          .fontWeight(FontWeight.Bold)
        Slider({
          value: this.outSetValue,
          min: 0,
          max: 100,
          step: 1,
          direction: Axis.Horizontal,
          reverse: false,
          style: SliderStyle.OutSet
        })
          .blockColor('#FFFF0000')
          .selectedColor('#FF0000FF')
          .trackColor('#FF808080')
          .showTips(false)
          .showSteps(false)
          .onChange((value: double, mode: SliderChangeMode): void => {
            this.outSetValue = value
            this.Begin = mode
            console.info('value: ' + value + '---mode: ' + mode)
          })
          .width("100")
          .height("100")
          .key('slider1')
        Slider({
          value: 40,
          min: 0,
          max: 100,
          step: 1,
          style: SliderStyle.InSet
        })
          .blockColor(Color.Red)
          .selectedColor(Color.Blue)
          .trackColor(Color.Gray)
          .showTips(true)
          .showSteps(true)
          .key('slider2')
      }.width(300)
      .height(300)
      .borderColor(Color.Pink)
      .borderWidth(2)
    }
  }
}

