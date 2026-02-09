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
  Entry, Component, Column, Search, Row, Button, ClickEvent, ContentType, AttributeModifier, SearchAttribute
} from '@ohos.arkui.component'
import { State, Observed } from '@ohos.arkui.stateManagement'

@Observed
class MyTextModifier implements AttributeModifier<SearchAttribute> {
  public isChange: boolean = true;

  applyNormalAttribute(instance: SearchAttribute): void {
    if (this.isChange) {
      instance.enableHapticFeedback(false)
    } else {
      instance.enableHapticFeedback(undefined)
    }
  }
}

@Entry
@Component
struct SearchEnableHapticFeedBackTest {
  @State isChange: boolean = true
  @State modifier: MyTextModifier = new MyTextModifier()

  build() {
    Row() {
      Column() {
        Search({ value: 'placeholder(Search)' })
          .width('100%')
          .key('key_search_enableHapticFeedback_002')
          .attributeModifier(this.modifier)
        Button('点击切换Undefined').id('button_enableHapticFeedback1').onClick((event: ClickEvent) => {
          this.modifier.isChange = !this.modifier.isChange
        })
      }
      .width('100%')
    }
    .height('100%')
  }
}