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
  public type1:ButtonType | undefined | null
  public type2: ButtonType | undefined | null
  public number1:number | undefined | null
  public number2:number | undefined | null

  constructor(type1: ButtonType | undefined | null, type2: ButtonType | undefined | null, number1: number | undefined | null, number2:number | undefined | null) {
    this.type1=type1
    this.type2=type2
    this.number1=number1
    this.number2=number2


  }
}


@Component
struct ViewA {
  @ObjectLink a:classA
  build() {
    Row() {
      Row() {

        Column() {
          Row(){
            Column(){
              Text("type-->undefined").height('5%')
              Button('button').height('5%')
                .type(this.a.type1)
                .onClick(() => {
                  this.a.type1 = undefined
                })
                .key('ziobBtn1')
            }
            Column(){
              Text("type-->null").height('5%')
              Button('button').height('5%')
                .type(this.a.type2)
                .onClick(() => {
                  this.a.type2 = null
                })
                .key('ziobBtn2')
            }

          }


          Row(){
            Column(){
              Text("文本10-->undefined").height('5%')
              Button('button').height('5%')
                .fontSize(this.a.number1)
                .onClick(() => {
                  this.a.number1 = undefined
                })
                .key('ziobBtn3')
            }

            Column(){
              Text("文本10-->null").height('5%')
              Button('button').height('5%')
                .fontSize(this.a.number2)
                .onClick(() => {
                  this.a.number2 = null
                })
                .key('ziobBtn4')
            }

          }


        }.width('100%')
      }
    }
  }
}
@Entry
@Component
struct ViewB {
  @State b:classA = new classA(ButtonType.Circle,ButtonType.Circle,10,10)
  build() {
    Row() {
      Scroll() {
        Row() {

          Column() {
            Button('compare').key('compareBtn')
            Row(){
              Column(){
                Text("父type-->undefined").height('5%')
                Button('button').height('5%')
                  .type(this.b.type1)
                  .onClick(() => {
                    this.b.type1 = undefined
                  })
                  .key('obBtn1')
              }
              Column(){
                Text("父type-->null").height('5%')
                Button('button').height('5%')
                  .type(this.b.type2)
                  .onClick(() => {
                    this.b.type2 = null
                  })
                  .key('obBtn2')
              }

            }

            Row(){
              Column(){
                Text("父文本10-->undefined").height('5%')
                Button('button').height('5%')
                  .fontSize(this.b.number1)
                  .onClick(() => {
                    this.b.number1 = undefined
                  })
                  .key('obBtn3')
              }

              Column(){
                Text("父文本10-->null").height('5%')
                Button('button').height('5%')
                  .fontSize(this.b.number2)
                  .onClick(() => {
                    this.b.number2 = null
                  })
                  .key('obBtn4')
              }
            }

            ViewA({a:this.b})

          }.width('100%')
        }
      }
    }
  }
}