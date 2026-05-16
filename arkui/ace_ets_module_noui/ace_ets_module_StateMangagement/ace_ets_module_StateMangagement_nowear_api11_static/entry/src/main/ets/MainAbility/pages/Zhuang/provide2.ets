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
  Link,Consume,Provide
} from '@ohos.arkui.stateManagement'
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import common from '@ohos.app.ability.common';

@Component
struct  CompB{
  @Consume type1: ButtonType | undefined
  @Consume type2: ButtonType | undefined
  @Consume number1: number | undefined
  @Consume number2: number | undefined
  build(){
    Row(){
      Column() {
        Row(){
          Column(){
            Text("type-->undefined").height('5%')
            Button('button')
              .height('5%')
              .type(this.type1)
              .onClick(():void => {
                this.type1 = undefined
              })
              .key('coBtn1')
          }
          Column(){
            Text("type-->null").height('5%')
            Button('button').height('5%')
              .type(this.type2)
              .onClick(():void => {
                this.type2 = undefined
              })
              .key('coBtn2')
          }
        }
        Row(){
          Column(){
            Text("文本10-->undefined").height('5%')
            Button('button').height('5%')
              .fontSize(this.number1)
              .onClick(():void => {
                this.number1 = undefined
              })
              .key('coBtn3')
          }
          Column(){
            Text("文本10-->null").height('5%')
            Button('button').height('5%')
              .fontSize(this.number2)
              .onClick(():void => {
                this.number2 = undefined
              })
              .key('coBtn4')
          }
        }

      }.width('100%')
    }
  }

}






@Entry
@Component
struct provide2 {
  @Provide type1: ButtonType | undefined = ButtonType.Circle
  @Provide type2: ButtonType | undefined  = ButtonType.Circle
  @Provide number1: number | undefined  = 10
  @Provide number2: number | undefined  = 10

  build() {
    Row() {
      Scroll() {
        Row() {
          Column() {
            Button('compare').key('compareBtn')
            Row(){
              Column(){
                Text("type-->undefined").height('5%')
                Button('button').height('5%')
                  .type(this.type1)
                  .onClick(():void => {
                    this.type1 = undefined
                  })
                  .key('prBtn1')
              }
              Column(){
                Text("type-->null").height('5%')
                Button('button').height('5%')
                  .type(this.type2)
                  .onClick(():void => {
                    this.type2 = undefined
                  })
                  .key('prBtn2')

              }
            }
            Row(){
              Column(){
                Text("文本10-->undefined").height('5%')
                Button('button').height('5%')
                  .fontSize(this.number1)
                  .onClick(():void => {
                    this.number1 = undefined
                  })
                  .key('prBtn3')
              }
              Column(){
                Text("文本10-->null").height('5%')
                Button('button').height('5%')
                  .fontSize(this.number2)
                  .onClick(():void => {
                    this.number2 = undefined
                  })
                  .key('prBtn4')

              }
            }
            CompB()

          }.width('100%')
        }
      }
    }
  }
}