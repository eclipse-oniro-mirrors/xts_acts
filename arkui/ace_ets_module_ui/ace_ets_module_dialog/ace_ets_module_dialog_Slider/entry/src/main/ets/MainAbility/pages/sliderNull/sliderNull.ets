/*
 * Copyright (c) 2023 Huawei Device Co., Ltd.
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
struct sliderUndefied {
  @State inSetValue: number = 40
  @State outSetValue: number = 40
  @State begin: number = SliderChangeMode.Begin

  onPageShow() {
    console.info('Slider page show called');
  }

  onBuildDone() {
    console.info('Slider page build done called');
  }

  build() {
    Flex({ direction: FlexDirection.Column, alignItems: ItemAlign.Center, justifyContent: FlexAlign.Center }) {
      Column() {
        Text(`Slider page`)
          .fontSize(50)
          .fontWeight(FontWeight.Bold)
        //null
        Slider({
          value: this.outSetValue,
          min: 0,
          max: 100,
          step: 1,
          direction: Axis.Horizontal,
          reverse: false,
          style: SliderStyle.OutSet
        })
          .blockColor('#FFFF0000')
          .selectedColor('#FF0000FF')
          .trackColor('#FF808080')
          .contentModifier(null)
          .minLabel(null)
          .maxLabel(null)
          .showTips(null,null)
          .showSteps(null,null)
          .blockStyle(null)
          .trackThickness(null)
          .selectedBorderRadius(null)
          .blockSize(null)
          .minResponsiveDistance(null)
          .slideRange(null)
          .prefix(null,null)
          .suffix(null,null)
          .onChange((value: number, mode: SliderChangeMode) => {
            this.outSetValue = value
            this.begin = mode
            console.info('value: ' + value + '---mode: ' + mode)
          })
          .width('100')
          .height('100')
          .key('slidernull')
        //undefined
        Slider({
          value: this.outSetValue,
          min: 0,
          max: 100,
          step: 1,
          direction: Axis.Horizontal,
          reverse: false,
          style: SliderStyle.OutSet
        })
          .slideRange(undefined)
          .prefix(undefined)
          .suffix(undefined)
          .contentModifier(undefined)
          .minResponsiveDistance(undefined)
          .minLabel(undefined)
          .maxLabel(undefined)
          .showTips(undefined,undefined)
          .showSteps(undefined,undefined)
          .trackThickness(undefined)
          .selectedBorderRadius(undefined)
          .blockSize(undefined)
          .blockStyle(undefined)
          .onChange((value: number, mode: SliderChangeMode) => {
            this.outSetValue = value
            this.begin = mode
            console.info('value: ' + value + '---mode: ' + mode)
          })
          .width('100')
          .height('100')
          // .id('sliderundefined')
          .key('sliderundefined')

      }
    }
  }
}
