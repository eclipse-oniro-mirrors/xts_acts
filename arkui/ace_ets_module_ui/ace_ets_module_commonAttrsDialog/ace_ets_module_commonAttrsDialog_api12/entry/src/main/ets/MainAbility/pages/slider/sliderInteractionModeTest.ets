/**
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
@Entry
@Component
struct sliderInterractionModeTest {
  @State inSetValue: number = 10
  @State inSetValue1: number = 10
  @State inSetValue2: number = 10

  build() {
    Column({ space: 10 }) {
      Slider({
        style: SliderStyle.InSet,
        min: 0,
        max: 100,
        value: this.inSetValue
      })
        .id('slider1')
        .sliderInteractionMode(SliderInteraction.SLIDE_AND_CLICK)
        .blockColor('#191970')
        .trackColor('#ADD8E6')
        .selectedColor('#4169E1')
        .showTips(true)
        .onChange((value:number)=>{
          this.inSetValue = value
        })
      Divider()
      Slider({
        style: SliderStyle.InSet,
        min: 0,
        max: 100,
        value: this.inSetValue1
      })
        .id('slider2')
        .sliderInteractionMode(SliderInteraction.SLIDE_ONLY)
        .blockColor('#191970')
        .trackColor('#ADD8E6')
        .selectedColor('#4169E1')
        .showTips(true)
        .onChange((value:number)=>{
          this.inSetValue1 = value
        })
      Divider()
      Slider({
        style: SliderStyle.InSet,
        min: 0,
        max: 100,
        value: this.inSetValue2
      })
        .id('slider3')
        .sliderInteractionMode(SliderInteraction.SLIDE_AND_CLICK_UP)
        .blockColor('#191970')
        .trackColor('#ADD8E6')
        .selectedColor('#4169E1')
        .showTips(true)
        .onChange((value:number)=>{
          this.inSetValue2 = value
        })
    }
  }
}