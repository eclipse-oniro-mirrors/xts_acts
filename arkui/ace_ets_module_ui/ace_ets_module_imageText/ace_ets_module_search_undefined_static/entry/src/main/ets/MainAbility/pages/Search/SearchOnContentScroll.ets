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
  TextArea
} from '@ohos.arkui.component'
import { State, Observed } from '@ohos.arkui.stateManagement'

@Entry
@Component
struct SearchOnWillDeleteModifierTest {
  @State isChange: boolean = true
  @State text: string = 'false'

  build() {
    Row() {
      Column() {
        Text(this.text).key('test_text_onContentScroll')
        Search({ value: 'placeholder(Search)' })
          .width('100%')
          .height(50)
          .key('key_search_onContentScroll_001')
          .onContentScroll(this.isChange ? (totalOffsetX: number, totalOffsetY: number) => {
            if (this.text == 'false') {
              this.text = 'true';
            }
          } : undefined)
        Button('点击切换参数').id('button_onContentScroll1').onClick((event: ClickEvent) => {
          this.isChange = !this.isChange
        })
        Button('变更文本').id('button_onContentScroll2').onClick((event: ClickEvent) => {
          this.text = 'false';
        })
      }
      .width('100%')
    }
    .height('100%')
  }
}