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
struct SliderAttrsTest {
  @State value2: number = 0
  @State value3: number = 0

  build() {
    Column({ space: 20 }) {
      Slider({ style: SliderStyle.InSet, value: 0, min: 0, max: 100 })
        .width('300vp')
        .id('SliderAttrs_slider1')
        .selectedBorderRadius(2)
        .minResponsiveDistance(50)
        .width('300vp')


      Slider({ style: SliderStyle.InSet, value: 0, min: 0, max: 100 })
        .width('300vp')
        .id('SliderAttrs_slider2')
        .sliderInteractionMode(SliderInteraction.SLIDE_AND_CLICK)
        .onChange((value: number, mode: SliderChangeMode) => {
          this.value2 = value
        })
      Text((this.value2 > 0)?'true':'false').id('SliderAttrs_text2')


      Slider({ style: SliderStyle.InSet, value: this.value3, min: 0, max: 100 })
        .width('300vp')
        .id('SliderAttrs_slider3')
        .sliderInteractionMode(SliderInteraction.SLIDE_ONLY)
        .onChange((value: number, mode: SliderChangeMode) => {
          this.value3 = value
        })
      Text(String(this.value3)).id('SliderAttrs_text3')

    }.width('100%')
  }
}