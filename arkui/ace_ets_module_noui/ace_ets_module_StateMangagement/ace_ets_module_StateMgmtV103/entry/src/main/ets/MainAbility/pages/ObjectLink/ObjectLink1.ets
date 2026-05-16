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
class classB {
  public color1: Color | undefined | null
  public color2: Color | undefined | null
  public number1: number | undefined | null
  public number2: number | undefined | null

  constructor(color1:Color | undefined | null, color2: Color | undefined | null, number1: number | undefined | null, number2: number | undefined | null) {
    this.color1=color1
    this.color2=color2
    this.number1=number1
    this.number2=number2

  }
}


@Component
struct ViewC {
  @ObjectLink a:classB
  build() {
    Row() {
        Row() {

          Column() {
            Text("@ObjectLink颜色子组件undefined-->Pink").height('5%')
            Button('button').height('5%')
              .backgroundColor(this.a.color1)
              .onClick(() => {
                this.a.color1 = Color.Pink
              })
              .key('zioBtn1')

            Text("@ObjectLink子组件颜色null-->Pink").height('5%')
            Button('button').height('5%')
              .backgroundColor(this.a.color2)
              .onClick(() => {
                this.a.color2 = Color.Pink
              })
              .key('zioBtn2')

            Text("@ObjectLink子组件文本undefined-->100").height('5%')
            Button('button').height('5%')
              .fontSize(this.a.number1)
              .onClick(() => {
                this.a.number1 = 100
              })
              .key('zioBtn3')

            Text("@ObjectLink子组件文本null-->100").height('5%')
            Button('button').height('5%')
              .fontSize(this.a.number2)
              .onClick(() => {
                this.a.number2 = 100
              })
              .key('zioBtn4')

          }.width('100%')
        }
      }
    }
}
@Entry
@Component
struct ViewD {
@State b:classB = new classB(undefined,null,undefined,null)
  build() {
    Row() {
      Scroll() {
        Row() {

          Column() {
            Text("@ObjectLink父组件颜色undefined-->Pink").height('5%')
            Button('button').height('5%')
              .backgroundColor(this.b.color1)
              .onClick(() => {
                this.b.color1 = Color.Pink
              })
              .key('oBtn1')

            Text("@ObjectLink父组件颜色null-->Pink").height('5%')
            Button('button').height('5%')
              .backgroundColor(this.b.color2)
              .onClick(() => {
                this.b.color2 = Color.Pink
              })
              .key('oBtn2')

            Text("@ObjectLink父组件文本undefined-->100").height('5%')
            Button('button').height('5%')
              .fontSize(this.b.number1)
              .onClick(() => {
                this.b.number1 = 100
              })
              .key('oBtn3')

            Text("@ObjectLink父组件文本null-->100").height('5%')
            Button('button').height('5%')
              .fontSize(this.b.number2)
              .onClick(() => {
                this.b.number2 = 100
              })
              .key('oBtn4')

            ViewC({a:this.b})

          }.width('100%')
        }
      }
    }
  }
}