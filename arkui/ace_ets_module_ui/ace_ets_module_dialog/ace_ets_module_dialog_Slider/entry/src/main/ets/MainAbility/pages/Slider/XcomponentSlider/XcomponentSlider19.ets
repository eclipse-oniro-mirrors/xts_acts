/**
 * Copyright (c) 2024 Shenzhen Kaihong Digital Industry Development Co., Ltd.
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

@Builder function buildSlider19(config: SliderConfiguration) {
  Row() {
    Column({space: 30}) {
      Button('增加').onClick(() => {
        config.value = config.value + config.step
        config.triggerChange(config.value, SliderChangeMode.Click)
      })
        .width(100)
        .height(25)
        .fontSize(10)
        .enabled(config.value<config.max)

      Button('减少').onClick(() => {
        config.value=config.value-config.step
        config.triggerChange(config.value, SliderChangeMode.Click)
      })
        .width(100)
        .height(25)
        .fontSize(10)
        .enabled(config.value>config.min)

      Slider({
        value: config.value,
        min: config.min,
        max: config.max,
        step:config.step,
      })
        .width(config.max)
        .visibility((config.contentModifier as MySliderStyle19).showSlider?Visibility.Visible:Visibility.Hidden)
        .showSteps(true)
        .onChange((value: number, mode: SliderChangeMode) => {
          config.triggerChange(value, mode)
        })
      Text('当前状态：'+ ((config.contentModifier as MySliderStyle19).sliderChangeMode==0?'Begin'
        :((config.contentModifier as MySliderStyle19).sliderChangeMode==1?'Moving'
          :((config.contentModifier as MySliderStyle19).sliderChangeMode==2?'End'
            :((config.contentModifier as MySliderStyle19).sliderChangeMode==3?'Click':'无')))))
        .fontSize(10)
      Text('进度值：'+ config.value)
        .fontSize(10)
      Text('最小值：'+ config.min)
        .fontSize(10)
      Text('最大值：'+ config.max)
        .fontSize(10)
      Text('步长：'+ config.step)
        .fontSize(10)
    }
    .width('80%')

  }
  .width('100%')
}

class MySliderStyle19 implements ContentModifier<SliderConfiguration> {
  public showSlider:boolean=true
  public sliderChangeMode:number=0
  constructor(showSlider: boolean,sliderChangeMode:number) {
    this.showSlider = showSlider
    this.sliderChangeMode = sliderChangeMode
  }
  applyContent() : WrappedBuilder<[SliderConfiguration]> {
    return wrapBuilder(buildSlider19)
  }
}

@Entry
@Component
struct XSlider19 {
  @State showSlider:boolean=true
  @State sliderValue: number = 0
  @State sliderMin: number = 0
  @State sliderMax: number = 5
  @State sliderStep: number = 0
  @State sliderChangeMode: number = 0

  build() {
    Column({ space: 8 }) {

      Row() {
        Slider({
          value: this.sliderValue,
          min: this.sliderMin,
          max: this.sliderMax,
          step:this.sliderStep,
        })
          .id('XSlider19')
          .showSteps(true)
          .onChange((value: number, mode: SliderChangeMode) => {
            this.sliderValue = value
            this.sliderChangeMode=mode
            console.info('【SliderLog】value:' + value + 'mode:' + mode.toString())
          })
          .contentModifier(new MySliderStyle19(this.showSlider,this.sliderChangeMode))
      }
      .width('100%')
    }.width('100%')
  }
}