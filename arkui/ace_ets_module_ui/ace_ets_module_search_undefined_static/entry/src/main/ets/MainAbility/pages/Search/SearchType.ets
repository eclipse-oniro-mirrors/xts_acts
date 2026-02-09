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

'use static'

import { Entry, Text, Column, Component, Search, ColumnOptions, ClickEvent, Button, Color, SearchType } from '@ohos.arkui.component'
import { State } from '@ohos.arkui.stateManagement'

@Entry
@Component
struct SelectedBackgroundColor {
  @State isType: boolean = true

  build() {
    Column({ space: 3 } as ColumnOptions) {
      Search({ value: '', placeholder: 'please enter...' })
        .id('isType')
        .width('95%')
        .height(40)
        .type(this.isType ? SearchType.PHONE_NUMBER : undefined)


      Button('change isType').id('isTypeButton0')
        .onClick(() => {
          this.isType = !this.isType;
        })
        .margin(5)
    }.width('100%')
  }
}