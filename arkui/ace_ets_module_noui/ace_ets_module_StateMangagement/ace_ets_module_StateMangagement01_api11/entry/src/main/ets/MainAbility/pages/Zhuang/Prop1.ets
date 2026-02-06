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
struct CountDownComponent {
  @Prop color1: Color | undefined | null
  @Prop color2: Color | undefined | null
  @Prop number1: number | undefined | null
  @Prop number2: number | undefined | null

  build() {
    Row(){
      Column() {
        Text("Prop子组件颜色undefined-->Pink").height('5%')
        Button('button').height('5%')
          .backgroundColor(this.color1)
          .onClick(() => {
            this.color1 = Color.Pink
          })
          .key('ziPropBtn1')

        Text("Prop子组件颜色null-->Pink").height('5%')
        Button('button').height('5%')
          .backgroundColor(this.color2)
          .onClick(() => {
            this.color2 = Color.Pink
          })
          .key('ziPropBtn2')

        Text("Prop子组件文本undefined-->100").height('5%')
        Button('button').height('5%')
          .fontSize(this.number1)
          .onClick(() => {
            this.number1 = 100
          })
          .key('ziPropBtn3')

        Text("Prop子组件文本null-->100").height('5%')
        Button('button').height('5%')
          .fontSize(this.number2)
          .onClick(() => {
            this.number2 = 100
          })
          .key('ziPropBtn4')

      }.width('100%')
    }

  }
}

@Entry
@Component
struct ParentComponent {
  @State color1: Color | undefined | null = undefined
  @State color2: Color | undefined | null = null
  @State number1: number | undefined | null = undefined
  @State number2: number | undefined | null = null

  build() {

    Row() {
      Scroll() {
        Row() {

          Column() {
            Text("Prop父组件颜色undefined-->Pink").height('5%')
            Button('button').height('5%')
              .backgroundColor(this.color1)
              .onClick(() => {
                this.color1 = Color.Pink
              })
              .key('propBtn1')

            Text("Prop父组件颜色null-->Pink").height('5%')
            Button('button').height('5%')
              .backgroundColor(this.color2)
              .onClick(() => {
                this.color2 = Color.Pink
              })
              .key('propBtn2')

            Text("Prop父组件文本undefined-->100").height('5%')
            Button('button').height('5%')
              .fontSize(this.number1)
              .onClick(() => {
                this.number1 = 100
              })
              .key('propBtn3')

            Text("Prop父组件文本null-->100").height('5%')
            Button('button').height('5%')
              .fontSize(this.number2)
              .onClick(() => {
                this.number2 = 100
              })
              .key('propBtn4')

            CountDownComponent({ color1:this.color1,color2:this.color2,number1:this.number1,number2:this.number2})

          }.width('100%')
        }
      }
    }
  }
}
