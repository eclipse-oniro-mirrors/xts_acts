/*
 * Copyright (c) 2024 Huawei Device Co., Ltd.
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

@Builder function buildSlider(config: SliderConfiguration) {
  Column({space: 5}) {
    Button('triggerChange')
      .onClick(()=>{
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
  applyContent() : WrappedBuilder<[SliderConfiguration]> {
    return wrapBuilder(buildSlider)
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
    Column({ space: 10 }) {
      Slider({
        value: this.sliderValue,
        min: this.sliderMin,
        max: this.sliderMax,
        step:this.sliderStep,
      })
        .onChange((value: number, mode: SliderChangeMode) => {
          this.sliderValue = value
          this.sliderChangeMode = mode
        })
        .contentModifier(new MySliderStyle())

      Text('mode'+ this.sliderChangeMode.toString()).id('SliderContentModifier_text2')

    }.width('100%')
  }
}