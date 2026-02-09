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
struct  CompD{
  @Link color1:Color | undefined | null
  @Link color2: Color | undefined | null
  @Link number1: number | undefined | null
  @Link number2: number | undefined | null
  build(){
    Row(){
      Column() {
        Text("Link子组件颜色undefined-->Pink").height('3%')
        Button('button').height('3%')
          .backgroundColor(this.color1)
          .onClick(() => {
            this.color1 = Color.Pink
          })
          .key('zilBtn1')

        Text("Link子组件颜色null-->Pink").height('3%')
        Button('button').height('3%')
          .backgroundColor(this.color2)
          .onClick(() => {
            this.color2 = Color.Pink
          })
          .key('zilBtn2')

        Text("Link子组件文本undefined-->10").height('3%')
        Button('button').height('3%')
          .fontSize(this.number1)
          .onClick(() => {
            this.number1 = 10
          })
          .key('zilBtn3')

        Text("Link子组件文本null-->10").height('3%')
        Button('button').height('3%')
          .fontSize(this.number2)
          .onClick(() => {
            this.number2 = 10
          })
          .key('zilBtn4')


      }.width('100%')
    }
  }

}






@Entry
@Component
struct In {
  @State color1: Color | undefined | null = undefined
  @State color2: Color | undefined | null = null
  @State number1:number | undefined | null = undefined
  @State number2: number | undefined | null = null

  build() {
    Row() {
      Scroll() {
        Row() {

          Column() {
            Text("Link父组件颜色undefined-->Pink").height('3%')
            Button('button').height('3%')
              .backgroundColor(this.color1)
              .onClick(() => {
                this.color1 = Color.Pink
              })
              .key('lBtn1')

            Text("Link父组件颜色null-->Pink").height('3%')
            Button('button').height('3%')
              .backgroundColor(this.color2)
              .onClick(() => {
                this.color2 = Color.Pink
              })
              .key('lBtn2')

            Text("Link父组件文本undefined-->10").height('3%')
            Button('button').height('3%')
              .fontSize(this.number1)
              .onClick(() => {
                this.number1 = 10
              })
              .key('lBtn3')

            Text("Link父组件文本null-->10").height('3%')
            Button('button').height('3%')
              .fontSize(this.number2)
              .onClick(() => {
                this.number2 = 10
              })
              .key('lBtn4')

            CompD({ color1:this.color1,color2:this.color2,number1:this.number1,number2:this.number2})

          }.width('100%')
        }
      }
    }
  }
}