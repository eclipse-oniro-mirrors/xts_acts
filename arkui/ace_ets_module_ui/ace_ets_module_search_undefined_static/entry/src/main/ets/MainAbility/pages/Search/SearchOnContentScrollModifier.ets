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

@Observed
class MySearchModifier implements AttributeModifier<SearchAttribute> {
  public str1: string = 'false'
  public isChange: boolean = true

  applyNormalAttribute(instance: SearchAttribute): void {
    if (this.isChange) {
      instance.onContentScroll((totalOffsetX: number, totalOffsetY: number) => {
        if (this.str1 == 'false') {
          this.str1 = 'true';
        }
      })
    } else {
      instance.onContentScroll(undefined)
    }
  }
}

@Entry
@Component
struct SearchOnContentScrollModifierTest {
  @State isChange: boolean = true
  @State modifier: MySearchModifier = new MySearchModifier()

  build() {
    Row() {
      Column() {
        Text(this.modifier.str1).key('test_text_onContentScrollModifier')
        Search({ value: 'placeholder(Search)' })
          .width('100%')
          .height(50)
          .key('key_search_onContentScrollModifier_001')
          .attributeModifier(this.modifier)
        Button('点击切换参数').id('button_onContentScrollModifier1').onClick((event: ClickEvent) => {
          this.modifier.isChange = !this.modifier.isChange
        })
        Button('变更文本').id('button_onContentScrollModifier2').onClick((event: ClickEvent) => {
          this.modifier.str1 = 'false';
        })
      }
      .width('100%')
    }
    .height('100%')
  }
}