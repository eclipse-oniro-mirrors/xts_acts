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
struct  CompC{
  @Consume color1: Color | undefined | null
  @Consume color2: Color | undefined | null
  @Consume number1:number | undefined | null
  @Consume number2: number | undefined | null
  build(){
    Row(){
      Column() {
        Text("Consume子组件颜色undefined-->Pink").height('5%')
        Button('button').height('5%')
          .backgroundColor(this.color1)
          .onClick(() => {
            this.color1 = Color.Pink
          })
          .key('cBtn1')

        Text("Consume子组件颜色null-->Pink").height('5%')
        Button('button').height('5%')
          .backgroundColor(this.color2)
          .onClick(() => {
            this.color2 = Color.Pink
          })
          .key('cBtn2')

        Text("Consume子组件文本undefined-->100").height('5%')
        Button('button').height('5%')
          .fontSize(this.number1)
          .onClick(() => {
            this.number1 = 100
          })
          .key('cBtn3')

        Text("Consume子组件文本null-->100").height('5%')
        Button('button').height('5%')
          .fontSize(this.number2)
          .onClick(() => {
            this.number2 = 100
          })
          .key('cBtn4')

      }.width('100%')
    }
  }

}






@Entry
@Component
struct provide1 {
  @Provide color1: Color | undefined | null = undefined
  @Provide color2: Color | undefined | null = null
  @Provide number1: number | undefined | null = undefined
  @Provide number2: number | undefined | null = null

  build() {
    Row() {
      Scroll() {
        Row() {

          Column() {
            Text("Provide父组件颜色undefined-->Pink").height('5%')
            Button('button').height('5%')
              .backgroundColor(this.color1)
              .onClick(() => {
                this.color1 = Color.Pink
              })
              .key('pBtn1')

            Text("Provide父组件颜色null-->Pink").height('5%')
            Button('button').height('5%')
              .backgroundColor(this.color2)
              .onClick(() => {
                this.color2 = Color.Pink
              })
              .key('pBtn2')

            Text("Provide父组件文本undefined-->100").height('5%')
            Button('button').height('5%')
              .fontSize(this.number1)
              .onClick(() => {
                this.number1 = 100
              })
              .key('pBtn3')

            Text("Provide父组件文本null-->100").height('5%')
            Button('button').height('5%')
              .fontSize(this.number2)
              .onClick(() => {
                this.number2 = 100
              })
              .key('pBtn4')

            CompC()

          }.width('100%')
        }
      }
    }
  }
}