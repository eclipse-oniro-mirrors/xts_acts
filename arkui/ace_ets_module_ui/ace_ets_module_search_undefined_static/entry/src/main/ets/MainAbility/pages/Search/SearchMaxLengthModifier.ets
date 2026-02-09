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


import { Entry, Text, Column, Component, Search, ColumnOptions, ClickEvent, Button,
  AttributeModifier, SearchAttribute, BorderOptions } from '@ohos.arkui.component'
import { State, Observed } from '@ohos.arkui.stateManagement'

@Observed
class SearchModifierUndefined implements AttributeModifier<SearchAttribute> {
  applyNormalAttribute(instance: SearchAttribute): void {
    instance
      .border({ width: 1 } as BorderOptions).padding(10).height(30)
      .maxLength(undefined)
  }
}

@Observed
class SearchModifierDynamicSwitch implements AttributeModifier<SearchAttribute> {
  public isMaxLengthDefined: boolean = true;

  applyNormalAttribute(instance: SearchAttribute): void {
    instance
      .border({ width: 1 } as BorderOptions).padding(10).height(30)
    if (this.isMaxLengthDefined) {
      instance.maxLength(25)
    } else {
      instance.maxLength(undefined)
    }
  }
}

@Entry
@Component
struct SearchMaxLengthModifier {
  private searchModifierUndefined: SearchModifierUndefined = new SearchModifierUndefined();
  @State private searchModifierDynamicSwitch: SearchModifierDynamicSwitch = new SearchModifierDynamicSwitch();

  build() {
    Column( { space: 10 } as ColumnOptions ) {
      Search({value: 'Search maxLength undefined'})
        .attributeModifier(this.searchModifierUndefined)
        .id('Search_MaxLength_Modifier_Undefined0')
      Search({value: `Search maxLength ${this.searchModifierDynamicSwitch.isMaxLengthDefined ? `25` : `undefined`}` })
        .attributeModifier(this.searchModifierDynamicSwitch)
        .id('Search_MaxLength_Modifier_Dynamic0')

      Text('isMaxLengthDefined:' + this.searchModifierDynamicSwitch.isMaxLengthDefined).height(30)
      Button('change isMaxLengthDefined').onClick((event: ClickEvent) => {
        this.searchModifierDynamicSwitch.isMaxLengthDefined = !this.searchModifierDynamicSwitch.isMaxLengthDefined;
      })
        .margin(5)
        .id('Search_MaxLength_Modifier_Button0')

    }.width('100%')
  }
}