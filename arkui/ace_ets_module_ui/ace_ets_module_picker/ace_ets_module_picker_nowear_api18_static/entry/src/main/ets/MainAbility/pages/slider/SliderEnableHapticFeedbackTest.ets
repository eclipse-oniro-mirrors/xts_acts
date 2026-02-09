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
import { Entry, Column, Component, Row, Button, Slider, SliderChangeMode, ClickEvent, ColumnOptions, Margin, SliderStyle, Axis } from '@ohos.arkui.component'
import { State } from '@ohos.arkui.stateManagement'

@Entry
@Component
struct SliderExample4 {
  @State enableHapticFeedback: boolean | undefined = true
  @State showSteps: boolean = true
  @State flag: number = 1
  @State flag1: number = 1
  @State outSetValueOne: number = 40

  build() {
    Column({ space: 8 } as ColumnOptions) {
      Row() {
        Slider({
          step: 20,
          value: this.outSetValueOne,
          style: SliderStyle.OutSet,
          direction: Axis.Horizontal,
          reverse: false
        })
          .id('slider')
          .showSteps(this.showSteps)
          .showTips(true)
          .enableHapticFeedback(this.enableHapticFeedback)
          .onChange((value: number, mode: SliderChangeMode) => {
            this.outSetValueOne = value
            console.info('value:' + value + 'mode:' + mode.toString())
          })
      }.width('80%')
      .height('40%')

      Button('true')
        .id('enableHapticFeedback_true')
        .onClick((e: ClickEvent) => {
          this.enableHapticFeedback = true
        })
      Button('false')
        .id('enableHapticFeedback_false')
        .onClick((e: ClickEvent) => {
          this.enableHapticFeedback = false
        })
      Button('undefined')
        .id('enableHapticFeedback_undefied')
        .onClick((e: ClickEvent) => {
          this.enableHapticFeedback = undefined
        })
      Button('null')
        .id('enableHapticFeedback_null')
        .onClick((e: ClickEvent) => {
        })
      Button('切换showSteps值-' + this.showSteps)
        .id('showSteps_value')
        .onClick((e: ClickEvent) => {
          if (this.flag1 == 1) {
            this.flag1 = 2;
            this.showSteps = false
          } else if (this.flag1 == 2) {
            this.flag1 = 1;
            this.showSteps = true
          }
        })
    }.width('100%')
  }
}


