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

@Entry
@Component
struct Slider14 {
  @State outSetValueOne: number = 30
  @State sliderMode:SliderChangeMode = 0

  build() {
    Column() {
      Text(`value is :  ${this.outSetValueOne} mode is : ${this.sliderMode}`)
        .id('SliderText12')
        .fontSize(18)
      
      Slider({
        value: this.outSetValueOne,
        min: 0,
        step: 10,
        max: 100
      })
        .id('Slider14')
        .width('80%')
        .showTips(true)
        .onChange((value: number, mode: SliderChangeMode) => {
          this.outSetValueOne = value
          this.sliderMode = mode
          console.info('value:' + value + 'mode:' + mode.toString())
        })
    }
    .width('100%')
    .height('100%')
    .justifyContent(FlexAlign.Center)
  }
}