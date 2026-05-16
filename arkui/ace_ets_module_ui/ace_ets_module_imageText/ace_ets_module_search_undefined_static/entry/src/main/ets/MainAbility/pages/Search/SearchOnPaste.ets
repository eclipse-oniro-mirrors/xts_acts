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


import { Entry, Text, Column, Component, Search, ColumnOptions, ClickEvent, Button} from '@ohos.arkui.component'
import { State } from '@ohos.arkui.stateManagement'

@Entry
@Component
struct SearchOnPaste {
  @State pasteValue: string = '';
  @State isOnPasteValid: boolean = true;

  build() {
    Column( { space: 10 } as ColumnOptions ) {
      Search({ value: 'Search onPaste undefined long long long long text' })
        .onPaste(undefined)
        .id('Search_OnPaste_Undefined0')
      Search({ value: `Search onPaste ${this.isOnPasteValid ? `defined` : `undefined`} long long long long text`})
        .onPaste(this.isOnPasteValid ? (pasteValue: string) => {
          this.pasteValue = this.pasteValue + 'onPaste';
        } : undefined)
        .id('Search_OnPaste_Dynamic0')

      Text('pasteValue: ' + this.pasteValue).height(30)
        .id('Search_OnPaste_Value0')
      Text('isOnPasteValid: ' + this.isOnPasteValid).height(30)
      Button('change isOnPasteValid').onClick((event: ClickEvent) => {
        this.isOnPasteValid = !this.isOnPasteValid;
      })
        .margin(5)
        .id('Search_OnPaste_Button0')
    }.width('100%')
  }
}