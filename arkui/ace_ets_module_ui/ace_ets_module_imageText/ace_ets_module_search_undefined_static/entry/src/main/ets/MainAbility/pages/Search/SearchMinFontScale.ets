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


import { Entry, Text, Column, Component, Search, Button, ClickEvent } from '@ohos.arkui.component'
import { State } from '@ohos.arkui.stateManagement'

@Entry
@Component
struct SearchMinFontScale {
  @State minFontScale: number = 0.9;
  @State isFontScaleDefined: boolean = true;

  build() {
    Column() {
      Search({ placeholder: 'Search minFontScale undefined ' })
        .minFontScale(undefined)
        .id('Search_MinFontScale_Undefined0')
      Search({ placeholder: `Search minFontScale ${this.isFontScaleDefined ? `0.9` : `undefined`}` })
        .minFontScale(this.isFontScaleDefined ? this.minFontScale : undefined)
        .id('Search_MinFontScale_Dynamic0')

      Text('isFontScaleDefined: ' + this.isFontScaleDefined).height(30)
      Button('change isFontScaleDefined').onClick((event: ClickEvent) => {
        this.isFontScaleDefined = !this.isFontScaleDefined;
      })
        .margin(5)
        .id('Search_MinFontScale_Button0')
    }.width('100%')
  }
}