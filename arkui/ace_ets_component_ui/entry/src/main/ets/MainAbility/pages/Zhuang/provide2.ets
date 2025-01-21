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
@Component
struct  CompB{
  @Consume color1: Color | undefined | null
  @Consume color2: Color | undefined | null
  @Consume number1: number | undefined | null
  @Consume number2: number | undefined | null
  build(){
    Row({ space: 5 }){
      Column({ space: 20 }) {
        Text("Consume子组件颜色Red-->undefined")
        Button('button')
          .backgroundColor(this.color1)
          .onClick(() => {
            this.color1 = undefined
          })
          .key('coBtn1')

        Text("Consume子组件颜色Red-->null")
        Button('button')
          .backgroundColor(this.color2)
          .onClick(() => {
            this.color2 = null
          })
          .key('coBtn2')

        Text("Consume子组件文本100-->undefined")
        Button('button')
          .fontSize(this.number1)
          .onClick(() => {
            this.number1 = undefined
          })
          .key('coBtn3')

        Text("Consume子组件文本100-->null")
        Button('button')
          .fontSize(this.number2)
          .onClick(() => {
            this.number2 = null
          })
          .key('coBtn4')



      }.width('100%').margin({top:10})
    }
  }

}






@Entry
@Component
struct provide2 {
  @Provide color1: Color | undefined | null = Color.Red
  @Provide color2: Color | undefined | null = Color.Red
  @Provide number1: number | undefined | null = 100
  @Provide number2: number | undefined | null = 100

  build() {
    Row() {
      Scroll() {
        Row({ space: 5 }) {

          Column({ space: 20 }) {
            Text("Provide父组件颜色Red-->undefined")
            Button('button')
              .backgroundColor(this.color1)
              .onClick(() => {
                this.color1 = undefined
              })
              .key('prBtn1')

            Text("Provide父组件颜色Red-->null")
            Button('button')
              .backgroundColor(this.color2)
              .onClick(() => {
                this.color2 = null
              })
              .key('prBtn2')

            Text("Provide父组件文本100-->undefined")
            Button('button')
              .fontSize(this.number1)
              .onClick(() => {
                this.number1 = undefined
              })
              .key('prBtn3')

            Text("Provide父组件文本100-->null")
            Button('button')
              .fontSize(this.number2)
              .onClick(() => {
                this.number2 = null
              })
              .key('prBtn4')

            CompB()

          }.width('100%').margin({top:10})
        }
      }
    }
  }
}