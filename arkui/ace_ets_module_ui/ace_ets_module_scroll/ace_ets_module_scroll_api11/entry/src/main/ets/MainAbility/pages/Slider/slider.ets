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
 import {MessageManager,Callback} from '../../utils/MessageManager';

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
  @State blockColor: string = "#191970"
  @State trackColor: string = "#ADD8E6"
  @State selectedColor: string = "#191970"
  @State showSteps: boolean = true
  @State showTips: boolean = true
  @State trackThickness: string = '10px'
  @State modeT: string = 'mode'

  messageManager:MessageManager = new MessageManager()

  onPageShow() {
    console.info('slider onPageShow')
    globalThis.value = {
      name:'messageManager',message:this.messageManager
    }
    let callback:Callback = (message: ESObject) => {
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
    Column({ space: 8 }) {
      Text('outset slider').fontSize(9).fontColor(0xCCCCCC).width('90%').margin(15)
      Row() {
        Slider({
          value: this.outSetValueOne,
          min: 0,
          max: 100,
          style: SliderStyle.OutSet
        })
          .showTips(true)
          .onChange((value: number, mode: SliderChangeMode) => {
            this.outSetValueOne = value
            console.info('value:' + value + 'mode:' + mode.toString())
          })
        // toFixed(0)将滑动条返回值处理为整数精度
        Text(this.outSetValueOne.toFixed(0)).fontSize(12)
      }
      .width('80%')
      Row() {
        Slider({
          value: this.outSetValueTwo,
          step: 10,
          style: SliderStyle.OutSet
        })
          .showSteps(true)
          .onChange((value: number, mode: SliderChangeMode) => {
            this.outSetValueTwo = value
            console.info('value:' + value + 'mode:' + mode.toString())
          })
        Text(this.outSetValueTwo.toFixed(0)).fontSize(12)
      }
      .width('80%')

      Text('inset slider').fontSize(9).fontColor(0xCCCCCC).width('90%').margin(15)
      Row() {
        Slider({
          value: this.inSetValueOne,
          min: 0,
          max: 100,
          style: SliderStyle.InSet
        })
          .blockColor('#191970')
          .trackColor('#ADD8E6')
          .selectedColor('#4169E1')
          .showTips(true)
          .onChange((value: number, mode: SliderChangeMode) => {
            this.inSetValueOne = value
            console.info('value:' + value + 'mode:' + mode.toString())
          })
        Text(this.inSetValueOne.toFixed(0)).fontSize(12)
      }
      .width('80%')
      Row() {
        Slider({
          value: this.inSetValueTwo,
          step: 10,
          style: SliderStyle.InSet
        })
          .blockColor('#191970')
          .trackColor('#ADD8E6')
          .selectedColor('#4169E1')
          .showSteps(true)
          .showTips(true)
          .onChange((value: number, mode: SliderChangeMode) => {
            this.inSetValueTwo = value
            console.info('value:' + value + 'mode:' + mode.toString())
          })
        Text(this.inSetValueTwo.toFixed(0)).fontSize(12)
      }
      .width('80%')

      Row() {
        Column() {
          Text('vertical outset slider').fontSize(9).fontColor(0xCCCCCC).width('50%').margin(15)
          Row() {
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
              }).key('sliderA')
            Slider({
              value: this.vOutSetValueTwo,
              step: 10,
              style: SliderStyle.OutSet,
              direction: Axis.Vertical
            })
              .blockColor('#191970')
              .trackColor('#ADD8E6')
              .selectedColor('#4169E1')
              .showSteps(true)
              .onChange((value: number, mode: SliderChangeMode) => {
                this.vOutSetValueTwo = value
                console.info('value:' + value + 'mode:' + mode.toString())
              })
          }
        }.width('50%').height(300)

        Column() {
          Text(this.vInSetValueOne+"").fontSize(9).fontColor(0xCCCCCC).width('50%').margin(15).key('tex')
          Text(this.modeT).fontSize(9).fontColor(0xCCCCCC).width('50%').margin(15).key('modeT')
          Row() {
            Slider({
              value: this.vInSetValueOne,
              style: this.style,
              direction: this.directionT,
              reverse: this.reverse,// 竖向的Slider默认是上端是min值，下端是max值，因此想要从下往上滑动，需要设置reverse为true
              min:this.min,
              max:this.max,
              step:this.step
            }).showTips(true)
              .onChange((value: number, mode: SliderChangeMode) => {
                this.vInSetValueOne = value
                console.info('value:' + value + 'm`ode:' + mode.toString())
              }).key('sliderConstructor')

            Slider({
              value: this.vInSetValueTwo,
              step: 10,
              style: SliderStyle.InSet,
              direction: Axis.Vertical,
              reverse: true
            }).showSteps(true)
              .onChange((value: number, mode: SliderChangeMode) => {
                this.vInSetValueTwo = value
                console.info('value:' + value + 'mode:' + mode.toString())
              })

            Slider().showTips(true)
              .onChange((value: number, mode: SliderChangeMode) => {
                this.vInSetValueOne1 = value
                this.modeT = mode.toString()
                console.info('value:' + value + 'm`ode:' + mode.toString())
              }).key('sliderConstructor2')

          }
        }.width('50%').height(300)
      }
    }.width('100%')
  }
}