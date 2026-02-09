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


import { Entry, Text, Column, Component, Search, ColumnOptions, Button, ClickEvent } from '@ohos.arkui.component'
import { State } from '@ohos.arkui.stateManagement'

@Entry
@Component
struct SearchMinFontSize {
  @State isMinFontSizeDefined: boolean = true;

  build() {
    Column( { space: 10 } as ColumnOptions ) {
      Search({value: 'Search minFontSize undefined && height 15'})
        .height(15)
        .minFontSize(undefined)
        .maxFontSize(40.0)
        .id('Search_MinFontSize_Undefined0')
      Search({value: `Search minFontSize ${this.isMinFontSizeDefined ? `20` : `undefined`}`})
        .height(15)
        .minFontSize(this.isMinFontSizeDefined ? 20.0 : undefined)
        .maxFontSize(40.0)
        .id('Search_MinFontSize_Dynamic0')

      Text('isMinFontSizeDefined: ' + this.isMinFontSizeDefined).height(30)
      Button('change isMinFontSizeDefined').onClick((event: ClickEvent) => {
        this.isMinFontSizeDefined = !this.isMinFontSizeDefined;
      })
        .margin(5)
        .id('Search_MinFontSize_Button0')

    }.width('100%')
  }
}