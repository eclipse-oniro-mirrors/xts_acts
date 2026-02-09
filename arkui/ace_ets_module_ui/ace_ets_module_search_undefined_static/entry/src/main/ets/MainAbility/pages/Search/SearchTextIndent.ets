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


import { Entry, Text, Column, Component, Search, ColumnOptions, ClickEvent, Button, Color} from '@ohos.arkui.component'
import { State } from '@ohos.arkui.stateManagement'

@Entry
@Component
struct SelectedBackgroundColor {
  @State isTextIndent: boolean = true;

  build() {
    Column( { space: 10 } as ColumnOptions ) {
      Search({ value: 'Search onCut undefined long long long long text' })
        .textIndent(undefined)
        .id('isTextIndent')
      Search({ value: `Search onCut ${this.isTextIndent ? `defined` : `undefined`} long long long long text`})
        .textIndent(this.isTextIndent ? '5vp' : undefined)
        .id('isTextIndent1')

      Text('isSelectedBackgroundColor: ' + this.isTextIndent).height(30)
        .id('isTextIndentValue0')
      Text('isSelectedBackgroundColor: ' + this.isTextIndent).height(30)
      Button('change isTextIndent').onClick((event: ClickEvent) => {
        this.isTextIndent = !this.isTextIndent;
      })
        .margin(5)
        .id('isTextIndentButton0')
    }.width('100%')
  }
}