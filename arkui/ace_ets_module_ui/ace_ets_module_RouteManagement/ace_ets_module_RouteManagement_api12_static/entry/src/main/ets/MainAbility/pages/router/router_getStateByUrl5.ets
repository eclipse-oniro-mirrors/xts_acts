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
import {
  Entry,
  Column,
  Component,
  Button,
  Text,
  Row,
  Color,
  ColumnOptions,
  ClickEvent
} from '@ohos.arkui.component';
import { State, AppStorage } from '@ohos.arkui.stateManagement';

@Entry
@Component
struct router_getStateByUrl5 {
  @State str1: string = ''
  @State str2: string = ''
  @State str3: string = ''

  build() {
    Column({ space: 5 } as ColumnOptions) {

      Text(this.str1).id('router_getStateByUrl5_text1')

      Button('getStateByUrl1')
        .id('router_getStateByUrl5_btn1')
        .onClick((e:ClickEvent) => {
          this.str1 = JSON.stringify(this.getUIContext().getRouter().getStateByUrl('pages/Page')) + ''
        })

      Text(this.str2).id('router_getStateByUrl5_text2')
      Button('getStateByUrl2')
        .id('router_getStateByUrl5_btn2')
        .onClick((e:ClickEvent) => {
          this.str2 = JSON.stringify(this.getUIContext().getRouter().getStateByUrl('library')) + ''
        })

      Text(this.str3).id('router_getStateByUrl5_text3')
      Button('getStateByUrl3')
        .id('router_getStateByUrl5_btn3')
        .onClick((e:ClickEvent) => {
          this.str3 = JSON.stringify(this.getUIContext().getRouter().getStateByUrl('shared_library')) + ''
        })

    }.width('100%').height('100%')

  }
}