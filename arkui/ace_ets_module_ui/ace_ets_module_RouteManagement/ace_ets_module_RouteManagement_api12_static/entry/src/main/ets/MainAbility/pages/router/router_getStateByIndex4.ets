'use static';
/**
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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
import router from '@ohos.router'
import { Entry, Component, Column, ColumnOptions, Text, Button, ClickEvent } from '@ohos.arkui.component'
import { State } from '@ohos.arkui.stateManagement';

@Entry
@Component
struct router_getStateByIndex4 {
  @State str1: string = '1'
  @State str2: string = '2'
  @State str3: string = '3'
  @State str4: string = '4'

  build() {
    Column({ space: 5 } as ColumnOptions) {

      Text(this.str1).id('router_getStateByIndex4_text1')
      Button('getStateByIndex(-100)')
        .id('router_getStateByIndex4_btn1')
        .onClick((e:ClickEvent) => {
          this.str1 = String(this.getUIContext().getRouter().getStateByIndex(-100))
        })


      Text(this.str2).id('router_getStateByIndex4_text2')
      Button('getStateByIndex(0)')
        .id('router_getStateByIndex4_btn2')
        .onClick((e:ClickEvent) => {
          this.str2 = String(this.getUIContext().getRouter().getStateByIndex(0))
        })

      Text(this.str3).id('router_getStateByIndex4_text3')
      Button('getStateByIndex(32)')
        .id('router_getStateByIndex4_btn3')
        .onClick((e:ClickEvent) => {
          this.str3 = String(this.getUIContext().getRouter().getStateByIndex(32))
        })

      Text(this.str4).id('router_getStateByIndex4_text4')
      Button('getStateByIndex(3)')
        .id('router_getStateByIndex4_btn4')
        .onClick((e:ClickEvent) => {
          this.str4 = String(this.getUIContext().getRouter().getStateByIndex(3))
        })

    }.width('100%').height('100%')

  }
}