'use static'
/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
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
  Text,
  ClickEvent,
  UIContext,
  Row,
  Area,
  Color
} from '@ohos.arkui.component'
import { State } from '@ohos.arkui.stateManagement'

@Entry
@Component
struct IntervalExample {
  @State value: string = 'Text'
  @State count: int = 0

  build() {
    Column() {
      Text(this.value)
        .height('10%')
        .backgroundColor(0xffffff)
        .id('IntervalText')
        .onClick((e: ClickEvent): void => {
          this.value = this.value + 'Text'
        })
        .onAreaChange((oldValue: Area, newValue: Area) => {
          this.count ++
        },{expectedUpdateInterval:3000})
      Text(`${this.count}`).id('IntervalText2').height('10%')

    }
    .width('60%').height('60%')
  }
}