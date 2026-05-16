/**
 * Copyright (c) 2026 Shenzhen Kaihong Digital Industry Development Co., Ltd.
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


'use static';

import {
  Entry,
  Component,
  Column,
  Slider,
  Text,
  ColumnOptions,
  ColorMetricsStop,
  SliderStepItemAccessibility,
  SliderShowStepOptions,
  SliderCustomContentOptions,
  SliderStyle,
  Color,
  TextAlign,
  FlexAlign,
  ResourceStr,
  $r,
  wrapBuilder,
  SliderOptions
} from '@ohos.arkui.component';
import { State } from '@ohos.arkui.stateManagement';
import { Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import { ColorMetrics, ColorSpace, ColorMetricsLinearGradient, ComponentContent } from '@kit.ArkUI';
import { UIContext } from '@ohos.arkui.UIContext';

@Builder
function preTextBuilder() {
  Text('低')
    .fontSize($r('sys.float.Caption_L'))
    .clip(true)
    .textAlign(TextAlign.Center)
    .fontColor(Color.Black)
}

@Builder
function sufTextBuilder() {
  Text('高')
    .fontSize(9)
    .clip(true)
    .textAlign(TextAlign.Center)
    .fontColor(Color.Black)
}

@Entry
@Component
struct SliderIndex {
  @State value1: number = 20;
  @State value2: number = 30;
  @State value3: number = 40;
  @State value4: number = 50;
  @State value5: number = 60;
  @State value6: number = 70;
  @State value7: number = 80;
  @State value8: number = 60;
  @State value9: number = 60;
  @State value10: number = 60;

  // ColorMetrics for ColorMetricsStop
  @State redColor: ColorMetrics = ColorMetrics.colorWithSpace(ColorSpace.DISPLAY_P3, 1.0, 0.0, 0.0, 1);
  @State blueColor: ColorMetrics = ColorMetrics.colorWithSpace(ColorSpace.DISPLAY_P3, 0.0, 0.0, 1.0, 1);
  @State greenColor: ColorMetrics = ColorMetrics.colorWithSpace(ColorSpace.DISPLAY_P3, 0.0, 1.0, 0.0, 1);
  @State yellowColor: ColorMetrics = ColorMetrics.colorWithSpace(ColorSpace.DISPLAY_P3, 1.0, 1.0, 0.0, 1);

  // ColorMetricsStop - color, offset (for testing ColorMetricsStop properties)
  @State color1: ColorMetricsLinearGradient = new ColorMetricsLinearGradient([
    { color: this.redColor, offset: 0.0 },
    { color: this.blueColor, offset: 1.0 }
  ]);

  // SliderAttribute - trackColorMetrics
  @State color2: ColorMetricsLinearGradient = new ColorMetricsLinearGradient([
    { color: this.greenColor, offset: 0.0 },
    { color: this.yellowColor, offset: 0.5 },
    { color: this.redColor, offset: 1.0 }
  ]);

  private uiContext: UIContext = this.getUIContext();
  private preNode1: ComponentContent<Object> =
    new ComponentContent<Object>(this.uiContext, wrapBuilder(preTextBuilder));
  private sufNode1: ComponentContent<Object> =
    new ComponentContent<Object>(this.uiContext, wrapBuilder(sufTextBuilder));

  aboutToAppear() {
    try {
      let router = this.getUIContext().getRouter();
      AppStorage.setOrCreate<Router>('router', router);
    } catch (error) {
      console.log('error ' + error);
    }
  }

  build() {
    Column({ space: 2 } as ColumnOptions) {
        // SliderAttribute - prefix
        Slider({
          value: this.value8,
          min: 0,
          max: 100,
          step: 1,
          style: SliderStyle.InSet
        } as SliderOptions)
          .id('sliderAttributePrefix')
          .width('100%')
          .layoutWeight(1)
          .constraintSize({ minHeight: 0, maxHeight: '12%' })
          .prefix(this.preNode1)
          .onChange((value: number) => {
            this.value8 = value;
          })

        // SliderAttribute - suffix
        Slider({
          value: this.value9,
          min: 0,
          max: 100,
          step: 1,
          style: SliderStyle.InSet
        } as SliderOptions)
          .id('sliderAttributeSuffix')
          .width('100%')
          .layoutWeight(1)
          .constraintSize({ minHeight: 0, maxHeight: '12%' })
          .suffix(this.sufNode1)
          .onChange((value: number) => {
            this.value9 = value;
          })

        // SliderAttribute - trackColorMetrics
        Slider({
          value: this.value10,
          min: 0,
          max: 100,
          step: 1,
          style: SliderStyle.InSet
        } as SliderOptions)
          .id('sliderAttributeTrackColorMetrics')
          .width('100%')
          .layoutWeight(1)
          .constraintSize({ minHeight: 0, maxHeight: '12%' })
          .trackColorMetrics(this.color2)
          .onChange((value: number) => {
            this.value10 = value;
          })

        // ColorMetricsStop - color, offset
        Slider({
          value: this.value1,
          min: 0,
          max: 100,
          step: 1,
          style: SliderStyle.InSet
        } as SliderOptions)
          .id('sliderColorMetricsStop')
          .width('100%')
          .layoutWeight(1)
          .trackColorMetrics(this.color1)
          .onChange((value: number) => {
            this.value1 = value;
          })

        // SliderStepItemAccessibility - text
        Slider({
          value: this.value2,
          min: 0,
          max: 100,
          step: 20,
          style: SliderStyle.InSet
        } as SliderOptions)
          .id('sliderStepItemAccessibility')
          .width('100%')
          .layoutWeight(1)
          .constraintSize({ minHeight: 0, maxHeight: '12%' })
          .showSteps(true, {
            stepsAccessibility: new Map<number, SliderStepItemAccessibility>()
              .set(1, {text : '123123'} as SliderStepItemAccessibility)
              .set(2, {text : 'Slider无障碍文本'} as SliderStepItemAccessibility)
              .set(3, {text : $r('app.string.app_name')} as SliderStepItemAccessibility)
              .set(4, {text : '!@#$%^&*()'} as SliderStepItemAccessibility)
          } as SliderShowStepOptions)
          .onChange((value: number) => {
            this.value2 = value;
          })

        // SliderShowStepOptions - stepsAccessibility
        Slider({
          value: this.value3,
          min: 0,
          max: 100,
          step: 25,
          style: SliderStyle.InSet
        } as SliderOptions)
          .id('sliderShowStepOptions')
          .width('100%')
          .layoutWeight(1)
          .constraintSize({ minHeight: 0, maxHeight: '12%' })
          .showSteps(false, {
            stepsAccessibility: new Map<number, SliderStepItemAccessibility>()
              .set(1, {text : '123123'} as SliderStepItemAccessibility)
              .set(2, {text : 'Slider无障碍文本'} as SliderStepItemAccessibility)
              .set(3, {text : $r('app.string.app_name')} as SliderStepItemAccessibility)
              .set(4, {text : '!@#$%^&*()'} as SliderStepItemAccessibility)
          } as SliderShowStepOptions)
          .onChange((value: number) => {
            this.value3 = value;
          })

        // SliderCustomContentOptions - accessibilityText
        Slider({
          value: this.value4,
          min: 0,
          max: 100,
          step: 1,
          style: SliderStyle.InSet
        } as SliderOptions)
          .id('sliderCustomContentAccessibilityText')
          .width('100%')
          .layoutWeight(1)
          .constraintSize({ minHeight: 0, maxHeight: '12%' })
          .prefix(this.preNode1, {
            accessibilityText: 'accessibilityText'
          })
          .onChange((value: number) => {
            this.value4 = value;
          })
    }
    .justifyContent(FlexAlign.SpaceEvenly)
    .width('100%')
    .height('100%')
    .padding({ left: '2%', right: '2%', top: '1%', bottom: '1%' })
  }
}
