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

import {
  Entry,
  Component,
  Column,
  Search,
  Row,
  Text,
  Button,
  ClickEvent,
  ContentType,
  AttributeModifier,
  SearchAttribute,
} from '@ohos.arkui.component'
import { State} from '@ohos.arkui.stateManagement'

@Entry
@Component
struct SearchOnWillChangeTest {
  @State isChange: boolean = true
  @State str: string = 'placeholder(Search)'
  @State str1: string = 'onWillChange fail'


  build() {
    Row() {
      Column() {
        Text(this.str1)
          .key('key_search_OnWillChange_001')
        Search({ value: this.str })
          .width('100%')
          .key('key_search_OnWillChange_002')
          .onWillChange(this.isChange ? () => {
            if (this.str1 == 'onWillChange pass') {
              this.str1 = 'onWillChange fail'
            } else {
              this.str1 = 'onWillChange pass'
            }
            return true;
          } : undefined)
        Button('点击触发onWillChange').id('button_onWillChange1').onClick((event: ClickEvent) => {
          if (this.str == 'placeholder(Search)') {
            this.str = 'placeholder(Search) success'
          } else {
            this.str = 'placeholder(Search)'
          }
        })
        Button('点击切换Undefined').id('button_onWillChange2').onClick((event: ClickEvent) => {
          this.isChange = !this.isChange
        })
      }
      .width('100%')
    }
    .height('100%')
  }
}