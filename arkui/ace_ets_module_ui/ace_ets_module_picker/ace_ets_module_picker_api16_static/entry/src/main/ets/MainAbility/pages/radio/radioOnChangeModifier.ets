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
import {RadioModifier}from '@ohos.arkui.modifier'

import {
  Entry, Component, Builder,NodeContainer,
  Column, ColumnOptions, ImageAnalyzerType, Radio,
  Flex, FlexDirection, ItemAlign, FlexAlign, ImageAIOptions,  ImageAnalyzerController, ImageBitmap,  ImageAnalyzerConfig,
  Text, Button, FontWeight, ClickEvent, Margin, Color, Row, RenderingContextSettings, CanvasRenderingContext2D, Canvas,
} from '@ohos.arkui.component'
import { State } from '@ohos.arkui.stateManagement';

@Entry
@Component
struct CheckboxExample {

  //Tab1
  @State mRadio1Value: String = ''
  @State modifier:RadioModifier = new RadioModifier().onChange((isChecked: boolean) => {
    console.log('form003 Radio_modifier one status is ' + isChecked)
    if(isChecked){
      this.mRadio1Value = 'true'
    }else{
      this.mRadio1Value = 'false'
    }
  })

  @State mRadio1Value1: String = ''
  @State modifier1:RadioModifier = new RadioModifier().onChange((isChecked: boolean) => {
    console.log('form003 Radio_modifier one status is ' + isChecked)
    if(isChecked){
      this.mRadio1Value1 = 'true'
    }else{
      this.mRadio1Value1 = 'false'
    }
  })


  build() {
    Column() {
      Radio({ value: 'mRadio1', group: 'mRadioGroup' }).checked(false)
        .radioStyle({
          checkedBackgroundColor: Color.Pink
        })
        .height(50)
        .width(50)
        .attributeModifier(this.modifier as RadioModifier)
        .id('mRadio1')
      Text(this.mRadio1Value.toString()).key('mRadio1Value')
      Radio({ value: 'mRadio2', group: 'mRadioGroup' }).checked(true)
        .radioStyle({
          checkedBackgroundColor: Color.Pink
        })
        .height(50)
        .width(50)
        .id('mRadio2')
        .attributeModifier(this.modifier1 as RadioModifier)
      Text(this.mRadio1Value1.toString()).key('mRadio1Value1')
    }.width('100%')
  }
}
