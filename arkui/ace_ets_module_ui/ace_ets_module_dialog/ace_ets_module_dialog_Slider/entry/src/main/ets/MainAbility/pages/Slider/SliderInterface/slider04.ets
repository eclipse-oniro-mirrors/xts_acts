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
struct Slider04 {
  @State outSetValueOne: number = 20

  build() {
    Row() {
      Slider({
        value: this.outSetValueOne,
        min: 100.1,
        step: 10,
        max: 100
      })
        .id('Slider04')
        .width('400px')
        .showTips(true)
        .onChange((value: number, mode: SliderChangeMode) => {
          this.outSetValueOne = value
          console.info('value:' + value + 'mode:' + mode.toString())
        })
    }
    .width(300)
    .height(200)
    .position({ x: 40, y: 60 })
  }
}