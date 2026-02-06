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
import common from '@ohos.app.ability.common';
import router from '@ohos.router';
import { Entry, Component, Column, Text, Image, Color, Padding, Button, ClickEvent, ColumnOptions} from '@ohos.arkui.component'
import { State,  AppStorage } from '@ohos.arkui.stateManagement'

@Entry
@Component
struct ObserverApi2Test {
  @State text1 :string = '1'

  build() {
    Column({ space: 5 } as ColumnOptions){

      Text(this.text1).id('ObserverApi2_text')

      Button('getText')
        .fontSize(14)
        .onClick((e: ClickEvent)=>{
          this.text1 = '' + AppStorage.get<string>('Observer_HIDE') + AppStorage.get<string>('Observer_APPEAR') + AppStorage.get<string>('Observer_SHOW')
        })
        .id('ObserverApi2_getText')

      Button('backToPageOne')
        .fontSize(14)
        .onClick((e: ClickEvent)=>{
          this.getUIContext().getRouter().back({url: "MainAbility/pages/observer/ObserverApi"})
        })
        .id('ObserverApi2_backToPageOne')
    }.width('100%')
  }
}
