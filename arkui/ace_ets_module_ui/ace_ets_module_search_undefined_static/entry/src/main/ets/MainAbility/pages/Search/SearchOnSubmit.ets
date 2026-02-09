'use static'

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

import { Entry, Text, Column, Component, TextInput, Search, ColumnOptions, Row, ClickEvent, Button,
  FontStyle, FontWeight, CopyOptions, TextAlign, Color, CaretStyle, EnterKeyType, SearchSubmitCallback, SubmitEvent } from '@ohos.arkui.component'
import { State } from '@ohos.arkui.stateManagement'

@Entry
@Component
struct SearchExample {
  @State enterKeyType:string = '';
  @State isOnSubmitValid:boolean = false;

  build() {
    Row(undefined) {
      Column(undefined) {
        Text(`${this.enterKeyType}`)
          .id('enterKeyType')
        Search({value: ''})
          .id('SearchTest')
          .enterKeyType(EnterKeyType.Go)
          .onSubmit(this.isOnSubmitValid ? (enterKey: string, event?: SubmitEvent) => {
            this.enterKeyType = enterKey;
            this.isOnSubmitValid = true;
            console.info(`${enterKey}`);
          } as SearchSubmitCallback : undefined)
        Button('change isOnSubmitValid:' + this.isOnSubmitValid)
          .onClick((event: ClickEvent) => {
            this.enterKeyType = '';
            this.isOnSubmitValid = !this.isOnSubmitValid;
          })
          .id('changeIsOnSubmitValid')
      }.width('100%')
    }
    .height('100%')
  }
}