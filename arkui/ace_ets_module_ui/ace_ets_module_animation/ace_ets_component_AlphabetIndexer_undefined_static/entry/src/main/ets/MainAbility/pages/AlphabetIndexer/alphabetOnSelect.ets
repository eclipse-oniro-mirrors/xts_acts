'use static'
/**
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
  Text,
  Column,
  Component,
  Button,
  ClickEvent,
  AlphabetIndexer
} from '@ohos.arkui.component'
import { State } from '@ohos.arkui.stateManagement'

@Entry
@Component
struct AlphabetOnSelect {
  @State text: string = 'expectChange'
  private value: string[] = ['#', 'A', 'B', 'C', 'D', 'E', 'F', 'G',
    'H', 'I', 'J', 'K', 'L', 'M', 'N',
    'O', 'P', 'Q', 'R', 'S', 'T', 'U',
    'V', 'W', 'X', 'Y', 'Z'];
  @State isShow: boolean | undefined = true;

  build() {
    Column() {
      Text(this.text)
        .id('Text_test')
        .height(100)
      AlphabetIndexer({ arrayValue: this.value, selected: 1 })
        .width(130)
        .height(130)
        .onSelect(this.isShow ? ((index: Int) => {
          this.text = 'selected success';
        }) : undefined)
        .id('AlphabetOnSelect')
      Button('change_onSelect')
        .id('AlphabetIndexer_change')
        .onClick((e: ClickEvent) => {
          this.isShow = !this.isShow;
        })
    }.width(300)
    .height(300)
  }
}