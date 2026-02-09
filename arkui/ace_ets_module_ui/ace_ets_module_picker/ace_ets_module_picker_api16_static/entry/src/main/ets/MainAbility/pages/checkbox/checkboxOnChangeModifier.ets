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

import {CheckboxModifier}from '@ohos.arkui.modifier'
import {
  Entry, Component, Builder,NodeContainer, CheckBoxShape,
  Column, ColumnOptions, ImageAnalyzerType, CheckboxGroup, Checkbox,
  Flex, FlexDirection, ItemAlign, FlexAlign, ImageAIOptions,  ImageAnalyzerController, ImageBitmap,  ImageAnalyzerConfig,
  Text, Button, FontWeight, ClickEvent, Margin, Color, Row, RenderingContextSettings, CanvasRenderingContext2D, Canvas,
} from '@ohos.arkui.component'
import { State } from '@ohos.arkui.stateManagement';

@Entry
@Component
struct CheckboxExample {

  //Tab1
  @State checkboxOnChangeModValueTure: String = ''
  @State checkboxOnChangeModValueFalse: String = ''
  @State modifierTrue: CheckboxModifier  = new CheckboxModifier().onChange((value: boolean) => {
    if (value) {
      this.checkboxOnChangeModValueTure = 'true'
    } else {
      this.checkboxOnChangeModValueTure = 'false'
    }
  })
  @State modifierFalse: CheckboxModifier  = new CheckboxModifier().onChange((value: boolean) => {
    if (value) {
      this.checkboxOnChangeModValueFalse = 'true'
    } else {
      this.checkboxOnChangeModValueFalse = 'false'
    }
  })


  build() {
    Column() {
      Checkbox({ name: 'mcheckbox1', group: 'checkboxGroup' })
        .select(true)
        .selectedColor(0xed6f21)
        .shape(CheckBoxShape.CIRCLE)
        .attributeModifier(this.modifierTrue)
        .id('mcheckbox1')
      Text(this.checkboxOnChangeModValueTure.toString()).id('checkboxOnChangeModTrue')
      Checkbox({ name: 'mcheckbox2', group: 'checkboxGroup' })
        .select(false)
        .selectedColor(0xed6f21)
        .shape(CheckBoxShape.CIRCLE)
        .attributeModifier(this.modifierFalse)
        .id('mcheckbox2')
      Text(this.checkboxOnChangeModValueFalse.toString()).id('checkboxOnChangeModFalse')
    }.width('100%')
  }
}
