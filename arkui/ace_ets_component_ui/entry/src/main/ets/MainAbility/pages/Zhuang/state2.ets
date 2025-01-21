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
@Entry
@Component
struct state2 {
  @State color1: Color | undefined | null = Color.Red
  @State color2: Color | undefined | null = Color.Red
  @State number1:number | undefined | null = 100
  @State number2: number | undefined | null = 100

  build() {
    Column({ space: 20 }) {
      Text("State颜色Red-->undefined")
      Button('button')
        .backgroundColor(this.color1)
        .onClick(() => {
          this.color1 = undefined
        })
        .key('stBtn1')

      Text("State颜色Red-->null")
      Button('button')
        .backgroundColor(this.color2)
        .onClick(() => {
          this.color2 = null
        })
        .key('stBtn2')

      Text("State文本100-->undefined")
      Button('button')
        .fontSize(this.number1)
        .onClick(() => {
          this.number1 = undefined
        })
        .key('stBtn3')

      Text("State文本100-->null")
      Button('button')
        .fontSize(this.number2)
        .onClick(() => {
          this.number2 = null
        })
        .key('stBtn4')



    }.width('100%').margin({top:10})
  }
}