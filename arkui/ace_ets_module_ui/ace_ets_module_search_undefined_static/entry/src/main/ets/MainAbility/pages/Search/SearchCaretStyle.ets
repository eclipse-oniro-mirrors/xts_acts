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


import { Entry, Text, Column, Component, Search, ColumnOptions, Button, ClickEvent, Color, CaretStyle } from '@ohos.arkui.component'
import { State } from '@ohos.arkui.stateManagement'

@Entry
@Component
struct SearchCaretStyle {
  @State caretStyleIndex: Int = 0;
  @State curCaretStyle:(CaretStyle | undefined)[] = [
    { width : '4vp', color : Color.Red } as CaretStyle,
    { width : undefined, color : Color.Red } as CaretStyle,
    { width : '4vp', color : undefined } as CaretStyle,
    { width : undefined, color : undefined } as CaretStyle,
    { width : '4vp', color : Color.Red } as CaretStyle,
    undefined
  ];

  build() {
    Column( { space: 5 } as ColumnOptions ) {
      Search({value: 'Search caretStyle undefined'})
        .height(30)
        .caretStyle(undefined)
        .id('Search_CaretStyle_Undefined0')
      Search({value: `Search caretStyle ${this.caretStyleIndex} `})
        .height(30)
        .caretStyle(this.curCaretStyle[this.caretStyleIndex])
        .id('Search_CaretStyle_Dynamic0')

      Text('caretStyleIndex: ' + this.caretStyleIndex).height(30)
      Button('change caretStyleIndex').onClick((event: ClickEvent) => {
        this.caretStyleIndex = (this.caretStyleIndex + 1) % 6;
      })
        .margin(5)
        .id('Search_CaretStyle_Button0')

    }.width('100%')
  }
}