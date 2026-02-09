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


import { Entry, Text, Column, Component, Search, ColumnOptions, Row, ClickEvent, Button,
  AttributeModifier, SearchAttribute } from '@ohos.arkui.component'
import { State, Observed } from '@ohos.arkui.stateManagement'

@Observed
class SearchModifierUndefined implements AttributeModifier<SearchAttribute> {
  applyNormalAttribute(instance: SearchAttribute): void {
    instance
      .height(30)
      .lineHeight(undefined)
  }
}

@Observed
class SearchModifierDynamicSwitch implements AttributeModifier<SearchAttribute> {
  public isLineHeightDefined: boolean = true;

  applyNormalAttribute(instance: SearchAttribute): void {
    instance
      .height(30)
    if (this.isLineHeightDefined) {
      instance.lineHeight(40.0)
    } else {
      instance.lineHeight(undefined)
    }
  }
}

@Entry
@Component
struct SearchLineHeightModifier {
  private searchModifierUndefined: SearchModifierUndefined = new SearchModifierUndefined();
  @State private searchModifierDynamicSwitch: SearchModifierDynamicSwitch = new SearchModifierDynamicSwitch();

  build() {
    Column( { space: 10 } as ColumnOptions ) {
      Search({value: 'Search lineHeight undefined'})
        .attributeModifier(this.searchModifierUndefined)
        .id('Search_LineHeight_Modifier_Undefined0')
      Search({value: `Search lineHeight ${this.searchModifierDynamicSwitch.isLineHeightDefined ? `40` : `undefined`}`})
        .attributeModifier(this.searchModifierDynamicSwitch)
        .id('Search_LineHeight_Modifier_Dynamic0')

      Text('isLineHeightDefined:' + this.searchModifierDynamicSwitch.isLineHeightDefined).height(30)
      Button('change isLineHeightDefined').onClick((event: ClickEvent) => {
        this.searchModifierDynamicSwitch.isLineHeightDefined = !this.searchModifierDynamicSwitch.isLineHeightDefined;
      })
        .margin(5)
        .id('Search_LineHeight_Modifier_Button0')

    }.width('100%')
  }
}