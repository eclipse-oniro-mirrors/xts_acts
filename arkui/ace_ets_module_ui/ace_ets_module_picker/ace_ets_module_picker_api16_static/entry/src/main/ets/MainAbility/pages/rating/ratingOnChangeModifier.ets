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
import {RatingModifier}from '@ohos.arkui.modifier'
import {
  Entry, Component, Builder,NodeContainer, CheckBoxShape,
  Column, ColumnOptions, ImageAnalyzerType, CheckboxGroup, Checkbox, Rating,
  Flex, FlexDirection, ItemAlign, FlexAlign, ImageAIOptions,  ImageAnalyzerController, ImageBitmap,  ImageAnalyzerConfig,
  Text, Button, FontWeight, ClickEvent, Margin, Color, Row, RenderingContextSettings, CanvasRenderingContext2D, Canvas,
} from '@ohos.arkui.component'
import { State } from '@ohos.arkui.stateManagement';
@Entry
@Component
struct CheckboxExample {

  @State rating: number = 3.5
  @State mRadio1Value: String = ''
  @State modifier:RatingModifier =  new RatingModifier().onChange((value: number) => {
    this.rating = value
    console.log('form004 rating_nodifier value is '+ this.rating)
  })


  build() {
    Column() {
      Button('ratingButton1').onClick((event: ClickEvent) => {
        this.rating = 5.0
      })
        .id('ratingButton')
      Rating({ rating: this.rating, indicator: false })
        .stars(5)
        .stepSize(0.5)
        .margin({ top: 24 } as Margin)
        .attributeModifier(this.modifier as RatingModifier)
        .id('ratingModifier')
      Text(this.rating.toString()).key('ratingModifierKey')
    }.width('100%')
  }
}
