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
import { Entry, Column, Component, Row, Toggle,  Text, Button, ClickEvent, ButtonRole, Checkbox, Position,XComponent,
  Slider,SliderChangeMode,SliderConfiguration,
  ColumnOptions, Shape, Path, Flex, Builder, Rating, Circle, Color, Visibility, Margin, FlexAlign,RatingConfiguration
,ContentModifier,SliderConfiguration,WrappedBuilder,wrapBuilder,CustomBuilderT
} from '@ohos.arkui.component'
import { State } from '@ohos.arkui.stateManagement';

@Builder function buildSlider(config: SliderConfiguration) {
  Column({space: 5} as ColumnOptions) {
    Button('triggerChange')
      .onClick((e:ClickEvent)=>{
        console.log("============================================ triggerChange")
        config.triggerChange(10, SliderChangeMode.Click)
      })
      .id('SliderContentModifier_btn')


    Text('value'+ config.value).id('SliderContentModifier_text1')
    Text('min'+ config.min)
    Text('max'+ config.max)
    Text('step'+ config.step)
  }
}

class MySliderStyle implements ContentModifier<SliderConfiguration> {

  constructor() {}

  applyContent(): WrappedBuilder<CustomBuilderT<SliderConfiguration>>{
    return wrapBuilder<CustomBuilderT<SliderConfiguration>>(buildSlider)
  }
}


@Entry
@Component
struct SliderContentModifierTest {
  @State sliderValue: number = 0
  @State sliderMin: number = 0
  @State sliderMax: number = 100
  @State sliderStep: number = 1
  @State sliderChangeMode: number = 0

  build() {
    Column({ space: 10 } as ColumnOptions) {
      Slider({
        value: this.sliderValue,
        min: this.sliderMin,
        max: this.sliderMax,
        step:this.sliderStep,
      })
        .onChange((value: number, mode: SliderChangeMode):void => {
          console.log("============================================ onChange")
          this.sliderValue = value
          this.sliderChangeMode = mode
          console.log("============================================ mode" + mode);
        })
        .contentModifier(new MySliderStyle())

      Text('mode'+ this.sliderChangeMode.toString()).id('SliderContentModifier_text2')

    }.width('100%')
  }
}