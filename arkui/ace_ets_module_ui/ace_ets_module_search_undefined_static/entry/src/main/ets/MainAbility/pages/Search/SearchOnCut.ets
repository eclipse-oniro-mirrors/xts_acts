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
struct SearchOnCut {
  @State copyValue: string = '';
  @State isOnCutValid: boolean = true;

  build() {
    Column( { space: 10 } as ColumnOptions ) {
      Search({ value: 'Search onCut undefined long long long long text' })
        .onCut(undefined)
        .id('Search_onCut_Undefined0')
      Search({ value: `Search onCut ${this.isOnCutValid ? `defined` : `undefined`} long long long long text`})
        .onCut(this.isOnCutValid ? (copyValue: string) => {
          this.copyValue = this.copyValue + 'onCut';
        } : undefined)
        .id('Search_onCut_Dynamic0')

      Text('copyValue: ' + this.copyValue).height(30)
        .id('Search_Copy_Value0')
      Text('isOnCutValid: ' + this.isOnCutValid).height(30)
      Button('change isOnCutValid').onClick((event: ClickEvent) => {
        this.isOnCutValid = !this.isOnCutValid;
      })
        .margin(5)
        .id('Search_onCut_Button0')
    }.width('100%')
  }
}