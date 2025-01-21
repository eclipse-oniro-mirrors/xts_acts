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
@Observed
class classA {
  public color1:Color | undefined | null
  public color2: Color | undefined | null
  public number1:number | undefined | null
  public number2:number | undefined | null

  constructor(color1: Color | undefined | null, color2: Color | undefined | null, number1: number | undefined | null, number2:number | undefined | null) {
    this.color1=color1
    this.color2=color2
    this.number1=number1
    this.number2=number2


  }
}


@Component
struct ViewA {
  @ObjectLink a:classA
  build() {
    Row() {
      Row({ space: 5 }) {

        Column({ space: 20 }) {
          Text("@ObjectLink子组件颜色Red-->undefined")
          Button('button')
            .backgroundColor(this.a.color1)
            .onClick(() => {
              this.a.color1 = undefined
            })
            .key('ziobBtn1')

          Text("@ObjectLink子组件颜色Red-->null")
          Button('button')
            .backgroundColor(this.a.color2)
            .onClick(() => {
              this.a.color2 = null
            })
            .key('ziobBtn2')

          Text("@ObjectLink子组件文本100-->undefined")
          Button('button')
            .fontSize(this.a.number1)
            .onClick(() => {
              this.a.number1 = undefined
            })
            .key('ziobBtn3')

          Text("@ObjectLink子组件文本100-->null")
          Button('button')
            .fontSize(this.a.number2)
            .onClick(() => {
              this.a.number2 = null
            })
            .key('ziobBtn4')

        }.width('100%').margin({ top: 10 })
      }
    }
  }
}
@Entry
@Component
struct ViewB {
  @State b:classA = new classA(Color.Red,Color.Red,100,100)
  build() {
    Row() {
      Scroll() {
        Row({ space: 5 }) {

          Column({ space: 20 }) {
            Text("@ObjectLink父组件颜色Red-->undefined")
            Button('button')
              .backgroundColor(this.b.color1)
              .onClick(() => {
                this.b.color1 = undefined
              })
              .key('obBtn1')

            Text("@ObjectLink父组件颜色Red-->null")
            Button('button')
              .backgroundColor(this.b.color2)
              .onClick(() => {
                this.b.color2 = null
              })
              .key('obBtn2')

            Text("@ObjectLink父组件文本100-->undefined")
            Button('button')
              .fontSize(this.b.number1)
              .onClick(() => {
                this.b.number1 = undefined
              })
              .key('obBtn3')

            Text("@ObjectLink父组件文本100-->null")
            Button('button')
              .fontSize(this.b.number2)
              .onClick(() => {
                this.b.number2 = null
              })
              .key('obBtn4')

            ViewA({a:this.b})

          }.width('100%').margin({ top: 10 })
        }
      }
    }
  }
}