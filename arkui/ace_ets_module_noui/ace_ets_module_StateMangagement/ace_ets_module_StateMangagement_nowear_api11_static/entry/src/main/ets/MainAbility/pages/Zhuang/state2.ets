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
  ButtonType
} from '@ohos.arkui.component'
import {
  State,
  Link,
} from '@ohos.arkui.stateManagement'
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import common from '@ohos.app.ability.common';

@Entry
@Component
struct state2 {
  @State type1: ButtonType | undefined = ButtonType.Circle
  @State type2: ButtonType | undefined = ButtonType.Circle
  @State number1:number | undefined = 10
  @State number2: number | undefined = 10

  aboutToAppear(){
    let uiContext = this.getUIContext();
    let state2 = uiContext.getRouter();
    AppStorage.setOrCreate<Router>("state2",  state2);
  }

  build() {
    Column() {
      Button('compare').key('compareBtn')
      Text("State:type-->undefined").height('5%')
      Button('button').height('5%')
        .type(this.type1)
        .onClick((e: ClickEvent) => {
          this.type1 = undefined
        })
        .key('stBtn1')
        .id('stBtn1')

      Text("State:type-->null").height('5%')
      Button('button').height('5%')
        .type(this.type2)
        .onClick((e: ClickEvent) => {
          this.type2 = undefined
        })
        .key('stBtn2')
        .id('stBtn2')

      Text("State文本10-->undefined").height('5%')
      Button('button').height('5%')
        .fontSize(this.number1)
        .onClick((e: ClickEvent) => {
          this.number1 = undefined
        })
        .key('stBtn3')
        .id('stBtn3')

      Text("State文本10-->null").height('5%')
      Button('button').height('5%')
        .fontSize(this.number2)
        .onClick((e: ClickEvent) => {
          this.number2 = undefined
        })
        .key('stBtn4')
        .id('stBtn4')



    }.width('100%')
  }
}