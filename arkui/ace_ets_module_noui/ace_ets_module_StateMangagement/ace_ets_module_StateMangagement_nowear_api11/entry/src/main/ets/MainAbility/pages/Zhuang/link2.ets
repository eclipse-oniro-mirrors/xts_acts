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
struct  CompE{
  @Link type1: ButtonType | undefined | null
  @Link type2: ButtonType | undefined | null
  @Link number1: number | undefined | null
  @Link number2: number | undefined | null
  build(){
    Row(){
      Column() {

        Row(){
          Column(){
            Text("type-->undefined").height('5%')
            Button('button').height('5%')
              .type(this.type1)
              .onClick(() => {
                this.type1 = undefined
              })
              .key('linkBtn1')
          }

          Column(){
            Text("type-->null").height('5%')
            Button('button').height('5%')
              .type(this.type2)
              .onClick(() => {
                this.type2 = null
              })
              .key('linkBtn2')
          }
        }

        Row(){
          Column(){
            Text("文本10-->undefined").height('5%')
            Button('button').height('5%')
              .fontSize(this.number1)
              .onClick(() => {
                this.number1 = undefined
              })
              .key('linkBtn3')
          }

          Column(){
            Text("文本10-->null").height('5%')
            Button('button').height('5%')
              .fontSize(this.number2)
              .onClick(() => {
                this.number2 = null
              })
              .key('linkBtn4')
          }
        }

      }.width('100%')
    }
  }

}






@Entry
@Component
struct Link1 {
  @State type1: ButtonType | undefined | null = ButtonType.Circle
  @State type2: ButtonType | undefined | null = ButtonType.Circle
  @State number1: number | undefined | null = 10
  @State number2: number | undefined | null = 10

  build() {
    Row() {
      Scroll() {
        Row() {

          Column() {
            Button('compare').key('compareBtn')
            Row(){
              Column(){
                Text("Link:type->undefined")
                Button('button')
                  .type(this.type1)
                  .onClick(() => {
                    this.type1 = undefined
                  })
                  .key('liBtn1')
              }
              Column(){
                Text("Link:type-->null")
                Button('button')
                  .type(this.type2)
                  .onClick(() => {
                    this.type2 = null
                  })
                  .key('liBtn2')
              }

            }

            Row(){
              Column(){
                Text("Link文本10-->undefined")
                Button('button')
                  .fontSize(this.number1)
                  .onClick(() => {
                    this.number1 = undefined
                  })
                  .key('liBtn3')
              }

              Column(){

                Text("Link文本10-->null")
                Button('button')
                  .fontSize(this.number2)
                  .onClick(() => {
                    this.number2 = null
                  })
                  .key('liBtn4')
              }

            }

            CompE({ type1:this.type1,type2:this.type2,number1:this.number1,number2:this.number2})

          }.width('100%')
        }
      }
    }
  }
}