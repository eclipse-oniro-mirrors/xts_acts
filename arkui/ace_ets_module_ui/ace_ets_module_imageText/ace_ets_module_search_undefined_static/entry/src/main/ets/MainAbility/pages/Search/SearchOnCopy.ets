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
struct SearchOnCopy {
  @State copyValue: string = '';
  @State isOnCopyValid: boolean = true;

  build() {
    Column( { space: 10 } as ColumnOptions ) {
      Search({ value: 'Search onCopy undefined long long long long text' })
        .onCopy(undefined)
        .id('Search_OnCopy_Undefined0')
      Search({ value: `Search onCopy ${this.isOnCopyValid ? `defined` : `undefined`} long long long long text`})
        .onCopy(this.isOnCopyValid ? (copyValue: string) => {
          this.copyValue = this.copyValue + 'onCopy';
        } : undefined)
        .id('Search_OnCopy_Dynamic0')

      Text('copyValue: ' + this.copyValue).height(30)
        .id('Search_OnCopy_Value0')
      Text('isOnCopyValid: ' + this.isOnCopyValid).height(30)
      Button('change isOnCopyValid').onClick((event: ClickEvent) => {
        this.isOnCopyValid = !this.isOnCopyValid;
      })
        .margin(5)
        .id('Search_OnCopy_Button0')
    }.width('100%')
  }
}