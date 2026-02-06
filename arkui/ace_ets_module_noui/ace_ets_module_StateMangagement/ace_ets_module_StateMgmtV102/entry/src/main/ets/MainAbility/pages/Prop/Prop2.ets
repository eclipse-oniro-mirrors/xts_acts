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
struct CountDownComponent1{
  @Prop type1: ButtonType | undefined | null
  @Prop type2: ButtonType | undefined | null
  @Prop number1: number | undefined | null
  @Prop number2: number | undefined | null

  build() {
    Row(){
      Column() {

        Row(){
          Column(){
            Text('type-->undefined').height('5%')
            Button('button').height('5%')
              .type(this.type1)
              .onClick(() => {
                this.type1 = undefined
              })
              .key('ziProp2Btn1')
          }

          Column(){
            Text('type-->null').height('5%')
            Button('button').height('5%')
              .type(this.type2)
              .onClick(() => {
                this.type2 = null
              })
              .key('ziProp2Btn2')
          }

        }

        Row(){
          Column(){
            Text('文本10-->undefined').height('5%')
            Button('button').height('5%')
              .fontSize(this.number1)
              .onClick(() => {
                this.number1 = undefined
              })
              .key('ziProp2Btn3')
          }
          Column(){
            Text('文本10-->null').height('5%')
            Button('button').height('5%')
              .fontSize(this.number2)
              .onClick(() => {
                this.number2 = null
              })
              .key('ziProp2Btn4')
          }
        }
      }.width('100%')
    }

  }
}

@Entry
@Component
struct ParentComponent1 {
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
                Text('Prop-->undefined').height('5%')
                Button('button').height('5%')
                  .type(this.type1)
                  .onClick(() => {
                    this.type1 = undefined
                  })
                  .key('prop2Btn1')
              }
              Column(){
                Text('Prop-->null').height('5%')
                Button('button').height('5%')
                  .type(this.type2)
                  .onClick(() => {
                    this.type2 = null
                  })
                  .key('prop2Btn2')
              }

            }
            Row(){
              Column(){
                Text('文本10-->undefined').height('5%')
                Button('button').height('5%')
                  .fontSize(this.number1)
                  .onClick(() => {
                    this.number1 = undefined
                  })
                  .key('prop2Btn3')

              }
              Column(){
                Text('文本10-->null').height('5%')
                Button('button').height('5%')
                  .fontSize(this.number2)
                  .onClick(() => {
                    this.number2 = null
                  })
                  .key('prop2Btn4')
              }
            }
            CountDownComponent1({
              type1: this.type1,
              type2: this.type2,
              number1: this.number1,
              number2: this.number2
            })


          }.width('100%')
        }
      }

    }

  }
}