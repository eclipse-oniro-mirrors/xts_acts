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

import {CheckboxGroupModifier}from '@ohos.arkui.modifier'
import {
  Entry, Component, Builder,NodeContainer, CheckBoxShape,
  Column, ColumnOptions, ImageAnalyzerType, CheckboxGroup, Checkbox,
  Flex, FlexDirection, ItemAlign, FlexAlign, ImageAIOptions,  ImageAnalyzerController, ImageBitmap,  ImageAnalyzerConfig,
  Text, Button, FontWeight, ClickEvent, Margin, Color, Row, RenderingContextSettings, CanvasRenderingContext2D, Canvas,CheckboxGroupResult,
} from '@ohos.arkui.component'
import { State } from '@ohos.arkui.stateManagement';

@Entry
@Component
struct CheckboxExample {

  //Tab1
  @State mItemNameTrue: String = ''
  @State mItemNameFalse: String = ''
  @State groupModifierTrue:CheckboxGroupModifier = new CheckboxGroupModifier()
    .onChange((itemName: CheckboxGroupResult) => {
      this.mItemNameTrue = 'CheckboxGroupModifierOnChange'
  })


  build() {
    Column() {
      CheckboxGroup({ group: 'mCheckboxGroup' })
        .checkboxShape(CheckBoxShape.ROUNDED_SQUARE)
        .selectedColor('#007DFF')
        .attributeModifier(this.groupModifierTrue as CheckboxGroupModifier)
        .id('checkbosGroupOnchange')
      Text('M Select All').fontSize(14).lineHeight(20).fontColor('#182431').fontWeight(500)
      Checkbox({ name: 'mcheckbox1', group: 'mCheckboxGroup' })
        .selectedColor('#007DFF')
        .shape(CheckBoxShape.ROUNDED_SQUARE)
      Checkbox({ name: 'mcheckbox2', group: 'mCheckboxGroup' })
        .selectedColor('#007DFF')
        .shape(CheckBoxShape.ROUNDED_SQUARE)
      Text(this.mItemNameTrue.toString()).key('checkboxGroupModifierTrue')
    }.width('100%')
  }
}