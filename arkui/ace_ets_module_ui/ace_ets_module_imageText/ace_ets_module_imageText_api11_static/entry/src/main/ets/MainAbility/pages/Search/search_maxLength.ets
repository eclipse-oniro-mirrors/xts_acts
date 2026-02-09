'use static';
/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *   http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import {
  Entry,
  Component,
  Column,
  Text,
  Search,
  Row,
  Button,
  ClickEvent,
  CaretOffset,
  SearchController,
  Color
} from '@ohos.arkui.component';
import { State, AppStorage } from '@ohos.arkui.stateManagement';
import { UIContext, Router } from '@ohos.arkui.UIContext';

@Entry
@Component
struct SearchMaxLength {
  @State submitValue: string = ''
  @State text: string = ''
  @State maxLength: int = 6

  build() {
    Column() {
      Search({ value: this.text, placeholder: 'Type to search...' })
        .searchButton('SEARCH')
        .width('90%')
        .height(40)
        .margin(20)
        .maxLength(this.maxLength)
        .key('SearchMaxLength')
        .onChange((value: string): void => {
          this.text = value
        })
      Row() {
        Button('maxLength:6').key('SearchMaxLength6')
          .onClick((e: ClickEvent) => {
            this.maxLength = 6
          })
        Button('maxLength:4').key('SearchMaxLength4')
          .onClick((e: ClickEvent) => {
            this.maxLength = 4
          })
      }

      Row() {
        Button('123456789').key('setText')
          .onClick((e: ClickEvent) => {
            this.text = '123456789'
          })
      }.margin(20)
    }.width('100%')
  }
}