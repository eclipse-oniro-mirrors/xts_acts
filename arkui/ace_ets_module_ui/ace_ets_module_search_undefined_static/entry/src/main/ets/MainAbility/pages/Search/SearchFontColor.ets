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
  @State isFontColor: boolean = true;

  build() {
    Column( { space: 10 } as ColumnOptions ) {
      Search({ value: 'Search onCut undefined long long long long text' })
        .fontColor(undefined)
        .id('isFontColor')
      Search({ value: `Search onCut ${this.isFontColor ? `defined` : `undefined`} long long long long text`})
        .fontColor(this.isFontColor ? '#FFA76D8D' : undefined)
        .id('isFontColor1')

      Text('isFontColor: ' + this.isFontColor).height(30)
        .id('isFontColorValue0')
      Button('change isFontColor').onClick((event: ClickEvent) => {
        this.isFontColor = !this.isFontColor;
      })
        .margin(5)
        .id('isFontColorButton0')
    }.width('100%')
  }
}