/**
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
import { MessageManager, Callback } from '../../utils/MessageManagerC';

@Entry
@Component
struct SliderExample {
  @State outSetValueOne: number = 40
  @State style: SliderStyle = SliderStyle.InSet
  @State directionT: Axis = Axis.Vertical
  @State reverse: boolean = true
  @State min: number = 2
  @State max: number = 1000
  @State step: number = 0.7
  @State inSetValueOne: number = 40
  @State outSetValueTwo: number = 40
  @State inSetValueTwo: number = 40
  @State vOutSetValueOne: number = 40
  @State vInSetValueOne: number = 40
  @State vInSetValueOne1: number = 40
  @State vOutSetValueTwo: number = 40
  @State vInSetValueTwo: number = 40
  @State blockColor: LinearGradient | string = "#191970"
  @State trackColor: string = "#ADD8E6"
  @State selectedColor: string = "#191970"
  @State showSteps: boolean = true
  @State showTips: boolean = true
  @State trackThickness: string = '10px'
  @State modeT: string = 'mode'
  messageManager: MessageManager = new MessageManager()

  onPageShow() {
    console.info('slider onPageShow')
    globalThis.value = {
      name: 'messageManager', message: this.messageManager
    }
    let callback: Callback = (message: ESObject) => {
      console.error('message = ' + message.name + "--" + message.value)
      if (message.name == 'vInSetValueOne') {
        this.vInSetValueOne = message.value
      }
      if (message.name == 'style') {
        this.style = message.value
      }
      if (message.name == 'directionT') {
        this.directionT = message.value
      }
      if (message.name == 'reverse') {
        this.reverse = message.value
      }
      if (message.name == 'min') {
        this.min = message.value
      }
      if (message.name == 'max') {
        this.max = message.value
      }
      if (message.name == 'step') {
        this.step = message.value
      }
      if (message.name == 'blockColor') {
        this.blockColor = message.value
      }
      if (message.name == 'trackColor') {
        this.trackColor = message.value
      }
      if (message.name == 'selectedColor') {
        this.selectedColor = message.value
      }
      if (message.name == 'showSteps') {
        this.showSteps = message.value
      }
      if (message.name == 'showTips') {
        this.showTips = message.value
      }
      if (message.name == 'trackThickness') {
        this.trackThickness = message.value
      }

    }
    this.messageManager.registerCallback(callback)
  }

  build() {
    Column() {
      Row(){
        Text(this.vInSetValueOne + "").fontSize(9).fontColor(0xCCCCCC).key('tex')
        Text(this.modeT).fontSize(9).fontColor(0xCCCCCC).key('modeT')
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
            this.vInSetValueOne = value
            console.info('value:' + value + 'm`ode:' + mode.toString())
          }).key('sliderConstructor')
        Slider().showTips(true)
          .onChange((value: number, mode: SliderChangeMode) => {
            this.vInSetValueOne1 = value
            this.modeT = mode.toString()
            console.info('value:' + value + 'm`ode:' + mode.toString())
          }).key('sliderConstructor2')
      }
      .height('40%')
      .width('90%')
    }
    .width('100%')
    .height('100%')
  }
}