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


import { Entry, Text, Column, Component, Search, ColumnOptions, ClickEvent, Button, Color, SearchType, AttributeModifier, SearchAttribute } from '@ohos.arkui.component'
import { State, Observed } from '@ohos.arkui.stateManagement'

@Observed
class SearchTypeModifier implements AttributeModifier<SearchAttribute> {
  public isType: boolean = true;
  public value: string = ''

  applyNormalAttribute(instance: SearchAttribute): void {
    instance.height(30)
    if(this.isType){
      instance.type(SearchType.PHONE_NUMBER)
    } else {
      instance.type(undefined)
    }
  }
}

@Entry
@Component
struct SelectedBackgroundColor {
  @State searchTypeModifier: SearchTypeModifier = new SearchTypeModifier();

  build() {
    Column({ space: 3 } as ColumnOptions) {
      Search({ value: '', placeholder: 'please enter...' })
        .id('isTypeModifier')
        .width('95%')
        .height(40)
        .attributeModifier(this.searchTypeModifier)

      Button('change isTypeModifier').id('isTypeButtonModifier')
        .onClick(() => {
          this.searchTypeModifier.isType = !this.searchTypeModifier.isType;
        })
        .margin(5)
        .id('isTypeModifierButton')
    }.width('100%')
  }
}