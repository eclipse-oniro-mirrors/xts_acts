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
import { BusinessError } from '@ohos.base'
import { Entry, Component, Column, ColumnOptions, Text, Button, ClickEvent } from '@ohos.arkui.component'
import { State } from '@ohos.arkui.stateManagement';


@Entry
@Component
struct router_back8 {
  @State str:string = '1'

  build() {
    Column({space:5} as ColumnOptions) {

      Text(this.str).id('router_back8_text')

      Button('getParams')
        .id('router_back8_btn1')
        .onClick((e:ClickEvent)=>{
          this.str = JSON.stringify(this.getUIContext().getRouter().getParams()) + ''
        })

      Button('go to second')
        .id('router_back8_btn2')
        .onClick((e:ClickEvent)=>{
          this.getUIContext().getRouter().pushUrl({url:"MainAbility/pages/router/router_back08"})
        })



    }.width('100%').height('100%')


  }
}