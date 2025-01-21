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
  @State type1: ButtonType | undefined | null = ButtonType.Circle
  @State type2: ButtonType | undefined | null = ButtonType.Circle
  @State number1:number | undefined | null = 10
  @State number2: number | undefined | null = 10

  build() {
    Column({ space: 20 }) {
      Text("State:type-->undefined")
      Button('button')
        .type(this.type1)
        .onClick(() => {
          this.type1 = undefined
        })
        .key('stBtn1')

      Text("State:type-->null")
      Button('button')
        .type(this.type2)
        .onClick(() => {
          this.type2 = null
        })
        .key('stBtn2')

      Text("State文本10-->undefined")
      Button('button')
        .fontSize(this.number1)
        .onClick(() => {
          this.number1 = undefined
        })
        .key('stBtn3')

      Text("State文本10-->null")
      Button('button')
        .fontSize(this.number2)
        .onClick(() => {
          this.number2 = null
        })
        .key('stBtn4')



    }.width('100%').margin({top:10})
  }
}