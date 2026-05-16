'use static';
/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
 * Licensed under Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with License.
 * You may obtain a copy of License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for specific language governing permissions and
 * limitations under the License.
 */
// xxx.ets
import { Entry, Column, Button, Component, Reusable, ClickEvent, Text, ReuseObject } from '@ohos.arkui.component'
import { RecordData } from '@ohos.base'
import { AppStorage, State } from '@ohos.arkui.stateManagement'
import hilog from '@ohos.hilog'

export class Message {
  value: string | undefined;

  constructor(value: string) {
    this.value = value
  }
}

@Entry
@Component
struct ReuseObjectRaw {
  @State isSwitch: boolean = true

  build() {
    Column() {
      Button('Hello World')
        .fontSize(50)
        .id('ReuseObjectRaw_btn')
        .onClick(() => {
          this.isSwitch = !this.isSwitch
        })
      if (this.isSwitch) {
        Child({ message: new Message('Child1') })
      } else {
        Child({ message: new Message('Child2') })
      }
    }
    .height('100%')
    .width('100%')
  }
}

@Reusable
@Component
struct Child {
  @State message: Message = new Message('AboutToReuse');

  aboutToReuse(params: ReuseObject) {
    console.info('ReuseObjectRaw component with params: ' + params.keys())
    console.info('ReuseObjectRaw component with params.raw: ' + JSON.stringify(params.raw))
    AppStorage.setOrCreate<RecordData>('ReuseObjectRaw', JSON.stringify(params.raw))

    if (params.has('message')) {
      this.message = params['message'] as Message
    }
  }

  build() {
    Column() {
      Text(this.message.value)
        .fontSize(20)
    }
    .borderWidth(2)
    .height(100)
  }
}