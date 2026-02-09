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
import { State, Observed } from '@ohos.arkui.stateManagement'



@Entry
@Component
struct SearchOnWillDeleteTest {
  @State isChange: boolean = true
  @State str: string = 'placeholder(Search)'
  @State str1: string = 'onWillDelete fail'

  build() {
    Row() {
      Column() {
        Text(this.str1).key('key_search_OnWillDelete_001')
        Search({ value: this.str })
          .width('100%')
          .id('button_onWillDelete1')
          .onWillDelete(this.isChange ? () => {
            if (this.str1 == 'onWillDelete pass') {
              this.str1 = 'onWillDelete fail'
            } else {
              this.str1 = 'onWillDelete pass'
            }
            return true;
          } : undefined)
        Button('点击切换Undefined').id('button_onWillDelete2').onClick((event: ClickEvent) => {
          this.isChange = !this.isChange
        })
      }
      .width('100%')
    }
    .height('100%')
  }
}