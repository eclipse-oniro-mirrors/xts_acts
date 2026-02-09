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
struct SearchLineHeight {
  @State isLineHeightDefined: boolean = true;

  build() {
    Column( { space: 5 } as ColumnOptions ) {
      Search({value: 'Search lineHeight undefined'})
        .height(30)
        .lineHeight(undefined)
        .id('Search_LineHeight_Undefined0')
      Search({value: `Search lineHeight ${this.isLineHeightDefined ? `40` : `undefined`}`})
        .height(30)
        .lineHeight(this.isLineHeightDefined ? 40.0 : undefined)
        .id('Search_LineHeight_Dynamic0')

      Text('isLineHeightDefined: ' + this.isLineHeightDefined).height(30)
      Button('change isLineHeightDefined').onClick((event: ClickEvent) => {
        this.isLineHeightDefined = !this.isLineHeightDefined;
      })
        .margin(5)
        .id('Search_LineHeight_Button0')

    }.width('100%')
  }
}