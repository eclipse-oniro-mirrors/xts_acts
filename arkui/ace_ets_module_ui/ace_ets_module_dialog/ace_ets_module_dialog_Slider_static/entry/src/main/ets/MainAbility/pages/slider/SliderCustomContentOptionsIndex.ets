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
  ColumnOptions,
  SliderCustomContentOptions,
  SliderStyle,
  Color,
  Text,
  TextAlign,
  FlexAlign,
  $r,
  wrapBuilder,
  SliderOptions
} from '@ohos.arkui.component';
import { State } from '@ohos.arkui.stateManagement';
import { Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import { ComponentContent } from '@kit.ArkUI';
import { UIContext } from '@ohos.arkui.UIContext';

@Builder
function preTextBuilder() {
  Text('低')
    .fontSize($r('sys.float.Caption_L'))
    .clip(true)
    .textAlign(TextAlign.Center)
    .fontColor(Color.Black)
}

@Entry
@Component
struct SliderCustomContentOptionsIndex {
  @State value1: number = 50;
  @State value2: number = 60;

  private uiContext: UIContext = this.getUIContext();
  private preNode1: ComponentContent<Object> =
    new ComponentContent<Object>(this.uiContext, wrapBuilder(preTextBuilder));

  aboutToAppear() {
    try {
      let router = this.getUIContext().getRouter();
      AppStorage.setOrCreate<Router>('router', router);
    } catch (error) {
      console.log('error ' + error);
    }
  }

  build() {
    Column({ space: 4 } as ColumnOptions) {
        // SliderCustomContentOptions - accessibilityDescription
        Slider({
          value: this.value1,
          min: 0,
          max: 100,
          step: 1,
          style: SliderStyle.InSet
        } as SliderOptions)
          .id('sliderDescription')
          .width('100%')
          .layoutWeight(1)
          .constraintSize({ minHeight: 0, maxHeight: '44%' })
          .prefix(this.preNode1, {
            accessibilityDescription: 'accessibilityDescription'
          })
          .onChange((value: number) => {
            this.value1 = value;
          })

        // SliderCustomContentOptions - accessibilityLevel
        Slider({
          value: this.value2,
          min: 0,
          max: 100,
          step: 1,
          style: SliderStyle.InSet
        } as SliderOptions)
          .id('sliderLevel')
          .width('100%')
          .layoutWeight(1)
          .constraintSize({ minHeight: 0, maxHeight: '44%' })
          .prefix(this.preNode1, {
            accessibilityLevel: 'auto'
          })
          .onChange((value: number) => {
            this.value2 = value;
          })
    }
    .justifyContent(FlexAlign.SpaceEvenly)
    .width('100%')
    .height('100%')
    .padding({ left: '2%', right: '2%', top: '1%', bottom: '1%' })
  }
}
