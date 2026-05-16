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

'use static'

import {
  Entry,
  Column,
  Component,
  Stack,
  Circle,
  Alignment,
  Blank,
  Color,
  ComponentV2,
  CrownSensitivity,
  TouchEvent,
  Text,
  FlexAlign
} from '@ohos.arkui.component';
import {
  ArcSlider,
  ArcSliderPosition,
  ArcSliderOptions,
  ArcSliderValueOptions,
  ArcSliderLayoutOptions,
  ArcSliderStyleOptions,
  ArcSliderValueOptionsConstructorOptions,
  ArcSliderLayoutOptionsConstructorOptions,
  ArcSliderStyleOptionsConstructorOptions,
  ArcSliderOptionsConstructorOptions
} from '@ohos.arkui.advanced.ArcSlider';
import { AppStorage } from '@ohos.arkui.stateManagement';
import { Router } from '@ohos.arkui.UIContext';

@Entry
@ComponentV2
struct ArcSliderExample {
  @Builder
  ArcSliderBuild() {
    Column(){
      Text('ArcSliderBuild')
        .fontSize(28)
      ArcSlider({ options: new ArcSliderOptions
        ({
          valueOptions: new ArcSliderValueOptions({
            progress: 60,
            min: 10,
            max: 110
          })
        })
      })
    }
  }

  valueOptionsConstructorOptions: ArcSliderValueOptionsConstructorOptions = {
    progress: 60,
    min: 10,
    max: 110
  };
  layoutOptionsConstructorOptions: ArcSliderLayoutOptionsConstructorOptions = {
    reverse: true,
    position: ArcSliderPosition.RIGHT
  };
  styleOptionsConstructorOptions: ArcSliderStyleOptionsConstructorOptions = {
    trackThickness: 8,
    activeTrackThickness: 30,
    trackColor: '#ffd5d5d5',
    selectedColor: '#ff2787d9',
    trackBlur: 20
  };
  valueOptions: ArcSliderValueOptions = new ArcSliderValueOptions(this.valueOptionsConstructorOptions);
  layoutOptions: ArcSliderLayoutOptions = new ArcSliderLayoutOptions(this.layoutOptionsConstructorOptions);
  styleOptions: ArcSliderStyleOptions = new ArcSliderStyleOptions(this.styleOptionsConstructorOptions);
  arcSliderOptionsConstructorOptions: ArcSliderOptionsConstructorOptions = {
    valueOptions: this.valueOptions,
    layoutOptions: this.layoutOptions,
    styleOptions: this.styleOptions,
    digitalCrownSensitivity:CrownSensitivity.LOW,
    onTouch: (event: TouchEvent) => {
      AppStorage.setOrCreate('arcSliderOnTouchCalled', true);
    },
    onChange: (progress: number) => {
      AppStorage.setOrCreate('arcSliderOnChangeProgress', progress);
    },
    onEnlarge: (isEnlarged: boolean) => {
      AppStorage.setOrCreate('arcSliderOnEnlargeValue', isEnlarged);
    }
  };
  arcSliderOptions: ArcSliderOptions = new ArcSliderOptions(this.arcSliderOptionsConstructorOptions);

  // LEFT position ArcSlider options
  leftLayoutOptionsConstructorOptions: ArcSliderLayoutOptionsConstructorOptions = {
    reverse: true,
    position: ArcSliderPosition.LEFT
  };
  leftLayoutOptions: ArcSliderLayoutOptions = new ArcSliderLayoutOptions(this.leftLayoutOptionsConstructorOptions);
  leftArcSliderOptionsConstructorOptions: ArcSliderOptionsConstructorOptions = {
    valueOptions: this.valueOptions,
    layoutOptions: this.leftLayoutOptions,
    styleOptions: this.styleOptions,
    digitalCrownSensitivity:CrownSensitivity.LOW,
    onTouch: (event: TouchEvent) => {
    },
    onChange: (progress: number) => {
    },
    onEnlarge: (isEnlarged: boolean) => {
    }
  };
  leftArcSliderOptions: ArcSliderOptions = new ArcSliderOptions(this.leftArcSliderOptionsConstructorOptions);

  build() {
    Column() {
      ArcSlider({ options: this.arcSliderOptions })
        .key('arcSliderAllOptions')
        .id('arcSliderAllOptions')
        .width('100%')
        .layoutWeight(1)
        .constraintSize({ minHeight: 0, maxHeight: '48%' })
      ArcSlider({ options: this.leftArcSliderOptions })
        .key('arcSliderLeft')
        .id('arcSliderLeft')
        .width('100%')
        .layoutWeight(1)
        .constraintSize({ minHeight: 0, maxHeight: '48%' })
    }
    .width('100%')
    .height('100%')
    .padding({ left: '2%', right: '2%', top: '1%', bottom: '1%' })
    .justifyContent(FlexAlign.SpaceEvenly)
  }
}