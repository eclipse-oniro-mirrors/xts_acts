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
import {
  Entry,
  Component,
  Column,
  Text,
  Row,
  Color,
  Rating,
  Margin,
  Axis,
  ColumnOptions,
  SliderChangeMode,
  Slider,
  Padding,ResourceColor, LinearGradient,Length,
  SliderStyle,
  FlexAlign
} from '@ohos.arkui.component';
import { State, AppStorage,StoragePropRef } from '@ohos.arkui.stateManagement'
@Entry
@Component
struct SliderExample {
  @State outSetValueOne: number = 40
  @StoragePropRef('style') style: SliderStyle = SliderStyle.InSet
  @StoragePropRef('directionT') directionT: Axis = Axis.Vertical
  @StoragePropRef('reverse') reverse: boolean = true
  @StoragePropRef('min') min: number = 2
  @StoragePropRef('max') max: number = 1000
  @StoragePropRef('step') step: number = 0.7
  @State inSetValueOne: number = 40
  @State outSetValueTwo: number = 40
  @State inSetValueTwo: number = 40
  @State vOutSetValueOne: number = 40
  @StoragePropRef('vInSetValueOne') vInSetValueOne: number = 40
  @State vInSetValueOne1: number = 40
  @State vOutSetValueTwo: number = 40
  @State vInSetValueTwo: number = 40
  @StoragePropRef('blockColor') blockColor: ResourceColor = "#191970"
  @StoragePropRef('trackColor') trackColor: ResourceColor | LinearGradient = "#ADD8E6"
  @StoragePropRef('selectedColor') selectedColor: ResourceColor = "#191970"
  @State showSteps: boolean = true
  @State showTips: boolean = true
  @StoragePropRef('trackThickness') trackThickness: Length = '10px'
  @State modeT: string = 'mode'

  build() {
    Column() {
      Row(){
        Text(this.vInSetValueOne + "").fontSize(9).fontColor(0xCCCCCC).key('tex').id('tex')
        Text(this.modeT).fontSize(9).fontColor(0xCCCCCC).key('modeT').id('modeT')
        Slider({
          value: this.vOutSetValueOne,
          style: SliderStyle.OutSet,
          direction: Axis.Vertical
        })
          .blockColor(this.blockColor)
          .trackColor(this.trackColor)
          .selectedColor(this.selectedColor)
          .showTips(this.showTips)
          .trackThickness(this.trackThickness)
          .showSteps(this.showSteps)
          .onChange((value: number, mode: SliderChangeMode) => {
            this.vOutSetValueOne = value
            console.info('value:' + value + 'mode:' + mode.toString())
          })
          .key('sliderA')
          .id('sliderA')

      }
      .justifyContent(FlexAlign.Start)
      .height('50%')
      Column() {
        Slider({
          value: this.vInSetValueOne,
          style: this.style,
          direction: this.directionT,
          reverse: this.reverse, // 竖向的Slider默认是上端是min值，下端是max值，因此想要从下往上滑动，需要设置reverse为true
          min: this.min,
          max: this.max,
          step: this.step
        }).showTips(true)
          .onChange((value: number, mode: SliderChangeMode) => {
            AppStorage.setOrCreate<number>("vInSetValueOne",value)
            console.info('value:' + value + 'm`ode:' + mode.toString())
          }).key('sliderConstructor').id('sliderConstructor')
        Slider().showTips(true)
          .onChange((value: number, mode: SliderChangeMode) => {
            this.vInSetValueOne1 = value
            this.modeT = mode.toString()
            console.info('11111value:' + value + 'm`ode:' + mode.toString())
          }).key('sliderConstructor2').id('sliderConstructor2')
      }
      .height('40%')
      .width('90%')
    }
    .width('100%')
    .height('100%')
  }
}