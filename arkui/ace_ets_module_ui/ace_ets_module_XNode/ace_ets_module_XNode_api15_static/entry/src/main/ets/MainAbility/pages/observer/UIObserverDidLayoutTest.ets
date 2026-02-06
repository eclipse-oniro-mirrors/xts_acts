'use static';
/*
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
import observer from '@ohos.arkui.observer';
import { Entry, Column, Component, Text, Button, ClickEvent, Margin} from '@ohos.arkui.component'
import { State } from '@ohos.arkui.stateManagement'
@Entry
@Component
struct DidLayoutIndex {
  @State didLayout: string = 'start'

  didLayoutCallback:()=>void = () => {
    this.didLayout = 'DidLayout succ'
  }

  build() {
    Column() {
      Text(this.didLayout).id('didLayout_value_id')

      Button('didLayout on').id('didLayout_on_id')
        .margin({ bottom: 10 } as Margin)
        .onClick((e:ClickEvent) => {
          this.getUIContext().getUIObserver().onDidLayout( this.didLayoutCallback);
        })
      Button('didLayout off').id('didLayout_off_id')
        .onClick((e:ClickEvent) => {
          this.getUIContext().getUIObserver().offDidLayout( this.didLayoutCallback);
        })
    }
    .height('100%')
  }
}