'use static';
/*
 * Copyright (C) 2025 Huawei Device Co., Ltd.
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
import {
  Entry,
  Column,
  Component,
  Button,
  ClickEvent,
  Text,
  Row,
  Scroll,
  ButtonType
} from '@ohos.arkui.component'
import {
  State,
  Link,
  PropRef,
  Observed,
  ObjectLink,
} from '@ohos.arkui.stateManagement'
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import common from '@ohos.app.ability.common';
@Observed
class classA {
  public type1:ButtonType | undefined
  public type2: ButtonType | undefined
  public number1:number | undefined
  public number2:number | undefined

  constructor(type1: ButtonType | undefined, type2: ButtonType | undefined, number1: number | undefined, number2:number | undefined) {
    this.type1=type1
    this.type2=type2
    this.number1=number1
    this.number2=number2


  }
}


@Component
struct ViewA {
  //@ObjectLink a:classA = new classA(ButtonType.Circle,ButtonType.Circle,10,10)
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
                .onClick((e: ClickEvent) => {
                  this.a.type1 = undefined
                })
                .key('ziobBtn1')
            }
            Column(){
              Text("type-->null").height('5%')
              Button('button').height('5%')
                .type(this.a.type2)
                .onClick((e: ClickEvent) => {
                  this.a.type2 = undefined
                })
                .key('ziobBtn2')
            }

          }


          Row(){
            Column(){
              Text("文本10-->undefined").height('5%')
              Button('button').height('5%')
                .fontSize(this.a.number1)
                .onClick((e: ClickEvent) => {
                  this.a.number1 = undefined
                })
                .key('ziobBtn3')
            }

            Column(){
              Text("文本10-->null").height('5%')
              Button('button').height('5%')
                .fontSize(this.a.number2)
                .onClick((e: ClickEvent) => {
                  this.a.number2 = undefined
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
  aboutToAppear(){
    let uiContext = this.getUIContext();
    let objectLink2 = uiContext.getRouter();
    AppStorage.setOrCreate<Router>("objectLink2",  objectLink2);
  }
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
                  .onClick((e: ClickEvent) => {
                    this.b.type1 = undefined
                  })
                  .key('obBtn1')
              }
              Column(){
                Text("父type-->null").height('5%')
                Button('button').height('5%')
                  .type(this.b.type2)
                  .onClick((e: ClickEvent) => {
                    this.b.type2 = undefined
                  })
                  .key('obBtn2')
              }

            }

            Row(){
              Column(){
                Text("父文本10-->undefined").height('5%')
                Button('button').height('5%')
                  .fontSize(this.b.number1)
                  .onClick((e: ClickEvent) => {
                    this.b.number1 = undefined
                  })
                  .key('obBtn3')
              }

              Column(){
                Text("父文本10-->null").height('5%')
                Button('button').height('5%')
                  .fontSize(this.b.number2)
                  .onClick((e: ClickEvent) => {
                    this.b.number2 = undefined
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