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
// checkbox
import {SliderModifier}from '@ohos.arkui.modifier'
import {
  Entry, Component, Builder,NodeContainer, CheckBoxShape,
  Column, ColumnOptions, ImageAnalyzerType, CheckboxGroup, Checkbox, SliderChangeMode, Slider, SliderStyle,
  Flex, FlexDirection, ItemAlign, FlexAlign, ImageAIOptions,  ImageAnalyzerController, ImageBitmap,  ImageAnalyzerConfig,
  Text, Button, FontWeight, ClickEvent, Margin, Color, Row, RenderingContextSettings, CanvasRenderingContext2D, Canvas,
} from '@ohos.arkui.component'
import { State } from '@ohos.arkui.stateManagement';
@Entry
@Component
struct CheckboxExample {

  @State mOutSetValueOne: number = 40
  @State mOutSetValueTwo: number = 40
  @State modifier: SliderModifier = new SliderModifier().onChange((value: number, mode: SliderChangeMode) => {
    this.mOutSetValueOne = value
    console.info('form005 Slider_Modifier_value1111:' + value + 'mode:' + mode.toString())
  })
  @State modifier1: SliderModifier = new SliderModifier().onChange((value: number, mode: SliderChangeMode) => {
    this.mOutSetValueTwo = value
    console.info('form005 Slider_Modifier_value1111:' + value + 'mode:' + mode.toString())
  })


  build() {
    Column() {
      Button('Button1').onClick((event: ClickEvent) => {
        this.mOutSetValueOne = 66
      })
        .id('sliderButtonOne')
      Button('Button2').onClick((event: ClickEvent) => {
        this.mOutSetValueTwo = 80
      })
        .id('sliderButtonTwo')
      Column(){
        Column(){
          Slider({
            value: this.mOutSetValueOne,
            min: 0,
            max: 100,
            style: SliderStyle.OutSet
          })
            .showTips(true)
            .attributeModifier(this.modifier as SliderModifier)
          Text(this.mOutSetValueOne.toString()).key('mOutSetValueOneKey')
        }
        Column(){
          Slider({
            value: this.mOutSetValueTwo,
            min: 0,
            max: 100,
            style: SliderStyle.OutSet
          })
            .showSteps(true)
            .attributeModifier(this.modifier1 as SliderModifier)
          Text(this.mOutSetValueTwo.toString()).key('mOutSetValueTwoKey')
        }
      }
    }.width('100%')
  }
}
