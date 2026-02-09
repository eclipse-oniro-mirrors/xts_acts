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

@Observed
class MySearchModifier implements AttributeModifier<SearchAttribute> {
  public isChange: boolean = true;
  public str1: string = 'onWillChange fail'

  applyNormalAttribute(instance: SearchAttribute): void {
    if (this.isChange) {
      instance.onChange((value: string) => {
        if (this.str1 == 'onChange fail') {
          this.str1 = 'onChange pass'
        } else {
          this.str1 = 'onChange fail'
        }
      })
    } else {
      instance.onChange(undefined)
    }
  }
}

@Entry
@Component
struct SearchOnChangeModifierTest {
  @State str: string = 'placeholder(Search)'
  @State modifier: MySearchModifier = new MySearchModifier()

  build() {
    Row() {
      Column() {
        Text(this.modifier.str1).key('key_search_onChangeModifier_001')
        Search({ value: this.str })
          .width('100%')
          .key('key_search_onChangeModifier_002')
          .attributeModifier(this.modifier)

        Button('点击触发onChange').id('button_onChangeModifier1').onClick((event: ClickEvent) => {
          if (this.str == 'placeholder(Search)') {
            this.str = 'placeholder(Search) success'
          } else {
            this.str = 'placeholder(Search)'
          }
        })
        Button('点击切换Undefined').id('button_onChangeModifier2').onClick((event: ClickEvent) => {
          this.modifier.isChange = !this.modifier.isChange
        })
      }
      .width('100%')
    }
    .height('100%')
  }
}